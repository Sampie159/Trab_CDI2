library IEEE;
use IEEE.std_logic_1164.all;

entity portas is
  port (
    inun, fogo, col, freio, seq: in std_logic;
    ejetar: out std_logic
  ) ;
end portas;

architecture ejete of portas is
begin
    process(inun, fogo, col, freio, seq) is
    begin
        if freio = '1' then
            ejetar <= '1';
        elsif col = '1' then
            if seq = '1' then
                ejetar <= '1';
            elsif inun = '1' then
                ejetar <= '1';
            elsif fogo = '1' then
                ejetar <= '1';
            else
                ejetar <= '0';
            end if;
        elsif inun = '1' and seq = '1' then
            ejetar <= '1';
        else
            ejetar <= '0';
        end if;
    end process;
end ejete;