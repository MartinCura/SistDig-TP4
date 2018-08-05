library ieee;
use ieee.std_logic_1164.all;


entity MemoryController is

    generic (
        clock_frec : integer := 50  -- MHz
    );
    port (
        clock       : in std_logic;     -- 100MHz/50MHz
        reset       : in std_logic;
        address_in  : in std_logic_vector(22 downto 0); -- dirección RAM
        go_in       : in std_logic;     -- if='1' starts the operation
        write_in    : in std_logic;     -- if='0' => read; if='1' => write
        data_in     : in std_logic_vector(15 downto 0);     -- datos a escribir
        data_out    : out std_logic_vector(15 downto 0);    -- datos leídos
        read_ready_out : out std_logic; -- if='1' valid data_out
        busy        : out std_logic;    -- if='1' RAM is busy (go_in won't take effect)
        -- Controladores de la memoria (externa):
        clock_out   : out std_logic;
        ADDRESS     : out std_logic_vector(22 downto 0);
        ADV         : out std_logic;
        CRE         : out std_logic;
        CE          : out std_logic;
        OE          : out std_logic;
        WE          : out std_logic;
        LB          : out std_logic;
        UB          : out std_logic;
        DATA        : inout std_logic_vector(15 downto 0)
    );

end;


architecture Behavioral of MemoryController is

    type t_state is (INIT, IDLE, WRITING, READING);
    signal state : state_t := INIT;
    constant clock_period_ns : integer := (1000/clock_frec); -- nanoseconds (50MHz => 20ns, 100MHz => 10ns)
    constant init_period_us : integer := 151; -- microseconds (151 us)
    constant init_counter : integer := (init_period_us * 1000 / clock_period_ns); -- 151 microseconds
    constant timing_counter : integer := (80 / clock_period_ns); -- 80 nanoseconds (70ns)

    signal counter : integer range 0 to init_counter := 0;

    -- Controls the input data to write to the RAM
    signal writing_out : STD_LOGIC := '0';

    -- signal current_data_out, next_data_out : std_logic_vector(15 downto 0):= (others => '0');

    -- Agregado:
    signal address_aux : std_logic_vector(22 downto 0) := (others => '0');
    signal data_in_aux : std_logic_vector(15 downto 0) := (others => '0');

begin

    ADDRESS <= address_aux;

    address_process: process (clock, reset)
    begin
        if reset = '1' then
            address_aux <= (others => '0');
            data_in_aux <= (others => '0');
        elsif rising_edge(clock) then
            if go_in = '1' then
                address_aux <= address_in;
                data_in_aux <= data_in;
            end if;
        end if;
    end process;

    clock_out <= '0'; -- always '0' since this controller operates in asynchronous mode
    CRE <= '0'; -- always '0' because this controller uses the default configuration

    -- DATA <= data_in when writing_out='1' else (others => 'Z');
    DATA <= data_in_aux when writing_out='1' else (others => 'Z');

    -- Señales de control
    busy <= '1' when (state = WRITING OR state = READING OR state = INIT) else '0';
    ADV <= '1' when state = INIT else '0';
    CE <= '0' when (state = WRITING OR state = READING) else '1';
    LB <= '0' when (state = WRITING OR state = READING) else '1';
    UB <= '0' when (state = WRITING OR state = READING) else '1';
    WE <= '0' when state = WRITING else '1';
    OE <= '0' when state = READING else '1';
    writing_out <= '1' when state = WRITING else '0';

    -- FSM process
    FSM: process (clock, reset)
    begin
        -- RESET
        if reset = '1' then
            state <= INIT;

        elsif rising_edge(clock) then

            case state is

                when INIT =>
                    read_ready_out <= '0';
                    data_out <= (others => '0');
                    if (counter >= init_counter) then
                        counter <= 0;
                        state <= IDLE;
                    else
                        counter <= counter + 1;
                    end if;

                when IDLE =>
                    read_ready_out <= '0';
                    data_out <= (others => '0');
                    if go_in = '1' then
                        if write_in = '1' then
                            state <= WRITING;
                        else
                            state <= READING;
                        end if;
                    end if;

                when WRITING =>
                    if (counter >= timing_counter - 1) then
                        counter <= 0;
                        state <= IDLE;
                    else
                        counter <= counter + 1;
                    end if;

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
                        --read_ready_out <= '1';
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
