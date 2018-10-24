----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:10:59 10/18/2018 
-- Design Name: 
-- Module Name:    KeyboardReader_Wrapper - Structural 
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

entity KeyboardReader_Wrapper is
	port (
			CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			J2_12 : in STD_LOGIC;
			J2_13 : in STD_LOGIC;
			J2_14 : in STD_LOGIC;
			J2_15 : in STD_LOGIC;
			OUTPORT_0: in STD_LOGIC;
			
			J2_9 : out STD_LOGIC;	
			J2_10 : out STD_LOGIC;
			J2_11 : out STD_LOGIC;
			INPORT_0 : out STD_LOGIC;
			INPORT_1 : out STD_LOGIC;
			INPORT_2 : out STD_LOGIC;
			INPORT_3 : out STD_LOGIC;
			INPORT_4 : out STD_LOGIC);
			
	
end KeyboardReader_Wrapper;

architecture Structural of KeyboardReader_Wrapper is

component KeyboardReader is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           K_Lin : in  STD_LOGIC_VECTOR (3 downto 0);
           ACK : in  STD_LOGIC;
			  DVAL : out STD_LOGIC;
           K_Col : out  STD_LOGIC_VECTOR (2 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

U0 : KeyboardReader
		port map( clk => CLK, 
					 rst => RST, 
					 K_Lin(0) => J2_15,
					 K_Lin(1) => J2_14,
					 K_Lin(2) => J2_13,
					 K_Lin(3) => J2_12,
					 ACK => OUTPORT_0,
					 K_Col(2) => J2_9,
					 K_Col(1) => J2_10,
					 K_Col(0) => J2_11,
					 Q(0) => INPORT_0,
					 Q(1) => INPORT_1,
					 Q(2) => INPORT_2,
					 Q(3) => INPORT_3,
					 DVAL => INPORT_4
					 );


end Structural;

