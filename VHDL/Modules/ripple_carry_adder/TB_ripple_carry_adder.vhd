library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TB_ripple_carry_adder is
end TB_ripple_carry_adder;

architecture sim of TB_ripple_carry_adder is
    constant width_c   : integer := 2;
    signal add_1_r : std_logic_vector(width_c-1 downto 0) := (others => '0');
    signal add_2_r : std_logic_vector(width_c-1 downto 0) := (others => '0');
    signal result_w : std_logic_vector(width_c downto 0);

    component ripple_carry_adder is
        generic (width_g : natural);
        port(
            add_term1_i : in std_logic_vector(width_g-1 downto 0);
            add_term2_i : in std_logic_vector(width_g-1 downto 0);
            result_o    : out std_logic_vector(width_g downto 0)
        );
        end component;
begin
        UTT : ripple_carry_adder
        generic map (width_g => width_c)
        port map(
            add_term1_i => add_1_r,
            add_term2_i => add_2_r,
            result_o    => result_w
        );

        process is
        begin
            add_1_r <= "00";
            add_2_r <= "01";
            wait for 10 ns;
            add_1_r <= "10";
            add_2_r <= "01";
            wait for 10 ns;
            add_1_r <= "01";
            add_2_r <= "11";
            wait for 10 ns;
            add_1_r <= "11";
            add_2_r <= "11";
            wait for 10 ns;
        end process;

end architecture;