library IEEE;
use IEEE.std_logic_1164.all;

entity portas is
port(
    A, B, Cin: in std_logic;
    S, Cout: out std_logic
);
end portas;

architecture somador of portas is
begin
    process(A, B, Cin) is
    begin
        S <= (A xor B) xor Cin;
        -- S <= '1' when (A = '1' and B = '1' and Cin = '1') else
        --      '1' when (A = '1' and B = '0' and Cin = '0') else
        --      '1' when (A = '0' and B = '1' and Cin = '0') else
        --      '1' when (A = '0' and B = '0' and Cin = '1') else '0';
        Cout <= '1' when (A = '1' and B = '1' and Cin = '1') else
                '1' when (A = '1' and B = '1' and Cin = '0') else
                '1' when (A = '1' and B = '0' and Cin = '1') else
                '1' when (A = '0' and B = '1' and Cin = '1') else '0';
        -- if A = '0' then
        --     if B = '0' then
        --         if Cin = '0' then
        --             S <= '0';
        --             Cout <= '0';
        --         else
        --             S <= '1';
        --             Cout <= '0';
        --         end if;
        --     else
        --         if Cin = '0' then
        --             S <= '1';
        --             Cout <= '0';
        --         else
        --             S <= '0';
        --             Cout <= '1';
        --         end if;
        --     end if;
        -- else
        --     if B = '0' then
        --         if Cin = '0' then
        --             S <= '1';
        --             Cout <= '0';
        --         else
        --             S <= '0';
        --             Cout <= '1';
        --         end if;
        --     else
        --         if Cin = '0' then
        --             S <= '0';
        --             Cout <= '1';
        --         else
        --             S <= '1';
        --             Cout <= '1';
        --         end if;
        --     end if;
        -- end if;
    end process;
end somador ; -- somador