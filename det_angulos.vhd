-- library IEEE;
-- use IEEE.std_logic_1164.all;
use ieee_proposed.float_pkg.all;

library work;
use work.cordic_lib.all;

-- Almacena y actualiza ángulos de rotación
entity det_angulos is
	port (
		-- clk: in std_logic;
		-- ena: in std_logic;
		rst: in std_logic;
        inc_a, inc_b, inc_g: in std_logic;
        neg_a, neg_b, neg_g: in std_logic;

        a, b, g: out float32 := CERO
	);
end;

architecture det_angulos_arq of det_angulos is

    constant PASO_ANG := "00111111001101000000000000000000";  -- Paso angular ∆φ: 0.703125 grados

begin

    a <= CERO when rst else ((a - paso_ang when neg_a else a + paso_ang) when inc_a else a);
    b <= CERO when rst else ((b - paso_ang when neg_b else b + paso_ang) when inc_b else b);
    g <= CERO when rst else ((g - paso_ang when neg_g else g + paso_ang) when inc_g else g);

end;
