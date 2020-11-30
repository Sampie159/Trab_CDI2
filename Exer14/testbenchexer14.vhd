library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end test;

architecture teste of test is
component portas is
port(
    A, B, Cin: in std_logic;
    S, Cout: out std_logic
);
end component;

signal AT, BT, CinT, ST, CoutT: std_logic;

begin
    DUT: portas port map(AT, BT, CinT, ST, CoutT);

    process
    begin
        AT <= '0';
        BT <= '0';
        CinT <= '0';
        wait for 1 ns;
        assert(ST = '0') report "Falha para S em 0/0/0" severity error;
        assert(CoutT = '0') report "Falha para Cout em 0/0/0" severity error;
        
        AT <= '0';
        BT <= '0';
        CinT <= '1';
        wait for 1 ns;
        assert(ST = '1') report "Falha para S em 0/0/1" severity error;
        assert(CoutT = '0') report "Falha para Cout em 0/0/1" severity error;
        
        AT <= '0';
        BT <= '1';
        CinT <= '0';
        wait for 1 ns;
        assert(ST = '1') report "Falha para S em 0/1/0" severity error;
        assert(CoutT = '0') report "Falha para Cout em 0/1/0" severity error;

        AT <= '0';
        BT <= '1';
        CinT <= '1';
        wait for 1 ns;
        assert(ST = '0') report "Falha para S em 0/1/1" severity error;
        assert(CoutT = '1') report "Falha para Cout em 0/1/1" severity error;
        
        AT <= '1';
        BT <= '0';
        CinT <= '0';
        wait for 1 ns;
        assert(ST = '1') report "Falha para S em 1/0/0" severity error;
        assert(CoutT = '0') report "Falha para Cout em 1/0/0" severity error;
        
        AT <= '1';
        BT <= '0';
        CinT <= '1';
        wait for 1 ns;
        assert(ST = '0') report "Falha para S em 1/0/1" severity error;
        assert(CoutT = '1') report "Falha para Cout em 1/0/1" severity error;
        
        AT <= '1';
        BT <= '1';
        CinT <= '0';
        wait for 1 ns;
        assert(ST = '0') report "Falha para S em 1/1/0" severity error;
        assert(CoutT = '1') report "Falha para Cout em 1/1/0" severity error;
        
        AT <= '1';
        BT <= '1';
        CinT <= '1';
        wait for 1 ns;
        assert(ST = '1') report "Falha para S em 1/1/1" severity error;
        assert(CoutT = '1') report "Falha para Cout em 1/1/1" severity error;
        
        AT <= '0';
        BT <= '0';
        CinT <= '0';
        
        assert false report "Teste completo." severity note;
        wait;
    end process;

end teste;