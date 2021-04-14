
	library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity TB_IC_74138 is
	end TB_IC_74138;
	
	architecture behaviour of TB_IC_74138 is
	
		signal tb_address	: std_logic_vector(2 downto 0);
		signal tb_enable	: std_logic_vector(3 downto 1);
		signal tb_output	: std_logic_vector(7 downto 0);
		
		component IC_74138_WHEN
			port(
					signal address	:	in std_logic_vector(2 downto 0);
					signal enable	:	in std_logic_vector(3 downto 1);
					signal output	: out	std_logic_vector(7 downto 0)
				);
		end component;
		
		begin
			IC_74138 : IC_74138_WHEN 
			port map(
				address 	=> tb_address,
				enable	=> tb_enable,
				output	=> tb_output
			);
			tb_address <= 	"000", 
								"001" after 1ms,	"010" after 2ms,	"011" after 3ms,	
								"100" after 4ms;	"101" after 5ms,	"110" after 6ms,	
								"111" after 7ms,	
								"000"	after 8ms, 	"001" after 9ms,	"010" after 10ms,	
								"011" after 11ms,	"100" after 12ms;	"101" after 13ms, 
								"110" after 14ms, "111" after 15ms,
								"000"	after 8ms, 	"001" after 9ms,	"010" after 10ms,	
								"011" after 11ms,	"100" after 12ms;	"101" after 13ms, 
								"110" after 14ms, "111" after 15ms, 	
			tb_enable  <= 	"000", "000" after 2ms, "000" after 4ms;
		end behaviour;