

	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	entity TB_15_MUX is
	end entity;
	
	architecture sim of TB_15_MUX is
		
		signal Sig1_tb	: unsigned(7 downto 0 ) := x"AA";
		signal Sig2_tb	: unsigned(7 downto 0 ) := x"BB";
		signal Sig3_tb	: unsigned(7 downto 0 ) := x"CC";
		signal Sig4_tb	: unsigned(7 downto 0 ) := x"DD";
		
		signal Sel_tb 	: unsigned(1 downto 0) := (others => '0');
		
		signal Output_tb : unsigned(7 downto 0);
		
		begin 
			I_Mux1: entity work.MUX(rtl) port map(
			Sel => Sel_tb,
			Sig1 => Sig1_tb,
			Sig2 => Sig2_tb,
			Sig3 => Sig3_tb,
			Sig4 => Sig4_tb,
			Output => Output_tb);
			
		process is
		begin
			wait for 10 ns;
			Sel_tb <= Sel_tb + 1;
			wait for 10 ns;
			Sel_tb <= Sel_tb + 1;
			wait for 10 ns;
			Sel_tb <= Sel_tb + 1;
			wait for 10 ns;
			Sel_tb <= Sel_tb + 1;
			wait for 10 ns;
			Sel_tb <= "UU";
			wait;
		end process;
	end architecture;