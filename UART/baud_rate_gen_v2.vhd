-- --------------------------
-- TIMING
-- --------------------------
-- Top16 es el clk dividido "divisor" (para el ejemplo de 115200, divisor=27)
-- ClkDiv cuenta los rising edges de Top16, a los 16 pone un 1 en TopTx
-- TopTx es Top16 dividido 16 => clk dividido "divisor"*16
-- TopRx es Top16 dividido 8 => TopTx*2

--Bloque contador de una salida. Su salida se  pone en 1 cuando el contador llega al valor indicado en cycles.

--necesito generar una señal muestreadora con una frecuencia de 16*BaudRate.

--elijo un baudrate de 19200 con un clock de 50Mhz, con lo cual cycles = 50e6/(16*19200) = 163

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- ----------------------------------------------------
Entity timing is
-- ----------------------------------------------------
generic (
	F : natural; --La frecuencia va como 50e3 en lugar de e6
	baud_rate: natural
);
port (
      CLK : in std_logic;
      RST : in std_logic;
      ClrDiv : in std_logic;
      Top16 : buffer std_logic;
      TopTx : out std_logic;
      TopRx : out std_logic
);
end timing;

-- ----------------------------------------------------
Architecture timing of timing is
-- ----------------------------------------------------
--	signal baud_value : natural;
	constant max_div : natural := ((F*1000)/(16*baud_rate)); --La frecuencia va como 50e3 en lugar de e6
	subtype div16_type is natural range 0 to max_div-1;
	signal Div16	: div16_type;
	signal ClkDiv	: integer;
	signal RxDiv	: integer;
begin
-- --------------------------
-- Clk16 Clock Generation
-- --------------------------
      process (RST, CLK)
         begin
            if RST='1' then
               Top16 <= '0';
               Div16 <= 0;
            elsif rising_edge(CLK) then
               Top16 <= '0';
               if Div16 = max_div-1 then
               	  Div16 <= 0;
                  Top16 <= '1';
               else
                  Div16 <= Div16 + 1;
               end if;
            end if;
      end process;
      
-- --------------------------
-- Tx Clock Generation
-- --------------------------
      process (RST, CLK)
         begin
            if RST='1' then
               TopTx <= '0';
               ClkDiv <= 0; --(others=>'0');
            elsif rising_edge(CLK) then
               TopTx <= '0';
               if Top16='1' then
                  ClkDiv <= ClkDiv + 1;
                  if ClkDiv = 15 then
                     TopTx <= '1';
                     ClkDiv <= 0;
                  end if;
               end if;
            end if;
      end process;
      
-- ------------------------------
-- Rx Sampling Clock Generation
-- ------------------------------
      process (RST, CLK)
        begin
            if RST='1' then
               TopRx <= '0';
               RxDiv <= 0;
            elsif rising_edge(CLK) then
               TopRx <= '0';
               if ClrDiv='1' then
                  RxDiv <= 0;
               elsif Top16='1' then
                  if RxDiv = 7 then
                     RxDiv <= 0;
                     TopRx <= '1';
                  else
                    RxDiv <= RxDiv + 1;
                  end if;
               end if;
            end if;
      end process;
end architecture;