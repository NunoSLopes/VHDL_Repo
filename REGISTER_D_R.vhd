----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:26:06 10/04/2018 
-- Design Name: 
-- Module Name:    REGISTER_D_R - Behavioral 
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

entity REGISTER_D_R is
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end REGISTER_D_R;

architecture Behavioral of REGISTER_D_R is

begin

process (CLK, RST)
	begin
		if (RST='1') then
			Q <= (others => '0');
		elsif (rising_edge(CLK)) then
			Q <= D;
		end if;
	end process;

end Behavioral;

