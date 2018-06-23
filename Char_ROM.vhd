-----
-----
-- CHAR ROM COMO LO TENÍA EN EL TP2, USAR LO Q SIRVA
-----
-----

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity Char_ROM is
	generic(
		N: integer:= 6;
		M: integer:= 3;
		W: integer:= 8
	);
	port(
		char_address: in std_logic_vector(5 downto 0);
		font_row, font_col: in std_logic_vector(M-1 downto 0);
		rom_out: out std_logic
	);
end;

architecture p of Char_ROM is
	subtype tipoLinea is std_logic_vector(0 to W-1);
	type char is array(0 to W-1) of tipoLinea;

	constant ESPACIO: char:= (
								"00000000",
								"00000000",
								"00000000",
								"00000000",
								"00000000",
								"00000000",
								"00000000",
								"00000000"
						);

	constant PUNTO: char:= (
								"00000000",
								"00000000",
								"00000000",
								"00000000",
								"00000000",
								"00011000",
								"00011000",
								"00000000"
						);

	constant V: char:= (
								"00000000",
								"01100110",
								"01100110",
								"01100110",
								"01100110",
								"00111100",
								"00011000",
								"00000000"
						);

	constant CERO: char:= (
								"00111100",
								"01100110",
								"01100110",
								"01100110",
								"01100110",
								"01100110",
								"00111100",
								"00000000"
						);

	constant UNO: char:= (
								"00011000",
								"00011000",
								"00011000",
								"00011000",
								"00011000",
								"00011000",
								"00011000",
								"00000000"
						);

	constant DOS: char:= (
								"00111110",
								"01100011",
								"01100110",
								"00001100",
								"00011000",
								"00110000",
								"01111110",
								"00000000"
						);

	constant TRES: char:= (
								"01111100",
								"00000110",
								"00000110",
								"00111100",
								"00000110",
								"00000110",
								"01111100",
								"00000000"
						);

	constant CUATRO: char:= (
								"01100110",
								"01100110",
								"01100110",
								"01111110",
								"00000110",
								"00000110",
								"00000110",
								"00000000"
						);

	constant CINCO: char:= (
								"01111110",
								"01100000",
								"01100000",
								"01111100",
								"00000110",
								"00000110",
								"01111100",
								"00000000"
						);

	constant SEIS: char:= (
								"00111100",
								"01100010",
								"01100000",
								"01111100",
								"01100110",
								"01100110",
								"00111100",
								"00000000"
						);

	constant SIETE: char:= (
								"01111110",
								"00000110",
								"00000110",
								"00000110",
								"00000110",
								"00000110",
								"00000110",
								"00000000"
						);

	constant OCHO: char:= (
								"01111110",
								"01100110",
								"01100110",
								"00111100",
								"01100110",
								"01100110",
								"01111110",
								"00000000"
						);

	constant NUEVE: char:= (
								"00111100",
								"01100110",
								"01100110",
								"00111110",
								"00000110",
								"01000110",
								"00111100",
								"00000000"
						);

	constant Err: char:= (
								"01111110",
								"01100000",
								"01100000",
								"01111000",
								"01100000",
								"01100000",
								"01111110",
								"00000000"
						);


	type memo is array(0 to 255) of tipoLinea;
	signal RAM: memo:= (
					0 => CERO(0), 1 => CERO(1), 2 => CERO(2), 3 => CERO(3), 4 => CERO(4), 5 => CERO(5), 6 => CERO(6), 7 => CERO(7), -- 0
					8 => UNO(0), 9 => UNO(1), 10 => UNO(2), 11 => UNO(3), 12 => UNO(4), 13 => UNO(5), 14 => UNO(6), 15 => UNO(7), -- 1
					16 => DOS(0), 17 => DOS(1), 18 => DOS(2), 19 => DOS(3), 20 => DOS(4), 21 => DOS(5), 22 => DOS(6), 23 => DOS(7), -- 2
					24 => TRES(0), 25 => TRES(1), 26 => TRES(2), 27 => TRES(3), 28 => TRES(4), 29 => TRES(5), 30 => TRES(6), 31 => TRES(7), -- 3
					32 => CUATRO(0), 33 => CUATRO(1), 34 => CUATRO(2), 35 => CUATRO(3), 36 => CUATRO(4), 37 => CUATRO(5), 38 => CUATRO(6), 39 => CUATRO(7), -- 4
					40 => CINCO(0), 41 => CINCO(1), 42 => CINCO(2), 43 => CINCO(3), 44 => CINCO(4), 45 => CINCO(5), 46 => CINCO(6), 47 => CINCO(7), -- 5
					48 => SEIS(0), 49 => SEIS(1), 50 => SEIS(2), 51 => SEIS(3), 52 => SEIS(4), 53 => SEIS(5), 54 => SEIS(6), 55 => SEIS(7), -- 6
					56 => SIETE(0), 57 => SIETE(1), 58 => SIETE(2), 59 => SIETE(3), 60 => SIETE(4), 61 => SIETE(5), 62 => SIETE(6), 63 => SIETE(7), -- 7
					64 => OCHO(0), 65 => OCHO(1), 66 => OCHO(2), 67 => OCHO(3), 68 => OCHO(4), 69 => OCHO(5), 70 => OCHO(6), 71 => OCHO(7), --8
					72 => NUEVE(0), 73 => NUEVE(1), 74 => NUEVE(2), 75 => NUEVE(3), 76 => NUEVE(4), 77 => NUEVE(5), 78 => NUEVE(6), 79 => NUEVE(7), -- 9
					80 => V(0), 81 => V(1), 82 => V(2), 83 => V(3), 84 => V(4), 85 => V(5), 86 => V(6), 87 => V(7), -- 10
					88 => ESPACIO(0), 89 => ESPACIO(1), 90 => ESPACIO(2), 91 => ESPACIO(3), 92 => ESPACIO(4), 93 => ESPACIO(5), 94 => ESPACIO(6), 95 => ESPACIO(7), -- 11
					96 => PUNTO(0), 97 => PUNTO(1), 98 => PUNTO(2), 99 => PUNTO(3), 100 => PUNTO(4), 101 => PUNTO(5), 102 => PUNTO(6), 103 => PUNTO(7), -- 12
					104 to 247 => "00000000",
					248 => Err(0), 249 => Err(1), 250 => Err(2), 251 => Err(3), 252 => Err(4), 253 => Err(5), 254 => Err(6), 255 => Err(7) -- 31
				);

	signal char_addr_aux: std_logic_vector(8 downto 0);

begin

	char_addr_aux <= char_address & font_row;
	rom_out <= RAM(to_integer(unsigned(char_addr_aux)))(to_integer(unsigned(font_col)));

end;
