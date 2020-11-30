library IEEE;
use IEEE.std_logic_1164.all;

entity test is
end test;

architecture teste of test is
component portas is
port(
    inun, fogo, col, freio, seq: in std_logic;
    ejetar: out std_logic
);
end component;

signal inunT, fogoT, colT, freioT, seqT, ejetarT: std_logic;

begin
    DUT: portas port map(inunT, fogoT, colT, freioT, seqT, ejetarT);

    process
    begin
        freioT <= '1';
        wait for 1 ns;
        assert(ejetarT = '1') report "Falha no Freio" severity error;

        freioT <= '0';

        colT <= '1';
        seqT <= '1';
        wait for 1 ns;
        assert(ejetarT = '1') report "Falha em Colisão/Sequestro" severity error;
        
        seqT <= '0';
        
        colT <= '1';
        inunT <= '1';
        wait for 1 ns;
        assert(ejetarT = '1') report "Falha em Colisão/Inundação" severity error;
        
        inunT <= '0';
        
        colT <= '1';
        fogoT <= '1';
        wait for 1 ns;
        assert(ejetarT = '1') report "Falha em Colisão/Fogo" severity error;

        colT <= '0';
        fogoT <= '0';

        inunT <= '1';
        seqT <= '1';
        wait for 1 ns;
        assert(ejetarT = '1') report "Falha em Inundação/Sequestro" severity error;
        
        inunT <= '0';
        fogoT <= '0';
        colT <= '0';
        freioT <= '0';
        seqT <= '0';

        assert false report "Teste completo." severity note;
        wait;
    end process;

end teste;