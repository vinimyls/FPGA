

	entity TB_05_While is
	end entity;
	
	architecture sim of TB_05_While is
	begin
		process is
		
		variable i : integer := 0;
		
		begin
			while i < 10 loop
				report "I= " & integer'image(i);
				i := i+2;
			end loop;
			wait;
		end process;
	end architecture;
	