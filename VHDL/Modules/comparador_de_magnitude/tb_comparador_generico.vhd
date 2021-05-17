
library ieee;
use ieee.std_logic_1164.all;

entity tb_comparador_generico is
end tb_comparador_generico;

architecture tb of tb_comparador_generico is

    component comparador_generico
        generic (tamanho : integer := 8);
        port (clock : in std_logic;
              A     : in std_logic_vector (tamanho-1 downto 0);
              B     : in std_logic_vector (tamanho-1 downto 0);
              IAB   : in std_logic;
              OAB   : out std_logic;
              A_B   : out std_logic;
              B_A   : out std_logic );
    end component;

    constant tamanho : integer := 8;
    signal clock : std_logic;
    signal A     : std_logic_vector (tamanho-1 downto 0);
    signal B     : std_logic_vector (tamanho-1 downto 0);
    signal IAB   : std_logic;
    signal OAB   : std_logic;
    signal A_B   : std_logic;
    signal B_A   : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '1';

begin

    dut : comparador_generico
    generic map( tamanho => tamanho )
    port map (
        clock => clock,
        A     => A,
        B     => B,
        IAB   => IAB,
        OAB   => OAB,
        A_B   => A_B,
        B_A   => B_A
    );

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '0' else '0';

    clock <= TbClock;

    stimuli : process
    begin
        A <= (others => '0');
        B <= (others => '0');
        IAB <= '0';
        wait for 10 ns;

        -- teste B > A
        IAB <= '1';
        A <= "01010110";
        B <= "01011110";
        wait for 100 ns;
        
        -- teste B = A
        A <= "01010110";
        B <= "01010110";
        wait for 100 ns;

        -- teste A > B
        A <= "01110110";
        B <= "01010110";
        wait for 150 ns;
        
        -- fim do TB
        TbSimEnded <= '0'; 
        wait;
    end process;
end tb;