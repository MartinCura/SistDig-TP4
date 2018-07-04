 --component uart is
 --   generic (
 --     F : natural := 50000;	-- Device clock frequency [KHz].
 --     min_baud : natural := 1200;
 --     num_data_bits : natural := 8
 --   );
 --   port (
 --     Rx	: in std_logic;
 --     Tx	: out std_logic;
 --     Din	: in std_logic_vector(7 downto 0);
 --     StartTx	: in std_logic;
 --     TxBusy	: out std_logic;
 --     Dout	: out std_logic_vector(7 downto 0);
 --     RxRdy	: out std_logic;
 --     RxErr	: out std_logic;
 --     Divisor	: in std_logic_vector;
 --     clk	: in std_logic;
 --     rst	: in std_logic
 --   );
 -- end component uart;
  -----
library IEEE;
use IEEE.std_logic_1164.all;
  
package uart_comps is
  -- Componentes de la UART
  -----
  component timing is
    generic (
      F : natural:=8;
      baud_rate : natural:=9600
    );
    port (
            CLK : in std_logic;
            RST : in std_logic;
            ClrDiv : in std_logic;
            Top16 : buffer std_logic;
            TopTx : out std_logic;
            TopRx : out std_logic
    );
  end component;
  -----

  component transmit is
    generic (
            NDBits : natural := 8
    );
    port (
      CLK : in std_logic;
      RST : in std_logic;
      Tx : out std_logic;
      Din  : in std_logic_vector (NDBits-1 downto 0);
      TxBusy : out std_logic;
      TopTx : in std_logic;
      StartTx : in std_logic
    );
  end component;
  -----

  component receive is
    generic (
      NDBits : natural := 8
    );
    port (
      CLK : in std_logic;
      RST : in std_logic;
      Rx : in std_logic;
      Dout : out std_logic_vector (NDBits-1 downto 0);
      RxErr : out std_logic;
      RxRdy : out std_logic;
      Top16 : in std_logic;
      ClrDiv : out std_logic;
      TopRx : in std_logic
    );
  end component;

  end package uart_comps;