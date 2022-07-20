library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity shift_reg is
    port (
        clk     : in  std_logic;
        count   : out unsigned(3 downto 0);
        i_bit   : in  std_logic;
        o_bit   : out std_logic;
        i_byte  : in  std_logic_vector(7 downto 0);
        o_byte  : out std_logic_vector(7 downto 0)
    );
end entity shift_reg;



architecture rtl of shift_reg is
    signal r_bit_out  : std_logic;
    signal r_bit_down : std_logic_vector(7 downto 0) := x"80";
    signal r_bit_up   : std_logic_vector(7 downto 0) := x"01";
    signal r_byte     : std_logic_vector(7 downto 0);
    signal r_byte_out : std_logic_vector(7 downto 0);
    signal o_count    : unsigned(3 downto 0) := x"0";

    constant N : integer := 8;
begin
    
    -- Input of bit to shift register
    shift_in : process(clk) begin
        if (rising_edge(clk)) then

            -- load data on count 0
            if (o_count = x"0") then
                r_byte <= i_byte;

            -- shift data on count 1 through 8
            elsif (o_count <= x"8") then
                r_bit_out <= r_byte(0);
                r_byte    <= std_logic_vector(shift_right(unsigned(r_byte), 1));
                r_byte(N-1) <= i_bit;

            -- other stuff on count 9 through F
            else

            end if;

        end if;
    end process shift_in;

    -- -- Output of bit to shift register
    -- shift_out : process(clk) begin
    --     if (rising_edge(clk)) then

    --         -- load data on count 0
    --         if (o_count = x"0") then
    --             r_byte <= i_byte;

    --         -- shift data on count 1 through 8
    --         elsif (o_count <= x"8") then
    --             r_bit_out <= r_byte(0);
    --             r_byte    <= std_logic_vector(shift_right(unsigned(r_byte), 1));
    --             r_byte(N-1) <= i_bit;

    --         -- other stuff on count 9 through F
    --         else

    --         end if;

    --     end if;
    -- end process shift_out;

    -- counter
    counter : process(clk) begin
        if (rising_edge(clk)) then
            o_count <= o_count + x"1";
        end if;
    end process counter;

    o_bit  <= r_bit_out;
    o_byte <= r_byte;
    count  <= o_count;

end architecture rtl;




            -- if (i_bit = '1') then

                -- if (r_bit_down = x"01") then
                --     r_byte <= r_byte or r_bit_down;
                --     r_bit_down <= x"80";
                -- else
                --     r_byte <= r_byte or r_bit_down;
                --     r_bit_down  <= std_logic_vector(unsigned(r_bit_down) srl 1);
                -- end if;


            -- end if;