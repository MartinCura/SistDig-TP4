library IEEE;
use IEEE.std_logic_1164.all;

entity ffd is
	port (
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		d: in std_logic;
		q: out std_logic := '0'
	);
end ffd;

architecture ffd_arq of ffd is
begin

	process(clk, rst)
	begin
		if rst = '1' then
			q <= '0';
		elsif rising_edge(clk) then
			if ena = '1' then
				q <= d;
			end if;
		end if;
	end process;
	
end ffd_arq;
