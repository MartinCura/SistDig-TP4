-- Para recibir datos. Bit RxRdy = 1 cada vez que leyó todos los bits de un dato
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity uart is

    generic (
        F : natural := 50000;	-- Device clock frequency [KHz]: 50 MHz
        min_baud : natural := 1200;
        num_data_bits : natural := 8
    );
    port (
        Rx	: in std_logic;
        Tx	: out std_logic;
        Din	: in std_logic_vector(7 downto 0);
        StartTx	: in std_logic;
        TxBusy	: out std_logic;
        Dout	: out std_logic_vector(7 downto 0);
        RxRdy	: out std_logic;
        RxErr	: out std_logic;
        Divisor	: in std_logic_vector;
        clk	: in std_logic;
        rst	: in std_logic
    );
end;


architecture uart_arq of uart is

    signal top16		: std_logic;
    signal toprx        : std_logic;
    signal toptx	    : std_logic;
    signal Sig_ClrDiv   : std_logic;

begin

    reception_unit: entity work.receive
    generic map (
        NDBits	=> num_data_bits
    )
    port map (
        clk 	=> clk,
        rst 	=> rst,
        Rx	    => Rx,
        Dout	=> Dout,
        RxErr	=> RxErr,
        RxRdy	=> RxRdy,
        ClrDiv	=> Sig_ClrDiv,
        Top16	=> top16,
        TopRx	=> toprx
    );

    transmission_unit: entity work.transmit
    generic map (
        NDBits	=> num_data_bits
    )
    port map (
        clk	=> clk,
        rst	=> rst,
        Tx	=> Tx,
        Din	=> Din,
        TxBusy	=> TxBusy,
        TopTx	=> toptx,
        StartTx	=> StartTx
    );

    timings_unit: entity work.timing
    generic map (
        F => F,
        min_baud => min_baud
    )
    port map (
        clk	=> clk,
        rst	=> rst,
        divisor	=> Divisor,
        ClrDiv	=> Sig_ClrDiv,
        Top16	=> top16,
        TopTx	=> toptx,
        TopRx	=> toprx
    );

end;
