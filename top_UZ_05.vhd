library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_UZ_05 is
    port (
      clk_i : in std_logic;
		echo  : in std_logic;

      disp_digit_o : out std_logic_vector(4-1 downto 0); 
      disp_sseg_o  : out std_logic_vector(7-1 downto 0);
		trigg 	     : out std_logic
    );

end top_UZ_05;

architecture Behavioral of top_UZ_05 is
	signal vzd_pom	   : std_logic_vector (16-1 downto 0);
	signal bcd_0	   : std_logic_vector (3 downto 0);
   signal bcd_1	   : std_logic_vector (3 downto 0);
   signal bcd_2	   : std_logic_vector (3 downto 0);
   signal bcd_3	   : std_logic_vector (3 downto 0);
	signal s_hex      : std_logic_vector (4-1 downto 0);
	signal a     	   : std_logic_vector (2-1 downto 0);
begin

	 ULTRAZVUK : entity work.UZ_05_02
		port map (
			clk_i => clk_i,
			echo => echo,
			trigg => trigg,
			vzdalenost => vzd_pom
		);


	 SXTNBITS : entity work.SXTN_bits_to_bcd
		port map (
			vzd_i => vzd_pom,
			bcd_o0 => bcd_0,
			bcd_o1 => bcd_1,
			bcd_o2 => bcd_2,
			bcd_o3 => bcd_3
		);

	 
    HEX2SSEG : entity work.hex_to_sseg
        port map (
            hex_i => s_hex,   
            sseg_o => disp_sseg_o   
        );

    ONEOFFOUR : entity work.one_of_four
        port map (
            a_i => a,            
            y_o => disp_digit_o     
        );
	 
	 GENAII : entity work.gen_ai
		  port map (
				clk_i => clk_i,
				echo => echo,
				a_ii => a
		  );

    s_hex <= bcd_0 when (a = "00") else
             bcd_1 when (a = "01") else
             bcd_2 when (a = "10") else
             bcd_3; 
end Behavioral;