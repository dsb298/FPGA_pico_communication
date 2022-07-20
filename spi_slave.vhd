library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity spi_slave is
    port (
        sck    : in  std_logic; -- 1 MHz
        count  : out unsigned(3 downto 0);
        mosi   : in  std_logic;
        miso   : out std_logic;
        i_byte : in  std_logic_vector(7 downto 0);
        o_byte : out std_logic_vector(7 downto 0)
    );
end entity spi_slave;

architecture rtl of spi_slave is

begin

    uut : entity work.shift_reg(rtl)
    port map (
        clk    => sck,
        count  => count,
        i_bit  => mosi,
        o_bit  => miso,
        i_byte => i_byte,
        o_byte => o_byte
    );

end architecture rtl;