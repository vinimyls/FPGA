--
-- description of IC 74138 in VHDL
-- using CASE
--
-- truth table
-- --------------------------------------------------
-- |  E1 E2 E3 | A0 A1 A2 | O0 01 02 03 04 05 06 07 |
-- --------------------------------------------------
-- |  1  x  x  |  x  x  x |  1  1  1  1  1  1  1  1 |
-- |  x  1  x  |  x  x  x |  1  1  1  1  1  1  1  1 |
-- |  x  x  0  |  x  x  x |  1  1  1  1  1  1  1  1 |
-- |  0  0  1  |  0  0  0 |  0  1  1  1  1  1  1  1 |
-- |  0  0  1  |  1  0  0 |  1  0  1  1  1  1  1  1 |
-- |  0  0  1  |  0  1  0 |  1  1  0  1  1  1  1  1 |
-- |  0  0  1  |  1  1  0 |  1  1  1  0  1  1  1  1 |
-- |  0  0  1  |  0  0  1 |  1  1  1  1  0  1  1  1 |
-- |  0  0  1  |  1  0  1 |  1  1  1  1  1  0  1  1 |
-- |  0  0  1  |  0  1  1 |  1  1  1  1  1  1  0  1 |
-- |  0  0  1  |  1  1  1 |  1  1  1  1  1  1  1  0 |
-- --------------------------------------------------
--
--------------------------------------------------------
-- author Vinicius Mylonas  

	library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity IC_74138_CASE is port
	(
		address	:	in std_logic_vector(2 downto 0);
		enable	:	in std_logic_vector(3 downto 1);
		output	: out	std_logic_vector(7 downto 0)
	
	);
	end IC_74138_CASE;
	
	architecture behavior of IC_74138_CASE is
	begin
		process(enable, address)
		begin
			case enable is
				when "100" => 
					case  address is
						when "000" 	=> output <= "11111110";
						when "001" 	=> output <= "11111101";
						when "010" 	=> output <= "11111011";
						when "011" 	=> output <= "11110111";
						when "100" 	=> output <= "11101111";
						when "101" 	=> output <= "11011111";
						when "110" 	=> output <= "10111111";
						when "111" 	=> output <= "01111111";
					end case;
				when others => output <= "11111111";				
			end case;
		end process;
	end architecture;