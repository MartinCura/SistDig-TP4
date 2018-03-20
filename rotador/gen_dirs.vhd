--- Ver si tengo que descomentar todo
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee_proposed.fixed_float_types.all;
-- use ieee_proposed.fixed_pkg.all;
use ieee_proposed.float_pkg.all;

library work;
use work.cordic_lib.all;

entity gen_dirs is

	port(
        clk: in std_logic;
        pos: in t_coordenada;
		dir: out t_dir
	);

end entity;

architecture gen_dirs_arq of gen_dirs is

    constant SCR_W : natural := 640;
    constant SCR_H : natural := 480;
    constant SIZE  : natural := 160;

    integer x, y : integer;

begin
    x := SCR_W / 2 + to_integer( SIZE * pos(1) );
    y := SCR_H / 2 + to_integer( SIZE * pos(2) );
    ---dir := x + SCR_W * y; 						!!!
	dir(1) <= std_logic_vector(to_unsigned(x));
	dir(2) <= std_logic_vector(to_unsigned(y));
end;
