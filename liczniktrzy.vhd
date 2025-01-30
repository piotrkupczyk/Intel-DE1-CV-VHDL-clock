library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity liczniktrzy is
    Port (
        CLK_50MHz : in  STD_LOGIC;
        CLK_1Hz   : in  STD_LOGIC;
        U         : in  STD_LOGIC;
        OUTPUT : out STD_LOGIC
    );
end liczniktrzy;

architecture Behavioral of liczniktrzy is
    signal count : INTEGER := 0; 
begin
    process (CLK_50MHz)
    begin
        if CLK_1Hz'event and CLK_1Hz = '1' then
            if U = '1' then
                if count = 2 then
                    OUTPUT <= '1';
                else
                    count <= count + 1;
                end if;
            
                
            end if;
				
        end if;
		  if U = '0' then
		  OUTPUT <= '0';
        count <= 0;
		  end if;
		  
    end process;
end Behavioral;