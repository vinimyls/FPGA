-------------------------------------------
-- comparador de entradas de tamanho generico
-- tabela verdade:
--
--       imputs  | output
--      IAB  A,B | OAB A_B B_A
--      ------------------------
--       L    X  |  L   L   L
--       H   A>B |  L   H   L
--       H   A<B |  L   L   H 
--       H   A=B |  H   L   L
--
--
-- autor: Vinicius Mylonas , maio 2020

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity comparador_generico is
generic (tamanho : integer := 8);   -- tamanho recebe o valor generico de 8, 
                                    -- podendo ser alterado na instancia do componente
port (
      clock : in std_logic;                             
      A,B   : in std_logic_vector(tamanho-1 downto 0);      -- vetores de entrada
      IAB   : in std_logic;                                 -- habilita saída 
      OAB   : out std_logic;                                -- saída para a = b
      A_B   : out std_logic;                                -- saída para A > B
      B_A   : out std_logic                                 -- saída para A < B
    );
end comparador_generico;

architecture rtl of comparador_generico is

signal Result_equal : std_logic;
signal Result_A     : std_logic;
signal Result_B     : std_logic;

begin
    process(clock)
    begin
        if(rising_edge(clock))then
            if A = B then
                Result_equal    <= '1';
                Result_A        <= '0';
                Result_B        <= '0';
            elsif A > B then
                Result_equal    <= '0';
                Result_A        <= '1';
                Result_B        <= '0';
            else 
                Result_equal    <= '0';
                Result_A        <= '0';
                Result_B        <= '1';
            end if;
        end if;
    end process;
    OAB <= Result_equal;  
    A_B <= Result_A;
    B_A <= Result_B;
end architecture;