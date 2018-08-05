-- Loader de posiciones (x,y,z) desde la RAM externa
library ieee;
use ieee.std_logic_1164.all;

entity pos_loader is

    port (
        clock: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        start: in std_logic;
        data_in: in std_logic_vector(15 downto 0);
        go_ram: out std_logic;
        busy_ram: in std_logic;
        RxRdy_ram: in std_logic;
        RxRdy_out: out std_logic;
        x, y, z: out std_logic_vector(15 downto 0)
    );

end;

architecture pos_loader_arq of pos_loader is

    -- Para indicar qué coordenada se está cargando
    type t_estado is (IDLE, X_st, Y_st, Z_st);
    signal estado : t_estado := IDLE;

begin

    process(clock, reset, start, RxRdy_ram, busy_ram)
    begin
        -- reset
        if reset = '1' then
            go_ram <= '0';
            estado <= IDLE;

        elsif rising_edge(clock) then
            RxRdy_out <= '0';
            go_ram <= '0';
            if enable = '1' then
                case estado is

                    when IDLE =>
                        if start = '1' and busy_ram = '0' then -- pido X
                            go_ram <= '1';
                            estado <= X_st;
                        end if;

                    when X_st =>
                        if RxRdy_ram = '1' then -- Ya X, pido Y
                            x <= data_in;
                            go_ram <= '1';
                            estado <= Y_st;
                        end if;

                    when Y_st =>
                        if RxRdy_ram = '1' then -- Ya Y, pido Z
                            y <= data_in;
                            go_ram <= '1';
                            estado <= Z_st;
                        end if;

                    when Z_st =>
                        if RxRdy_ram = '1' then -- Ya Z, vuelvo a IDLE
                            x <= data_in;
                            RxRdy_out <= '1'; -- Posición lista
                            go_ram <= '1';
                            estado <= X_st;---
                        end if;

                end case;
            end if;
        end if;
    end process;

end;
