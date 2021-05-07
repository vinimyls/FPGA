
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	entity TB_17_Clocked_process is
	end entity;
	
	architecture rtl of TB_17_Clocked_process is

		constant ClockFrequency		: integer := 100e6;
		constant ClockPeriode		: time := 1000 ms / ClockFrequency;
		
		signal Clk_tb	: std_logic := '1';
		signal nRst_tb	: std_logic := '0';
		signal Input_tb	: std_logic := '0';
		signal Output_tb: std_logic;
	
	begin
		i_FlipFlop : entity work.FlipFlop(rtl)
		port map(
			Clk		=> Clk_tb,
			nRst	=> nRst_tb,
			Input	=> Input_tb,
			Output	=> Output_tb);
			
		Clk_tb <= not Clk_tb after ClockPeriode / 2;
		
		process is
		begin
			
			nRst_tb <= '1';
			
			wait for 20 ns;
			Input_tb <= '1';
			wait for 22 ns;
			Input_tb <= '0';
			wait for 6 ns;
			Input_tb <= '1';
			wait for 20 ns;
			
			nRst_tb <= '0';
			
			wait;
		end process;
	end architecture;
		
			