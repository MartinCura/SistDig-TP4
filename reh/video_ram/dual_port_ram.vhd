library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dual_port_ram is
    generic (
        DATA_WIDTH : natural := 1;
        ADDRESS_WIDTH : natural := 18
    );
    port (
        clock: in std_logic;
        write_enable : in std_logic;
        address_A : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
        address_B : in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
        data_A : in  std_logic_vector(DATA_WIDTH-1 downto 0);
        data_B : out std_logic_vector(DATA_WIDTH-1 downto 0)
    );
end entity dual_port_ram;

architecture dual_port_ram_arq of dual_port_ram is

    attribute ram_style : string;

    constant memo_size : natural := 2**ADDRESS_WIDTH;
    subtype t_word is std_logic_vector(DATA_WIDTH-1 downto 0);
    type memo is array(0 to (memo_size-1)) of t_word;
    signal RAM : memo := (others => (others => '0'));
    attribute ram_style of ram: signal is "block";

    -- DEBUG
    ---type memo_aux is array(0 to (memo_size-1)) of std_logic;
    ---signal RAM_aux : memo_aux := (others => '0');

    signal address_A_int : integer := 0;
    signal address_B_int : integer := 0;

begin

    --DEBUG
    ---ram_test: for i in 0 to memo_size-1 generate
    ---    RAM_aux(i) <= RAM(i)(0);
    ---end generate;

    address_A_int <= to_integer(unsigned(address_A));
    address_B_int <= to_integer(unsigned(address_B));

    process(clock)
    begin
        if rising_edge(clock) then
            if write_enable = '1' then
                RAM(address_A_int) <= data_A;
            end if;
            data_B <= RAM(address_B_int);
        end if;
    end process;

end;
