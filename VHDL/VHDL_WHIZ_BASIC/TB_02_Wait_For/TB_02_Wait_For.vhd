
	entity TB_02_Wait_For is
	end TB_02_Wait_For;
	
	architecture sun of TB_02_Wait_For is
	begin
		process is
		begin
			report "Peekaboo!";
			wait for 10 ns;
		end process;
	end architecture;
			