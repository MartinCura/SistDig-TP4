-- Algoritmo CORDIC y elementos suplementarios
--- (Rehecho de forma iterativa)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.MATH_REAL.all;

---library work;
---use work.


---Considerar mover a otro archivo
package cordic_lib is

    ---constant N_PF       : natural := 32;
    ---constant N_BITS_DIR	: natural := 10;

    constant N_BITS : natural := 16;
    constant N_EXTR : natural := N_BITS + 2;    -- Precisión extra

    subtype t_num is std_logic_vector(N_BITS-1 downto 0);
    -- Tipo coordenada {x, y, z}
    subtype t_coord is t_num;
    -- Tipo coordenada con precisión extra
    subtype t_coord_e is std_logic_vector(N_EXTR-1 downto 0);
    ---///

end package cordic_lib;



entity cordic is
    generic(
        P : natural := 16   -- Cantidad de iteraciones, determina la precisión
    );
    port(
        clk  : in std_logic;
        rst  : in std_logic;
        load : in std_logic;
        x_in, y_in : in t_coord;
        angle  : in t_num;
        x_rot, y_rot : out t_coord;
        rotRdy : out std_logic
    );
end entity cordic;


architecture cordic_arq of cordic is

    type t_angles is array (0 to 27) of real;
    constant ANGLES	: t_angles := (		-- 28 primeros valores de atan(2^-i)
        0.785398163397448279, 0.463647609000806094, 0.244978663126864143, 0.124354994546761438,
        0.062418809995957350, 0.031239833430268277, 0.015623728620476831, 0.007812341060101111,
        0.003906230131966972, 0.001953122516478819, 0.000976562189559319, 0.000488281211194898,
        0.000244140620149362, 0.000122070311893670, 0.000061035156174209, 0.000030517578115526,
        0.000015258789061316, 0.000007629394531102, 0.000003814697265606, 0.000001907348632810,
        0.000000953674316406, 0.000000476837158203, 0.000000238418579102, 0.000000119209289551,
        0.000000059604644775, 0.000000029802322388, 0.000000014901161194, 0.000000007450580597
    );
    type t_angles_deg is array(0 to 27) of unsigned(N_BITS-1 downto 0);
    constant ANGLES_DEG : t_angles := to_unsigned(integer(round( ANGLES * real(2**N_BITS) / (2.0*MATH_PI) )), N_BITS);
    ---constant ANGLES_DEG : t_angles := ANGLES(0 to 27) * real(2**N_BITS) / (2.0*MATH_PI);
    ---chequear; si no, copiar lo otro

    constant N_K : natural := N_BITS / 2;
    type t_kvalues is array (0 to 25) of real;
    constant K_VALUES: t_kvalues := (	-- 26 primeros cumprod(1 ./ abs(1 + 1j*2.^(-(0:25))))
        0.707106781186547462, 0.632455532033675771, 0.613571991077896284, 0.608833912517752429,
        0.607648256256168140, 0.607351770141295932, 0.607277644093526026, 0.607259112298892734,
        0.607254479332562269, 0.607253321089875175, 0.607253031529134346, 0.607252959138944837,
        0.607252941041397154, 0.607252936517010178, 0.607252935385913406, 0.607252935103139269,
        0.607252935032445706, 0.607252935014772288, 0.607252935010353934, 0.607252935009249373,
        0.607252935008973260, 0.607252935008904204, 0.607252935008886885, 0.607252935008882666,
        0.607252935008881555, 0.607252935008881223
    );----///2**Nk

    signal x_in_e, x_in_n, x0, x_1, x_2, x_2_sh, x_3, x_4 : t_coord_e := (others => '0');
    signal y_in_e, y_in_n, y0, y_1, y_2, y_2_sh, y_3, y_4 : t_coord_e := (others => '0');
    signal x_5, y_5 : std_logic_vector((N_EXTR+N_K)-1 downto 0) := (others => '0');

    signal angle0, angle_1, angle_2, angle_3 : t_num := (others => '0');

    subtype natural_i is natural range 0 to 31;
    signal i : natural_i := P;
    signal cuadrante : std_logic_vector(1 downto 0) := "00";
    signal angle_i : unsigned(N_BITS-1 downto 0) := (others => '0');
    signal sigma : std_logic := '0';

    signal ena_reg : std_logic := '0';
    type t_estado is (IDLE, LOAD, ROTA, RDY);
    signal estado : t_estado : IDLE;

begin

    -- Extiendo coordenadas
    x_in_e <= (N_EXTR-N_BITS-1 downto 0 => x_in(N_BITS-1)) & x_in;
    y_in_e <= (N_EXTR-N_BITS-1 downto 0 => y_in(N_BITS-1)) & y_in;
    -- Versiones negativas
    x_in_n <= std_logic_vector(signed(not x_in_e) + 1);
    y_in_n <= std_logic_vector(signed(not y_in_e) + 1);


    -- Iterador
    process(clk, rst, load)
    begin
        if rst = '1' then
            i <= P;
            estado <= IDLE;
        elsif rising_edge(clk) then
            if load = '1' then
                -- Cargo nueva posición para rotar
                estado <= LOAD;
                i <= 0;
            elsif i < P-2 then
                -- Sigo rotando
                estado <= ROTA;
                i <= i + 1;
            elsif i = P-2 then
                -- Terminé de rotar posición
                estado <= RDY;
                i <= i + 1;
            else
                estado <= IDLE;
            end if;
        end if;
    end process;

    ena_reg <= (estado = LOAD or estado = ROTA) or load = '1';    ---Chequear sintaxis

    -- Averiguo cuadrante con los 2 MSBs del ángulo
    cuadrante <= angle(N_BITS-1 downto N_BITS-2);

    -- Rotación inicial (pongo en el cuadrante correcto)
    x0 <= x_in_e when cuadrante = "00" else
          y_in_n when cuadrante = "01" else
          x_in_n when cuadrante = "10" else
          y_in_e when cuadrante = "11";
    y0 <= y_in_e when cuadrante = "00" else
          x_in_e when cuadrante = "01" else
          y_in_n when cuadrante = "10" else
          x_in_n when cuadrante = "11";
    angle0 <= "00" & angle(N_BITS-3 downto 0);


    -- Uso pos nueva si cargando o sigo rotando
    x_1 <= x0 when load = '1' else
           x_3;
    y_1 <= y0 when load = '1' else
           y_3;
    angle_1 <= angle0 when load = '1' else
               angle_3;

    -- ...
    reg_x: entity work.registroNb
        generic map(
            N => N_EXTR
        ) port map(
            clk => clk,
            rst => rst,
            ena => ena_reg,
            d => x_1,
            q => x_2
        );
    reg_y: entity work.registroNb
        generic map(
            N => N_EXTR
        ) port map(
            clk => clk,
            rst => rst,
            ena => ena_reg,
            d => y_1,
            q => y_2
        );
    reg_angle: entity work.registroNb
        generic map(
            N => N_BITS
        ) port map(
            clk => clk,
            rst => rst,
            ena => ena_reg,
            d => angle_1,
            q => angle_2
        );

    -- ...
    bshift_x: entity work.barrel_shifterNb
        generic map(
            N => N_EXTR
        ) port map(
            to_left => '0',
            M => i,
            a => x_2,
            o => x_2_sh
        );
    bshift_y: entity work.barrel_shifterNb
        generic map(
            N => N_EXTR
        ) port map(
            to_left => '0',
            M => i,
            a => y_2,
            o => y_2_sh
        );

    -- ...
    x_3 <= std_logic_vector(unsigned(x_2) + unsigned(y_2_sh)) when sigma = '1' else
           std_logic_vector(unsigned(x_2) - unsigned(y_2_sh));
    y_3 <= std_logic_vector(unsigned(y_2) + unsigned(x_2_sh)) when sigma = '0' else
           std_logic_vector(unsigned(y_2) - unsigned(x_2_sh));


    angle_i <= ANGLES_DEG(i);---- when (i < ANGLES'length) else
               ----(angle(ANGLES'length-1) / (2**(i - ANGLES'length + 1)));
               ------ Si me paso de la tabla, aproximo

    angle_3 <= std_logic_vector(unsigned(angle_2) + angle_i) when sigma = '1' else
               std_logic_vector(unsigned(angle_2) - angle_i);

    -- Signo del ángulo de rotación restante
    sigma <= angle_2(N_BITS-1) and (estado = ROTA);

    -- ...
    pipe_reg_x: entity work.registroNb
        generic map(
            N => N_EXTR
        ) port map(
            clk => clk,
            rst => rst,
            ena => '1',
            d => x_3,
            q => x_4
        );
    pipe_reg_y: entity work.registroNb
        generic map(
            N => N_EXTR
        ) port map(
            clk => clk,
            rst => rst,
            ena => '1',
            d => y_3,
            q => y_4
        );

    -- ...
    delay_Rdy: ffd
        port map(
            clk => clk,
            rst => rst,
            ena => '1',
            d => (estado = RDY); ---Seguro tenga q reemplazar por auxiliar
            q => rotRdy
        );

    ---Chequear que funcionen
    x_5 <= std_logic_vector( signed(x_4) * to_signed(real(2**N_K) * K_VALUES, N_K) );
    y_5 <= std_logic_vector( signed(y_4) * to_signed(real(2**N_K) * K_VALUES, N_K) );

    -- Salida de la rotación (si rotRdy)
    x_rot <= x_5(N_EXTR+N_K-3 downto N_EXTR+N_K-3-N_BITS+1);
    y_rot <= y_5(N_EXTR+N_K-3 downto N_EXTR+N_K-3-N_BITS+1);

end cordic_arq;
