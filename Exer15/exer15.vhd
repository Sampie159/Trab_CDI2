library IEEE;
use IEEE.std_logic_1164.all;

entity portas is
port(
    A, B, Cin: in std_logic;
    S, Cout: out std_logic
);
end portas;

architecture subtrator of portas is
begin
    process(A, B, Cin) is
    begin
        S <= (A xor B) xor Cin;
        Cout <= '1' when (A = '1' and B = '1' and Cin = '1') else
                '1' when (A = '0' and B = '1' and Cin = '1') else
                '1' when (A = '0' and B = '1' and Cin = '0') else
                '1' when (A = '0' and B = '0' and Cin = '1') else '0';
    end process;
end subtrator ; -- subtrator