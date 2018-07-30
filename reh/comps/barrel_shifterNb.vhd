library IEEE;
use IEEE.std_logic_1164.all;

-- Barrel shifter de N bits (default = 4)
entity barrel_shifterNb is
    -- Cantidad de bits
	generic (N: NATURAL := 4);

	port (
        to_left : in std_logic;
        M : in natural;
        a : in std_logic_vector(N-1 downto 0);
        o : out std_logic_vector(N-1 downto 0)
	);
end;

architecture barrel_shifterNb_arq of barrel_shifterNb is

    -- Señal con cada corrido posible simultáneamente
    type t_shifts is array(natural range<>) of std_logic_vector(N-1 downto 0);
    signal shs : t_shifts(0 to N);

begin

    shs(0) <= a;
    for i in 1 to N generate
        shs(i) <= shs(i-1)(N-2 downto 0) & '0' when to_left = '1' else  -- Lleno
                  shs(i-1)(N-1) & shs(i-1)(N-1 downto 1);   -- Extiendo
    end generate;

    -- Agarro el que quiero
    o <= shs(M);

end barrel_shifterNb_arq;
