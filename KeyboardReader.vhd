----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:46:02 10/11/2018 
-- Design Name: 
-- Module Name:    KeyboardReader - Structural 
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

entity KeyboardReader is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           K_Lin : in  STD_LOGIC_VECTOR (3 downto 0);
           ACK : in  STD_LOGIC;
			  DVAL : out STD_LOGIC;
           K_Col : out  STD_LOGIC_VECTOR (2 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end KeyboardReader;

architecture Structural of KeyboardReader is

	COMPONENT KeyDecoder
    PORT(
         K_Col : OUT  std_logic_vector(2 downto 0);
         K_Lin : IN  std_logic_vector(3 downto 0);
         Kack : IN  std_logic;
         Kval : OUT  std_logic;
         CLK : IN  std_logic;
         RST : IN  std_logic;
         K : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT KeyBuffer is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           DAV : in  STD_LOGIC;
           ACK : in  STD_LOGIC;
           DAC : out  STD_LOGIC;
           DVAL : out  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
	end COMPONENT;
	
	SIGNAL cableDACtoK, cableKVALtoDAV : STD_LOGIC;
	SIGNAL cableKtoD : STD_LOGIC_VECTOR(3 downto 0);

begin

U0 : KeyDecoder
	port map( CLK => clk, RST => rst, K_Col => K_Col, K_Lin => K_Lin, Kack => cableDACtoK, Kval => cableKVALtoDAV, K => cableKtoD);
	
U1 : KeyBuffer
	port map( CLK => clk, RST => rst, D => cableKtoD, DAV => cableKVALtoDAV, ACK => ACK, DAC => cableDACtoK, DVAL => DVAL, Q => Q );


end Structural;

