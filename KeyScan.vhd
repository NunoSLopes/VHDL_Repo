----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:14:12 10/04/2018 
-- Design Name: 
-- Module Name:    KeyScan - Structural 
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

entity KeyScan is
    Port ( Kscan : in  STD_LOGIC;
			  CLK : in STD_LOGIC;
			  RST : in STD_LOGIC;
           mux : in  STD_LOGIC_VECTOR (3 downto 0);
           K : out  STD_LOGIC_VECTOR (3 downto 0);
           Kpress : out  STD_LOGIC;
           DEC : out  STD_LOGIC_VECTOR (2 downto 0));
end KeyScan;

architecture Structural of KeyScan is

component Counter is 
	port ( CE : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           CntOUT : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder2_3 is 

    Port ( Sel : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
           DEC : OUT STD_LOGIC_VECTOR (2 downto 0));
end component;

component MUX4_2 is
	Port ( Sel : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
          INPUT : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
          Y : out  STD_LOGIC);
end component;

signal cableY : STD_LOGIC;
signal cableCnt2K : STD_LOGIC_VECTOR ( 3 downto 0 );
signal cableCnt2Dec, cableCnt2Mux : STD_LOGIC_VECTOR ( 1 downto 0 );

begin


U0: Counter
	port map( CE => Kscan, cntOUT => cableCnt2K, CLK => CLK, RST => RST);
	
U1: Decoder2_3
	port map ( Sel => cableCnt2k (3 downto 2), DEC => DEC); 

U2: MUX4_2
	port map ( Sel => cableCnt2k (1 downto 0), INPUT => mux, Y =>  cableY);
	
K <= cableCnt2K;
Kpress <= not cableY;

end Structural;

