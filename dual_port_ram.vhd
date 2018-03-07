library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--De los puertos A y B, uso el A para escribir y B para leer (uso esta opcion de las 4 posibles de la dual port ram)

entity dual_port_ram is
  generic(
    data_width : natural := 1;
    addr_width : natural := 18
  );

  port(
    clock: in std_logic;
    write_enable : in std_logic;
    addr_A : in  std_logic_vector(addr_width-1 downto 0);
    addr_B : in  std_logic_vector(addr_width-1 downto 0);
    data_A : in  std_logic_vector(data_width-1 downto 0);
    data_B : out std_logic_vector(data_width-1 downto 0)
  );
end entity dual_port_ram;

architecture dual_port_ram_arch of dual_port_ram is
	--Creo un array donde tengo 2^(addr_width) vectores de largo data_width (posiciones en la memoria).
	constant memo_size : natural := 2**(addr_width) -1;
	type  ram_type is array(0 to memo_size)
		of std_logic_vector(data_width-1 downto 0) ;
	signal ram: ram_type;
	signal addr_A_int : integer := 0;
	signal addr_B_int : integer := 0;

begin
	--Paso a integer los vectores addr_A y addr_B para ubicarme en la posicion de la memoria ram deseada
	--y escribir (si clock=1 y write_enable=1) o leer (si clock=1 y write_enable=0)
	addr_A_int <= to_integer(unsigned(addr_A));
	addr_B_int <= to_integer(unsigned(addr_B));

	process(clock)
		begin
			if (clock'event and clock = '1') then
				if(write_enable = '1') then
					ram(addr_A_int) <= data_A;
				end if;
			data_B <= ram(addr_B_int);
			end if;
	end process;

end dual_port_ram_arch;
