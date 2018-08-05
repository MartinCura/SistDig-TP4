library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
    generic (
        N : integer := 8
    );
    port (
        clock : in std_logic;
        load : std_logic;
        A : in std_logic_vector(N-1 downto 0);
        B : in std_logic_vector(N-1 downto 0);
        result : out std_logic_vector(2*N-1 downto 0);
        done : out std_logic
    );
end;

architecture multiplier_arq of multiplier is

    signal aux, regA_in, regB_in, regA_out, regB_out, regP_in, regP_out, adder_out
        : std_logic_vector(N-1 downto 0);
    signal Co : std_logic;
    signal enable_aux : std_logic := '1';
    signal done_aux : std_logic := '0';

begin

    regA_inst: entity work.registroNb
    generic map(
        N => N
    ) port map(
        clk => clock,
        rst => '0',
        ena => '1',
        d => regA_in,
        q => regA_out
    );

    regB_inst: entity work.registroNb
    generic map(
        N => N
    ) port map(
        clk => clock,
        rst => '0',
        ena => '1',
        d => regB_in,
        q => regB_out
    );

    regP_inst: entity work.registroNb
    generic map(
        N => N
    ) port map(
        clk => clock,
        rst => '0',
        ena => '1',
        d => regP_in,
        q => regP_out
    );

    adder_inst: entity work.adder
    generic map(
        N => N
    ) port map(
        A => aux,
        B => regP_out,
        control => '0',
        S => adder_out,
        Cout => Co
    );

    regA_in <= A;
    -- Es necesario poner el registro P en cero cuando se cargan nuevos datos,
	-- además de resetear la salida.
	regP_in <= Co & adder_out(N-1 downto 1) when load = '0' else
	           (others => '0');
	regB_in <= B when (load='1') else
		       adder_out (0) & regB_out(N-1 downto 1);
	aux <= regA_out when regB_out(0)='1' else
		   (others=>'0');

    done <= done_aux;
    result <= regP_out & regB_out when done_aux = '1' else
              (others => 'X');

    process (clock)
    variable i: integer := 0;
    begin
        if rising_edge(clock) then
            if load = '1' then
                i := 0;
                done_aux <= '0';
            end if;

            if i < N then
                i := i + 1;
            elsif i = N then
                done_aux <= '1';
                i := i+1;
            else
                done_aux <= '0';
            end if;
        end if;
    end process;

end;
