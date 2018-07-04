--top level para la UART y transfer_unit de 16 bits

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity data_acq_unit is
port (
      clk :	in std_logic;
      rst :	in std_logic;
      rx :	in std_logic;
      data_out_16bits:out std_logic_vector(15 downto 0);
      data_ready:out std_logic
);

end data_acq_unit;

architecture arch of data_acq_unit is

 component uart
     	generic (
		F: natural;
		baud_rate: natural;
		num_data_bits: natural
	);
	port (
        Rx	: in std_logic;
		Tx	: out std_logic;
		Din	: in std_logic_vector(num_data_bits-1 downto 0);
		StartTx	: in std_logic;
		TxBusy	: out std_logic;
		Dout	: out std_logic_vector(num_data_bits-1 downto 0);
		RxRdy	: out std_logic;
		RxErr	: out std_logic;
		clk	: in std_logic;
		rst	: in std_logic
	);
 end component;

component data_loader
	generic (

    in_data_bits : natural := 8; --cantidad de bits del dato que entra
    out_data_bits: natural:=16; -- cant de bits del dato que sale
    data_midpoint: natural:=8 -- bits/2 del dato que sale
  );

	port(
   -- clock: in std_logic;
    reset: in std_logic;
    data_in: in std_logic_vector(in_data_bits-1 downto 0);
    data_out: out std_logic_vector(out_data_bits-1 downto 0);
    RxRdy_in: in std_logic;
    RxRdy_out: out std_logic
	);
end component;
		
      signal sig_Dout_16: std_logic_vector(15 downto 0);
	  signal sig_Din	: std_logic_vector(7 downto 0);
	  signal sig_Dout_UART	: std_logic_vector(7 downto 0);
      signal sig_RxErr	: std_logic;
      signal sig_RxRdy	: std_logic;
      signal sig_RxRdy_loader: std_logic;
      signal sig_TxBusy	: std_logic;
      signal sig_StartTx: std_logic;
      signal tx_aux:std_logic;

   begin
   -- UART Instanciation :
	UUT : uart
	generic map (
		F 	=> 50000,
		baud_rate => 9600,
		num_data_bits => 8
	)
	port map (
      Rx => rx,
	 	Tx	=> tx_aux,
	 	Din	=> sig_Din,
	 	StartTx	=> sig_StartTx,
		TxBusy	=> sig_TxBusy,
		Dout	=> sig_Dout_UART,
		RxRdy	=> sig_RxRdy,
		RxErr	=> open,
		clk	=> clk,
		rst	=> rst
	);
     	
  	UUT3:data_loader

  	generic map (
		 in_data_bits => 8, --cantidad de bits del dato que entra
   	     out_data_bits =>16, -- cant de bits del dato que sale
    	 data_midpoint => 8 -- bits/2 del dato que sale
	)
  	port map(
  	--clock => clk,
    reset => rst,
    data_in => sig_Dout_UART,
    data_out => data_out_16bits,
    RxRdy_in =>sig_RxRdy,
    RxRdy_out => data_ready

  	);

end arch;