----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:11:31 09/27/2018 
-- Design Name: 
-- Module Name:    MUX4_2 - Behavioral 
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

entity MUX4_2 is
    Port ( Sel : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
           INPUT : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           Y : out  STD_LOGIC);
end MUX4_2;

architecture Behavioral of MUX4_2 is

begin

process (INPUT, Sel) is

begin
	if (Sel = "00") then Y <= INPUT(0);
		elsif (Sel = "01") then Y <= INPUT(1);
		elsif (Sel = "10") then Y <= INPUT(2);
		else Y <= INPUT(3);
		end if;
end process;


end Behavioral;

