-- Algoritmo CORDIC
-- (Rehecho de forma iterativa)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.MATH_REAL.all;

library work;
use work.cordic_lib.all;


entity cordic is
    generic (
        P : natural := 16   -- Cantidad de iteraciones, determina la precisión
    );
    port (
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

    constant N_K : natural := N_BITS / 2;
	constant Nrom : natural := 32;
	
    type t_angles is array(natural range <>) of std_logic_vector(N_BITS-1 downto 0);
    constant ANGLES : t_angles(0 to Nrom-1) := (	-- Nrom primeros valores de atan(2^-i), convertidos
        std_logic_vector(to_unsigned(integer(round(0.785398163397448278999490867136 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.463647609000806093515478778500 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.244978663126864143473326862477 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.124354994546761438156678991618 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.062418809995957350023054743815 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.031239833430268277442154456480 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.015623728620476831294161534913 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.007812341060101111143987306917 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.003906230131966971757390139075 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.001953122516478818758434155001 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000976562189559319459436492750 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000488281211194898289926213941 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000244140620149361771244744812 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000122070311893670207853065945 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000061035156174208772593501454 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000030517578115526095727154735 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000015258789061315761542377868 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000007629394531101969981038997 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000003814697265606496141750756 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000001907348632810186964779285 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000953674316405960844127631 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000476837158203088842281064 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000238418579101557973667688 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000119209289550780680899739 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000059604644775390552208106 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000029802322387695302573833 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000014901161193847654595639 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000007450580596923828125000 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000003725290298461914062500 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000001862645149230957031250 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000000931322574615478515625 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS)),
        std_logic_vector(to_unsigned(integer(round(0.000000000465661287307739257812 * real(2**(N_BITS-0)) / (2.0*MATH_PI) )), N_BITS))
    );

    type t_kvalues is array(natural range <>) of std_logic_vector(N_K-1 downto 0);
    constant K_VALUES : t_kvalues(0 to Nrom-1) := (	-- Nrom primeros cumprod(1 ./ abs(1 + 1j*2.^(-(0:25))))
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.707106781186547461715008466854)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.632455532033675771330649695301)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.613571991077896283783843500714)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.608833912517752429138795378094)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607648256256168139977091868786)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607351770141295932425862247328)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607277644093526025592666428565)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607259112298892733683430833480)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607254479332562269178197311703)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607253321089875175431416209904)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607253031529134346122589249717)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252959138944836681162087189)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252941041397154009473524638)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252936517010177830400152743)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935385913406030056194140)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935103139268591121435747)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935032445706475812130520)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935014772288191409188585)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935010353933620308453101)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935009249372733108884859)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008973260266884608427)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008904204394752923690)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008886884915568771248)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008882666068075195653)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008881555845050570497)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008881222778143182950)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008881222778143182950)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008881222778143182950)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008881222778143182950)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008881222778143182950)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008881222778143182950)), N_K)),
        std_logic_vector(to_signed(integer(round( real(2**N_K) * 0.607252935008881222778143182950)), N_K))
    );


    signal x_in_e, x_in_n, x0, x_1, x_2, x_2_sh, x_3, x_4 : t_coord_e := (others => '0');
    signal y_in_e, y_in_n, y0, y_1, y_2, y_2_sh, y_3, y_4 : t_coord_e := (others => '0');
    signal x_5, y_5 : std_logic_vector((N_EXTR+N_K)-1 downto 0) := (others => '0');

    signal angle0, angle_1, angle_2, angle_3 : t_num := (others => '0');

    subtype natural_i is natural range 0 to 31;
    signal i : natural_i := P;
    signal cuadrante : std_logic_vector(1 downto 0) := "00";
    signal angle_i : std_logic_vector(N_BITS-1 downto 0) := (others => '0');
	--signal angle_i : unsigned(N_BITS-1 downto 0) := (others => '0');
    signal sigma : std_logic := '0';

    signal ena_reg : std_logic := '0';
	signal stRdy   : std_logic := '0';
    type t_estado is (IDLE, LOADING, ROTA, RDY);
    signal estado : t_estado := IDLE;

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
                estado <= LOADING;
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

    ena_reg <= '1' when (estado = LOADING or estado = ROTA or load = '1') else '0';
	stRdy <= '1' when (estado = RDY) else '0';

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


    angle_i <= ANGLES(i); ----ANGLES_DEG(i);---- when (i < ANGLES'length) else
               ----(angle(ANGLES'length-1) / (2**(i - ANGLES'length + 1)));
               ------ Si me paso de la tabla, aproximo

    angle_3 <= std_logic_vector(unsigned(angle_2) + unsigned(angle_i)) when sigma = '1' else
               std_logic_vector(unsigned(angle_2) - unsigned(angle_i));

    -- Signo del ángulo de rotación restante
    sigma <= angle_2(N_BITS-1) when (estado = ROTA) else '0';

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
    delay_Rdy: entity work.ffd
        port map(
            clk => clk,
            rst => rst,
            ena => '1',
            d => stRdy,
            q => rotRdy
        );

	-- Intermedio
    x_5 <= std_logic_vector( signed(x_4) * signed(K_VALUES(i)) );
    y_5 <= std_logic_vector( signed(y_4) * signed(K_VALUES(i)) );

    -- Salida de la rotación (si rotRdy)
    x_rot <= x_5(N_EXTR+N_K-3 downto N_EXTR+N_K-3-N_BITS+1);
    y_rot <= y_5(N_EXTR+N_K-3 downto N_EXTR+N_K-3-N_BITS+1);

end cordic_arq;
