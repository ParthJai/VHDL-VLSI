--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:36:37 08/07/2018
-- Design Name:   
-- Module Name:   F:/vhdl/ALU_new/ALU_tb.vhd
-- Project Name:  ALU_new
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         select_op : IN  std_logic_vector(2 downto 0);
         result : OUT  std_logic_vector(63 downto 0);
         zero : OUT  std_logic;
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal select_op : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(63 downto 0);
   signal zero : std_logic;
   signal carry : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          a => a,
          b => b,
          select_op => select_op,
          result => result,
          zero => zero,
          carry => carry
        );



   -- Stimulus process
   stim_proc: process
   begin	
		select_op <= "010";
		a <= "00000000000000000000000000000000";
		b <= "00000000000000000000000000000000";
		wait for 10 ns;
		a <= not a;
		wait for 10 ns;
		a <= not a;
		b <= not b;
		wait for 10 ns;
		a <= not a;
		wait for 100 ns;
		
		select_op <= "101";
		a <= "00000000000000000000000000000000";
		b <= "00000000000000000000000000000000";
		wait for 10 ns;
		a <= not a;
		wait for 10 ns;
		a <= not a;
		b <= not b;
		wait for 10 ns;
		a <= not a;		
		wait for 100 ns;

		select_op <= "100";
		a <= "00000000000000000000000000000000";
		b <= "00000000000000000000000000000000";
		wait for 10 ns;
		a <= not a;
		wait for 10 ns;
		a <= not a;
		b <= not b;
		wait for 10 ns;
		a <= not a;
		wait for 100 ns;
		
		select_op <= "111";
		a <= "11111111111111111111111111111111";
		b <= "11111111111111111111111111111111";
		wait for 10 ns;
		a <= "10101010101010101010101010101010";
		b <= "01010101010101010101010101010101";
		wait for 10 ns;
		a <= "00000000000000000000000000000000";
		b <= "00000000000000000000000000000000";
		wait for 100 ns;
		
		select_op <= "001";
		a <= "11111111111111111111111111111111";
		b <= "11111111111111111111111111111111";
		wait for 10 ns;
		a <= "10101010101010101010101010101010";
		b <= "01010101010101010101010101010101";
		wait for 10 ns;
		a <= "00000000000000000000000000000000";
		b <= "00000000000000000000000000000000";
		wait for 10 ns;
		b <= "11111111111111111111111111111111";
		wait for 100 ns;
		
		select_op <= "110";
		a <= "10101010101010101010101010101010";
		b <= "11001100110011001100110011001100";


      wait;
   end process;

END;
