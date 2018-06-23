library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
---use ieee_proposed.float_pkg.all;
use work.float_pkg.all;
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
        Din: in std_logic_vector(N_BITS-1 downto 0);	---Estoy guardando slv y sacando t_coordenada's ???
		Dout: out t_pos;
        Rdy: out std_logic := '0';
        barrido: out std_logic := '0'
	);

end entity;

architecture ram_interna_arq of ram_interna is

    constant ram_size : integer := 3 * CANT_P;
    type t_ram is array(1 to ram_size) of t_coordenada;
    signal ram : t_ram; ----:= (others => CERO); ---Cómo la inicializo?

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
            ram(j) <= to_float(Din);	---CHEQUEAR... hacerlo afuera??
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
                end if;		---CHEQUEAR dónde puse el end if
                Dout(1) <= ram(j);
                Dout(2) <= ram(j+1);
                Dout(3) <= ram(j+2);
            end if;
        end if;
    end process;

end;
