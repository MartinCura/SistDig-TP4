library ieee;
use ieee.std_logic_1164.all;

library work;
use work.cordic_lib.all;
---use work.float_pkg.all;
--library ieee_proposed;
--use ieee_proposed.float_pkg.all;
library floatfixlib;
use floatfixlib.float_pkg.all;

-- Rota un punto 3D, usando 3 veces el algoritmo CORDIC y rotando según los ángulos para cada eje
entity rotador3d is
    generic(
		N_BITS: integer := 32
	);
	port(
        ena : in std_logic := '0';  	-- Enable para rotar
        pos_in: in t_pos;      			-- Posición de un punto a rotar a la pos correcta
		alfa, beta, gama: in t_float;	-- Ángulo de rotación en x, y, z respectivamente
        pos_rotada: out t_pos			-- Posición una vez rotada (o la original si ena = 0)
	);
end;

architecture rotador3d_arq of rotador3d is
   
	signal pos_1, pos_2, pos_3 : t_pos;
	signal vec_1a, vec_1b, vec_2a, vec_2b, vec_3a, vec_3b : t_vec;

begin

	-- Rotación en x
	vec_1a(1) <= pos_in(2);
	vec_1a(2) <= pos_in(3);
	process(vec_1a, alfa)
	begin
		if (alfa /= 0) then
			vec_1b <= cordic(vec_1a, alfa);
		end if;
	end process;
	pos_1(1) <= vec_1b(1) when (alfa /= 0) else pos_in(2);
	pos_1(2) <= vec_1b(2) when (alfa /= 0) else pos_in(3);
	pos_1(3) <= pos_in(1);
	
	-- Rotación en y
	vec_2a(1) <= pos_1(2);
	vec_2a(2) <= pos_1(3);
	process(vec_2a, beta)
	begin
		if (beta /= 0) then
			vec_2b <= cordic(vec_2a, beta);
		end if;
	end process;
	pos_2(1) <= vec_2b(1) when (beta /= 0) else pos_1(2);
	pos_2(2) <= vec_2b(2) when (beta /= 0) else pos_1(3);
	pos_2(3) <= pos_1(1);
	
	-- Rotación en z
	vec_3a(1) <= pos_2(2);
	vec_3a(2) <= pos_2(3);
	process(vec_3a, gama)
	begin
		if (gama /= 0) then
			vec_3b <= cordic(vec_3a, gama);
		end if;
	end process;
	pos_3(1) <= vec_3b(1) when (gama /= 0) else pos_2(2);
	pos_3(2) <= vec_3b(2) when (gama /= 0) else pos_2(3);
	pos_3(3) <= pos_2(1);
	
	-- Salida
	pos_rotada <= pos_3 when ena = '1' else pos_in;

end;
