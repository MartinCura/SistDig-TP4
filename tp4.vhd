entity tp4 is

	generic(
		n_bits_coord := 8	--- REVISAR
	);

	port(
		clk_i: in std_logic;	-- Clock general

		data_volt_out: out std_logic;
		hs, vs: out std_logic;
		red_o: out std_logic_vector(2 downto 0);
		grn_o: out std_logic_vector(2 downto 0);
		blu_o: out std_logic_vector(1 downto 0);

		a,b,c,d,e,f,g,dp: out std_logic	-- Segmentos del display
	);

	attribute loc: string;
	attribute slew: string;
	attribute drive: string;
	attribute iostandard: string;

	-- Mapeo de pines para el kit Nexys 2 (spartan 3E)
	-- https://reference.digilentinc.com/_media/nexys:nexys2:nexys2_rm.pdf
	attribute loc of clk_i: signal is "B8";
	attribute loc of hs: signal is "T4";
	attribute loc of vs: signal is "U3";
	attribute loc of red_o: signal is "R8 T8 R9";
	attribute loc of grn_o: signal is "P6 P8 N8";
	attribute loc of blu_o: signal is "U4 U5";
	-- Switches
	-- attribute loc of rot_on: signal is "R17";	-- Prender rotación constante
	-- attribute loc of rot_vel: signal is "N17";	-- Velocidad lenta o rápida
	-- attribute loc of rot_x_on: signal is "L13";	-- Rotación en x
	attribute loc of rot_x_ng: signal is "L14";	-- Rotación negativa en x
	-- attribute loc of rot_y_on: signal is "K17";	-- Rotación en y
	attribute loc of rot_y_ng: signal is "K18";	-- Rotación negativa en y
	-- attribute loc of rot_z_on: signal is "H18";	-- Rotación en z
	attribute loc of rot_z_ng: signal is "G18";	-- Rotación negativa en z
	-- Botones
	attribute loc of inc_alfa: signal is "H13";
	attribute loc of inc_beta: signal is "E18";
	attribute loc of inc_gama: signal is "D18";
	attribute loc of rst_angs: signal is "B18";

	-- Apagar los segmentos del display
	attribute loc of a:	signal is "L18";
	attribute loc of b:	signal is "F18";
	attribute loc of c:	signal is "D17";
	attribute loc of d:	signal is "D16";
	attribute loc of e:	signal is "G14";
	attribute loc of f:	signal is "J17";
	attribute loc of g:	signal is "H14";
	attribute loc of dp: signal is "C17";

end;

architecture tp4_arq of tp4 is

	signal lectura_uart: std_logic_vector(n_bits_coord-1 downto 0) := (others => '0');

	signal alfa, beta, gama: t_float;
	signal pos_leida, pos_rotada: t_pos;
	signal pos_pixel: t_vec;
	signal dir_pixel: t_dir;

    signal pix_x, pix_y: std_logic_vector(9 downto 0) := (others => '0');
	signal pix_on: std_logic := '0';

begin

	-- *** RECIBIR Y GUARDAR ***

	-- UART para recibir los datos de la RAM externa
	uart: entity work.uart_rx
		generic map(
			data_bits => n_bits_coord
		) port map(
			clk_in   => clk_i,
			reset_in => '0', ---TODO
			tick_in  => '1', ---TODO!
			rx_in	 => '0', ---TODO
			rx_done_tick => '0', ---TODO
			data_out => lectura_uart
		);

	--- TODO: Escribir esos datos (procesar lectura_uart) en memoria externa


	-- *** LEER Y ROTAR ***

	--- TODO: Leer datos de memoria externa y guardarlos en vector pos_pixel_leido

	--- Si hiciéramos rotación constante:
	---			3 contadores de pasos angulares en cada eje,
	--- 		se multiplican a la velocidad de rotación (lenta o rápida según rot_vel),
	---			y eso son los 3 ángulos: alfa, beta, gama.

	-- Obtengo los ángulos de rotación para cada eje
	angles: entity work.det_angulos
		port map(
			rst_angs,
			inc_alfa, inc_beta, inc_gama,
			rot_x_ng, rot_y_ng, rot_z_ng,
			alfa, beta, gama
		);

	-- Roto la posición leída según los ángulos de rotación
	rotador: entity work.rotador3d
		port map(
			clk => clk_i,
			pos => pos_leida,
			alfa => alfa,
			beta => beta,
			gama => gama,
			pos_rotada => pos_rotada
		);

	-- Aplano a ejes (y,z)
	pos_pixel <= pos_rotada(2 to 3);

	-- Para la posición rotada genero la dirección en memoria correspondiente
	gen_dir: entity work.gen_dirs
		port map(
            clk => clk_i,
			pos => pos_pixel,
			dir => dir_pixel
		);

	-- Prendo el bit para la posición apropiada en la dual port ram
    escrit_dpram: entity work.video_ram
        port map (
            clock => clk,
            write_enable => '1',
            A_row => dir_pixel(1),
            B_row => open,
            A_col => dir_pixel(2),
            B_col => open,
            data_A => '1',
            data_B => open
        );


	-- *** IMPRIMIR ***		[De acá en más, se tratan los ejes como (x,y)]

	--- TODO: Leer de DP RAM si en (pix_x,pix_y) hay un píxel => pix_on

	-- VGA
	vga: entity work.VGA_ctrl
		port map(
			mclk => clk_i,
			red_i => pix_on,	--- 1 si hay algo, 0 si no
			grn_i => pix_on,	--- 1 si hay algo, 0 si no
			blu_i => '1',

			hs => hs,
			vs => vs,
			red_o => red_o,
			grn_o => grn_o,
			blu_o => blu_o,
			pixel_row => pix_y,	-- y del píxel que se está imprimiendo
			pixel_col => pix_x	-- x del píxel que se está imprimiendo
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
