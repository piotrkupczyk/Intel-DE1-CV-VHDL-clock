library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity edgeing is
    port (
        clk : in std_logic;
        D_in : in std_logic;
        Q : out std_logic
    );
end edgeing;

architecture Przypisania of edgeing is
    signal reg : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Q_reg : std_logic := '0';
begin
    process(clk)
    begin
        if clk'event and clk = '1' then
            -- Shift register logic
            reg(3) <= D_in; 
            reg(2) <= reg(3); 
            reg(1) <= reg(2);
            reg(0) <= reg(1);

            -- Generate Q for one clock cycle
            if reg = "0111" then
                Q_reg <= '1'; -- Set Q high for one cycle
            else
                Q_reg <= '0'; -- Reset Q to 0
            end if;
        end if;
    end process;

    -- Assign the output
    Q <= Q_reg;

end Przypisania;
