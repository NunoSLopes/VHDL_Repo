----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:01:41 10/23/2018 
-- Design Name: 
-- Module Name:    adder8bits - Behavioral 
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

entity adder8bits is
Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
       B : in  STD_LOGIC_VECTOR (7 downto 0);
       Cin : in  STD_LOGIC;
       S : out  STD_LOGIC_VECTOR (7 downto 0);
       Cout : out  STD_LOGIC);
end adder8bits;

architecture Stuctural of adder8bits is

component FA is
	port ( A : in STD_LOGIC;
			 B : in STD_LOGIC;
			 Cin : in STD_LOGIC;
			 S : out STD_LOGIC;
			 Cout : out STD_LOGIC);
end component;

signal carry : STD_LOGIC_VECTOR(7 downto 1);

begin

U0:   FA
		port map (A => A(0), B => B(0), Cin => Cin, S => S(0), Cout => carry(1));
		
U1:	 FA
		 port map (A => A(1), B => B(1), Cin => carry(1), S => S(1), Cout => carry(2));

U2:	 FA
		 port map (A => A(2), B => B(2), Cin => carry(2), S => S(2), Cout => carry(3));
		 
U3:	 FA
		 port map (A => A(3), B => B(3), Cin => carry(3), S => S(3), Cout => carry(4));

U4:	 FA
		 port map (A => A(4), B => B(4), Cin => carry(2), S => S(2), Cout => carry(5));
		 
U5:	 FA
		 port map (A => A(5), B => B(5), Cin => carry(3), S => S(3), Cout => carry(6));

U6:	 FA
		 port map (A => A(6), B => B(6), Cin => carry(2), S => S(2), Cout => carry(7));
		 
U7:	 FA
		 port map (A => A(7), B => B(7), Cin => carry(3), S => S(3), Cout => Cout);
		 
end Stuctural;

