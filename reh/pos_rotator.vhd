-- Rota posiciones (x,y,z) usando el algoritmo CORDIC iterativamente
library ieee;
use ieee.std_logic_1164.all;

entity pos_rotator is

    generic(
        Nxy : natural := 16;
        Nangle : natural := 16;
        Nits : 16
    );

    port (
        clock : in std_logic;
        reset : in std_logic;
        load  : in std_logic;
        RxRdy : out std_logic;
        alfa, beta, gama : in std_logic_vector(Nangle-1 downto 0);
        x0, y0, z0 :  in std_logic_vector(Nxy-1 downto 0);
        x1, y1, z1 : out std_logic_vector(Nxy-1 downto 0)
    );

end;


architecture pos_rotator_arq of pos_rotator is

    -- Señales entre etapas

    signal xrot_load : std_logic := '0';
    signal xrot_RxRdy : std_logic := '0';
    signal xrot_angle: std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal xrot_x0: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal xrot_y0: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal xrot_x1: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal xrot_x1_delay: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal xrot_y1: std_logic_vector(Nxy-1 downto 0) := (others => '0');

    signal yrot_load : std_logic := '0';
    signal yrot_RxRdy : std_logic := '0';
    signal yrot_angle: std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal yrot_x0: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal yrot_y0: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal yrot_x1: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal yrot_x1_delay: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal yrot_y1: std_logic_vector(Nxy-1 downto 0) := (others => '0');

    signal zrot_load : std_logic := '0';
    signal zrot_RxRdy : std_logic := '0';
    signal zrot_angle: std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal zrot_x0: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal zrot_y0: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal zrot_x1: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal zrot_y1: std_logic_vector(Nxy-1 downto 0) := (others => '0');

    signal out_reg_in : std_logic_vector(1+3*Nxy-1 downto 0) := (others => '0');
    signal out_reg_out : std_logic_vector(1+3*Nxy-1 downto 0) := (others => '0');
    signal in_reg_in : std_logic_vector(n_reg_in downto 0) := (others => '0');
    signal in_reg_out : std_logic_vector(n_reg_in downto 0) := (others => '0');

    signal load_delay : std_logic := '0';
    signal x0_delay: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal x0_delay_delay: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal y0_delay: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal z0_delay: std_logic_vector(Nxy-1 downto 0) := (others => '0');
    signal alfa_delay : std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal beta_delay : std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal gama_delay : std_logic_vector(Nangle-1 downto 0) := (others => '0');

    constant n_reg_in : natural := 1+3*Nxy+3*Nangle-1; -- tamaño de registro de entrada

begin

    -- Registro de entrada
    in_reg_in <= load & x0 & y0 & z0 & alfa & beta & gama;
    pipe_reg_in: entity work.registroNb
    generic map(
        N => 1 + 3*Nxy + 3*Nangle
    ) port map(
        clk => clock,
        rst => reset,
        ena => '1',
        d => in_reg_in,
        q => in_reg_out
    );

    load_delay <= in_reg_out(n_reg_in);
    x0_delay <= in_reg_out(  n_reg_in -1 downto n_reg_in -Nxy);
    y0_delay <= in_reg_out(  n_reg_in -Nxy-1 downto n_reg_in -2*Nxy);
    z0_delay <= in_reg_out(  n_reg_in -2*Nxy-1 downto n_reg_in -3*Nxy);
    alfa_delay <= in_reg_out(n_reg_in -3*Nxy -1 downto n_reg_in -3*Nxy -Nangle);
    beta_delay <= in_reg_out(n_reg_in -3*Nxy -Nangle-1 downto n_reg_in -3*Nxy -2*Nangle);
    gama_delay <= in_reg_out(n_reg_in -3*Nxy -2*Nangle-1 downto n_reg_in -3*Nxy -3*Nangle);

    -------------------------------------
    -- Rotador según eje X
    -------------------------------------
    xrot_load <= load_delay;
    xrot_x0 <= y0_delay;
    xrot_y0 <= z0_delay;
    xrot_angle <= alfa_delay;

    X_rot: entity work.cordic
    generic map(
        ---Nxy => Nxy,
        ---Nangle => Nangle,
        P => Nits
    ) port map(
        clk => clock,
        rst => reset,
        load => xrot_load,
        x_in => xrot_x0,
        y_in => xrot_y0,
        angle => xrot_angle,
        x_rot => xrot_x1,
        y_rot => xrot_y1,
        rotRdy => xrot_RxRdy
    );

    -------------------------------------
    -- Delay para x
    -------------------------------------
    X_del: entity work.delay_reg
    generic map(
        N => Nxy,
        DELAY => Nits +1
    )
    port map(
        clock => clock,
        reset => reset,
        enable => '1',
        A => x0_delay,
        B => x0_delay_delay
    );

    -------------------------------------
    -- Rotador según eje Y
    -------------------------------------
    yrot_load <= xrot_RxRdy;
    yrot_x0 <= xrot_y1;
    yrot_y0 <= x0_delay_delay;
    yrot_angle <= beta_delay;

    Y_rot: entity work.cordic
    generic map(
        ---Nxy => Nxy,
        ---Nangle => Nangle,
        P => Nits
    ) port map(
        clk => clock,
        rst => reset,
        load => yrot_load,
        x_in => yrot_x0,
        y_in => yrot_y0,
        angle => yrot_angle,
        x_rot => yrot_x1,
        y_rot => yrot_y1,
        rotRdy => yrot_RxRdy
    );

    -------------------------------------
    -- Delay para y
    -------------------------------------
    Y_del: entity work.delay_reg
    generic map(
        N => Nxy,
        DELAY => Nits+1
    )
    port map(
        clock => clock,
        reset => reset,
        enable => '1',
        A => xrot_x1,
        B => xrot_x1_delay
    );

    -------------------------------------
    -- Rotador según eje Z (plano XY)
    -------------------------------------
    zrot_load <= yrot_RxRdy;
    zrot_x0 <= yrot_y1;
    zrot_y0 <= xrot_x1_delay;
    zrot_angle <= gama_delay;

    Z_rot: entity work.cordic
    generic map(
        ---Nxy => Nxy,
        ---Nangle => Nangle,
        P => Nits
    ) port map(
        clk => clock,
        rst => reset,
        load => zrot_load,
        x_in => zrot_x0,
        y_in => zrot_y0,
        angle => zrot_angle,
        x_rot => zrot_x1,
        y_rot => zrot_y1,
        rotRdy => zrot_RxRdy
    );

    -------------------------------------
    -- Delay para Z
    -------------------------------------
    Z_del: entity work.delay_reg
    generic map(
        N => Nxy,
        DELAY => Nits +1
    )
    port map(
        clock => clock,
        reset => reset,
        enable => '1',
        A => yrot_x1,
        B => yrot_x1_delay
    );


    -- Registro de salida
    out_reg_in <= zrot_RxRdy & zrot_x1 & zrot_y1 & yrot_x1_delay;
    pipe_reg_out: entity work.registroNb
    generic map(
        N => 1 + 3*Nxy
    )
    port map(
        clk => clock,
        rst => reset,
        ena => '1',
        d => out_reg_in,
        q => out_reg_out
    );

    RxRdy <= out_reg_out(1+3*Nxy-1);
    x1 <= out_reg_out(1+3*Nxy-1-1 downto 1+3*Nxy-1-Nxy);
    y1 <= out_reg_out(1+3*Nxy-1-Nxy-1 downto 1+3*Nxy-1-2*Nxy);
    z1 <= out_reg_out(1+3*Nxy-1-2*Nxy-1 downto 0);

end;
