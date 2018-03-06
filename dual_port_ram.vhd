library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--De los puertos A y B, uso el A para escribir y B para leer (uso esta opcion de las 4 posibles de la dual port ram)

entity dual_port_ram is
  generic(
    data_width : natural := 1;
    add_width : natural := 18
);

port(
    clock: in std_logic;
    write_enable : in std_logic;
    add_A : in std_logic_vector(add_width-1 downto 0);
    add_B : in std_logic_vector(add_width-1 downto 0);
    data_A : in  std_logic_vector(data_width-1 downto 0);
    data_B : out std_logic_vector(data_width-1 downto 0)
	);
end entity dual_port_ram;

architecture dual_port_ram_arch of dual_port_ram is
	--Creo un array donde tengo 2^(add_width) vectores de largo data_width (posiciones en la memoria).
	constant memo_size : natural := 2**(add_width) -1;
	type  ram_type is array(0 to memo_size) 
		of std_logic_vector(data_width-1 downto 0) ; 
	signal ram: ram_type;
	signal add_A_int : integer := 0;
	signal add_B_int : integer := 0;
	
	begin
	--Paso a integer los vectores add_A y add_B para ubicarme en la posicion de la memoria ram deseada 
	--y escribir (si clock=1 y write_enable=1) o leer (si clock=1 y write_enable=0)
	add_A_int <= to_integer(unsigned(add_A));
	add_B_int <= to_integer(unsigned(add_B));
	
	process(clock)
		begin
			if (clock'event and clock = '1') then
				if(write_enable = '1') then
				ram(add_A_int) <= data_A;
				end if;
			data_B <= ram(add_B_int);
			end if;
	end process;

end dual_port_ram_arch;