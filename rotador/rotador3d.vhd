library ieee;
use ieee.std_logic_1164.all;

library work;
use work.cordic_lib.all;
---use work.float_pkg.all;
library ieee_proposed;
use ieee_proposed.float_pkg.all;

-- Rota un punto 3D, usando 3 veces el algoritmo CORDIC, usando 3 veces el algoritmo CORDIC y los ángulos para cada eje
entity rotador3d is
    generic(
		N: integer := 32
	);
	port(
        ena: in std_logic;  	-- Enable para rotar
        pos: in t_pos;      	-- Posición de un punto a rotar a la pos correcta
		alfa, beta, gama: in t_float;  -- Ángulo de rotación en x, y, z
        pos_rotada: out t_pos	---Valor inicial?
	);
end;

architecture rotador3d_arq of rotador3d is
   
	signal aux_1, aux_2, aux_3 : t_pos;
	signal vec_aux : t_vec;

begin

	process(pos)	--- Con cada cambio de posición?? Con cada clock???
	begin
	    if ena = '1' then
			-- Rotación en x
			if (alfa /= 0) then
				---aux_1 <= cordic(pos, alfa); -- Otra forma, pero es menos clara de este lado
				vec_aux(1) <= pos(2);
				vec_aux(2) <= pos(3);
				vec_aux <= cordic(vec_aux, alfa);
				aux_1(1) <= vec_aux(1);
				aux_1(2) <= vec_aux(2);
			else
				aux_1(1 to 2) <= pos(2 to 3);
			end if;
			aux_1(3) <= pos(1);

			-- Rotación en y
			if (beta /= 0) then
				vec_aux(1) <= aux_1(2);
				vec_aux(2) <= aux_1(3);
				vec_aux <= cordic(vec_aux, beta);
				aux_2(1) <= vec_aux(1);
				aux_2(2) <= vec_aux(2);
			else
				aux_2(1 to 2) <= aux_1(2 to 3);
			end if;
			aux_2(3) <= aux_1(1);

			-- Rotación en z
			if (gama /= 0) then
				vec_aux(1) <= aux_2(2);
				vec_aux(2) <= aux_2(3);
				vec_aux <= cordic(vec_aux, gama);
				aux_3(1) <= vec_aux(1);
				aux_3(2) <= vec_aux(2);
			else
				aux_3(1 to 2) <= aux_2(2 to 3);
			end if;
			aux_3(3) <= aux_2(1);

			pos_rotada <= aux_3;
		end if;
	end process;

end;
