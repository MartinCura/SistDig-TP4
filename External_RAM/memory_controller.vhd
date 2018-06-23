library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MemoryController is
    Generic (
        clock_frec : integer := 50 -- MHz
    );
    Port ( 
			  clk				:in	STD_LOGIC;								 -- 100MHz/50MHz
			  reset				:in	STD_LOGIC;								
			  address_in	    :in	STD_LOGIC_VECTOR (22 downto 0);	         -- RAM address
			  mem				:in	STD_LOGIC;								 -- if='1' Comienza la operacion
			  rw		        :in	STD_LOGIC;								 -- if='0' => lectura if='1' => escritura
			  data_in			:in STD_LOGIC_VECTOR (15 downto 0);	         -- data que va a ser escrita
			  data_out		    :out STD_LOGIC_VECTOR (15 downto 0);	     -- data que va a ser leida
              read_ready_out    :out STD_LOGIC;                              -- if='1' valida data_out
              busy 				:out STD_LOGIC;                              -- if='1' RAM esta ocupada (mem no tiene efecto)

			  clock_out		        :out STD_LOGIC;
			  ADDRESS			    :out STD_LOGIC_VECTOR (22 downto 0);
			  ADV					:out STD_LOGIC;
			  CRE					:out STD_LOGIC;
			  CE					:out STD_LOGIC;
			  OE					:out STD_LOGIC;
			  WE					:out STD_LOGIC;
			  LB					:out STD_LOGIC;
			  UB					:out STD_LOGIC;
			  DATA				    :inout	STD_LOGIC_VECTOR (15 downto 0)
			 );
end entity MemoryController;

architecture Behavioral of MemoryController is

	type state_t is (INIT, IDLE, WRITING, READING); --Estados en los que se encuentra el controlador
    signal state : state_t := INIT;
    constant clock_period_ns : integer := (1000/clock_frec); -- nanosegundos (50MHz => 20ns, 100MHz => 10ns)
    constant init_period_us : integer := 151; -- microsegundos (151 us)
	constant init_counter : integer := (init_period_us * 1000 / clock_period_ns); -- 151 microsegundos
	constant timing_counter : integer := (80 / clock_period_ns); -- 80 nanosegundos (70ns)
	signal counter : integer range 0 to init_counter := 0;
	
    -- Controla la data de entrada a escribir en la RAM
	signal writing_out : STD_LOGIC := '0';
    signal address_aux : std_logic_vector(22 downto 0) := (others => '0');
    signal data_in_aux : std_logic_vector(15 downto 0) := (others => '0');

begin

   ADDRESS <= address_aux ;
  --Estado y registro de datos
  address_process: process (clk, reset)
  begin
    if reset = '1' then
      address_aux <= (others => '0');
      data_in_aux <= (others => '0');
    elsif rising_edge(clk) then ---elsif (clk'event and clk = 'l') then
      if mem = '1' then
        address_aux <= address_in;
        data_in_aux <= data_in;
      end if;
    end if;
  end process;
  --

	clock_out <= '0'; -- El control opera asincronicamente
	CRE <= '0'; -- El controlador usa la configuracion default
	
  -- Señal auxiliar para poder inicializar correctamente
  -- de modo que no quede indefinido su valor antes del primer mem
	DATA <= data_in_aux when writing_out='1' else (others => 'Z');
  --

  -- Señales de control
  busy <= '1' when (state = WRITING OR state = READING OR state = INIT) else '0';
  ADV <= '1' when state = INIT else '0';
  CE <= '0' when (state = WRITING OR state = READING) else '1'; --Habilita o deshabilita el chip
  LB <= '0' when (state = WRITING OR state = READING) else '1'; --Habilita o deshabilita el lower byte del bus de datos
  UB <= '0' when (state = WRITING OR state = READING) else '1'; --Habilita o deshabilita el upper byte del bus de datos
  WE <= '0' when state = WRITING else '1'; --Habilita o deshabilita la operación de escritura
  OE <= '0' when state = READING else '1'; --Habilita o deshabilita la salida
  writing_out <= '1' when state = WRITING else '0';
	
  -- FSM process
  FSM: process (clk, reset)
  begin
    -- RESET
    if reset = '1' then
       state <= INIT;
    elsif rising_edge(clk) then ---elsif (clk'event and clk = 'l') then
      case state is
        -- INIT
        when INIT => 
          read_ready_out <= '0';
          data_out <= (others => '0');
          if (counter >= init_counter) then
            counter <= 0;
            state <= IDLE;
          else
            counter <= counter + 1;
          end if;
        -- IDLE
        when IDLE => 
          read_ready_out <= '0';
          data_out <= (others => '0');

          if mem = '1' then --Si esta habilitado el controlador, entonces entra en estado de lectura o escritura
            if rw = '1' then
              state <= WRITING;
            else
              state <= READING;
            end if;
          end if;

        -- WRITING
        when WRITING =>
          if (counter >= timing_counter - 1) then
            counter <= 0;
            state <= IDLE;
          else
            counter <= counter + 1;
          end if;

        -- READING
        when READING =>
          -- En el último ciclo de la cuenta
          if (counter = timing_counter - 2) then
            data_out <= DATA;
            counter <= counter + 1;
            -- Adelanto el read_ready_out para leer en el 5to flanco
            read_ready_out <= '1';
          -- Cuando termina de contar
          elsif (counter >= timing_counter - 1) then
            counter <= 0;
            state <= IDLE;
            data_out <= DATA;
            read_ready_out <= '0';
          else
            counter <= counter + 1;
          end if;

        when others =>
          state <= IDLE;

      end case;
    end if;
  end process; -- FSM
  
end;
