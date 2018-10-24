----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:04:09 10/11/2018 
-- Design Name: 
-- Module Name:    KeyControl - Behavioral 
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

entity KeyControl is
    Port ( Kack : in  STD_LOGIC;
           Kpress : in  STD_LOGIC;
			  CLK  : in STD_LOGIC;
			  RST : in STD_LOGIC;
           Kval : out  STD_LOGIC;
           Kscan : out  STD_LOGIC);
end KeyControl;

architecture Behavioral of KeyControl is

	type STATE_TYPE is (STATE0, STATE1, STATE2);
	
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

Next_State_Evaluation : process (CS, Kpress, Kack)
begin
	case (CS) is
	
		when STATE0 => if(Kpress = '1') then NS <= STATE1;
							else NS <= STATE0;
							end if;
		when STATE1 => if (Kack = '1') then NS <= STATE2;
							else NS <= STATE1;
							END IF;
		when STATE2 => if (Kpress = '0' and Kack = '0') then NS <= STATE0;
							else NS <= STATE2;
							end if;
	end case;
end process;

Kscan <= '1' when (CS = STATE0) else '0';
Kval <= '1' when (CS = STATE1) else '0';

end Behavioral;

