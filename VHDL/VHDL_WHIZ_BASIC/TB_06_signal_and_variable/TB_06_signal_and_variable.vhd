

	entity TB_06_signal_and_variable is
	end entity;
	
	architecture sim of TB_06_signal_and_variable is
	
		signal MySignal_s : integer := 0;
		
		begin
			process is
				
				variable MyVariable_v : integer := 0;
			
			begin
			    report "*** Process begin ***";
			
				MyVariable_v 	:= MyVariable_v + 1;
				MySignal_s		<= MySignal_s + 1;
				
				report "My variable= " &integer'image(MyVariable_v) &", my signal= " & integer'image(MySignal_s);
				
				MyVariable_v 	:= MyVariable_v + 1;
				MySignal_s		<= MySignal_s + 1;
				
				report "My variable= " &integer'image(MyVariable_v) &", my signal= " & integer'image(MySignal_s);
				
				wait for 10 ns;
				
				
				report "My variable= " &integer'image(MyVariable_v) &", my signal= " & integer'image(MySignal_s);
			
			end process;
		
	end architecture;