library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.cordic_lib.all;
---use work.float_pkg.all;
--library ieee_proposed;
--use ieee_proposed.float_pkg.all;
library floatfixlib;
use floatfixlib.float_pkg.all;

-- Almacena y actualiza ángulos de rotación en cada ciclo
--- Funciona perfecto (salvo por un retraso de 1 clock para resetear, nada importante)
entity det_angulos is
	generic (
		C : integer := 1---50 * (10**6)	-- Ciclo en clocks. Clock es 50 MHz. --- Si es rotación manual, chequear siempre
	);
	port (
		clk: in std_logic;
		ena: in std_logic;
		rst: in std_logic;
        inc_a, inc_b, inc_g: in std_logic;
        neg_a, neg_b, neg_g: in std_logic;
		
        a, b, g: out float32 := CERO
	);
end;

architecture det_angulos_arq of det_angulos is

    constant PASO_ANG : t_float := "00111111001101000000000000000000";	-- Paso angular ∆φ: 0.703125 grados
	constant PASO_ANG_R : t_float := PI_PF * PASO_ANG / 180;			-- Paso angular en radianes
	
	signal a_aux, b_aux, g_aux : t_float := CERO;

begin

	process(clk)---, rst, inc_a, inc_b, inc_g)
	variable i : NATURAL := 0;
	begin
		if rising_edge(clk) then
			if rst = '1' then
				a_aux <= CERO;
				b_aux <= CERO;
				g_aux <= CERO;
			elsif ena = '1' then
				i := i + 1;
				if i >= C then	-- Actualizar ángulos de rotación cada C clocks
					i := 0;
					if inc_a = '1' then
						if neg_a = '1' then
							a_aux <= a_aux - PASO_ANG_R;
						else
							a_aux <= a_aux + PASO_ANG_R;
						end if;
					end if;
					if inc_b = '1' then
						if neg_b = '1' then
							b_aux <= b_aux - PASO_ANG_R;
						else
							b_aux <= b_aux + PASO_ANG_R;
						end if;
					end if;
					if inc_g = '1' then
						if neg_g = '1' then
							g_aux <= g_aux - PASO_ANG_R;
						else
							g_aux <= g_aux + PASO_ANG_R;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;

	a <= a_aux;
	b <= b_aux;
	g <= g_aux;
	
end;
