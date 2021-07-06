----------------------------------------------------------------------
-- Arquivo original http://www.nandland.com
----------------------------------------------------------------------
-- Este arquivo contem um receptor UART. Este receptor pode receber
-- 8 bits de dados seriais, um start bit, um stop bit,
-- e sem bit de paridade.  Quando a recepção esta completa 
-- RX_DV_o vai estar em valor alto por um ciclo de clock.
-- 
-- Exemplo de como configurar CLKS_PER_BIT_g:
-- CLKS_PER_BIT_g = (Frequencia de clock)/(Frequencia do UART)
-- exemplo: 10 MHz Clock, 115200 baud UART
-- (10000000)/(115200) = 87

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
entity UART_RX is
  generic (
    CLKS_PER_BIT_g : integer := 115     -- precisa ser corrigido
    );
  port (
    clock_i       : in  std_logic;
    RX_Serial_i : in  std_logic;
    RX_DV_o     : out std_logic;
    RX_Byte_o   : out std_logic_vector(7 downto 0)
    );
end UART_RX;
 
architecture rtl of UART_RX is

 -- maquina de estados
  type SM_Main_t is (Idle_s, RX_Start_Bit_s, RX_Data_Bits_s,
                     RX_Stop_Bit_s, Cleanuo_s);
  signal SM_Main_r : SM_Main_t := Idle_s;
 
  signal RX_Data_R_r : std_logic := '0';
  signal RX_Data_r   : std_logic := '0';
   
  signal Clk_Count_r : integer range 0 to CLKS_PER_BIT_g-1 := 0;
  signal Bit_Index_r : integer range 0 to 7 := 0;  -- 8 Bits Total
  signal RX_Byte_r   : std_logic_vector(7 downto 0) := (others => '0');
  signal RX_DV_r     : std_logic := '0';

begin
 
  -- Proposito : Registrar duas vezes os dados de entrada.
  -- (Isso remove problemas de metaestabilidade)
  SAMPLE_p : process (clock_i)
  begin
    if rising_edge(clock_i) then
      RX_Data_R_r <= RX_Serial_i;
      RX_Data_r   <= RX_Data_R_r;
    end if;
  end process SAMPLE_p;

  -- Proposito: controle de maquina de estados RX
  UART_RX_p : process (clock_i)
  begin
    if rising_edge(clock_i) then
         
      case SM_Main_r is

        -- valor inicial 
        when Idle_s =>
          RX_DV_r     <= '0';
          Clk_Count_r <= 0;
          Bit_Index_r <= 0;
 
          if RX_Data_r = '0' then        -- se start bit é detectado
            SM_Main_r <= RX_Start_Bit_s; -- vai para o proximo estado
          else
            SM_Main_r <= Idle_s;
          end if;
 
           
        -- verifica se o start bit continua em baixo
        when RX_Start_Bit_s =>
          if Clk_Count_r = (CLKS_PER_BIT_g-1)/2 then  
            if RX_Data_r = '0' then                   -- se o start bit continuar em zero  
              Clk_Count_r <= 0;                       -- vai para o proximo estado 
              SM_Main_r   <= RX_Data_Bits_s;
            else
              SM_Main_r   <= Idle_s;
            end if;
          else
            Clk_Count_r <= Clk_Count_r + 1;
            SM_Main_r   <= RX_Start_Bit_s;
          end if;
 
           
        -- espera CLKS_PER_BIT_g-1 ciclos de clock para coletar o dado serial
        when RX_Data_Bits_s =>
          if Clk_Count_r < CLKS_PER_BIT_g-1 then
            Clk_Count_r <= Clk_Count_r + 1;
            SM_Main_r   <= RX_Data_Bits_s;
          else
            Clk_Count_r            <= 0;
            RX_Byte_r(Bit_Index_r) <= RX_Data_r;  -- grava bit recebido no vetor de dados
             
            -- verifica se ja recebeu todos os 8 bits de dados
            -- caso sim, pula para o proximo estado
            if Bit_Index_r < 7 then
              Bit_Index_r <= Bit_Index_r + 1;
              SM_Main_r   <= RX_Data_Bits_s;
            else
              Bit_Index_r <= 0;
              SM_Main_r   <= RX_Stop_Bit_s;
            end if;
          end if;
 
 
        -- Recebe o stop bit.  Stop bit = 1
        when RX_Stop_Bit_s =>
          -- aguarda CLKS_PER_BIT_g-1 ciclos de clock para o fim do Stop bit
          -- sinaliza RX_DV_r como alto e pula para o proximo estado
          if Clk_Count_r < CLKS_PER_BIT_g-1 then
            Clk_Count_r <= Clk_Count_r + 1;
            SM_Main_r   <= RX_Stop_Bit_s;
          else
            RX_DV_r     <= '1';
            Clk_Count_r <= 0;
            SM_Main_r   <= Cleanuo_s;
          end if;
 
                   
        -- fica aqui por 1 ciclo de clock
        -- coloca RX_DV_r em baixo (RX_DV_r fica em alto apenas por um ciclo)
        -- e então retorna para o valor inicial da maquina de estados
        when Cleanuo_s =>
          SM_Main_r <= Idle_s;
          RX_DV_r   <= '0';
 
             
        when others =>
          SM_Main_r <= Idle_s;
 
      end case;
    end if;
  end process UART_RX_p;
 
  RX_DV_o   <= RX_DV_r;
  RX_Byte_o <= RX_Byte_r;

end rtl;