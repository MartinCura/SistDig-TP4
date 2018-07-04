-----------------------------------------------
--          UART core                        --
-----------------------------------------------
-- RxRdy es generado por la uart cuando recibe un dato correctamente (luego de leer cada uno de los 8 bits, genera un pulso en dicha señal en el STOP BIT, y luego vuelve a 0 en IDLE o en el siguiente START BIT)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--library work; 
--use work.uart_comps.all;
use work.uart_comps.all;

entity uart is
	generic (
		F : natural := 50000;	-- Device clock frequency [KHz].
		baud_rate : natural := 1200;
		num_data_bits : natural := 8
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
end;

architecture arch of uart is
	signal top16		: std_logic;
	signal toprx		: std_logic;
	signal toptx		: std_logic;
	signal Sig_ClrDiv	: std_logic;
begin
	reception_unit: receive
		generic map (
      NDBits	=> num_data_bits
		)
		port map (
			CLK 	=> clk,
			RST 	=> rst,
			Rx	=> Rx,
			Dout	=> Dout,
			RxErr	=> RxErr,
			RxRdy	=> RxRdy,
			ClrDiv	=> Sig_ClrDiv,
			Top16	=> top16,
			TopRx	=> toprx
		);
	
	transmission_unit: transmit
		generic map (
      NDBits	=> num_data_bits
		)
		port map ( 
			CLK	=> clk,
			RST	=> rst,
			Tx	=> Tx,
			Din	=> Din,
			TxBusy	=> TxBusy,
			TopTx	=> toptx,
			StartTx	=> StartTx
		);

	timings_unit: timing
		generic map (
			F => F,
			baud_rate => baud_rate
		)
		port map (
			CLK	=> clk,
			RST	=> rst,
			ClrDiv	=> Sig_ClrDiv,
			Top16	=> top16,
			TopTx	=> toptx,
			TopRx	=> toprx
		);
	
end;
