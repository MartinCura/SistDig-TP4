library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ffd_serie is

    generic (
        N : natural := 1
    );
    port (
        clock : in std_logic;
        reset : in std_logic;
        enable: in std_logic;
        D : in std_logic;
        Q : out std_logic
    );

end;

architecture ffd_serie_arq of ffd_serie is

    signal aux : std_logic_vector(N downto 0);

begin

    aux(0) <= D;

    delay_i: for i in 1 to N generate
        ffd_delay: entity work.ffd
            port map(
                clk => clock,
                rst => reset,
                ena => enable,
                d => aux(i-1),
                q => aux(i)
            );
    end generate;

    Q <= aux(N);

end;
