# Simple And in VHDL

this project contain a simple and in VHDL and its test bench.

## simple_and <= VHDL

	library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity simple_and is port
	(
		a	:	in std_logic;
		b	:	in std_logic;
		o	: 	out std_logic
	);
	
	end simple_and;
	
	architecture hardware of simple_and is
	begin
		o	<=	A and B;
	end hardware;

## tb_simple_and <= Test Bench

	library IEEE;
	use IEEE.std_logic_1164.all;
	
	entity tb_simple_and is
	end tb_simple_and;
	
	architecture hardware of tb_simple_and is
		signal tb_A : std_logic;
		signal tb_B : std_logic;
		signal tb_O : std_logic;
		
	component simple_and	
		port(
			a	:	in  std_logic;
			b	:	in  std_logic;
			o	:  	out std_logic
		);
	end component;
	
	
	begin
		port_and : simple_and port map(
				a => tb_A,
				b => tb_B,
				o => tb_O);
		tb_A <= '0', '1' after 1ms, '0' after 2ms, '1' after 3ms, '0' after 4ms;
		tb_B <= '0', '1' after 2ms, '0' after 4ms;
	end hardware;
