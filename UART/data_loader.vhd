--lee de la uart y combina  LSB y MSB en un dato de 16bits con los datos de la UART. 
--(Toma LSB y MSB de la uart)
--Version con maquinola  de estados
-------------------------------------------------------------------------------
--UNIDAD ASINCRONICA
--Algo que podria generar problemas es inicializar la senial RxRdy_out en cero 
--justo debajo del begin. Habria que revisar eso como prioridad en caso de que falle
--la recepcion de datos.
-------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
-------------------------------------------------------------------------------

entity data_loader is

  generic (

    in_data_bits : natural := 8; --cantidad de bits del dato que entra
    out_data_bits: natural:=16; -- cant de bits del dato que sale
    data_midpoint: natural:=8 -- bits/2 del dato que sale
  );

	port(
    --clock: in std_logic;
    reset: in std_logic;
    data_in: in std_logic_vector(in_data_bits-1 downto 0);
    data_out: out std_logic_vector(out_data_bits-1 downto 0);
    RxRdy_in: in std_logic;
    RxRdy_out: out std_logic
	);
end entity data_loader;

architecture data_loader_arch of data_loader is

  type state_t is (LSB, MSB);
  signal state : state_t := LSB;

begin

  FSM: process(RxRdy_in, reset)
  begin

    RxRdy_out <= '0';
    -- RESET
    if reset = '1' then
      data_out <= (others => '0');
      state <= LSB;
      RxRdy_out <= '0';
    else
      case state is
        -- LSByte
        when LSB =>
          if RxRdy_in = '1' then
            data_out(data_midpoint-1 downto 0) <= data_in;
            RxRdy_out <= '0';
            state <= MSB;
          end if;
        -- MSByte
        when MSB =>
          if RxRdy_in = '1' then
            data_out(out_data_bits-1 downto data_midpoint) <= data_in;
            RxRdy_out <= '1';
            state <= LSB;
          end if;
      end case;
    end if;
  end process;

end data_loader_arch;
-------------------------------------------------------------------------------
