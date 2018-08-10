library ieee;
use ieee.std_logic_1164.all;

---library work;
---use work.float_pkg.all;
--library ieee_proposed;
--use ieee_proposed.float_pkg.all;
library floatfixlib;
use floatfixlib.float_pkg.all;

-- -- Para usar:
-- library work;
-- use work.cordic_lib.all;


package cordic_lib is

    constant N_PF       : natural := 32;
	constant N_BITS_DIR	: natural := 10;

	subtype t_float is float32;
    subtype t_coordenada is t_float; --- := CERO;	-- tipo coordenada
	type t_pos is array (1 to 3) of t_coordenada;	-- tipo posición 3D (x,y,z)
    type t_vec is array (1 to 2) of t_coordenada;	-- tipo posición 2D (x,y)
    type t_dir is array (1 to 2) of std_logic_vector(N_BITS_DIR-1 downto 0);   -- tipo dirección en memoria	---float32 es 23 a -8, que no cause problemas...
	type t_pos_mem is array (1 to 3) of std_logic_vector(15 downto 0);	-- tipo de posición 3D (x,y,z) tal como son recibidas y guardadas en memoria interna

    constant PI_PF      : t_float := "01000000010010010000111111011011";
    constant HALF_PI_PF : t_float := "00111111110010010000111111011011";
    constant CERO       : t_float := "00000000000000000000000000000000";

	-- Firma de función cordic, para que pueda ser llamada
	function cordic (vector : t_vec; beta : t_float) return t_vec;
	function cordic (pos : t_pos; beta : t_float) return t_pos;

end package cordic_lib;


package body cordic_lib is

	-- Función ayuda: si recibe t_pos, rota en (x) [o sea, rota (y,z)] y devuelve los valores girados en (x,y)
	function cordic (pos : t_pos; beta : t_float)
					return t_pos is
		variable vec : t_vec;
		variable ret : t_pos := (others => CERO);
	begin
		vec(1) := pos(2);
		vec(2) := pos(3);
		vec := cordic(vec, beta);
		ret(1) := vec(1);
		ret(2) := vec(2);
		return ret;
	end function;

    -- Funciôn CORDIC: rotar vector 2D en el plano con ángulo beta (en radianes)
    function cordic (vector : t_vec; beta : t_float)
                    return t_vec is

        constant P		: natural := 24;	-- Cantidad de iteraciones, que determina la precisión

		type T_ANGLES is array (0 to 27) of real;
        constant ANGLES	: T_ANGLES := (		-- 28 primeros valores de atan(2^-i)
			0.785398163397448279, 0.463647609000806094, 0.244978663126864143, 0.124354994546761438,
			0.062418809995957350, 0.031239833430268277, 0.015623728620476831, 0.007812341060101111,
			0.003906230131966972, 0.001953122516478819, 0.000976562189559319, 0.000488281211194898,
			0.000244140620149362, 0.000122070311893670, 0.000061035156174209, 0.000030517578115526,
			0.000015258789061316, 0.000007629394531102, 0.000003814697265606, 0.000001907348632810,
			0.000000953674316406, 0.000000476837158203, 0.000000238418579102, 0.000000119209289551,
			0.000000059604644775, 0.000000029802322388, 0.000000014901161194, 0.000000007450580597
			);

		type T_KVALUES is array (0 to 25) of real;
        constant K_VALUES: T_KVALUES := (	-- 26 primeros cumprod(1 ./ abs(1 + 1j*2.^(-(0:25))))
			0.707106781186547462, 0.632455532033675771, 0.613571991077896284, 0.608833912517752429,
			0.607648256256168140, 0.607351770141295932, 0.607277644093526026, 0.607259112298892734,
			0.607254479332562269, 0.607253321089875175, 0.607253031529134346, 0.607252959138944837,
			0.607252941041397154, 0.607252936517010178, 0.607252935385913406, 0.607252935103139269,
			0.607252935032445706, 0.607252935014772288, 0.607252935010353934, 0.607252935009249373,
			0.607252935008973260, 0.607252935008904204, 0.607252935008886885, 0.607252935008882666,
            0.607252935008881555, 0.607252935008881223
			);

        variable v, v_aux : t_vec := vector;
        variable sigma : integer := 1;
        variable angle_i : t_float := to_float(ANGLES(0));
        variable Kn : t_float;
		variable beta_i : t_float := beta;

    begin
        if (beta_i < -PI_PF/2 or beta_i > PI_PF/2) then
            if (beta_i < 0) then
                v := cordic(vector, beta_i + PI_PF);
            else
                v := cordic(vector, beta_i - PI_PF);
            end if;
            v(1) := -1 * v(1);
            v(2) := -1 * v(2);
            return v;
        end if;

        for i in 0 to P-1 loop
            if (i > (ANGLES'length - 1)) then
                angle_i := angle_i / 2;			-- Si superé la tabla, aproximo
            else
                angle_i := to_float(ANGLES(i));	-- Si no, tabla
            end if;

            if (beta_i < 0) then
                sigma := -1;
            else
                sigma := 1;
            end if;

			v_aux(1) := v(1) - sigma * (v(2) / 2**(i));		--- Cambié desde * 2**(-i)
			v_aux(2) := sigma * (v(1) / 2**(i)) + v(2);		--- Same
            v := v_aux;

            -- Actualizo ángulo beta_i faltante
            beta_i := beta_i - sigma * angle_i;
        end loop;

        if (P > K_VALUES'length) then
            Kn := to_float(K_VALUES(K_VALUES'length - 1));
        else
            Kn := to_float(K_VALUES(P - 1));
        end if;

        -- Ajusto magnitud del vector
        for i in 1 to 2 loop
            v(i) := Kn * v(i);
        end loop;

        return v;
    end function;

end package body cordic_lib;
