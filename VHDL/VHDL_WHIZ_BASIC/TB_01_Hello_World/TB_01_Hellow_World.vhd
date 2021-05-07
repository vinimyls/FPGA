

	entity TB_01_Hellow_World is
	end TB_01_Hellow_World;
	
	architecture sim of TB_01_Hellow_World is
	begin
		process is
		begin
			report "Hello World!";
			wait;
		end process;
	end architecture;