library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity buffer_almacenamiento is
   generic (
	N,M : natural
   );
   port (
	clk : in std_logic;
	rst : in std_logic;
	flag_rotar : in std_logic;--flag que indica cuando mandar los datos al cordic
	data_in_rdy : in std_logic;
	data_in : in std_logic_vector (N-1 downto 0);
	datax_out : out std_logic_vector (N-1 downto 0);
	datay_out : out std_logic_vector (N-1 downto 0);
	dataz_out : out std_logic_vector (N-1 downto 0);	
	data_out_rdy : out std_logic
   );
end;

architecture beh of buffer_almacenamiento is

	type memo is array (0 to M-1) of std_logic_vector(N-1 downto 0); --M = 300
	signal posicion : memo;
	signal contador_carga : unsigned(8 downto 0):= (others => '0');
	signal contador_salida : unsigned(8 downto 0):= (others => '0');
	--variable flag_aux_rotar is std_logic;--flag auxiliar para que no cambie una vez que cambia el flag de afuera
begin 

--Process carga de datos--
process(clk,rst)
begin

	if rst='1' then
		contador_carga <= (others => '0');
	elsif rising_edge(clk) then
		if data_in_rdy = '1' then
			posicion(to_integer(contador_carga)) <= data_in;
			contador_carga <= contador_carga + 1;
		end if;
	end if;
	
end process;

--Process salida de datos--
process(clk,rst)
variable flag_aux_rotar,aux_data_out_rdy : std_logic;
variable aux_data_buffer : unsigned(3 downto 0) := "0000";
begin

	if rst='1' then
		contador_salida <= (others => '0');
	elsif rising_edge(clk) then
		--aux_data_out_rdy := '0';
		if flag_rotar = '1' then	
			flag_aux_rotar := '1';
			aux_data_buffer := "0000";
		end if;
		if flag_aux_rotar = '1' then
			if to_integer(contador_salida) >= M then -- M=300
				contador_salida <= (others => '0');
				flag_aux_rotar := '0';
				aux_data_buffer := "0000";
				aux_data_out_rdy := '0';
			elsif aux_data_buffer > "0000" then
				aux_data_buffer := aux_data_buffer +1;
				if aux_data_buffer = "1111" then
					aux_data_out_rdy := '1';
					aux_data_buffer := "0000";
				end if;

			else
				datax_out <= posicion(to_integer(contador_salida));
				datay_out <= posicion(to_integer(contador_salida + 1));
				dataz_out <= posicion(to_integer(contador_salida + 2));
				contador_salida <= contador_salida + 3;
				aux_data_buffer := "0001";
				aux_data_out_rdy := '0';
			end if;
		end if;
	end if;
	
	data_out_rdy <= aux_data_out_rdy;
	
end process;

end beh;
