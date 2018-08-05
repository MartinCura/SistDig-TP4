-- Contador de N bits
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter is

    generic(
        N_bits : natural := 2;
        MAX_COUNT : natural := 2
    );
    port(
        clock: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        counter_output: out std_logic_vector(N_bits-1 downto 0);
        carry_out: out std_logic
    );

end entity counter;


architecture counter_arch of counter is

    signal counter_aux : unsigned(N_bits-1 downto 0) := (others => '0');

begin

    counter_output <= std_logic_vector(counter_aux);

    process(clock, enable, reset)
    begin
        -- Reset
        if reset = '1' then
            counter_aux <= (others => '0');
            carry_out <= '0';

        elsif rising_edge(clock) then
            if enable = '1' then
                if counter_aux = MAX_COUNT then
                    counter_aux <= (others => '0');
                    carry_out <= '1';
                else
                    counter_aux <= counter_aux + 1;
                    carry_out <= '0';
                end if;
            end if;
        end if;
    end process;

end counter_arch;
