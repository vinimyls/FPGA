
	
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	entity TB_13_Cuncorrent_statement is
	end entity;
	
	architecture sim of TB_13_Cuncorrent_statement is
	
		signal Uns	:	unsigned(5 downto 0) := (others => '0');
		signal Mul1	:	unsigned(7 downto 0);
		signal Mul2	:	unsigned(7 downto 0);
		signal Mul3	:	unsigned(7 downto 0);
		
	begin
		process is
		begin
			Uns <= Uns + 1;
			wait for 10 ns;
		end process;
		-- process multiplying Uns by 4
		process is
		begin	
			Mul1 <= Uns & "00";
			wait on Uns;
		end process;
		-- Equivalent process using sensitivity list
		Process(Uns) is
		begin 
			Mul2 <= Uns &"00";
		end process;
		-- Equivalent process using a concurrent statement
		Mul3 <= Uns & "00";
		
	end architecture;