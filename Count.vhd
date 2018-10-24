----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:43:23 10/04/2018 
-- Design Name: 
-- Module Name:    Counter - Stuctural
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

entity Counter is
    Port ( CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           CntOUT : out  STD_LOGIC_VECTOR (3 downto 0));
end Counter;

architecture Stuctural of Counter is

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

component MUX2_1 is
	Port ( SEL : in  STD_LOGIC;
          IA : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
          R : out  STD_LOGIC_VECTOR (3 DOWNTO 0));
end component;

SIGNAL eq11: STD_LOGIC;
SIGNAL cableIA, cableA, cableR: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

eq11 <= (cableA(3) AND NOT cableA(2) AND cableA(1) AND cableA(0) AND CE);

U0: ADDER4BIT
	PORT MAP(Cin => CE, A => cableA, S => cableIA);

U2: MUX2_1
	PORT MAP (SEL => eq11, IA => cableIA, R => cableR);
	
U1: REGISTER_D_R
	PORT MAP (D => cableR , CLK => CLK, Q => cableA, RST => RST);
	
	
Cntout <= cableA;

end Stuctural;

