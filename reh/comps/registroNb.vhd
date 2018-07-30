library IEEE;
use IEEE.std_logic_1164.all;

-- Registro de N bits (default = 4)
entity registroNb is
	-- Cantidad de bits
	generic (N: NATURAL := 4);

	port (
		clk: in std_logic;
		ena: in std_logic;
		d: in  std_logic_vector(N-1 downto 0);
		q: out std_logic_vector(N-1 downto 0)
	);
end;

architecture registroNb_arq of registroNb is
begin

	FFD_i: for i in 0 to N-1 generate
		FFD_inst: entity work.ffd
			port map(
				clk => clk,
				rst => '0',
				ena => ena,
				d => d(i),
				q => q(i)
			);
	end generate;

end;
