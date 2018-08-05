-- Elementos suplementarios para CORDIC
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


package cordic_lib is

    ---constant N_PF       : natural := 32;
    ---constant N_BITS_DIR	: natural := 10;

    constant N_BITS : natural := 16;
    constant N_EXTR : natural := N_BITS + 2;    -- Precisión extra

    subtype t_num is std_logic_vector(N_BITS-1 downto 0);
    -- Tipo coordenada {x, y, z}
    subtype t_coord is t_num;
    -- Tipo coordenada con precisión extra
    subtype t_coord_e is std_logic_vector(N_EXTR-1 downto 0);
    ---///

end package cordic_lib;
