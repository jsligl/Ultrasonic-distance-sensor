--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:28:17 04/18/2019
-- Design Name:   
-- Module Name:   /home/lab661/Documents/slislo/project_05/tb_SXTN_bits_to_bcd_01.vhd
-- Project Name:  project_05
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SXTN_bits_to_bcd
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_SXTN_bits_to_bcd_01 IS
END tb_SXTN_bits_to_bcd_01;
 
ARCHITECTURE behavior OF tb_SXTN_bits_to_bcd_01 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SXTN_bits_to_bcd
    PORT(
         vzd_i : IN  std_logic_vector(15 downto 0);
         bcd_o0 : OUT  std_logic_vector(3 downto 0);
         bcd_o1 : OUT  std_logic_vector(3 downto 0);
         bcd_o2 : OUT  std_logic_vector(3 downto 0);
         bcd_o3 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal vzd_i : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal bcd_o0 : std_logic_vector(3 downto 0);
   signal bcd_o1 : std_logic_vector(3 downto 0);
   signal bcd_o2 : std_logic_vector(3 downto 0);
   signal bcd_o3 : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SXTN_bits_to_bcd PORT MAP (
          vzd_i => vzd_i,
          bcd_o0 => bcd_o0,
          bcd_o1 => bcd_o1,
          bcd_o2 => bcd_o2,
          bcd_o3 => bcd_o3
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
--        for i in 0 to 1001 loop
--            wait for 25 us;
--            vzd_i <= std_logic_vector(to_unsigned(9999 - i, 16));
--        end loop;
--        wait for 20 ns;
--        wait;
	wait for 25 us;
	vzd_i <= "0000000000001110";
   end process;

END;
