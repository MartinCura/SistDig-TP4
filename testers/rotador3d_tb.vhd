library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cordic_lib.all;

--library ieee_proposed;
--use ieee_proposed.float_pkg.all;
library floatfixlib;
use floatfixlib.float_pkg.all;


entity rotador3d_tb is

	generic(
		N_BITS_COORD : integer := 32	--- REVISAR
	);

	port(
		vec_pos_pixel: out t_vec := (others => CERO)
	);

end;

architecture rotador3d_tb_arq of rotador3d_tb is

	type memo_t is array(0 to 39) of std_logic_vector(15 downto 0);
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
			"1111110111111110",
			"1111101111101111",
			"0000000000000010",
			"1000000000000011",
			"0000000000000011",
			"0000000001100000",
			"0000000000000010",
			"0000000000000001",
			"1000001100000000",
			"1000000000010000",
			"0100000000010000",
			"1111111101111111",
			"1111111111111110",
			"1111111111111110",
			"1111101111101111",
			"0000000000000010",
			"1000000000000011",
			"0000000000000011",
			"0000000001100000",
			"0000000000000010",
			"0100000000010000",
			"1111111111111111",
			"1111111111111110",
			"1111101111101111",
			"0000000000000010",
			"1000000000000011",
			"0000000000000011",
			"0000000001100000",
			"0000000000000001",
			"0000000000000010"
		);
		
	constant c1  : t_float := PI_PF * to_float( 0.703125) / 180;
	constant c2  : t_float := PI_PF * to_float( 1.406250) / 180;
	constant c_1 : t_float := PI_PF * to_float(-0.703125) / 180;
	constant c_2 : t_float := PI_PF * to_float(-1.406250) / 180;
	
	signal clk_t : std_logic := '1';
	signal ena_o: std_logic := '0';		-- Enable de rotar
	signal pos_mem_leida: t_pos_mem := (others => (others => '0'));
	signal alfa, beta, gama: t_float := CERO;
	signal pos_leida, pos_rotada: t_pos := (others => CERO);

begin

	clk_t <= not clk_t after 5 ns;
	ena_o <= '1' after 10 ns;
	
	pos_mem_leida(1) <= (15 downto 1 => '0') & '1';
	pos_mem_leida(2) <= (15 downto 1 => '0') & '1';
	pos_mem_leida(3) <= (15 downto 1 => '0') & '1';
	---pos_mem_leida(1) <= testmemo(3) after 0 ns;---, testmemo(10) after 100 ns, testmemo(20) after 200 ns;
	---pos_mem_leida(2) <= testmemo(4) after 0 ns;---, testmemo(11) after 100 ns, testmemo(21) after 200 ns;
	---pos_mem_leida(3) <= testmemo(5) after 0 ns;---, testmemo(12) after 100 ns, testmemo(22) after 200 ns;

	-- Paso a formato punto flotante
	---process(pos_mem_leida)
	---begin
	---	pos_leida(1) <= to_float(std_logic_vector(to_signed(to_integer(signed(pos_mem_leida(1))),N_BITS_COORD)));
	---	pos_leida(2) <= to_float(std_logic_vector(to_signed(to_integer(signed(pos_mem_leida(2))),N_BITS_COORD)));
	---	pos_leida(3) <= to_float(std_logic_vector(to_signed(to_integer(signed(pos_mem_leida(3))),N_BITS_COORD)));
	---end process;
	
	pos_leida(1) <= to_float(1);
	pos_leida(2) <= to_float(2);
	pos_leida(3) <= to_float(3);
	
	alfa <= c1 after 20 ns, (PI_PF/2) after 100 ns;
	beta <= c1 after 20 ns, CERO after 100 ns;
	gama <= c1 after 20 ns, (PI_PF/2) after 100 ns, (PI_PF) after 600 ns;

	-- Roto la posición leída según los ángulos de rotación
	rotador: entity work.rotador3d
		port map(
---			clk => clk_t,
			ena => ena_o,	---ena => rot_ena,
			pos_in => pos_leida,
			alfa => alfa,
			beta => beta,
			gama => gama,
			pos_rotada => pos_rotada
		);
	
	-- Aplano a ejes (y,z)
	vec_pos_pixel(1) <= pos_rotada(2);
	vec_pos_pixel(2) <= pos_rotada(3);
	
	process(clk_t, pos_rotada)
	begin
		if falling_edge(clk_t) then
			report "pos x: " & integer'image(to_integer(to_signed(pos_rotada(1)*(1000000),32)))
				& " pos y: " & integer'image(to_integer(to_signed(pos_rotada(2)*(1000000),32)))
				& " pos z: " & integer'image(to_integer(to_signed(pos_rotada(3)*(1000000),32)))
					severity note;
		end if;
	end process;

end;
