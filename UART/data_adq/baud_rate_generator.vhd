library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--Bloque contador de una salida. Su salida se  pone en 1 cuando el contador llega al valor indicado en cycles.

--necesito generar una señal muestreadora con una frecuencia de 16*BaudRate.

--elijo un baudrate de 19200 con un clock de 50Mhz, con lo cual cycles = 50e6/(16*19200) = 163



entity baud_rate_generator is
	generic(cycles: natural := 163); --numero de ciclos de reloj a contar. 

	port(
		clk_in: in std_logic;
		tick_out: out std_logic
	);
end;

architecture arch of baud_rate_generator  is
	
begin
	process(clk_in)
		variable counter: integer := 0; --inicio el contador en cero
	begin
		if rising_edge(clk_in) then

			counter := counter + 1;

			if counter = cycles then

				tick_out <= '1';

			else
				tick_out <= '0';
			end if;

		end if;
	end process;
end;
