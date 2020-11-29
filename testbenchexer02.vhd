library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end test;

architecture teste of test is

component portas is
port(
    DRIV, PASS, IGN, BELTD, BELTP: in std_logic;
    ALARM: out std_logic);
end component;

signal DRIVT, PASST, IGNT, BELTDT, BELTPT, ALARMT: std_logic;

begin
    DUT: portas port map(DRIVT, PASST, IGNT, BELTDT, BELTPT, ALARMT);

    process
    begin
        DRIVT <= '1';
        IGNT <= '1';
        BELTDT <= '1';
        wait for 1 ns;
        assert(ALARMT = '0') report "Falha em 1/1/1 motorista" severity error;
        
        DRIVT <= '1';
        IGNT <= '1';
        BELTDT <= '0';
        wait for 1 ns;
        assert(ALARMT = '1') report "Falha em 1/1/0 motorista" severity error;
        
        DRIVT <= '0';
        BELTDT <= '0';
        IGNT <= '0';

        PASST <= '1';
        IGNT <= '1';
        BELTPT <= '1';
        wait for 1 ns;
        assert(ALARMT = '0') report "Falha em 1/1/1 passageiro" severity error;

        PASST <= '1';
        IGNT <= '1';
        BELTPT <= '0';
        wait for 1 ns;
        assert(ALARMT = '1') report "Falha em 1/1/0 passageiro" severity error;
        
        DRIVT <= '0';
        PASST <= '0';
        BELTDT <= '0';
        BELTPT <= '0';
        IGNT <= '0';
        
        assert false report "Teste completo." severity note;
        wait;
    end process;
end teste;