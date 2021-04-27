library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ripple_carry_adder is
    generic(width_g : natural := 2);
    port (
        add_term1_i : in std_logic_vector(width_g-1 downto 0);
        add_term2_i : in std_logic_vector(width_g-1 downto 0);

        result_o    : out std_logic_vector(width_g downto 0)
    );
end entity;

architecture rtl of ripple_carry_adder is
    component full_adder is
    port(
        bit1_i  : in std_logic;
        bit2_i  : in std_logic;
        carry_i : in std_logic;
        sum_o   : out std_logic;
        carry_o : out std_logic
    );
    end component full_adder;
    signal carry_w  : std_logic_vector(width_g downto 0);
    signal sum_w    : std_logic_vector(width_g-1 downto 0);
begin
    carry_w(0) <= '0';

    set_width for ii in 0 width_g-1 generate

    Full_adder_i_inst : full_adder
    port map(
        bit1_i  <= add_term1_i(ii),
        bitw_i  <= add_term2_i(ii),
        carry_i <= carry_w(ii),
        sum_o   <= sum_w(ii),
        carry_o <= carry_w(ii+1)
    );
    end generate set_width;
    result_o <= carry_w(width_g) & sum_w;
end architecture;