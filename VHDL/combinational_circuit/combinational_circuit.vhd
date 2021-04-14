--
--	Combinational Circuit descrited in VHDL
--
-- Three input 	:	a, b and c
-- One output 	:	o
--
-- | A . B . C | O |  
-- -----------------
-- | 0 . 0 . 0 | O |  
-- | 0 . 0 . C | O |  
-- | 0 . 1 . 0 | 1 |  
-- | 0 . 1 . 1 | 1 |  
-- | 1 . 0 . 0 | 0 |  
-- | 1 . 0 . 1 | 1 |  
-- | 1 . 1 . 0 | 0 |  
-- | 1 . 1 . 1 | 1 |  
-- -----------------
--
-- Author: Vinicius Mylonas
-- Date : March 2021
--


 library IEEE;
 use IEEE.std_logic_1164.all;
 
 entity combinational_circuit is port
 (
		A	:	in	std_logic;
		B	: 	in	std_logic;
		C	:	in	std_logic;
		O	: out	std_logic
 );
 end combinational_circuit;
 
 architecture hardware of combinational_circuit is
 
 signal OR1 : std_logic;
 signal OR2 : std_logic;
 signal OR3 : std_logic;
 
 begin
 
 OR1 <= (not A) and (not B);
 OR2 <= (not B) and (not C);
 OR3 <= 		 A and (not C);

 O <= (OR1 or OR2 or OR3);
 
 end hardware;