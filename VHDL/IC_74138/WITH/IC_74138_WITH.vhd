--
-- description of IC 74138 in VHDL
-- using WITH SELECTOR
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
	
	entity IC_74138_WITH is port
	(
		address	:	in std_logic_vector(2 downto 0);
		enable	:	in std_logic_vector(3 downto 1);
		output	: out	std_logic_vector(7 downto 0)
	
	);
	end IC_74138_WITH;
	
	architecture behavior of IC_74138_WITH is
	
	signal inBus :	std_logic_vector (5 downto 0);
	
	begin
		inBus <= address & enable;
		with inBus select 
			output <= "11111110" when "000100",
						 "11111101" when "001100",
						 "11111011" when "010100",
						 "11110111" when "011100",
						 "11101111" when "100100",
						 "11011111" when "101100",
						 "10111111" when "110100",
						 "01111111" when "111100",
						 "11111111" when others;
	end architecture;