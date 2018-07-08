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


-- RAM interna que recibe svl's de forma serial y los guarda como posiciones de 3 coordenadas; también lee
---Actualmente debería recibir precisamente (o más) CANT_P puntos. Podría cambiarla para que sepa la cantidad que contiene
entity ram_interna is

    generic(
        N_BITS : integer :=	  32;     -- Cantidad de bits por coordenada
        CANT_P : integer :=	10;---00;     -- Cantidad de puntos	---12 MIL
        REFR_R : integer :=	 100      -- Ciclos por dato que saco
    );

	port(
        clk:	 in std_logic;
		rst:	 in std_logic;
        Rx:		 in std_logic;
		Din:	 in t_coordenada;
---        Din:	 in std_logic_vector(N_BITS-1 downto 0);	---Guardando slv y sacando t_coordenada's ???
		Dout:	 out t_pos;
        Rdy:	 out std_logic := '1';---'0';
        barrido: out std_logic := '0'
	);

end entity;

architecture ram_interna_arq of ram_interna is

    constant ram_size : integer := 3 * CANT_P;
    type t_ram is array(1 to ram_size) of t_coordenada;
    signal ram : t_ram; ----:= (others => CERO); ---Cómo la inicializo?
	---shared variable ram: t_ram;
	
begin

	process(clk, Rx, rst)
	variable i : natural := 0;
	variable j_in, j_out : natural := 1;
	variable n : natural := 0;
	begin
		if rising_edge(clk) then
			if rst = '1' then
				-- Reseteo
				ram <= (others => CERO);
				j_in := 1;
			---if Rx = '1' then
			elsif Rx = '1' then ----rising_edge(Rx) then		---CHEQUEAR!!!

				-- IN
				if j_in > ram_size then
					j_in := 1;
					Rdy <= '1';
				else
					ram(j_in) <= Din;
					j_in := j_in + 1;
					if n < ram_size then
						n := n + 1;
					end if;
				end if;
				
			end if;
			
			-- OUT
			i := i + 1;
			if i = REFR_R then
				barrido <= '0';
				i := 0;
				if j_out > n then
					j_out := 1;
					Dout(1) <= ram(j_out);
					Dout(2) <= ram(j_out+1);
					Dout(3) <= ram(j_out+2);
				else
					j_out := j_out + 3;
					if j_out > n then
						barrido <= '1';
					else
						Dout(1) <= ram(j_out);
						Dout(2) <= ram(j_out+1);
						Dout(3) <= ram(j_out+2);
					end if;
				end if;
			end if;
		end if;
	end process;

	----Analizar problemas con el tiempo intermedio entre fin de lectura y barrido

end;
