library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cordic_lib.all;

--library ieee_proposed;
--use ieee_proposed.float_pkg.all;
library floatfixlib;
use floatfixlib.float_pkg.all;


entity det_angulos_tb is

	generic(
		N_BITS_COORD : integer := 32	--- REVISAR
	);

	port(
		--clk_i: in std_logic;		-- Clock general
		
		alfa, beta, gama: out t_float := CERO
	);

	--attribute loc: string;
	--attribute loc of clk_i: signal is "B8";

end;

architecture det_angulos_tb_arq of det_angulos_tb is

	constant PASO_ANG : t_float := "00111111001101000000000000000000";	-- Paso angular ∆φ: 0.703125 grados
	constant PASO_ANG_R : t_float := PI_PF * PASO_ANG / 180;			-- Paso angular en radianes

	-- Entrada
	signal clk_t : std_logic := '1';
	signal rot_x_ng, rot_y_ng, rot_z_ng, inc_alfa, inc_beta, inc_gama, rst_angs_t, rst_t : std_logic := '0';

	-- Salida
	-- signal rot_ena: std_logic := '0';		-- Enable de rotar
	signal ena_o: std_logic := '1';
	signal rst_angs: std_logic := '0';
	
	signal alfa_aux, beta_aux, gama_aux: t_float := CERO;
	signal off : std_logic := '0';

begin
	
	clk_t <= not clk_t after 5 ns;

	inc_alfa <= '1' after 20 ns, '0' after 25 ns, '1' after 100 ns, '0' after 105 ns, '1' after 160 ns, '0' after 165 ns;
	inc_beta <= '1' after 40 ns, '0' after 45 ns, '1' after 100 ns, '0' after 115 ns, '1' after 220 ns, '0' after 225 ns;
	inc_gama <= '1' after 60 ns, '0' after 65 ns, '1' after 100 ns, '0' after 105 ns, '1' after 160 ns, '0' after 175 ns;
	rot_x_ng <= '1' after 150 ns;
	---rot_y_ng <= 
	---rot_z_ng <= 
	ena_o <= '0' after 105 ns;
	rst_angs_t <= '1' after 200 ns, '0' after 205 ns;
	rst_t <= '1' after 240 ns;
	
	off <= '1' after 260 ns;
	

	-- *** LEER Y ROTAR ***

	--- Si hiciéramos rotación constante:
	---			3 contadores de pasos angulares en cada eje,
	--- 		se multiplican a la velocidad de rotación (lenta o rápida según rot_vel),
	---			y eso son los 3 ángulos: alfa, beta, gama.

	rst_angs <= rst_angs_t or rst_t;
	
	-- Obtengo los ángulos de rotación para cada eje
	angles: entity work.det_angulos
		generic map(
			C => 1
		) port map(
			clk_t,
			ena_o,	-- and rot_ena,
			rst_angs,
			inc_alfa, inc_beta, inc_gama,
			rot_x_ng, rot_y_ng, rot_z_ng,
			alfa_aux, beta_aux, gama_aux
		);
	
	alfa <= alfa_aux;
	beta <= beta_aux;
	gama <= gama_aux;
		

	process(clk_t)
	begin
		if rising_edge(clk_t) then
			if off = '0' then
				report "alfa: " & integer'image(to_integer(to_signed(alfa_aux/PASO_ANG,32)))
					& " beta: " & integer'image(to_integer(to_signed(beta_aux/PASO_ANG,32)))
					& " gama: " & integer'image(to_integer(to_signed(gama_aux/PASO_ANG,32)))
					severity note;
			end if;
		end if;
	end process;

end;
