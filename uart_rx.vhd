library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity uart_rx is
	generic(DATA_BITS: integer := 8; --cantidad de bits de datos a recibir. 
			TICKS: integer := 16 --ticks por bits de stop. 16 para 1 bit de stop, 32 para 2 bits de stop.
	); 

	port(
		clk_in, reset_in: in std_logic;
		tick_in: in std_logic;
		rx_in: in std_logic;
		rx_done_tick: out std_logic; --hay que ver que es esto, en el libro esta asique lo deje
		data_out: out std_logic_vector(DATA_BITS - 1 downto 0) 
	);
end;

architecture arch of uart_rx  is
	
-- En el libro el chabon usa maquinas de estado, releer esa parte pp158.

begin
	process(clk_in)
		
	begin
		if rising_edge(clk_in) then

			

		end if;
	end process;
end;