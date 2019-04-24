library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.ALL;


entity UZ_05_02 is
        port(
          clk_i : in std_logic;
          echo  : in std_logic;
          trigg  : out std_logic;
		    vzdalenost : out std_logic_vector(16-1 downto 0)
        );
end UZ_05_02;

architecture Behavioral of UZ_05_02 is
    signal N : integer := 0;
	 signal N_pulz : integer := 0;
    signal trigger: std_logic := '1';
	 signal pomocna : std_logic_vector(16-1 downto 0);

    
begin
    process(clk_i)
    begin
        if rising_edge(clk_i) then
            if trigger = '1' then
					 pomocna <= "0000000000000000";
                if N_pulz = 10 then
                    trigg <= '0';
                    trigger <= '0';
                    N_pulz <= 0;
                else
                    trigg <= '1';
                    N_pulz <= N_pulz + 1;
                end if;
            else
                if echo = '1' then
						  pomocna <= pomocna + "1";
                else
                    if N = 20000 then
                        trigger <= '1';
                        N <= 0;
                    else
                        if N = 10 then
                            pomocna <= "000000" & pomocna(15 DOWNTO 6); --- posunuti registru o 6 mist (odpovida /64), ackooliv je treba delit 58.13
                        end if;
                        vzdalenost <= pomocna;
                        N <= N + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;