library ieee;
use ieee.std_logic_1164.all;
 
entity UART_RX_To_7_Seg_Top is
  port (
    -- Main Clock (50 MHz)
    clock_i         : in std_logic;
    reset_i       : in std_logic;

    -- UART RX Data
    i_UART_RX : in std_logic;
     
    -- digit output and anode select
    digit_o  : out std_logic_vector(6 downto 0);
    anode_o  : out std_logic_vector(3 downto 0)

    );
end entity UART_RX_To_7_Seg_Top;
 
architecture RTL of UART_RX_To_7_Seg_Top is
 
  signal w_RX_DV   : std_logic;
  signal w_RX_Byte : std_logic_vector(7 downto 0);
  signal digit1_seven, digit2_seven, digit3_seven, digit4_seven   : std_logic_vector(6 downto 0);

  component UART_RX is
    generic (
      CLKS_PER_BIT_g : integer := 115     -- Needs to be set correctly
    );
    port (
      clock_i       : in  std_logic;
      RX_Serial_i : in  std_logic;
      RX_DV_o     : out std_logic;
      RX_Byte_o   : out std_logic_vector(7 downto 0)
    );
  end component;

  component bcd_seven_seg is
    port (
      clock_i : in  std_logic;
      bcd_i   : in  std_logic_vector(3 downto 0);
      seven_o : out std_logic_vector(6 downto 0)
    ) ;
  end component ; 

  component four_digit_mux is
    port (
      clock_i     : in  std_logic;
      reset_i     : in  std_logic;
      digit1_i    : in  std_logic_vector (6 downto 0);
      digit2_i    : in  std_logic_vector (6 downto 0);
      digit3_i    : in  std_logic_vector (6 downto 0);
      digit4_i    : in  std_logic_vector (6 downto 0);
      segment_o   : out std_logic_vector (6 downto 0);
      anode_o     : out std_logic_vector (3 downto 0)
    ) ;
  end component ; 
 
begin
 
  UART_RX_Inst : UART_RX
  generic map (CLKS_PER_BIT_g => 434)            -- 50,000,000 / 115,200
  port map (
    clock_i     => clock_i,
    RX_Serial_i => i_UART_RX,
    RX_DV_o     => w_RX_DV,
    RX_Byte_o   => w_RX_Byte
  );
  
   
  -- Binary to 7-Segment Converter for Upper Digit
  bcd_1 : bcd_seven_seg port map (clock_i => clock_i, bcd_i => w_RX_Byte(3 downto 0), seven_o => digit1_seven);
  bcd_2 : bcd_seven_seg port map (clock_i => clock_i, bcd_i => w_RX_Byte(7 downto 4), seven_o => digit2_seven);
  bcd_3 : bcd_seven_seg port map (clock_i => clock_i, bcd_i => "0000", seven_o => digit3_seven);
  bcd_4 : bcd_seven_seg port map (clock_i => clock_i, bcd_i => "0000", seven_o => digit4_seven);

  four_digit_mux_1 : four_digit_mux 
    port map(
        clock_i     => clock_i,
        reset_i     => reset_i,
        digit1_i    => digit1_seven,
        digit2_i    => digit2_seven,
        digit3_i    => digit3_seven,
        digit4_i    => digit4_seven,
        segment_o   => digit_o,
        anode_o     => anode_o
    );

end architecture RTL;