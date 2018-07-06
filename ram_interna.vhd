library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cordic_lib.all;
---use work.float_pkg.all;
library ieee_proposed;
use ieee_proposed.float_pkg.all;

-- RAM interna que recibe svl's de forma serial y los guarda como posiciones de 3 coordenadas; también lee
---Actualmente debería recibir precisamente (o más) CANT_P puntos. Podría cambiarla para que sepa la cantidad que contiene
entity ram_interna is

    generic(
        N_BITS : integer :=	  32;     -- Cantidad de bits por coordenada
        CANT_P : integer := 1000;     -- Cantidad de puntos
        REFR_R : integer :=	 100      -- Ciclos por dato que saco
    );

	port(
        clk:	 in std_logic;
		rst:	 in std_logic;
        Rx:		 in std_logic;
        Din:	 in std_logic_vector(N_BITS-1 downto 0);	---Estoy guardando slv y sacando t_coordenada's ???
		Dout:	 out t_pos;
        Rdy:	 out std_logic := '0';
        barrido: out std_logic := '0'
	);

end entity;

architecture ram_interna_arq of ram_interna is

    constant ram_size : integer := 3 * CANT_P;
    type t_ram is array(1 to ram_size) of t_coordenada;
    signal ram : t_ram; ----:= (others => CERO); ---Cómo la inicializo?

begin

    -- IN
    process(Rx, rst)
    variable j : natural := 0;
    begin
        if rising_edge(Rx) then
            j := j + 1;
            if j > ram_size then
                j := 1;
                Rdy <= '1';
			else
				ram(j) <= to_float(Din);	---CHEQUEAR... hacerlo afuera?
            end if;
        end if;
		-- Reseteo
		if rising_edge(rst) then
			ram <= (others => CERO);
			j := 1;
		end if;
    end process;

    -- OUT
    process(clk)
    variable i : natural := 0;
	variable j : natural := 1;
    begin
        if rising_edge(clk) then
            i := i + 1;
            if i = REFR_R then
                barrido <= '0';
                i := 0;
				if j > ram_size then
                    j := 1;
					Dout(1) <= ram(j);
					Dout(2) <= ram(j+1);
					Dout(3) <= ram(j+2);
				else
					j := j + 3;
					if j > ram_size then
						barrido <= '1';
					else
						Dout(1) <= ram(j);
						Dout(2) <= ram(j+1);
						Dout(3) <= ram(j+2);
					end if;
				end if;
            end if;
        end if;
    end process;
	----Tiempo intermedio entre fin de lectura y barrido

end;
