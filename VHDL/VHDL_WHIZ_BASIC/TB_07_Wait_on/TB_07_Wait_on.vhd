
	entity TB_07_Wait_on is
	end entity;
	
	architecture sim of TB_07_Wait_on is
	
		signal ContUp	:	integer := 0;
		signal ContDown	:	integer := 10;
		
	begin
		process is
		begin
			ContUp 		<= ContUp 	+ 1;
			ContDown	<= ContDown - 1;
			wait for 10 ns;
		
		end process;
		
		process is
		begin
			wait on ContUp,ContUp ;
			report "CounUp = " & integer'image(ContUp) ;
			report "CounDown = " & integer'image(ContDown) ;
			wait for 10 ns;
		end process;
		
		process is
		begin
			wait until ContUp = ContDown;
			report "Jackpot!";
		end process;
		
	end architecture;
	