library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder is
    port (
        bit1_i  : in  std_logic;
        bit2_i  : in  std_logic;
        carry_i : in  std_logic;
        sum_o   : out std_logic;
        carry_o : out std_logic
    );
end full_adder;

architecture rtl of full_adder is

    signal wire_1 : std_logic;
    signal wire_2 : std_logic;
    signal wire_3 : std_logic;

begin
    wire_1 <= bit1_i xor bit2_i;
    wire_2 <= wire_1 and carry_i;
    wire_3 <= bit1_i and bit2_i;

    sum_o   <= wire_1 xor carry_i;
    carry_o <= wire_2 or wire_3;
end architecture;