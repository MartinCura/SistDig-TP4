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
        pos: in t_coordenada
	);

end entity;

architecture gen_dirs_arq of gen_dirs is

    constant SCR_W : natural := 640;
    constant SCR_H : natural := 480;
    constant SIZE  : natural := 160;

    integer x, y, dir : integer;

begin

    --for pos in posiciones loop
    x := SCR_W / 2 + to_integer( SIZE * pos(1) );
    y := SCR_H / 2 + to_integer( SIZE * pos(2) );
    dir := x + y * SCR_W;
    --end loop;

    --- TODO: guardar dir en Dual Port RAM
    -- escrit_dpram: entity work.dual_ram_escritura
	-- 	port map(
	-- 		pos => pix
	-- 	);

end;
