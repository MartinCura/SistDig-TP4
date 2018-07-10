library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cordic_lib.all;

library floatfixlib;
use floatfixlib.float_pkg.all;

entity cordic_tb is

	generic(
		N_BITS_COORD : integer := 32	--- REVISAR
	);

end;

architecture cordic_tb_arq of cordic_tb is

	signal clk_i : std_logic := '1';
	signal ang : t_float := CERO;
	signal x, y, z : t_coordenada := CERO;
	signal vec_i, vec_o : t_vec;

begin

	clk_i <= not clk_i after 5 ns;
	
	ang <= PI_PF/4 after 49 ns, PI_PF/2 after 100 ns, 3*PI_PF/4 after 150 ns, PI_PF after 200 ns, 3*PI_PF/2 after 250 ns, -PI_PF/2 after 300 ns, 2*PI_PF after 350 ns, to_float(0.5) after 400 ns;

	x <= to_float(1);
	y <= to_float(2);
	z <= to_float(3);

	vec_i(1) <= x;
	vec_i(2) <= y;
	
	process(vec_i, ang)
	begin
		vec_o <= cordic(vec_i, ang);
	end process;
	
	process(clk_i, vec_o)
	begin
		if rising_edge(clk_i) then
			report "pos x: " & integer'image(to_integer(to_signed(vec_o(1)*(1000),32)))
				& " pos y: " & integer'image(to_integer(to_signed(vec_o(2)*(1000),32)))
				severity note;
		end if;
	end process;

end;
