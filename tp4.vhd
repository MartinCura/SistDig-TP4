entity tp2 is

	-- generic(
		-- Cantidad de dígitos
		-- DIG: NATURAL := 5;	-- [3.30(00)]
		-- M: integer := 3
	-- );

	port(
		clk_i: in std_logic;	-- Clock general
		-- data_volt_in_p, data_volt_in_n: in std_logic;

		data_volt_out: out std_logic;
		hs, vs: out std_logic;
		red_o: out std_logic_vector(2 downto 0);
		grn_o: out std_logic_vector(2 downto 0);
		blu_o: out std_logic_vector(1 downto 0);

		a,b,c,d,e,f,g,dp: out std_logic	-- Segmentos del display
	);

	-- attribute loc: string;
	-- attribute slew: string;
	-- attribute drive: string;
	-- attribute iostandard: string;
	--
	-- -- Mapeo de pines para el kit Nexys 2 (spartan 3E)
	-- attribute loc of clk_i: signal is "B8";
	-- attribute loc of hs: signal is "T4";
	-- attribute loc of vs: signal is "U3";
	-- attribute loc of red_o: signal is "R8 T8 R9";
	-- attribute loc of grn_o: signal is "P6 P8 N8";
	-- attribute loc of blu_o: signal is "U4 U5";
	--
	-- -- Apagar los segmentos del display
	-- attribute loc of a:	signal is "L18";
	-- attribute loc of b:	signal is "F18";
	-- attribute loc of c:	signal is "D17";
	-- attribute loc of d:	signal is "D16";
	-- attribute loc of e:	signal is "G14";
	-- attribute loc of f:	signal is "J17";
	-- attribute loc of g:	signal is "H14";
	-- attribute loc of dp: signal is "C17";

	-- ...

end;

architecture tp2_arq of tp2 is

	-- component IBUFDS
	-- 	port(
	-- 		I: 	in std_logic;
	-- 		IB: in std_logic;
	-- 		O: 	out std_logic
	-- 	);
	-- end component;
    --
	-- signal dif_out: std_logic := '0';
	-- signal ffd_out: std_logic := '0';
    --
	-- type t_numero is array(integer range<>)
	-- 	of std_logic_vector(3 downto 0);
	-- signal cuenta: t_numero((DIG-1) downto 0);
	-- signal lectura: t_numero((DIG-1) downto 0);
    --
	-- -- Auxiliar para contador de 1's
	-- signal c_aux: std_logic_vector((DIG-1) downto 0) := (others => '0');
	-- signal en_aux: std_logic_vector((DIG-1) downto 0);
    --
	-- -- Auxiliar para generador de ena y rst
	-- signal ena_reg: std_logic := '0';
	-- signal rst_cont: std_logic := '1';
    --
	-- -- Auxiliar para Mux
	-- signal sel_mux: std_logic_vector(2 downto 0) := (others => '0');
	-- signal o_mux: std_logic_vector(3 downto 0) := (others => '0');
    --
	-- signal char_address_aux: std_logic_vector(5 downto 0) := (others => '0');
    --
	-- signal pix_x, pix_y: std_logic_vector(9 downto 0) := (others => '0');
	-- signal font_row, font_col: std_logic_vector(M-1 downto 0) := (others => '0');
	-- signal rom_aux: std_logic := '0';

begin

    ------ Flujo de control general del TP4:
    ---- UART recibiendo de la PC
    ---- Lector de RAM externa llama al rotador3d, este al gen de dir, qn escribe
    ---- Controlador VGA lee de DP RAM y dibuja en pantalla

    

	-- ...
	-- -- VGA
	-- vga: entity work.VGA_ctrl
	-- 	port map(
	-- 		mclk => clk_i,
	-- 		red_i => rom_aux,
	-- 		grn_i => rom_aux,
	-- 		blu_i => '1',
	--
	-- 		hs => hs,
	-- 		vs => vs,
	-- 		red_o => red_o,
	-- 		grn_o => grn_o,
	-- 		blu_o => blu_o,
	-- 		pixel_row => pix_y,
	-- 		pixel_col => pix_x
	-- 	);
	--
	-- a <= '1';
	-- b <= '1';
	-- c <= '1';
	-- d <= '1';
	-- e <= '1';
	-- f <= '1';
	-- g <= '1';
	-- dp <= '1';

end;
