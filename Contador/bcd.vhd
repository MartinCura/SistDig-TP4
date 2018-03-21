library IEEE;
use IEEE.std_logic_1164.all;

-- Contador BCD 0-9 con flag
entity bcd is
	port (
		clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		q: out std_logic_vector(3 downto 0);
		c: out std_logic	-- Flag de carry
	);
end;

architecture bcd_arq of bcd is
	
	signal rst_aux: std_logic := '0';
	signal q_aux: std_logic_vector(3 downto 0) := "0000";
	
begin
	
	-- Salida
	q <= q_aux;

	-- Flag de carry
	c <= q_aux(0) and q_aux(3);
	
	-- Si pasa el 9, reset
	rst_aux <= rst or (q_aux(1) and q_aux(3));
	
	Contador: entity work.contador4b
		port map(
			clk => clk,
			rst => rst_aux,
			ena => ena,
			q => q_aux
		);
	
end;
