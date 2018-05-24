--- Ver si tengo que descomentar todo
-- use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
-- use ieee_proposed.fixed_float_types.all;
-- use ieee_proposed.fixed_pkg.all;
use ieee_proposed.float_pkg.all;

library work;
use work.cordic_lib.all;

entity ram_interna is

    generic(
        N_BITS : integer :=  32;     -- Cantidad de bits por coordenada
        CANT_P : integer := 100;     -- Cantidad de puntos
        REFR_R : integer :=   3      -- Ciclos por dato que saco
    );

	port(
        clk: in std_logic;
        Rx: in std_logic;
        Din: in std_logic_vector(N-1 downto 0);
		Dout: out t_pos;
        Rdy: out std_logic := '0';
        barrido: out std_logic := '0'
	);

end entity;

architecture ram_interna_arq of ram_interna is

    constant ram_size = 3 * CANT_P;
    type t_ram is array(1 to ram_size) of t_coordenada;
    variable ram : t_ram;

begin

    -- IN
    process(Rx)
    variable j : NATURAL := 1;
    begin
        if rising_edge(Rx) then
            j := j + 1;
            if j > ram_size then
                j := 1;
                Rdy <= '1';
            end if;
            ram(j) := Din;
        end if;
    end process;

    -- OUT
    process(clk)
    variable i, j : NATURAL := 0;
    begin
        if rising_edge(clk) then
            i := i + 1;
            if i = REFR_R then
                barrido <= '0';
                i := 0;
                j := j + 3;
                if j > ram_size then
                    j := 1;
                    barrido <= '1';
                end if;
                Dout(0) <= ram(j);
                Dout(1) <= ram(j+1);
                Dout(2) <= ram(j+2);
            end if;
        end if;
    end process;

end;
