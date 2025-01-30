library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Entity declaration
entity BCD_to_7Seg is
    Port (
        BCD_in : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit BCD input
        Seg_out : out STD_LOGIC_VECTOR (0 to 6) -- 7-segment output (a-g)
    );
end BCD_to_7Seg;

-- Architecture
architecture Behavioral of BCD_to_7Seg is
begin
    -- Process to decode BCD to 7-segment
    process(BCD_in)
    begin
        case BCD_in is
            when "0000" => Seg_out <= "0000001"; -- 0
            when "0001" => Seg_out <= "1001111"; -- 1
            when "0010" => Seg_out <= "0010010"; -- 2
            when "0011" => Seg_out <= "0000110"; -- 3
            when "0100" => Seg_out <= "1001100"; -- 4
            when "0101" => Seg_out <= "0100100"; -- 5
            when "0110" => Seg_out <= "0100000"; -- 6
            when "0111" => Seg_out <= "0001111"; -- 7
            when "1000" => Seg_out <= "0000000"; -- 8
            when "1001" => Seg_out <= "0000100"; -- 9
            when others => Seg_out <= "-------"; -- Invalid input (all segments off)
        end case;
    end process;

end Behavioral;