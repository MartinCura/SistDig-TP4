library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity rot_ena_gen is

	generic(
		-- Cada cuántos ciclos rotar; no superar 50 MHz
		M: NATURAL := 50 * (10**6)	-- 50 MHz
	);

	port (
		clk: in std_logic;
		ena: out std_logic := '0'
	);

end;

architecture rot_ena_gen_arq of rot_ena_gen is
begin

	process(clk)
	variable i : NATURAL;
	begin
		if rising_edge(clk) then
			ena <= '0';
			i := i + 1;
			if i = M then
				i := 0;
				ena <= '1';
			end if;
		end if;
	end process;

end;
