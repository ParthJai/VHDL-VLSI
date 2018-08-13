----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:06 08/07/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
port(a: in std_logic_vector (31 downto 0);
	  b: in std_logic_vector (31 downto 0);
	  select_op: in std_logic_vector (2 downto 0);
	  result: out std_logic_vector (63 downto 0);
	  zero: out std_logic;
	  carry: out std_logic);
end ALU;

architecture Behavioral of ALU is
begin
	process(a, b, select_op)
	variable compare: std_logic_vector (63 downto 0) := (others => '0');
	variable temp_result: std_logic_vector (63 downto 0);
	variable temp: std_logic_vector(64 downto 0);
	variable pv, yp: std_logic_vector(63 downto 0);
		begin
			case select_op is
				when "010" => 
				temp_result := X"00000000" & (a and b);
				if (temp_result = compare) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				result <= temp_result;
				
				when "101" =>
				temp_result := X"00000000" & (a or b);
				if (temp_result = compare) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				result <= temp_result;
				
				when "100" =>
				temp_result := X"00000000" & (a xor b);
				if (temp_result = compare) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				result <= temp_result;
				
				when "111" =>
				temp := X"00000000" & (('0' & a) + ('0' & b));
				carry <= temp(32);
				result <= X"00000000" & temp(31 downto 0);
				if (temp(63 downto 0) = compare) then
					zero <= '1';
				else
					zero <= '0';					
				end if;
				
				when "001" =>
				temp := X"00000000" & (('0' & a) + ('0' & (not b)) + '1');
				if (temp(32) = '1') then
					result <= X"00000000" & temp(31 downto 0);
					carry <= '0';
				else
					result <= X"00000000" & ((not temp(31 downto 0) + '1'));
					carry <= '1';
				end if;
				
				if ((X"00000000" & temp(31 downto 0)) = compare) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				
				when "110" =>
				pv := X"0000000000000000";
				yp := X"00000000" & b;
				for i in 0 to 31 loop
					if a(i) = '1' then
						pv := pv + yp;
					end if;
					yp := yp(62 downto 0) & '0';
				end loop;
				if (pv = compare) then
					zero <= '1';
				else
					zero <= '0';
				end if;
				result <= pv;
				
				when others =>
				carry <= 'Z';
				zero <= 'Z';
				
			end case;
	end process;
end Behavioral;

