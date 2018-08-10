library ieee;
use ieee.std_logic_1164.all;

entity extRam_loader is

    port(
        clock : in std_logic;
        reset : in std_logic;
        data_in : in std_logic_vector(7 downto 0);
        RxRdy_in : in std_logic;
        data_out : out std_logic_vector(15 downto 0);
        RxRdy_out : out std_logic
    );

end;

architecture extRam_loader_arq of extRam_loader is

    type t_estado is (LSB, MSB);
    signal estado : t_estado := LSB;

begin

    process(clock, reset)
    begin
        -- reset
        if reset = '1' then
            data_out <= (others => '0');
            estado <= LSB;
            RxRdy_out <= '0';

        elsif rising_edge(clock) then
            RxRdy_out <= '0';

            case estado is
                when LSB =>
                    if RxRdy_in = '1' then  -- Modo lectura del LSB
                        data_out(7 downto 0) <= data_in;
                        RxRdy_out <= '0';
                        estado <= MSB;
                    end if;

                when MSB =>
                    if RxRdy_in = '1' then
                        data_out(15 downto 8) <= data_in;
                        RxRdy_out <= '1';
                        estado <= LSB;
                    end if;
            end case;
        end if;
    end process;

end;
