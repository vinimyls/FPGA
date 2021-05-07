

	entity TB_03_Loop_and_exit is
	end TB_03_Loop_and_exit;
	
	architecture sim of TB_03_Loop_and_exit is
	begin
		process is
		begin
			report "Hello";
			
			loop
				report "Peekaboo!";
				exit;
			end loop;
			
			report "Good bye!";
			wait;
		end process;
	end architecture;
	