library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity counter_4_digit_tb is
end counter_4_digit_tb;

architecture sim of counter_4_digit_tb is

    constant clk_hz : integer := 100e6;
    constant clk_period : time := 1 sec / clk_hz;

    signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal digit_tb : std_logic_vector(6 downto 0);
    signal anode_tb : std_logic_vector(3 downto 0);

begin

    clk <= not clk after clk_period / 2;

    DUT : entity work.counter_4_digt(rtl)
    port map (
        clock_i => clk,
        reset_i => rst,
        digit_o => digit_tb,
        anode_o => anode_tb
    );

    SEQUENCER_PROC : process
    begin
        wait for clk_period * 2;
        rst <= '1';
    end process;

end architecture;