
	entity TB_08_if_then is
	end entity;
	
	architecture sim of TB_08_if_then is
	
		signal CountUp		: integer := 0;
		signal CountDown	: integer := 10;
	
	begin
		process is
		begin
			CountUp <= CountUp + 1;
			CountDown <= CountUp - 1;
			wait for 10 ns;
			
		end process;
		
		process is 
		begin
			if CountUp > CountDown then
				report "CountUp is larger";
			elsif CountUp < CountDown then
				report "CountDown is larger";
			else
				report "They are equal";
			end if;
		
			wait on CountUp, CountDown;
		end process;
		
	end architecture;