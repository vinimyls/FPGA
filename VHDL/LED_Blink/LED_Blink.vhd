
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	
	entity LED_Blink is 
		port(
			i_clock		:	in std_logic;
			i_enable		:	in std_logic;
			i_switch_1	:	in std_logic;
			i_switch_2	:	in std_logic;
			o_led_drive	:	out std_logic
		);
	end LED_Blink;
	
	architecture behavior of LED_Blink is
		
		signal	s_CNT			:	integer := 0;
		constant	c_valor_1HZ	:	natural := 25000000;
		constant	c_valor_2HZ	:	natural := 12500000;
		constant	c_valor_3HZ	:	natural :=  8333333;
		constant	c_valor_4HZ	:	natural :=  6250000;	
		
		signal	r_CNT				:	integer 		:=  0 ;		
		signal	r_TOOGLE			:	std_logic 	:= '0';
		signal 	w_LED_SELECT	:	std_logic;
		
		begin
			p	:	process (i_clock) is
			begin
				
				if rising_edge(i_clock) then
					if r_CNT = s_CNT-1 then
						r_TOOGLE <= not r_TOOGLE;
						r_CNT		<= 0;
					else
						r_CNT		<= r_CNT + 1;
					end if;
				end if;
			end process p;
			
			s_CNT		<=	c_valor_1HZ		when (i_switch_1 = '0' and i_switch_2 = '0') else
							c_valor_2HZ 	when (i_switch_1 = '0' and i_switch_2 = '1') else
							c_valor_3HZ 	when (i_switch_1 = '1' and i_switch_2 = '0') else
							c_valor_4HZ;
			w_LED_SELECT 	<=  r_TOOGLE;
									
			o_led_drive 	<= w_LED_SELECT;
					
		end behavior;