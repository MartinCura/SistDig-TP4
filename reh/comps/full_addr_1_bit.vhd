library ieee;
use ieee.std_logic_1164.all;

entity full_addr_1_bit is
    port(
        A: in std_logic;
        B: in std_logic;
        Cin: in std_logic;  -- carry
        S: out std_logic;
        Cout: out std_logic -- carry out
    );
end;

architecture full_addr_1_bit_beh of full_addr_1_bit is
begin

    S <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);

end;
