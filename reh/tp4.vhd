library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--library floatfixlib;
--use floatfixlib.float_pkg.all;


entity tp4 is

    port (
        clk_i   : in std_logic;     -- Clock general
        data_i  : in std_logic;     -- Entrada de datos (UART)
        -- Controles:
		write_rst_i : in std_logic;
		read_rst_i  : in std_logic;
		speed : in std_logic_vector(1 downto 0);
        rot_switches_i : in std_logic_vector(5 downto 0);
        -- Salidas
        hs, vs: out std_logic;						-- Output para el display VGA
        red_o: out std_logic_vector(2 downto 0);
        grn_o: out std_logic_vector(2 downto 0);
        blu_o: out std_logic_vector(1 downto 0);
        a,b,c,d,e,f,g,dp: out std_logic;	-- Segmentos del display de 7 segmentos
        -- Para controlar la memoria externa:
        clock_out   : out 	STD_LOGIC;
        ADDRESS     : out	STD_LOGIC_VECTOR (22 downto 0);
        ADV			: out	STD_LOGIC;
        CRE			: out	STD_LOGIC;
        CE			: out	STD_LOGIC;
        OE			: out	STD_LOGIC;
        WE			: out	STD_LOGIC;
        LB			: out	STD_LOGIC;
        UB			: out	STD_LOGIC;
        DATA		: inout	STD_LOGIC_VECTOR (15 downto 0)
    );


    attribute loc: string;
    --attribute CLOCK_DEDICATED_ROUTE: string;
	--attribute CLOCK_DEDICATED_ROUTE of rst_i: signal is "false";

    -- Mapeo de pines para el kit Nexys 2 (spartan 3E)
	-- https://reference.digilentinc.com/_media/nexys:nexys2:nexys2_rm.pdf
	attribute loc of clk_i: signal is "B8";
	attribute loc of data_i: signal is "L15";		-- Pin físico de entrada de datos
	-- VGA
	attribute loc of hs: signal is "T4";
	attribute loc of vs: signal is "U3";
	attribute loc of red_o: signal is "R8 T8 R9";
	attribute loc of grn_o: signal is "P6 P8 N8";
	attribute loc of blu_o: signal is "U4 U5";
	-- Switches
	-- attribute loc of rot_on: signal is "R17";	-- Prender rotación constante
	-- attribute loc of rot_vel: signal is "N17";	-- Velocidad lenta o rápida
	-- attribute loc of rot_x_on: signal is "L13";	-- Rotación en x
	-- attribute loc of rot_y_on: signal is "K17";	-- Rotación en y
	-- attribute loc of rot_z_on: signal is "H18";	-- Rotación en z
    attribute loc of speed: signal is "R17 N17";
    attribute loc of rot_switches_i: signal is "L13 L14 K17 K18 H18 G18";
	---attribute loc of rot_x_ng: signal is "L14";		-- Rotación negativa en x
	---attribute loc of rot_y_ng: signal is "K18";		-- Rotación negativa en y
	---attribute loc of rot_z_ng: signal is "G18";		-- Rotación negativa en z
	-- Botones
	--attribute loc of rst_i: signal is "B18";		-- Botón para resetear todo
    attribute loc of write_rst_i: signal is "H13";
    attribute loc of read_rst_i: signal is "E18";
	--attribute loc of inc_alfa: signal is "H13";
	--attribute loc of inc_beta: signal is "E18";
	--attribute loc of inc_gama: signal is "D18";
	-- attribute loc of rst_angs_i: signal is "B18";	-- Reseteo a posición inicial

	-- Segmentos del display (por ahora simplemente se apagan)
	attribute loc of a:	signal is "L18";
	attribute loc of b:	signal is "F18";
	attribute loc of c:	signal is "D17";
	attribute loc of d:	signal is "D16";
	attribute loc of e:	signal is "G14";
	attribute loc of f:	signal is "J17";
	attribute loc of g:	signal is "H14";
	attribute loc of dp: signal is "C17";

    -- External RAM
    attribute loc of clock_out  : signal is "H5";
    attribute loc of ADDRESS    : signal is "K6 D1 K3 D2 C1 C2 E2 M5 E1 F2 G4 G5 G6 G3 F1 H6 H3 J5 H2 H1 H4 J2 J1";
    attribute loc of ADV		: signal is "J4";
    attribute loc of CRE		: signal is "P7";
    attribute loc of CE			: signal is "R6";
    attribute loc of OE			: signal is "T2";
    attribute loc of WE			: signal is "N7";
    attribute loc of LB			: signal is "K5";
    attribute loc of UB			: signal is "K4";
    attribute loc of DATA		: signal is "T1 R3 N4 L2 M6 M3 L5 L3 R2 P2 P1 N5 M4 L6 L4 L1";

end;

architecture tp4_arq of tp4 is

    constant Nangle : natural := 16;
    constant Nxy : natural := 16;
    constant Nits : natural := Nxy-2;

    constant N_bits_row : natural := 6;
    constant N_bits_col : natural := N_bits_row;
    constant N_ROWS : natural := 2**N_bits_row;
    constant N_COLS : natural := 2**N_bits_col;
    constant CENTER_ROW : natural := N_ROWS/2;
    constant CENTER_COL : natural := N_COLS/2;
    constant TOP_MARGIN : natural := 200;
    constant LEFT_MARGIN : natural := 300;

    constant memo_size : integer := N_rows * N_cols;
    constant N_ROWS_VEC : std_logic_vector(N_bits_row-1 downto 0) := std_logic_vector(to_unsigned(N_ROWS, N_bits_row));
    constant N_COLS_VEC : std_logic_vector(N_bits_col-1 downto 0) := std_logic_vector(to_unsigned(N_COLS, N_bits_col));

    -- Video RAM
    signal A_row : std_logic_vector(N_bits_row-1 downto 0) := (others => '0');
    signal B_row : std_logic_vector(N_bits_row-1 downto 0) := (others => '0');
    signal A_col : std_logic_vector(N_bits_col-1 downto 0) := (others => '0');
    signal B_col : std_logic_vector(N_bits_col-1 downto 0) := (others => '0');
    signal A_row_aux : std_logic_vector(N_bits_row-1 downto 0) := (others => '0');
    signal A_col_aux : std_logic_vector(N_bits_col-1 downto 0) := (others => '0');
    signal data_A : std_logic := '0';
    signal data_B : std_logic := '0';
    signal video_write_enable : std_logic := '0';

    -- Limpieza de video RAM
    signal row_counter : std_logic_vector(N_bits_row-1 downto 0) := (others => '0');
    signal col_counter : std_logic_vector(N_bits_col-1 downto 0) := (others => '0');

    -- VGA
    signal pixel_row : std_logic_vector(10-1 downto 0) := (others => '0');
    signal pixel_col : std_logic_vector(10-1 downto 0) := (others => '0');
    signal enable_vga : std_logic := '0';
    signal enable_vga_delay : std_logic := '0';
    signal vga_pixel_in : std_logic := '0';
    signal vga_start : std_logic := '0';
    signal vga_stop : std_logic := '0';

    -- RAM externa
    signal data_out_ram : std_logic_vector(15 downto 0) := (others => '0');
    signal data_in_ram : std_logic_vector(15 downto 0) := (others => '0');
    signal address_in_ram : std_logic_vector(22 downto 0) := (others => '0');
    signal go_in_ram : std_logic := '0';
    signal write_in_ram : std_logic := '0';
    signal busy_ram : std_logic := '0';
    signal RxRdy_ram : std_logic := '0';
    signal extRam_reset : std_logic := '0';

    -- global control
    signal delta_angle: std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal alfa: std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal beta: std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal gama: std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal clear_enable: std_logic    := '0';
    signal clear_stop: std_logic      := '0';
    signal clear_reset: std_logic     := '0';
    signal read_start: std_logic      := '0';
    signal read_stop: std_logic       := '0';
    signal read_stop_delay: std_logic := '0';
    signal read_reset_out: std_logic  := '0';
    signal write_reset_out: std_logic := '0';

    -- UART
    constant Divisor : std_logic_vector := "000000011011"; -- Para 115200 baudios divido por 27
    signal sig_Din	: std_logic_vector(7 downto 0) := (others => '0');
    signal uart_Dout	: std_logic_vector(7 downto 0) := (others => '0');
    signal sig_RxErr	: std_logic := '0';
    signal uart_RxRdy	: std_logic := '0';
    signal sig_TxBusy	: std_logic := '0';
    signal sig_StartTx  : std_logic := '0';
    signal rx, tx : std_logic := '0';

    -- ExtRam Loader
    signal loader_RxRdy	: std_logic := '0';
    signal loader_RxRdy_delay : std_logic := '0';

    -- pos loader
    signal reset_xyz : std_logic := '0';
    signal enable_xyz : std_logic := '0';
    signal RxRdy_xyz : std_logic := '0';
    signal x0 : std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal y0 : std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal z0 : std_logic_vector(Nxy-1 downto 0) := (others => '0');

    -- Rotador de posiciones
    signal x : std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal y : std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal z : std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal rotator_RxRdy : std_logic := '0';
    signal x_screen : std_logic_vector((Nxy+N_bits_col)-1 downto 0) := (others => '0');
    signal y_screen : std_logic_vector((Nxy+N_bits_row)-1 downto 0) := (others => '0');
    signal x_screen_aux : std_logic_vector((Nxy+N_bits_col)-1 downto 0) := (others => '0');
    signal y_screen_aux : std_logic_vector((Nxy+N_bits_row)-1 downto 0) := (others => '0');

    -- Interconexiones
    signal reset_read_extram_counter : std_logic := '0';
    signal write_address_ram_counter : std_logic_vector(22 downto 0) := (others => '0');
    signal read_address_ram_counter : std_logic_vector(22 downto 0) := (others => '0');
    signal read_ram_ctrl : std_logic := '0';
    signal pixel_row_aux : std_logic_vector(N_bits_row-1 downto 0) := (others => '0');
    signal pixel_col_aux : std_logic_vector(N_bits_col-1 downto 0) := (others => '0');
    signal button_down : std_logic := '0';

begin

    ---button_down <= ( (rot_switches_i(5) XOR rot_switches_i(4)) OR
    ---                 (rot_switches_i(3) XOR rot_switches_i(2)) OR
    ---                 (rot_switches_i(1) XOR rot_switches_i(0)) OR
    ---                    write_rst_i OR
    ---                    read_rst_i );
    --button_down <= ( (not (rot_switches_i = (rot_switches_i'range => '0')))
    --                 write_rst_i OR
    --                 read_rst_i );
    -- Si estoy apretando algún botón o algún switch está prendido
	button_down <= (rot_switches_i(5) or rot_switches_i(4) or rot_switches_i(3) or
					rot_switches_i(2) or rot_switches_i(1) or rot_switches_i(0) or
					write_rst_i or read_rst_i);

    control_global: entity work.global_ctrl
    generic map(Nangle)
    port map(
        clock           => clk_i,
        write_rst_i     => write_rst_i,
        read_rst_i      => read_rst_i,
        sw_x_pos        => rot_switches_i(0),
        sw_x_neg        => rot_switches_i(1),
        sw_y_pos        => rot_switches_i(2),
        sw_y_neg        => rot_switches_i(3),
        sw_z_pos        => rot_switches_i(4),
        sw_z_neg        => rot_switches_i(5),
        delta_angle     => delta_angle,
        alfa            => alfa,
        beta            => beta,
        gama            => gama,
        clear_reset     => clear_reset,
        clear_enable    => clear_enable,
        clear_stop      => clear_stop,
        read_start      => read_start,
        read_stop       => read_stop,
        read_reset_out  => read_reset_out,
        write_reset_out => write_reset_out,
        vga_start       => vga_start,
        vga_stop        => vga_stop
    );

    -- Decido la velocidad de giro en base a los selectores de velocidad
    delta_angle <=  std_logic_vector(to_unsigned(  4, Nangle)) when speed = "00" else
                    std_logic_vector(to_unsigned( 18, Nangle)) when speed = "01" else
                    std_logic_vector(to_unsigned( 55, Nangle)) when speed = "10" else
                    std_logic_vector(to_unsigned(128, Nangle)) when speed = "11";

    read_stop <= '1' when (unsigned(read_address_ram_counter) = unsigned(write_address_ram_counter))
                else '0';

    -------------------------------------------------------------------
    -- CLEAR VIDEO RAM
    -------------------------------------------------------------------
    clear_inst: entity work.clear_video_ram
    generic map(
        N_bits_row => N_bits_row,
        N_bits_col => N_bits_col,
        N_ROWS => N_ROWS,
        N_COLS => N_COLS
    ) port map(
        clock => clk_i,
        reset => clear_reset,
        enable => clear_enable,
        row_counter => row_counter,
        col_counter => col_counter,
        carry_out => clear_stop
    );
    -------------------------------------------------------------------

    -------------------------------------------------------------------
    -- UART 8bits --> 16bits
    -------------------------------------------------------------------
    data_loader: entity work.extRam_loader
    port map(
        clock => clk_i,
        reset => write_reset_out,
        data_in => uart_Dout,
        RxRdy_in => uart_RxRdy,
        data_out => data_in_ram,
        RxRdy_out => loader_RxRdy
    );
    -- Lo recibido por la UART se almacena en la RAM externa

    go_in_ram <= loader_RxRdy OR (read_ram_ctrl and (not read_stop));
    write_in_ram <= loader_RxRdy;
    address_in_ram <= write_address_ram_counter when loader_RxRdy = '1' else
                      read_address_ram_counter;

    ------------------------------------
    -- Retardo para RxRdy
    ------------------------------------
    RdRdy_delay: entity work.ffd_serie
    generic map(N => 5)
    port map(
        clock => clk_i,
        reset => write_reset_out,
        enable => '1',
        D => loader_RxRdy,
        Q => loader_RxRdy_delay
    );

    -------------------------------------------------------------------
    -- Contador de escritura de la RAM Externa
    -------------------------------------------------------------------
    write_extram_counter: entity work.counter
    generic map(
        N_bits => 23,
        MAX_COUNT => 2**23-1
    )
    port map(
        clock => clk_i,
        reset => write_reset_out,
        enable => loader_RxRdy_delay,
        counter_output => write_address_ram_counter,
        carry_out => open
    );

    -------------------------------------------------------------------
    -- Contador de lectura de la RAM Externa
    -------------------------------------------------------------------
    reset_read_extram_counter <= loader_RxRdy_delay OR read_reset_out;

    read_extram_counter: entity work.counter
    generic map(
        N_bits => 23,
        MAX_COUNT => 2**23
    ) port map(
        clock => clk_i,
        reset => reset_read_extram_counter,
        -- enable => read_ram_ctrl_delay,
        enable => RxRdy_ram,
        counter_output => read_address_ram_counter,
        carry_out => open
    );


    -------------------------------------------------------------------
    -- Lectura de la RAM externa
    -------------------------------------------------------------------
    pos_loader_inst: entity work.pos_loader
    port map(
        clock => clk_i,
        reset => read_stop_delay,
        enable => enable_xyz,
        start => read_start,
        data_in => data_out_ram,
        go_ram => read_ram_ctrl,
        RxRdy_ram => RxRdy_ram,
        busy_ram => busy_ram,
        RxRdy_out => RxRdy_xyz,
        x => x0,
        y => y0,
        z => z0
    );

    enable_xyz <= '1';
    read_stop_ffd: entity work.ffd
    port map(
        clk => clk_i,
        rst => '0',
        ena => '1',
        d => read_stop,
        q => read_stop_delay
    );

    -------------------------------------------------------------------
    -- Rotador de posiciones
    -------------------------------------------------------------------
    rotator: entity work.pos_rotator
    generic map(
        Nxy => Nxy,
        Nangle => Nangle,
        Nits => Nits
    ) port map(
        clock => clk_i,
        reset => read_reset_out,
        load => RxRdy_xyz,
        RxRdy => rotator_RxRdy,
        alfa => alfa,
        beta => beta,
        gama => gama,
        x0 => x0,
        y0 => y0,
        z0 => z0,
        x1 => x,
        y1 => y,
        z1 => z
    );

    -------------------------------------------------------------------
    -- Escalado de la salida del rotador
    -------------------------------------------------------------------
    -- Version para N_ROWS = 2**N_bits_row
    -- Multiplico por 2**N_bits_row
    x_screen_aux <= x  & (N_bits_col-1 downto 0 => '0');-- when bypass_cordic = '0' else
                    --x0 & (N_bits_col-1 downto 0 => '0') ;
    y_screen_aux <= y  & (N_bits_row-1 downto 0 => '0');-- when bypass_cordic = '0' else
                    --y0 & (N_bits_col-1 downto 0 => '0') ;

    ---- test martín
    -- Dividir por 2**(Nxy-1) es equivalente a desplazar a derecha en Nxy-1, que equivale a tomar los segundos Nxy-1 bits
    --  x_screen <= (Nxy-3 downto 0 => '0') & x_screen_aux((Nxy+N_bits_col)-1 downto Nxy) when bypass_scale = '0' else
    --              (N_bits_col-1 downto 0 => '0') & x when bypass_cordic = '0' else
    --              (N_bits_col-1 downto 0 => '0') & x0;
    --  y_screen <= (Nxy-3 downto 0 => '0') & y_screen_aux((Nxy+N_bits_row)-1 downto Nxy) when bypass_scale = '0' else
    --              (N_bits_row-1 downto 0 => '0') & y when bypass_cordic = '0' else
    --              (N_bits_row-1 downto 0 => '0') & y0;
    -- Dividir por 2**(Nxy-1) es equivalente a desplazar a derecha en Nxy-1, que equivale a tomar los segundos Nxy-1 bits
    x_screen <= (Nxy-2 downto 0 => '0') & x_screen_aux((Nxy+N_bits_col)-1 downto Nxy-1); --when bypass_scale = '0' else
                --(N_bits_col-1 downto 0 => '0') & x when bypass_cordic = '0' else
                --(N_bits_col-1 downto 0 => '0') & x0;
    y_screen <= (Nxy-2 downto 0 => '0') & y_screen_aux((Nxy+N_bits_row)-1 downto Nxy-1); --when bypass_scale = '0' else
                --(N_bits_row-1 downto 0 => '0') & y when bypass_cordic = '0' else
                --(N_bits_row-1 downto 0 => '0') & y0;

    -- v que shiftea antes y solo se queda con los N_bits_row
    A_row_aux <= std_logic_vector(CENTER_ROW - signed(y_screen((N_bits_row)-1 downto 0)));
    A_col_aux <= std_logic_vector(CENTER_COL + signed(x_screen((N_bits_col)-1 downto 0)));


    -------------------------------------------------------------------
    -- Video RAM
    -------------------------------------------------------------------
    video_RAM_inst : entity work.video_ram
    generic map (
        N_bits_row => N_bits_row,
        N_bits_col => N_bits_col,
        N_rows => N_rows,
        N_cols => N_cols
    ) port map(
        clock => clk_i,
        write_enable => video_write_enable,
        A_row => A_row,
        B_row  => B_row,
        A_col  => A_col,
        B_col  => B_col,
        data_A => data_A,
        data_B => data_B
    );

    -- Escritura
    -- row/col_counter: del CLEAR
    -- A_row/col_aux: de x,y,z, luego de transformarlos y escalarlos
    A_row <= row_counter when clear_enable = '1' else A_row_aux;
    A_col <= col_counter when clear_enable = '1' else A_col_aux;
    data_A <= '0' when clear_enable = '1' else '1';
    video_write_enable <= rotator_RxRdy OR clear_enable;-- when bypass_cordic = '0' else
                            --RxRdy_xyz OR clear_enable;

    -- Lectura: con el contador de salida de la VGA, leo la video ram,
    --  solo cuando está habilitada la escritura.
    B_row <= pixel_row_aux when enable_vga = '1' else (others => '0');
    B_col <= pixel_col_aux when enable_vga = '1' else (others => '0');

    -------------------------------------------------------------------
    -- VGA
    -------------------------------------------------------------------
    -- Señales para avisar cuando empieza a barrer la pantalla
    vga_start<= '1' when (unsigned(B_row) = 0) and (unsigned(B_col) = 0) and (enable_vga = '1')
                else '0';
    -- Avisa cuando se terminó una barrida completa de la pantalla.
    vga_stop <= '1' when (unsigned(B_row) = N_ROWS-1) and (unsigned(B_col) = N_COLS-1)
                else '0';

    -- Entrada de color de la VGA.
    vga_pixel_in <= not (data_B and enable_vga_delay); ---cambio color mnm
    -- Retraso enable_vga en 1 ciclo de clock
    delay_vga: entity work.ffd
    port map(
        clk => clk_i,
        rst => '0',
        ena => '1',
        d => enable_vga,
        q => enable_vga_delay
    );

    -- Resto el offset de los contadores de filas y columnas de VGA
    pixel_row_aux <= std_logic_vector(unsigned(pixel_row(N_bits_row-1 downto 0)) - TOP_MARGIN);
    pixel_col_aux <= std_logic_vector(unsigned(pixel_col(N_bits_col-1 downto 0)) - LEFT_MARGIN);

    -- Habilito la escritura en la VGA solo cuando me encuentro
    --  entre los márgenes permitidos para imprimir en pantalla.
    process(pixel_row, pixel_col)
    begin
        if  (TOP_MARGIN - 1 < unsigned(pixel_row) and            -- Superior
                unsigned(pixel_row) < TOP_MARGIN + N_rows and    -- Inferior
                LEFT_MARGIN - 1 < unsigned(pixel_col) and        -- Izquierdo
                unsigned(pixel_col) < LEFT_MARGIN + N_cols) then -- Derecho
            enable_vga <= '1';
        else
            enable_vga <= '0';
        end if;
    end process;

    -- Control de VGA
    vga: entity work.vga_ctrl
    port map(
        mclk => clk_i,
        red_i => vga_pixel_in,
        grn_i => vga_pixel_in,  ---Testear colores
        blu_i => vga_pixel_in,
        hs => hs,
        vs => vs,
        red_o => red_o,
        grn_o => grn_o,
        blu_o => blu_o,
        pixel_row => pixel_row,
        pixel_col => pixel_col
    );

    -------------------------------------------------------------------
    -- UART
    -------------------------------------------------------------------
    rx <= data_i;

    UART_receiver : entity work.uart
    generic map (
        F 	=> 50000,
        min_baud => 1200,
        num_data_bits => 8
    ) port map (
        clk	=> clk_i,
        Rx	=> rx,
        Tx	=> tx,
        Din	=> sig_Din,
        StartTx	=> sig_StartTx,
        TxBusy	=> sig_TxBusy,
        Dout	=> uart_Dout,
        RxRdy	=> uart_RxRdy,
        RxErr	=> sig_RxErr,
        Divisor	=> Divisor,
        rst	=> write_reset_out
    );

    -------------------------------------------------------------------
    -- Controlador de la RAM Externa
    -------------------------------------------------------------------
    ext_RAM: entity work.MemoryController
    generic map (
        clock_frec => 50
    ) port map(
        clock       => 	clk_i,
        reset       =>  '0',
        address_in  => 	address_in_ram,
        go_in		=> 	go_in_ram,
        write_in	=> 	write_in_ram,
        data_in     => 	data_in_ram,
        data_out    => 	data_out_ram,
        read_ready_out => RxRdy_ram,
        busy       =>   busy_ram,
        ---- Conexiones con la ram externa de la placa:
        clock_out   => 	clock_out,
        ADDRESS     => 	ADDRESS,
        ADV			=> 	ADV,
        CRE			=> 	CRE,
        CE			=> 	CE,
        OE			=> 	OE,
        WE			=> 	WE,
        LB			=> 	LB,
        UB			=> 	UB,
        DATA		=> 	DATA
    );

    -- Apago todos los segmentos del display de 7 segmentos
	a <= '1';
	b <= '1';
	c <= '1';
	d <= '1';
	e <= '1';
	f <= '1';
	g <= '1';
	dp <= '1';

end;
