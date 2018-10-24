----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:51:34 10/04/2018 
-- Design Name: 
-- Module Name:    MUX2_1 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX2_1 is
    Port ( SEL : in  STD_LOGIC;
           IA : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           R : out  STD_LOGIC_VECTOR (3 DOWNTO 0));
end MUX2_1;

architecture Behavioral of MUX2_1 is

begin

process (IA, SEL) is

begin
	if (SEL = '0') then R <= IA;
	else R <= "0000";
	end if;
end process;


end Behavioral;

