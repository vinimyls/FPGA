-------------------------------------------------
--
-- simple BCD ~ seven segments display
--
-- Author : Vinicius Mylonas
-------------------------------------------------

library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity bcd_seven_seg is
  port (
    clock_i : in  std_logic;
    bcd_i   : in  std_logic_vector(3 downto 0);
    seven_o : out std_logic_vector(6 downto 0)
  ) ;
end bcd_seven_seg ; 

architecture rtl of bcd_seven_seg is
begin
    process (clock_i)
    begin
        if rising_edge(clock_i)then
            case bcd_i is
                when "0000" => seven_o <= "0000001"; -- "0"     
                when "0001" => seven_o <= "1001111"; -- "1" 
                when "0010" => seven_o <= "0010010"; -- "2" 
                when "0011" => seven_o <= "0000110"; -- "3" 
                when "0100" => seven_o <= "1001100"; -- "4" 
                when "0101" => seven_o <= "0100100"; -- "5" 
                when "0110" => seven_o <= "0100000"; -- "6" 
                when "0111" => seven_o <= "0001111"; -- "7" 
                when "1000" => seven_o <= "0000000"; -- "8"     
                when "1001" => seven_o <= "0000100"; -- "9" 
                when "1010" => seven_o <= "0000010"; -- a
                when "1011" => seven_o <= "1100000"; -- b
                when "1100" => seven_o <= "0110001"; -- C
                when "1101" => seven_o <= "1000010"; -- d
                when "1110" => seven_o <= "0110000"; -- E
                when others => seven_o <= "0000001"; -- F
            end case;
        end if;
    end process;
end architecture ;