-- Retarda en N ciclos el vector recibido
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity delay_reg is
    generic(
        N: natural := 8;
        DELAY: natural := 0
    );
    port(
        clock: in std_logic;
        reset: in std_logic;
        enable: in std_logic;
        A: in std_logic_vector(N-1 downto 0);
        B: out std_logic_vector(N-1 downto 0)
    );
end entity delay_reg;

architecture delay_arch of delay_reg is

    type t_aux is array(0 to DELAY+1) of std_logic_vector(N-1 downto 0);
    signal aux: t_aux;

begin

    -- Entrada
    aux(0) <= A;

    gen_retardo: for i in 0 to DELAY generate

        sin_retardo: if i = 0 generate
            aux(1) <= aux(0);
        end generate sin_retardo;

        con_retardo: if i > 0 generate
            reg: entity work.registroNb
            generic map(N)
            port map(
                clk => clock,
                rst => reset,
                ena => enable,
                d => aux(i),
                q => aux(i+1)
            );
        end generate con_retardo;

    end generate gen_retardo;

    -- Salida
    B <= aux(DELAY+1);

end architecture delay_arch;
