library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_Half_adder is
end TB_Half_adder;

architecture sim of TB_Half_adder is
    signal bit1_tb  : std_logic := '0';
    signal bit2_tb  : std_logic := '0';
    signal sum_tb   : std_logic;
    signal carry_tb : std_logic;
begin
    UUT : entity work.Half_adder
        port map(
            bit1_i  => bit1_tb,
            bit2_i  => bit2_tb,
            sum_o   => sum_tb,
            carry_o => carry_tb
        );
    process is
    begin
        bit1_tb <= '0';
        bit2_tb <= '0';
        wait for 10 ns;
        bit1_tb <= '0';
        bit2_tb <= '1';
        wait for 10 ns;
        bit1_tb <= '1';
        bit2_tb <= '0';
        wait for 10 ns;
        bit1_tb <= '1';
        bit2_tb <= '1';
        wait for 10 ns;
    end process;
end architecture;