library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity testbench is
end testbench;

architecture Behavior of testbench is
component ButtonPress_FSM is
   port (clk, rst : in std_logic;
         b : in std_logic;
         y : out std_logic);
end component;

  constant CLK_PERIOD : time := 20 ns;

  signal clk_tb, rst_tb, b_tb, y_tb : std_logic;

begin
  testbenchA : ButtonPress_FSM
                       port map (clk_tb, rst_tb, b_tb, y_tb);

  process begin
  
     rst_tb <= '1';
     b_tb <= '0'; 
     clk_tb <= '0';  
     wait for CLK_PERIOD/2;
     
     rst_tb <= '1'; 
     clk_tb <= '1';
     wait for CLK_PERIOD/2;
     
     rst_tb <= '0'; 
     clk_tb <= '0';
     wait for CLK_PERIOD/2;
     
     
     b_tb <= '1'; 
     clk_tb <= '1';
     wait for CLK_PERIOD/2;
     
     b_tb <= '0'; 
     clk_tb <= '0';
     wait for CLK_PERIOD/2;
     
     clk_tb <= '1';
     wait for CLK_PERIOD/2;
     
     loop 
     clk_tb <= '0';
     wait for CLK_PERIOD/2;
     
     clk_tb <= '1';
     wait for CLK_PERIOD/2;
     
     end loop;
     
       clk_tb <= '1';     
       wait;
    
  end process;   
end Behavior;