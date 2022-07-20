library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity spi_slave_tb is
end entity spi_slave_tb;

architecture tb of spi_slave_tb is

    signal sck    : std_logic := '0';
    signal count  : unsigned(3 downto 0)  := x"0";
    signal mosi   : std_logic := '0';
    signal miso   : std_logic;
    signal i_byte : std_logic_vector(7 downto 0) := "10101010";
    signal o_byte : std_logic_vector(7 downto 0);

    constant max_cycles : integer := 30;
    signal i : integer := 0;

begin

    uut : entity work.spi_slave(rtl)
        port map (
            sck    => sck,
            count  => count,
            mosi   => mosi,
            miso   => miso,
            i_byte => i_byte,
            o_byte => o_byte
        );

    tb : process begin
        wait for 1000 ns;
        mosi <= '1';
        wait;
    end process tb;
    
    -- clock
    process
    begin
        wait for 100 ns;
        sck <= not sck;
        if (i = max_cycles) then
            wait;
        else
            i <= i + 1;
        end if;
    end process;

end architecture tb;