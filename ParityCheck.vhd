----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:04:41 10/25/2018 
-- Design Name: 
-- Module Name:    ParityCheck - Behavioral 
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

entity ParityCheck is
    Port ( CLK : in  STD_LOGIC;
           DataIn : in  STD_LOGIC;
           Init : in  STD_LOGIC;
           Error : out  STD_LOGIC);
end ParityCheck;

architecture Structural of ParityCheck is

component REGISTER_D_1bit is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           D : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end component;

Signal cableQtoError : STD_LOGIC;
Signal cableXor : STD_LOGIC;

begin

cableXor <= (DataIn XOR cableQtoError);

U0: REGISTER_D_1bit
	port map ( CLK => CLK, RST => Init, D => cableXor, Q => cableQtoError);

	Error <= cableQtoError;
	
	
end Structural;

