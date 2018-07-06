library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cordic_lib.all;

entity tp4 is

	generic(
		n_bits_coord : integer := 32	--- REVISAR
	);

	port(
		clk_i: in std_logic;	-- Clock general
		
		data_i: in std_logic;	-- Entrada de datos
		rst_i: in std_logic;	-- Botón de reset

		--rot_on, rot_vel: in std_logic;			-- Switches y botones para controlar la rotación
		--rot_x_on, rot_y_on, rot_z_on: in std_logic;
		rot_x_ng, rot_y_ng, rot_z_ng: in std_logic;
		inc_alfa, inc_beta, inc_gama: in std_logic;
		rst_angs_i: in std_logic;

		data_volt_out: out std_logic;
		hs, vs: out std_logic;						-- Output para el display VGA
		red_o: out std_logic_vector(2 downto 0);
		grn_o: out std_logic_vector(2 downto 0);
		blu_o: out std_logic_vector(1 downto 0);

		a,b,c,d,e,f,g,dp: out std_logic				-- Segmentos del display de 7 segmentos
	);

	attribute loc: string;
	attribute slew: string;
	attribute drive: string;
	attribute iostandard: string;

	-- Mapeo de pines para el kit Nexys 2 (spartan 3E)
	-- https://reference.digilentinc.com/_media/nexys:nexys2:nexys2_rm.pdf
	attribute loc of clk_i: signal is "B8";
	attribute loc of data_i: signal is "L15";		-- Pin físico de entrada de datos
	---attribute loc of rst_i: signal is "?##";		-- Botón para resetear todo
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
	attribute loc of rot_x_ng: signal is "L14";		-- Rotación negativa en x
	-- attribute loc of rot_y_on: signal is "K17";	-- Rotación en y
	attribute loc of rot_y_ng: signal is "K18";		-- Rotación negativa en y
	-- attribute loc of rot_z_on: signal is "H18";	-- Rotación en z
	attribute loc of rot_z_ng: signal is "G18";		-- Rotación negativa en z
	-- Botones
	attribute loc of inc_alfa: signal is "H13";
	attribute loc of inc_beta: signal is "E18";
	attribute loc of inc_gama: signal is "D18";
	attribute loc of rst_angs_i: signal is "B18";

	-- Apagar los segmentos del display
	attribute loc of a:	signal is "L18";
	attribute loc of b:	signal is "F18";
	attribute loc of c:	signal is "D17";
	attribute loc of d:	signal is "D16";
	---attribute loc of e:	signal is "G14";
	attribute loc of f:	signal is "J17";
	attribute loc of g:	signal is "H14";
	attribute loc of dp: signal is "C17";

end;

architecture tp4_arq of tp4 is

	-- signal rot_ena: std_logic := '0';		-- Enable de rotar
	signal ena_o: std_logic := '0';
	signal ram_int_refresh, rst_pdram: std_logic := '0';
	signal alfa, beta, gama: t_float;
	signal pos_leida, pos_rotada: t_pos;
	signal vec_pos_pixel: t_vec;
	signal dir_pixel: t_dir;

    signal pix_x, pix_y: std_logic_vector(9 downto 0) := (others => '0');
	signal pix_on: std_logic := '0';

	----signal barrido: std_logic := '0';	---FALTA ASIGNARLA EN ALGÚN MOMENTO /// O es rst_pdram?
	signal RxRdy: std_logic := '0';		-- Dato listo para leerse
	---Falta un bit para saber si se terminó de leer [todos los] datos?
	signal Dout_uart: std_logic_vector(15 downto 0) := (others => '0');---CHEQUEAR TAMAÑO CORRECTO, MIRAR NOTA MÁS ABAJO
	signal lectura_32b: std_logic_vector(n_bits_coord-1 downto 0) := (others => '0');---
	signal rst_angs: std_logic := '0';

begin

	-- *** RECIBIR Y GUARDAR ***

	-- UART para recibir los datos de la PC y mandarlos a la RAM externa
	uart: entity work.data_acq_unit
		port map(
			clk => clk_i,
			rst => rst_i,
			rx => data_i,
			data_out_16bits => Dout_uart,
			data_ready => RxRdy
		);
	
	--- %%%%%% LA UART LEE 16 BITS, PERO LO ESTIRO A 32 %%%%%%%%%%%%	---Así estará bien?
	lectura_32b(n_bits_coord-1 downto n_bits_coord-16) <= Dout_uart;
	lectura_32b(n_bits_coord-17 downto 0) <= (others => '0');
	--- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	--- Se guarda un dato de lectura listo en memoria [interna]. Continuamente se leen y guardan en vector pos_leida
	ram_int: entity work.ram_interna
		generic map(
			N_BITS => n_bits_coord,
			CANT_P => 1000
		) port map(
			clk => clk_i,
			rst => rst_i,
			Rx  => RxRdy,
			Din => lectura_32b,

			Dout => pos_leida,
			Rdy => ena_o,
			barrido => ram_int_refresh
		);

		
	-- *** LEER Y ROTAR ***

	--- Si hiciéramos rotación constante:
	---			3 contadores de pasos angulares en cada eje,
	--- 		se multiplican a la velocidad de rotación (lenta o rápida según rot_vel),
	---			y eso son los 3 ángulos: alfa, beta, gama.

	rst_angs <= rst_angs_i or rst_i;
	
	-- Obtengo los ángulos de rotación para cada eje
	angles: entity work.det_angulos
		port map(
			clk_i,
			'0',---APAGO PARA TESTEAR---ena_o,	-- and rot_ena,
			rst_angs,
			inc_alfa, inc_beta, inc_gama,
			rot_x_ng, rot_y_ng, rot_z_ng,
			alfa, beta, gama
		);

	-- Roto la posición leída según los ángulos de rotación
	rotador: entity work.rotador3d
		port map(
			ena => ena_o,	---ena => rot_ena,
			pos => pos_leida,
			alfa => alfa,
			beta => beta,
			gama => gama,
			pos_rotada => pos_rotada
		);

	-- Aplano a ejes (y,z)
	vec_pos_pixel(1) <= pos_rotada(2);
	vec_pos_pixel(2) <= pos_rotada(3);

	-- Para la posición rotada genero la dirección en memoria correspondiente
	gen_dir: entity work.gen_dirs
		port map(
            clk => clk_i,
			pos => vec_pos_pixel,
			dir => dir_pixel
		);

	rst_pdram <= ram_int_refresh or rst_i;
	
	-- Prendo el bit para la posición apropiada en la dual port ram
    escrit_dpram: entity work.video_ram
        port map (
            clock => clk_i,
            write_enable => ena_o,	---Chequear
			barrido => rst_pdram,
            A_row => dir_pixel(2),
            B_row => pix_y,
            A_col => dir_pixel(1),

            B_col => pix_x,
			data_A => '1',
            data_B => pix_on
        );

	pix_on <= pix_on and ena_o;

	
	-- *** IMPRIMIR ***		[De acá en más, se tratan los ejes como (x,y)]

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
