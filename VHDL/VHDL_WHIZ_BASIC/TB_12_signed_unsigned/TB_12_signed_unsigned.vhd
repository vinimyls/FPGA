
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	entity TB_12_signed_unsigned is
	end entity;
	
	architecture sim of TB_12_signed_unsigned is
	
		signal UnsCnt 	: unsigned(7 downto 0)	:= (others => '0');
		signal SigCnt 	: signed(7 downto 0)	:= (others => '0');
		
		signal Uns4		: unsigned(3 downto 0)	:= "1000";
		signal Sig4		: signed(3 downto 0)	:= "1000";
		
		signal Uns8 	: unsigned(7 downto 0)	:= (others => '0');
		signal Sig8 	: signed(7 downto 0)	:= (others => '0');
		
	begin
		process is
		begin
			wait for 10 ns;
			
			UnsCnt <= UnsCnt +1;
			SigCnt <= SigCnt +1;
			
			Uns8 <= Uns8 + Uns4;
			Sig8 <= Sig8 + Sig4;
			
		end process;
	end architecture;