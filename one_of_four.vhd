library ieee;
use ieee.std_logic_1164.all;

entity one_of_four is
    port(
        a_i : in std_logic_vector(2-1 downto 0);    -- 2 address inputs
        y_o : out std_logic_vector(4-1 downto 0)    -- active-low outputs
    );
end one_of_four;

architecture Behavioral of one_of_four is
begin
    --  addr | outputs
    -- ------+---------
    --   0 0 | H H H L
    --   0 1 | H H L H
    --   1 0 | H L H H
    --   1 1 | L H H H
    y_o(3) <= NOT (a_i(0) AND a_i(1));      --y_o(3) <= '1'; 
    y_o(2) <= NOT (NOT a_i(0) AND a_i(1));  --y_o(2) <= '1'; 
    y_o(1) <= NOT (a_i(0) AND NOT a_i(1));  --y_o(1) <= '1'; 
    y_o(0) <= a_i(0) OR a_i(1);             --y_o(0) <= '0';
end Behavioral;
