----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:07:13 10/23/2018 
-- Design Name: 
-- Module Name:    CoinAcceptor - Behavioral 
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

entity CoinCounter is
	port( CLK : in STD_LOGIC;
			RST : in STD_LOGIC;
			Coin : in STD_LOGIC_VECTOR ( 3 downto 0);
			Result : out STD_LOGIC_VECTOR ( 3 downto 0)
			);
end CoinCounter;

architecture Structural of CoinCounter is

component REGISTER_D_R is
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end component;

component ADDER4BITS is
Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
       B : in  STD_LOGIC_VECTOR (3 downto 0);
       Cin : in  STD_LOGIC;
       S : out  STD_LOGIC_VECTOR (3 downto 0);
       Cout : out  STD_LOGIC);
end component;

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


end Structural;

