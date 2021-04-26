library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_full_adder is
end tb_full_adder;

architecture sim of tb_full_adder is

    signal  bit1_tb     : std_logic := '0';
    signal  bit2_tb     : std_logic := '0';
    signal  carry_i_tb  : std_logic;
    signal  sum_tb      : std_logic;
    signal  carry_o_tb  : std_logic;
begin
    UTT: entity work.full_adder
        port map(
            bit1_i  => bit1_tb,
            bit2_i  => bit2_tb,
            carry_i => carry_i_tb,
            sum_o   => sum_tb,
            carry_o => carry_o_tb
        );
    process is
    begin
        bit1_tb     <= '0';
        bit2_tb     <= '0';
        carry_i_tb  <= '0';
        wait for 10 ns;
        bit1_tb     <= '1';
        bit2_tb     <= '0';
        carry_i_tb  <= '0';
        wait for 10 ns;
        bit1_tb     <= '0';
        bit2_tb     <= '1';
        carry_i_tb  <= '0';
        wait for 10 ns;
        bit1_tb     <= '1';
        bit2_tb     <= '1';
        carry_i_tb  <= '0';
        wait for 10 ns;
        bit1_tb     <= '0';
        bit2_tb     <= '0';
        carry_i_tb  <= '1';
        wait for 10 ns;
        bit1_tb     <= '1';
        bit2_tb     <= '0';
        carry_i_tb  <= '1';
        wait for 10 ns;
        bit1_tb     <= '0';
        bit2_tb     <= '1';
        carry_i_tb  <= '1';
        wait for 10 ns;
        bit1_tb     <= '1';
        bit2_tb     <= '1';
        carry_i_tb  <= '1';
        wait for 10 ns;
    end process;
end architecture;