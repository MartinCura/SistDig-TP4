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
        pos: in t_coordenada
	);

end entity;

architecture gen_dirs_arq of gen_dirs is

    constant SCR_W : natural := 640;
    constant SCR_H : natural := 480;
    constant SIZE  : natural := 160;

    integer x, y, dir : integer;

begin
    --for pos in posiciones loop / end loop;

    x := SCR_W / 2 + to_integer( SIZE * pos(1) );
    y := SCR_H / 2 + to_integer( SIZE * pos(2) );
    ---dir := x + SCR_W * y;

    -- Prendo el bit para la posición apropiada
    escrit_dpram: entity work.video_ram
        port map (
            clock => clk,
            write_enable => '1',
            A_row => std_logic_vector(to_unsigned(x)),
            B_row => open,
            A_col => std_logic_vector(to_unsigned(y)),
            B_col => open,
            data_A => '1',
            data_B => open
        );
end;
