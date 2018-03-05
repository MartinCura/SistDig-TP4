--- Ver si tengo que descomentar todo
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee_proposed.fixed_float_types.all;
-- use ieee_proposed.fixed_pkg.all;
use ieee_proposed.float_pkg.all;

-- Para usar:
-- -- library work;
-- -- use work.cordic_lib.all;

--- TODO: Chequear que funcionen las operaciones de PF

package cordic_lib is

    constant N_PF       : natural := 32;
    constant PI_PF      : std_logic_vector := "01000000010010010000111111011011";
    constant HALF_PI_PF : std_logic_vector := "00111111110010010000111111011011";

    -- type t_float is std_logic_vector(N_PF-1 downto 0);
    type t_float is float32;
    type t_coordenada is t_float;                   -- tipo coordenada
    type t_pos is array(1 to 3) of t_coordenada;    -- tipo posición (x,y,z)
    type t_vec is array(1 to 2) of t_coordenada;    -- tipo posición (x,y)
    -- type t_mat_r is array(1 to 2) of t_coordenada;
    -- type t_mat is array(1 to 2) of t_mat_r;         -- tipo matriz 2x2 de coordenadas

end package cordic_lib;


package body cordic_lib is

    -- Funciôn CORDIC: rotar vector 2D en el plano con ángulo beta (en radianes)
    function cordic (vector : t_vec, beta : t_float)
                    return t_vec is

        constant P := 16; -- Cantidad de iteraciones, que determina la precisión

        constant ANGLES: t_float := (   -- 40 primeros atan(2^-i) en binario
            "00111111010010010000111111011011", "00111110111011010110001100111000", "00111110011110101101101110110000", "00111101111111101010110111010101",
            "00111101011111111010101011011110", "00111100111111111110101010101110", "00111100011111111111101010101011", "00111011111111111111111010101011",
            "00111011011111111111111110101011", "00111010111111111111111111101011", "00111010011111111111111111111011", "00111001111111111111111111111111",
            "00111001100000000000000000000000", "00111001000000000000000000000000", "00111000100000000000000000000000", "00111000000000000000000000000000",
            "00110111100000000000000000000000", "00110111000000000000000000000000", "00110110100000000000000000000000", "00110110000000000000000000000000",
            "00110101100000000000000000000000", "00110101000000000000000000000000", "00110100100000000000000000000000", "00110100000000000000000000000000",
            "00110011100000000000000000000000", "00110011000000000000000000000000", "00110010100000000000000000000000", "00110010000000000000000000000000",
            "00110001100000000000000000000000", "00110001000000000000000000000000", "00110000100000000000000000000000", "00110000000000000000000000000000",
            "00101111100000000000000000000000", "00101111000000000000000000000000", "00101110100000000000000000000000", "00101110000000000000000000000000",
            "00101101100000000000000000000000", "00101101000000000000000000000000", "00101100100000000000000000000000", "00101100000000000000000000000000" );

        constant K_VALUES: t_float := ( -- 26 primeros cumprod(1 ./ abs(1 + 1j*2.^(-(0:23)))) en binario
            "00111111001101010000010011110011", "00111111001000011110100010011011", "00111111000111010001001100001110", "00111111000110111101110010001010",
            "00111111000110111000111011010110", "00111111000110110111101101101000", "00111111000110110111011010001100", "00111111000110110111010101010101",
            "00111111000110110111010100001000", "00111111000110110111010011110100", "00111111000110110111010011101111", "00111111000110110111010011101110",
            "00111111000110110111010011101110", "00111111000110110111010011101110", "00111111000110110111010011101110", "00111111000110110111010011101110",
            "00111111000110110111010011101110", "00111111000110110111010011101110", "00111111000110110111010011101110", "00111111000110110111010011101110",
            "00111111000110110111010011101110", "00111111000110110111010011101110", "00111111000110110111010011101110", "00111111000110110111010011101110",
            "00111111000110110111010011101110", "00111111000110110111010011101110" );

        variable v, v_aux: t_vec := vector;
        variable sigma: integer := 1;
        variable angle_i: t_float := ANGLES(0);
        variable Kn: t_float;

    begin
        -- if ( (beta + HALF_PI_PF)(0) == '1' or (beta - HALF_PI_PF)(0) == '0' )
        if (beta < -PI_PF/2 or beta > PI_PF/2) then
            -- if (beta(0) == '1') then
            if (beta < 0) then
                v <= cordic(vector, beta + PI_PF);
            else
                v <= cordic(vector, beta - PI_PF);
            end if;
            v(1) <= -1 * v(1);
            v(2) <= -1 * v(2);
            return v;
        end if;

        for i in 0 to P-1 loop
            if (i > (ANGLES'length - 1)) then
                --- angle_i := angle_i / 2;
                angle_i := angle_i srl 1;   -- Si superé la tabla, aproximo
            else
                angle_i := ANGLES(i);  -- Si no, tabla
            end if;

            if (beta < 0) then
                sigma = -1;
            else
                sigma = 1;
            end if;

            --- v_aux(1) <= v(1) - sigma * (v(2) * 2^(-i));
            v_aux(1) <= v(1) - sigma * (v(2) srl i);
            --- v_aux(2) <= sigma * (v(1) * 2^(-i)) + v(2);
            v_aux(2) <= sigma * (v(1) srl i) + v(2);
            v <= v_aux;

            -- Actualizo ángulo beta faltante
            beta = beta - sigma * angle_i;
        end loop;

        if (P > K_VALUES'length) then
            Kn := K_VALUES(K_VALUES'length - 1);
        else
            Kn := K_VALUES(P - 1);
        end if;

        -- Ajusto magnitud del vector
        for i in 1 to 2 loop
            v(i) <= Kn * v(i);
        end loop;

        return v;
    end function;

end package body cordic_lib;
