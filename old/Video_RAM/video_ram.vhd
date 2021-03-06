library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- La video ram es implementada con la dual port ram, por ende A es la escritura y B lectura.
entity video_ram is
	generic(
	    -- Bits por fila/columna
		N_bits_row : integer := 10;
	    N_bits_col : integer := 10;
		-- Numero de filas/columnas
	    N_rows : integer := 480;			---NO SE USAN
		N_cols : integer := 640
	);
	port(
	    clock: in std_logic;
	    write_enable : in std_logic;
		barrido: in std_logic;
	    A_row : in std_logic_vector(N_bits_row-1 downto 0);
	    B_row : in std_logic_vector(N_bits_row-1 downto 0);
	    A_col : in std_logic_vector(N_bits_col-1 downto 0);
	    B_col : in std_logic_vector(N_bits_col-1 downto 0);
	    data_A : in std_logic;
		data_B : out std_logic
	);
end entity video_ram;

architecture video_ram_arch of video_ram is

	--Declaracion de componentes a utilizar (se utiliza la dual port ram)
	component dual_port_ram is
		generic(
			data_width : natural := 1;
			addr_width : natural := 18
		);

		port(
			clock: in std_logic;
			write_enable : in std_logic;
			barrido : in std_logic;
			addr_A : in  std_logic_vector(addr_width-1 downto 0);
			addr_B : in  std_logic_vector(addr_width-1 downto 0);
			data_A : in  std_logic_vector(data_width-1 downto 0);
			data_B : out std_logic_vector(data_width-1 downto 0)
		);
	end component;

	--Senales auxiliares
	signal address_A :std_logic_vector(N_bits_row+N_bits_col -1 downto 0):= (others => '0');
	signal address_B :std_logic_vector(N_bits_row+N_bits_col -1 downto 0):= (others => '0');

begin
	address_A <= A_row & A_col; --La dirección A es la concantenacion de fila y columna		---CREO Q HAY Q OPTIMIZAR ESTO
    address_B <= B_row & B_col; --La dirección B es la concantenacion de fila y columna		---mirar gen_dirs.vhd
	--Instanciación de los componentes a utilizar
	video_dual_port_ram: dual_port_ram
		generic map(
			data_width => 1,
			addr_width => 5---N_bits_row + N_bits_col		---TESTEO
		)

		port map(
			clock =>clock,
			write_enable =>write_enable,
			barrido => barrido,
			addr_A =>"00000",---address_A,
			addr_B =>"00000",---address_B,
			data_A(0) =>data_A,
			data_B(0) =>data_B
		);






end video_ram_arch;
