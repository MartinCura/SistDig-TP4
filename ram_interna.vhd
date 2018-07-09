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
        CANT_P : integer :=	  40;---1000;     -- Cantidad de puntos	---12 MIL
        REFR_R : integer :=	 100      -- Ciclos por dato que saco
    );

	port(
        clk:	 in std_logic;
		rst:	 in std_logic;
        Rx:		 in std_logic;
		Din:	 in std_logic_vector(15 downto 0);
		Dout:	 out t_pos_mem;
        Rdy:	 out std_logic := '0';
        barrido: out std_logic := '0'
	);

end entity;

architecture ram_interna_arq of ram_interna is

	signal n : integer := 0;
    constant ram_size : integer := 3 * CANT_P;
	subtype t_ram_elem is std_logic_vector(15 downto 0);---t_coordenada;
    type t_ram is array(1 to ram_size) of t_ram_elem;
    signal ram : t_ram; ----:= (others => CERO); ---Cómo la inicializo?
	---shared variable ram: t_ram;
	signal Dout_aux : t_pos_mem := (others => (others => '0'));
	
begin

	-- IN
	process(Rx, Din, n, rst)
	variable j_in : natural := 1;
	begin
		-- Reseteo
		if rst = '1' then
			ram <= (others => (others => '0'));
			j_in := 1;
		elsif Rx = '1' then
		---if Rx = '1' then
			if j_in > ram_size then
				j_in := 1;
			end if;
			ram(j_in) <= Din;
			j_in := j_in + 1;
			if n < ram_size then
				n <= n + 1;
			end if;
		end if;
	end process;
	
	-- OUT
	process(clk)
	variable i : natural := 0;
	variable j_out : natural := 1;
	begin
		if rising_edge(clk) then
			i := i + 1;
			if i = REFR_R then
				barrido <= '0';
				i := 0;
				if j_out > n then
					j_out := 1;
					Dout_aux(1) <= ram(j_out);
					Dout_aux(2) <= ram(j_out+1);
					Dout_aux(3) <= ram(j_out+2);
				else
					j_out := j_out + 3;
					if j_out > n then
						barrido <= '1';
					else
						Dout_aux(1) <= ram(j_out);
						Dout_aux(2) <= ram(j_out+1);
						Dout_aux(3) <= ram(j_out+2);
					end if;
				end if;
				Rdy <= '1';
			else
				Rdy <= '0';	---Chequear que funcione
			end if;
		end if;
	end process;

	Dout <= Dout_aux;
	
	----Analizar problemas con el tiempo intermedio entre fin de lectura y barrido

end;
