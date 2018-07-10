library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cordic_lib.all;
---use work.float_pkg.all;
--library ieee_proposed;
--use ieee_proposed.float_pkg.all;
library floatfixlib;
use floatfixlib.float_pkg.all;

-- A partir de una posición 2D (x,y) mapea a una dirección de pantalla (i,j)
entity gen_dirs is

	generic(
	    -- Bits por fila/columna
		BR : integer := 10;		-- n_bits_row
	    BC : integer := 10		-- n_bits_col
	);

	port(
        pos_2d: in t_vec;		-- Posición 2D
		dir: out t_dir		-- Dirección en pantalla de píxel correspondiente
	);

end entity;

architecture gen_dirs_arq of gen_dirs is

    constant SCR_W : integer := 640;
    constant SCR_H : integer := 480;
	constant SIZE  : integer := 160;

begin

	process(pos_2d)
	variable x, y : integer := 0;
	begin
		x := SCR_W / 2 + to_integer( SIZE * pos_2d(1) );
		y := SCR_H / 2 + to_integer( SIZE * pos_2d(2) );
		---dir := x + SCR_W * y;
		dir(1) <= std_logic_vector(to_unsigned(x, BR));
		dir(2) <= std_logic_vector(to_unsigned(y, BC));
	end process;

end;
