library ieee;
use ieee.std_logic_1164.all;

entity delta_delay is
    generic(
        N : natural := 1
    );
    port(
        A : in std_logic;
        Z : out std_logic
    );
end entity delta_delay;

architecture delta_delay_arch of delta_delay is

    signal Z_aux : std_logic_vector(N-2 downto 0);

begin

    Z_aux(0) <= A; -- 1 delta

    ciclo: for i in 1 to (N-2) generate
        Z_aux(i) <= Z_aux(i-1);
    end generate;

    Z <= Z_aux(N-2); -- 1 delta

end delta_delay_arch;
