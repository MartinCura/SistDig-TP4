library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Generic (
        clock_frec : integer := 50 -- MHz
    );
    Port ( 
			  clock :in	STD_LOGIC;								 -- 100MHz/50MHz
			  reset	:in	STD_LOGIC;			
			  en :in STD_LOGIC;


			 );
end entity control_unit;



architecture behavioral of control_unit is

type state_t is (INIT, );
signal state: state_t := INIT;

begin
SYNC_PROC : process (clock, reset)
begin
    if reset = '1' then
       state <= INIT;
    elsif (clk’event and clk=’l’) then
      case state is
		 when INIT => 
		 
		 when  =>



end process;