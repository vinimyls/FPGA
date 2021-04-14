--
-- description of IC 74138 in VHDL
-- using When/else
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
	
	entity IC_74138_WHEN is port
	(
		address	:	in std_logic_vector(2 downto 0);
		enable	:	in std_logic_vector(3 downto 1);
		output	: out	std_logic_vector(7 downto 0)
	
	);
	end IC_74138_WHEN;
	
	architecture behavior of IC_74138_WHEN is
	begin
		output <= "11111110" when address = "000" AND enable = "100" else
					 "11111101" when address = "001" AND enable = "100" else
					 "11111011" when address = "010" AND enable = "100" else
					 "11110111" when address = "011" AND enable = "100" else
					 "11101111" when address = "100" AND enable = "100" else
					 "11011111" when address = "101" AND enable = "100" else
					 "10111111" when address = "110" AND enable = "100" else
					 "01111111" when address = "111" AND enable = "100";
	end architecture;