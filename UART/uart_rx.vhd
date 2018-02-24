library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity uart_rx is
	generic(data_bits: integer := 8; --cantidad de bits de datos a recibir. 
			ticks: integer := 16 --ticks por bits de stop. 16 para 1 bit de stop, 32 para 2 bits de stop.
	); 

	port(
		clk_in, reset_in: in std_logic;
		tick_in: in std_logic;
		rx_in: in std_logic;
		rx_done_tick: out std_logic; --es un flag que se pone en 1 cuando se completo la recepcion.
		data_out: out std_logic_vector(data_bits - 1 downto 0) 
	);
end;

architecture arch of uart_rx  is
	
-- En el libro el chabon usa maquinas de estado, releer esa parte pp138 pp158. ver listing 5.2 en pagina 144
	type state_type is (IDLE, START_RX, DATA, STOP_RX);
	signal rx_reg : std_logic_vector (data_bits-1 downto 0); --registro auxiliar que despues igualo al data_out del port
	signal state_reg, state_next: state_type;
	signal rx_counter : integer; --Para contar la cantidad de bits que estoy recibiendo

	begin
	FMS_RX:	process(clk_in, reset_in)
			
	--si reset = 1 me quedo en idle, inicializo todo a cero		
		if reset_in = '1' then 

				state_reg <= IDLE;
				data_out <= (others => '0');
				rx_reg <= (others => '0');

		else if rising_edge(CLK) then
			
			

		end if ;
		end if;

	end process;
end;