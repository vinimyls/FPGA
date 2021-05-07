
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	entity TB_19_Procedure is
	end entity;
	
	architecture sim of TB_19_Procedure is
	
		constant ClockFrequencyhz_tb 	: integer := 10;
		constant ClockPeriod_tb 		: time := 1000 ms /ClockFrequencyhz_tb;
		
		signal Clk_tb 		: std_logic := '1';
		signal nRst_tb		: std_logic := '0';
		signal Seconds_tb 	: integer;
		signal Minutes_tb	: integer;
		signal Hours_tb		: integer;
		
	begin
	
		i_Timer : entity work.Timer(rtl)
		generic map(ClockFrequencyhz => ClockFrequencyhz_tb)
		port map(
			Clk 	=> Clk_tb,
			nRst	=> nRst_tb,
			Seconds	=> Seconds_tb,
			Minutes => Minutes_tb,
			Hours	=> Hours_tb
		);
		
		Clk_tb <= not Clk_tb after ClockPeriod_tb/2;
		
		process is
		begin
			wait until rising_edge(Clk_tb);
				nRst_tb <= '1';
			wait;
		end process;
		
	end architecture;
			