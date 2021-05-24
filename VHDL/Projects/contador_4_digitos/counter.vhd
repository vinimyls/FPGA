-------------------------------------------------
--
-- this is a counter generate with 1hz frequency
--
-- clock_i = 50 Mhz
-- value_1HZ_c = clock_i / 2;
--
-- Author : Vinicius Mylonas
-------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity counter is
  port (
    clock_i     : in std_logic;
    reset_i     : in std_logic;
    -- output four digits
    digit1_o    : out std_logic_vector(3 downto 0);
    digit2_o    : out std_logic_vector(3 downto 0);
    digit3_o    : out std_logic_vector(3 downto 0);
    digit4_o    : out std_logic_vector(3 downto 0)
  ) ;
end counter ; 

architecture rtl of counter is

    -- 1 sec clock signals
    constant    value_1HZ_c         : natural := 50000000;
    signal      clk_1s              : std_logic;
    signal	    cnt_s               :  integer   :=  0 ;

    -- signals to count every digit 0001 up to 9999
    signal      unit_counter        : integer := 0;
    signal      tens_counter        : integer := 0; 
    signal      hundred_counter     : integer := 0;
    signal      thousand_counter    : integer := 0;


begin
    
    -- process for increment 1 sec clock
    process(clock_i)
        begin
        if rising_edge(clock_i) then
                if  cnt_s = value_1HZ_c - 1 then
                    cnt_s  <= 0;
                    clk_1s <= '1';
                else
                    cnt_s  <= cnt_s + 1;
                    clk_1s <= '0';
                end if;
        end if;
    end process;

    -- process for increment unit value,
    -- reset retur all values to 0
    process(clk_1s, reset_i)
    begin
        if  reset_i = '0' then
            unit_counter     <= 0;
            tens_counter     <= 0;
            hundred_counter  <= 0;
            thousand_counter <= 0;
        else
            if rising_edge(clk_1s) then
                unit_counter <= unit_counter + 1;
                if unit_counter >= 9 then
                    unit_counter <= 0;
                    tens_counter <= tens_counter + 1;
                    if tens_counter >= 9 then
                        tens_counter <= 0;
                        hundred_counter <= hundred_counter + 1;
                        if hundred_counter >= 9 then
                            hundred_counter <= 0;
                            thousand_counter <= thousand_counter + 1;
                            if thousand_counter >= 9 then
                                thousand_counter <= 0;
                            end if;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    digit1_o <= std_logic_vector(to_unsigned(unit_counter     , digit1_o'length));
    digit2_o <= std_logic_vector(to_unsigned(tens_counter     , digit2_o'length));
    digit3_o <= std_logic_vector(to_unsigned(hundred_counter  , digit3_o'length));
    digit4_o <= std_logic_vector(to_unsigned(thousand_counter , digit4_o'length));

end architecture ;