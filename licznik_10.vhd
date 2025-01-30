library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity licznik_10 is
    port (
        clk : in std_logic;
        en : in std_logic;
        Q : buffer std_logic_vector(3 downto 0);
        clr : in std_logic;
        rco : out std_logic
    );
end licznik_10;

architecture counter of licznik_10 is
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            -- Reset condition
            if clr = '1' then
                Q <= "0000";
                rco <= '0'; -- Ensure rco is reset
            elsif en = '1' then
                -- Normal counting
                if Q = "1001" then
                    rco <= '1'; -- Set rco for one cycle
                    Q <= "0000"; -- Reset counter
                else
                    rco <= '0'; -- Ensure rco is low otherwise
                    Q <= Q + 1;
                end if;
            else
                rco <= '0'; -- Ensure rco is low when disabled
            end if;
        end if;
    end process;
end counter;
