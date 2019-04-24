library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gen_ai is
		port (
			clk_i : in std_logic; 
			echo  : in std_logic;
			a_ii  : out std_logic_vector(2-1 downto 0)
		);
end gen_ai;

architecture Behavioral of gen_ai is
	signal n     : integer := 0;
	--signal pocet : integer := 0;

begin
	process(clk_i)
	begin
		if falling_edge(clk_i) then
			if echo = '0' then
				--if pocet = 10 then
					if n = 0 then
						a_ii <= "00";
					elsif n = 1 then
						a_ii <= "01";
					elsif n = 2 then
						a_ii <= "10";
					else  
						a_ii <= "11";
					end if;
						n <= n + 1; 
					if (n = 4) then
						n <= 0;
					end if;
				--	pocet <= 0;
				--else
				--	pocet <= pocet + 1;
				--end if;
			end if;
		end if;	
	end process;
end Behavioral;