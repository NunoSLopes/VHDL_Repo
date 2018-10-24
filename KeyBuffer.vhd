----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:32:28 10/11/2018 
-- Design Name: 
-- Module Name:    KeyBuffer - Structural 
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

entity KeyBuffer is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           DAV : in  STD_LOGIC;
           ACK : in  STD_LOGIC;
           DAC : out  STD_LOGIC;
           DVAL : out  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end KeyBuffer;

architecture Structural of KeyBuffer is

component REGISTER_D_R is
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component KeyBufferControl is
    Port ( CLK : in STD_LOGIC;
			  RST : in STD_LOGIC;
			  DAV : in  STD_LOGIC;
           ACK : in  STD_LOGIC;
           DAC : out  STD_LOGIC;
           Dval : out  STD_LOGIC;
           Wreg : out  STD_LOGIC);
end component;

signal cabelW : STD_LOGIC;

begin

U0 : REGISTER_D_R
	port map ( CLK => cabelW, RST => RST, Q => Q, D => D  );

U1 : KeyBufferControl
	port map ( CLK => CLK, RST => RST, DAV => DAV, ACK => ACK, DAC => DAC, Dval => Dval, Wreg => cabelW);


end Structural;

