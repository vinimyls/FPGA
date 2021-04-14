--
-- description of IC 74138 in VHDL
-- using IF
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
	
	entity CI_74138_IF is port
	(
		address	:	in std_logic_vector(2 downto 0);
		enable	:	in std_logic_vector(3 downto 1);
		output	: out	std_logic_vector(7 downto 0)
	
	);
	end CI_74138_IF;
	
	architecture behavior of CI_74138_IF is
	begin
		process(enable, address)
		begin
			if 	(enable(1) =  '1'	) then  		output <= "11111111";
			elsif (enable(2) =  '1'	) then 		output <= "11111111";
			elsif (enable(3) =  '0'	) then		output <= "11111111";
			elsif	(address	  = "000") then		output <= "11111110";
			elsif	(address	  = "001") then		output <= "11111101";
			elsif	(address	  = "010") then		output <= "11111011";
			elsif	(address	  = "011") then		output <= "11110111";
			elsif	(address	  = "100") then		output <= "11101111";
			elsif	(address	  = "101") then		output <= "11011111";
			elsif	(address	  = "110") then		output <= "10111111";
			elsif	(address	  = "111") then		output <= "01111111";
			end if;
		end process;
	end architecture;