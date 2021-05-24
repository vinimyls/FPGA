library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;

entity counter_4_digt is
  port (
    clock_i  : in  std_logic;
    reset_i  : in  std_logic;
    digit_o  : out std_logic_vector(6 downto 0);
    anode_o  : out std_logic_vector(3 downto 0)
  ) ;
end counter_4_digt ; 

architecture rtl of counter_4_digt is
    signal digit1_bcd  , digit2_bcd  , digit3_bcd  , digit4_bcd     : std_logic_vector(3 downto 0);
    signal digit1_seven, digit2_seven, digit3_seven, digit4_seven   : std_logic_vector(6 downto 0);

    component counter is
    port (
        clock_i     : in  std_logic;
        reset_i     : in  std_logic;
        digit1_o    : out std_logic_vector(3 downto 0);
        digit2_o    : out std_logic_vector(3 downto 0);
        digit3_o    : out std_logic_vector(3 downto 0);
        digit4_o    : out std_logic_vector(3 downto 0)
    ) ;
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
    counter_1 : counter 
    port map ( 
        clock_i  => clock_i, 
        reset_i  => reset_i, 
        digit1_o => digit1_bcd, 
        digit2_o => digit2_bcd, 
        digit3_o => digit3_bcd, 
        digit4_o => digit4_bcd
    );

    bcd_1 : bcd_seven_seg port map (clock_i => clock_i, bcd_i => digit1_bcd, seven_o => digit1_seven);
    bcd_2 : bcd_seven_seg port map (clock_i => clock_i, bcd_i => digit2_bcd, seven_o => digit2_seven);
    bcd_3 : bcd_seven_seg port map (clock_i => clock_i, bcd_i => digit3_bcd, seven_o => digit3_seven);
    bcd_4 : bcd_seven_seg port map (clock_i => clock_i, bcd_i => digit4_bcd, seven_o => digit4_seven);

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
end architecture ;