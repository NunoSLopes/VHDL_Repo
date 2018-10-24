----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:12:08 10/11/2018 
-- Design Name: 
-- Module Name:    KeyBufferControl - Behavioral 
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

entity KeyBufferControl is
    Port ( CLK : in STD_LOGIC;
			  RST : in STD_LOGIC;
			  DAV : in  STD_LOGIC;
           ACK : in  STD_LOGIC;
           DAC : out  STD_LOGIC;
           Dval : out  STD_LOGIC;
           Wreg : out  STD_LOGIC);
end KeyBufferControl;

architecture Behavioral of KeyBufferControl is

type STATE_TYPE is (STATE0, STATE1, STATE2, STATE3, STATE4);
	
	-- CS = Current State, NS = Next State
	
	signal CS, NS : STATE_TYPE;

begin

--Make the transitio to the next state on a clock
State_Transitions : process (CLK, RST)
	begin
		if(RST = '1') then
			CS <= STATE0;
		elsif rising_edge(CLK) then
			CS <= NS;
		end if;
	end process;
	
-- Determine the next state

Next_State_Evaluation : process (CS, ACK , DAV)
begin
	case (CS) is
	
		when STATE0 => if(DAV = '1') then NS <= STATE1;
							else NS <= STATE0;
							end if;
		when STATE1 => NS <= STATE2;
		when STATE2 => if (DAV = '0') then NS <= STATE3;
							else NS <= STATE2;
							end if;
		when STATE3 => if (ACK = '1') then NS <= STATE4;
							else NS <= STATE3;
							end if;
		when STATE4 => if ( ACK = '0' ) then NS <= STATE0;
							else NS <= STATE4;
							end if;
	end case;
end process;

Wreg <= '1' when ( CS = STATE1 ) else '0';
DAC <= '1' when ( CS = STATE2 ) else '0';
Dval <= '1' when ( CS = STATE2 or CS = STATE3 ) else '0';

end Behavioral;

