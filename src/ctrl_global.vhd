library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity global_ctrl is

    generic (
        Nangle : natural := 16
    );
    port (
        clock : in std_logic;
        write_rst_i: in std_logic;
        read_rst_i : in std_logic;
        sw_x_pos, sw_x_neg: in std_logic;
        sw_y_pos, sw_y_neg: in std_logic;
        sw_z_pos, sw_z_neg: in std_logic;
        delta_angle: in std_logic_vector(Nangle-1 downto 0);
        alfa, beta, gama: out std_logic_vector(Nangle-1 downto 0);
        clear_reset, clear_enable: out std_logic;
		clear_stop: in std_logic;
        read_start: out std_logic;
		read_stop: in std_logic;
        read_reset_out, write_reset_out: out std_logic;
        vga_start, vga_stop: in std_logic
    );

end;


architecture global_ctrl_arq of global_ctrl is

    type t_estado is (IDLE, CLEARING, READING, REFRESHING);
    signal estado : t_estado := IDLE;
    type t_subestado is (WAITING, REFRESHING);
    signal refresh_subestado : t_subestado := WAITING;

    signal ctrl_alfa, ctrl_beta, ctrl_gama : std_logic_vector(1 downto 0) := (others => '0');
    signal alfa_aux, beta_aux, gama_aux: std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal delta_alfa, delta_beta, delta_gama: std_logic_vector(Nangle-1 downto 0) := (others => '0');
    signal minus_delta_angle: std_logic_vector(Nangle-1 downto 0) := (others => '0');

    signal button_down : std_logic := '0';

begin

    button_down <= (sw_x_pos or sw_x_neg or
                    sw_y_pos or sw_y_neg or
                    sw_z_pos or sw_z_neg or
                    write_rst_i or read_rst_i);
    --button_down <= ( (sw_x_pos XOR sw_x_neg) OR (sw_y_pos XOR sw_y_neg) OR (sw_z_pos XOR sw_z_neg)
    --              OR write_rst_i OR read_rst_i );

    clear_enable   <= '1' when (estado = CLEARING) else '0';
    read_reset_out <= '1' when (estado = CLEARING) else '0';
    read_start     <= '1' when (estado = READING)  else '0';
    write_reset_out <= write_rst_i;

    process(clock, button_down)
    begin
        if rising_edge(clock) then
            case estado is

                when IDLE =>
                    refresh_subestado <= WAITING;
                    if button_down = '1' then
                        estado <= CLEARING;
                        clear_reset <= '0';
                    end if;

                -- Borro la memoria de video
                when CLEARING =>
                    if clear_stop = '1' then
                        clear_reset <= '1';
                        estado <= READING;
                    end if;

                -- Leo los nuevos datos
                when READING =>
                    clear_reset <= '0';
                    if read_stop = '1' then
                        estado <= REFRESHING;
                    end if;

                -- Espero a que refresque la pantalla con los nuevos datos leídos
                when REFRESHING =>
                    clear_reset <= '0';
                    case refresh_subestado is
                        when WAITING =>
                            if vga_start = '1' then
                                refresh_subestado <= REFRESHING;
                                -- else refresh_subestado <= WAITING;
                            end if;

                        when REFRESHING =>
                            if vga_stop = '1' then
                                estado <= IDLE;
                                refresh_subestado <= WAITING;
                                -- else
                                --   refresh_subestado <= REFRESHING;
                            end if;
                    end case;

            end case;
        end if;
    end process;


    -- Ángulos
    -- Ctrl +/- (selector del mux)
    ctrl_alfa <= sw_x_pos & sw_x_neg;
    ctrl_beta <= sw_y_pos & sw_y_neg;
    ctrl_gama <= sw_z_pos & sw_z_neg;


    -- Menos delta (-delta)
    minus_delta_angle <= std_logic_vector(unsigned(not delta_angle) + 1);

    -- Mux
    delta_alfa <= delta_angle       when ctrl_alfa = "10" else
                  minus_delta_angle when ctrl_alfa = "01" else
                  (others => '0');

    delta_beta <= delta_angle       when ctrl_beta = "10" else
                  minus_delta_angle when ctrl_beta = "01" else
                  (others => '0');

    delta_gama <= delta_angle       when ctrl_gama = "10" else
                  minus_delta_angle when ctrl_gama = "01" else
                  (others => '0');

    alfa <= alfa_aux;
    beta <= beta_aux;
    gama <= gama_aux;

    -- Acumulador de ángulos
    process(clock, estado)
    begin
        if rising_edge(clock) then
            if estado = IDLE then
                alfa_aux <= std_logic_vector( unsigned(alfa_aux) + unsigned(delta_alfa) );
                beta_aux <= std_logic_vector( unsigned(beta_aux) + unsigned(delta_beta) );
                gama_aux <= std_logic_vector( unsigned(gama_aux) + unsigned(delta_gama) );
            end if;
        end if;
    end process;

end;
