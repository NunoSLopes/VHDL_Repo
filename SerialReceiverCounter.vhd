----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:08:55 10/25/2018 
-- Design Name: 
-- Module Name:    SerialReceiverCounter - Behavioral 
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

entity SerialReceiverCounter is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           a : out  STD_LOGIC_VECTOR (3 downto 0));
end SerialReceiverCounter;

architecture Stuctural of SerialReceiverCounter is

component ADDER4BIT is
	Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : out  STD_LOGIC);
end component;

component REGISTER_D_R is
	Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

SIGNAL cableA, cableS: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

U0: ADDER4BIT
	PORT MAP(Cin => Not CLR, A => cableA, S => cableS);
	
U1: REGISTER_D_R
	PORT MAP ( CLK => CLK, RST => CLR, D => cableS ,  Q => cableA);
	
	
a <= cableS;

end Stuctural;