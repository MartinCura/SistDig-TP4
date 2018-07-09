library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cordic_lib.all;

library floatfixlib;
use floatfixlib.float_pkg.all;


entity tester_ram_interna is

	generic(
		N_BITS_COORD : integer := 32	--- REVISAR
	);

	port(
		clk_i: in std_logic;		-- Clock general
		rst_i: in std_logic := '0';	-- Botón de reset
		
		pos_leida: out t_pos;
		ena_o: out std_logic := '0';
		ram_int_refresh: out std_logic := '0'
	);

	attribute loc: string;
	attribute loc of clk_i: signal is "B8";

end;

architecture tester_ram_interna_arq of tester_ram_interna is

	signal pos_leida_aux: t_pos;

	signal RxRdy: std_logic := '0';		-- Dato listo para leerse
	signal Dout_uart: std_logic_vector(15 downto 0) := (others => '0');
	signal lectura_32b: std_logic_vector(N_BITS_COORD-1 downto 0) := (others => '0');
	signal lectura_fp: t_coordenada := CERO;

	type memo_t is array(0 to 14) of std_logic_vector(15 downto 0);
	constant testmemo : memo_t := (
			"0000000000000000",
			"0000000000000100",
			"0000000000001100",
			"0000000001100000",
			"0000000000000010",
			"0000000000000001",
			"1000001100000000",
			"1000000000010000",
			"0100000000010000",
			"1111111111111111",
			"1111111111111110",
			"1111101111101111",
			"0000000000000010",
			"1000000000000011",
			"0000000000000011"
		);
	
begin

	process(clk_i)
	variable i : natural := 0;
	variable j : natural := 0;
	variable n : natural := 0;
	begin
		if rising_edge(clk_i) then
			i := i + 1;
			if i > 32 then
				i := 0;
				Dout_uart <= testmemo(j);
				RxRdy <= '1';
				j := j + 1;
				if j >= testmemo'length then
					j := 0;
				end if;
			end if;
			--- else RxRdy <= '0';
			
			if n < 150 then
				report "pos_leida 1 " & integer'image(to_integer(signed(pos_leida_aux(1))))-- & " ena_o " & ena_o
					severity note;
				report "pos_leida 2 " & integer'image(to_integer(signed(pos_leida_aux(2))))-- & " ena_o " & ena_o
					severity note;
				report "pos_leida 3 " & integer'image(to_integer(signed(pos_leida_aux(3))))-- & " ena_o " & ena_o
					severity note;
				n := n + 1;
			end if;
		end if;
	end process;
	
	
	lectura_32b <= std_logic_vector(to_signed(to_integer(signed(Dout_uart)),N_BITS_COORD));
	lectura_fp <= to_float(lectura_32b);

	--- Se guarda un dato de lectura listo en memoria [interna]. Continuamente se leen y guardan en vector pos_leida
	ram_int: entity work.ram_interna
		generic map(
			N_BITS => N_BITS_COORD,
			CANT_P => 1000
		) port map(
			clk => clk_i,
			rst => rst_i,
			Rx  => RxRdy,
			Din => lectura_fp,

			Dout => pos_leida_aux,
			Rdy => ena_o,
			barrido => ram_int_refresh
		);
	
	pos_leida <= pos_leida_aux;

end;
