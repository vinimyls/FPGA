library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_20_Finite_state_machine is
end TB_20_Finite_state_machine;

architecture sim of TB_20_Finite_state_machine is

    constant ClockFrequencyHz_tb : integer := 100;
    constant ClockPeriod_tb : time := 1000 ms / ClockFrequencyHz_tb;

    signal Clk_tb           : std_logic := '1';
    signal nRst_tb          : std_logic := '0';
    signal NorthRed_tb      : std_logic;
    signal NorthYellow_tb   : std_logic;
    signal NorthGreen_tb    : std_logic;
    signal WestRed_tb       : std_logic;
    signal WestYellow_tb    : std_logic;
    signal WestGreen_tb     : std_logic;

begin

    i_TrafficLights : entity work.TrafficLights(rtl) 
        generic map (ClockFrequencyHz => ClockFrequencyHz_tb)
        port map (
            Clk         => Clk_tb,
            nRst        => nRst_tb,
            NorthRed    => NorthRed_tb,
            NorthYellow => NorthYellow_tb,
            NorthGreen  => NorthGreen_tb,
            WestRed     => WestRed_tb,
            WestYellow  => WestYellow_tb,
            WestGreen   => WestGreen_tb
        );
        
    Clk_tb <= not Clk_tb after ClockPeriod_tb /2;

    process is
    begin
        wait until rising_edge(Clk_tb);
        nRst_tb <= '1';
        wait;
    end process;
end architecture;