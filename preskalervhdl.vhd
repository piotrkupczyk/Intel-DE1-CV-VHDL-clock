library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity preskalervhdl is
    Port (
        CLK_50MHz : in  STD_LOGIC;
        CLK_10Hz  : out STD_LOGIC;
        CLK_1Hz   : out STD_LOGIC;
        CLK_1_60Hz : out STD_LOGIC
    );
end preskalervhdl;

architecture Behavioral of preskalervhdl is
    signal counter_10Hz : INTEGER := 0;
    signal clk_10Hz_reg : STD_LOGIC := '0';
    signal clk_1Hz_reg  : STD_LOGIC := '0';
    signal licznik      : INTEGER := 0;
    signal licznik60    : INTEGER := 0;
    signal clk_1_60Hz_reg : STD_LOGIC := '0';
begin
    process (CLK_50MHz)
    begin
        if CLK_50MHz'event and CLK_50MHz = '1' then
            -- Zliczanie do 10 Hz
            if counter_10Hz = 4999999 then
                counter_10Hz <= 0;
                clk_10Hz_reg <= '1';
                licznik <= licznik + 1;
            else
                counter_10Hz <= counter_10Hz + 1;
                clk_10Hz_reg <= '0';
            end if;

            -- Zliczanie do 1 Hz
            if licznik = 10 then
                licznik <= 0;
                clk_1Hz_reg <= '1';
                licznik60 <= licznik60 + 1;
            else
                clk_1Hz_reg <= '0';
            end if;

            -- Zliczanie do 1/60 Hz
            if licznik60 = 60 then
                licznik60 <= 0;
                clk_1_60Hz_reg <= '1';
            else
                clk_1_60Hz_reg <= '0';
            end if;
        end if;
    end process;

    -- Wyjścia
    CLK_10Hz <= clk_10Hz_reg;
    CLK_1Hz  <= clk_1Hz_reg;
    CLK_1_60Hz <= clk_1_60Hz_reg;
end Behavioral;
