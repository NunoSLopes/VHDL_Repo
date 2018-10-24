--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:29:49 10/11/2018
-- Design Name:   
-- Module Name:   D:/LIC/Project/KeyDecodes_tb.vhd
-- Project Name:  Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: KeyDecoder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY KeyDecoder_tb IS
END KeyDecoder_tb;
 
ARCHITECTURE behavior OF KeyDecoder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
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
    

   --Inputs
   signal K_Lin : std_logic_vector(3 downto 0) := (others => '1');
   signal Kack : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';

 	--Outputs
   signal K_Col : std_logic_vector(2 downto 0);
   signal Kval : std_logic;
   signal K : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: KeyDecoder PORT MAP (
          K_Col => K_Col,
          K_Lin => K_Lin,
          Kack => Kack,
          Kval => Kval,
          CLK => CLK,
          RST => RST,
          K => K
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		RST <= '1';
		
      wait for 100 ns;	

		RST <= '0';
		
      wait for CLK_period*5;

      -- insert stimulus here 
		
		K_Lin <= "1110";
		wait for CLK_period*4;
		
		K_Lin <= "1110";
		Kack <='1';

		wait for CLK_period*4;
		
		Kack <='0';
		K_Lin <= "1111";
		
		wait for CLK_period*4;
		
		Kack <='0';
		K_Lin <= "1110";
		
		wait for CLK_period*4;
		
		Kack <='1';
		K_Lin <= "1110";

		wait for CLK_period*4;
		
		Kack <= '0';
		K_Lin <= "1110";
		
		wait for CLK_period*4;
		
      wait;
   end process;

END;
