library ieee;
use ieee.std_logic_1164.all;

---use ieee_proposed.float_pkg.all;
library work;
use work.float_pkg.all;

-- Para usar:
-- -- library work;
-- -- use work.cordic_lib.all;


package cordic_lib is

    constant N_PF       : natural := 32;

	alias t_float is float32;
    subtype t_coordenada is t_float; --- := CERO;           -- tipo coordenada
	type t_pos is array (1 to 3) of t_coordenada;    -- tipo posición 3D (x,y,z)
    type t_vec is array (1 to 2) of t_coordenada;    -- tipo posición 2D (x,y)
    type t_dir is array (1 to 2) of std_logic_vector(N_PF-1 downto 0);   -- tipo dirección en memoria	---float32 es 23 a -8, que no cause problemas...
    -- type t_mat_r is array(1 to 2) of t_coordenada;

    constant PI_PF      : t_float := "01000000010010010000111111011011";---Estos 3 tendrían que ser std_logic_vector?
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

        constant P		: natural := 16;	-- Cantidad de iteraciones, que determina la precisión

		type T_ANGLES is array (0 to 27) of real;
        constant ANGLES	: T_ANGLES := (		-- 28 primeros valores de atan(2^-i)
			0.78539816339745, 0.46364760900081, 0.24497866312686, 0.12435499454676,
			0.06241880999596, 0.03123983343027, 0.01562372862048, 0.00781234106010,
			0.00390623013197, 0.00195312251648, 0.00097656218956, 0.00048828121119,
			0.00024414062015, 0.00012207031189, 0.00006103515617, 0.00003051757812,
			0.00001525878906, 0.00000762939453, 0.00000381469727, 0.00000190734863,
			0.00000095367432, 0.00000047683716, 0.00000023841858, 0.00000011920929,
			0.00000005960464, 0.00000002980232, 0.00000001490116, 0.00000000745058
			);

		type T_KVALUES is array (0 to 23) of real;
        constant K_VALUES: T_KVALUES := (	-- 24 primeros cumprod(1 ./ abs(1 + 1j*2.^(-(0:23))))
			0.70710678118655, 0.63245553203368, 0.61357199107790, 0.60883391251775,
			0.60764825625617, 0.60735177014130, 0.60727764409353, 0.60725911229889,
			0.60725447933256, 0.60725332108988, 0.60725303152913, 0.60725295913894,
			0.60725294104140, 0.60725293651701, 0.60725293538591, 0.60725293510314,
			0.60725293503245, 0.60725293501477, 0.60725293501035, 0.60725293500925,
			0.60725293500897, 0.60725293500890, 0.60725293500889, 0.60725293500888
			);

        variable v, v_aux : t_vec := vector;
        variable sigma : integer := 1;
        variable angle_i : t_float := to_float(ANGLES(0));
        variable Kn : t_float;
		variable beta_i : t_float := beta;

    begin
        -- if ( (beta_i + HALF_PI_PF)(0) == '1' or (beta_i - HALF_PI_PF)(0) == '0' )
        if (beta_i < -PI_PF/2 or beta_i > PI_PF/2) then
            -- if (beta_i(0) == '1') then
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
                angle_i := angle_i / 2;
                ---angle_i := angle_i srl 1;   -- Si superé la tabla, aproximo
            else
                angle_i := to_float(ANGLES(i));  -- Si no, tabla
            end if;

            if (beta_i < 0) then
                sigma := -1;
            else
                sigma := 1;
            end if;

            ---v_aux(1) := v(1) - sigma * (v(2) srl i); MAL
            ---v_aux(1) := v(1) - sigma * (v(2) * 2^(-i));
			v_aux(1) := v(1) - sigma * (v(2) * 2**(-i));
            ---v_aux(2) <= sigma * (v(1) srl i) + v(2); MAL
            ---v_aux(2) := sigma * (v(1) * 2^(-i)) + v(2);
			v_aux(2) := sigma * (v(1) * 2**(-i)) + v(2);
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
