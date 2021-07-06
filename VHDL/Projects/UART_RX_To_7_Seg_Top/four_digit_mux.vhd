-------------------------------------------------
--
--  Mux for 4 digits display, 
--  cathode comom, variate anodes
-- 
-- value_1HZ_c = clock_i / 2;
--
-- Author : Vinicius Mylonas
-------------------------------------------------

library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.std_logic_unsigned.all ;

entity four_digit_mux is
  port (
    clock_i     : in  std_logic;
    reset_i     : in  std_logic;
    digit1_i    : in  std_logic_vector (6 downto 0);
    digit2_i    : in  std_logic_vector (6 downto 0);
    digit3_i    : in  std_logic_vector (6 downto 0);
    digit4_i    : in  std_logic_vector (6 downto 0);
    segment_o   : out std_logic_vector (6 downto 0);
    anode_o     : out std_logic_vector (3 downto 0)
  ) ;
end four_digit_mux ; 

architecture arch of four_digit_mux is
    signal period_display           : std_logic_vector (17 downto 0);
    signal led_activating_counter   : std_logic_vector (1 downto 0);
begin
    -- process add value in period_display
    process (clock_i,reset_i)
    begin
        if reset_i = '0' then
            period_display <= (others => '0');
        elsif rising_edge(clock_i)then
            period_display <=  period_display + 1;
        end if;
    end process;
    
    -- chance value each 25M/65536 = 2.6 ms
    led_activating_counter <= period_display(17 downto 16);
    process (led_activating_counter)
    begin
        case led_activating_counter is
            when "11" =>
                anode_o     <= "0111";
                segment_o   <= digit1_i;
            when "10" =>
                anode_o     <= "1011";
                segment_o   <= digit2_i;
            when "01" =>
                anode_o     <= "1101";
                segment_o   <= digit3_i;
            when others =>
                anode_o     <= "1110";
                segment_o   <= digit4_i;
        end case;
    end process;
end architecture;