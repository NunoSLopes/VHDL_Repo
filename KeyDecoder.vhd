----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:29:05 10/11/2018 
-- Design Name: 
-- Module Name:    KeyDecoder - Behavioral 
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

entity KeyDecoder is
    Port ( K_Col : out  STD_LOGIC_VECTOR (2 downto 0);
           K_Lin : in  STD_LOGIC_VECTOR (3 downto 0);
           Kack : in  STD_LOGIC;
           Kval : out  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           K : out  STD_LOGIC_VECTOR (3 downto 0));
end KeyDecoder;

architecture Stuctural of KeyDecoder is

Component KeyScan is
    Port ( Kscan : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
			  RST : in STD_LOGIC;
           mux : in  STD_LOGIC_VECTOR (3 downto 0);
           K : out  STD_LOGIC_VECTOR (3 downto 0);
           Kpress : out  STD_LOGIC;
           DEC : out  STD_LOGIC_VECTOR (2 downto 0));
end Component;

Component KeyControl is
    Port ( Kack : in  STD_LOGIC;
           Kpress : in  STD_LOGIC;
			  CLK  : in STD_LOGIC;
			  RST : in STD_LOGIC;
           Kval : out  STD_LOGIC;
           Kscan : out  STD_LOGIC);
end Component;

signal cableKscan, cableKpress, cableNotCLK : STD_LOGIC;

begin

U0 : KeyScan
		port map (K => K, Kpress => cableKpress, Kscan => cableKscan, mux => K_Lin, DEC => K_Col, CLK => CLK, RST => RST);
		
U1 : KeyControl
		port map (Kpress => cableKpress, Kscan => cableKscan, Kack => Kack, Kval => Kval, CLK => cableNotCLK, RST => RST);
		
cableNotCLK <= not CLK;

end Stuctural;

