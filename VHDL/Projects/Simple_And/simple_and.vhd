--
--	Logical port AND descrited in VHDL
--
-- Two input 	:	a and b
-- One output 	:	o
--
-- Author: Vinicius Mylonas
-- Date : March 2021
--

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
	