
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	entity TB_18_Timer is
	end entity;
	
	architecture sim of TB_18_Timer is
		
		constant ClockFrequency_HZ_tb 	: integer := 10;
		constant ClockPeriod	: time := 1000 ms / ClockFrequency_HZ_tb;
		
		signal Clk_tb		: std_logic := '1';
		signal nRst_tb		: std_logic := '0';
		signal Seconds_tb	: integer;
		signal Minutes_tb	: integer;
		signal Hours_tb		: integer;
	
	begin
	
		Timer : entity work.Timer(rtl)
		generic map (ClockFrequency_HZ => ClockFrequency_HZ_tb)
		port map(
			Clk 	=> Clk_tb,
			nRst	=> nRst_tb,
			Seconds	=> Seconds_tb,
			Minutes => Minutes_tb,
			Hours	=> Hours_tb);
		Clk_tb <= not Clk_tb after ClockPeriod / 2;
		
		process is
		begin
			wait until rising_edge(Clk_tb);
			wait until rising_edge(Clk_tb);
			nRst_tb<= '1';
			wait;
		end process;
			
	end architecture;