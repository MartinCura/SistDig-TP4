library IEEE;
use IEEE.std_logic_1164.all;

library work;
---use ieee_proposed.float_pkg.all;
use work.float_pkg.all;
use work.cordic_lib.all;

-- Almacena y actualiza ángulos de rotación en cada ciclo
entity det_angulos is
	generic (
		C : integer := 50 * (10**6)		-- Ciclo en clocks. Clock es 50 MHz.
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
	
	signal a_aux, b_aux, g_aux : t_float := CERO;

begin

	process(clk)
	variable i : NATURAL := 0;
	begin
		if ena = '1' then
			i := i + 1;
			if i = C then	-- Cada C clocks, actualizar ángulos de rotación
				i := 0;
				if rst = '1' then
					a_aux <= CERO;
					b_aux <= CERO;
					g_aux <= CERO;
				else
					if inc_a = '1' then
						if neg_a = '1' then
							a_aux <= a_aux - PASO_ANG;
						else
							a_aux <= a_aux + PASO_ANG;
						end if;
					end if;
					if inc_b = '1' then
						if neg_b = '1' then
							b_aux <= b_aux - PASO_ANG;
						else
							b_aux <= b_aux + PASO_ANG;
						end if;
					end if;
					if inc_g = '1' then
						if neg_g = '1' then
							g_aux <= g_aux - PASO_ANG;
						else
							g_aux <= g_aux + PASO_ANG;
						end if;
					end if;
				end if;					
				
				--a := CERO when rst = '1' else ((a - PASO_ANG when neg_a = '1' else a + PASO_ANG) when inc_a = '1' else a);
				--b := CERO when rst = '1' else ((b - PASO_ANG when neg_b = '1' else b + PASO_ANG) when inc_b = '1' else b);
				--g := CERO when rst = '1' else ((g - PASO_ANG when neg_g = '1' else g + PASO_ANG) when inc_g = '1' else g);
			end if;
		end if;
		
		a <= a_aux;
		b <= b_aux;
		g <= g_aux;
	end process;
	
end;
