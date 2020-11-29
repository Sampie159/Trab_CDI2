library IEEE;
use IEEE.std_logic_1164.all;

entity portas is
  port (
    DRIV, PASS, IGN, BELTD, BELTP: in std_logic;
    ALARM: out std_logic
    ) ;
end portas;

architecture alarme of portas is
begin
    process(DRIV, PASS, IGN, BELTD, BELTP) is
    begin
        if DRIV = '1' and IGN = '1' then
            if BELTD = '1' then
                ALARM <= '0';
            else
                ALARM <= '1';
            end if;
        elsif PASS = '1' and IGN = '1' then
            if BELTP = '1' then
                ALARM <= '0';
            else
                ALARM <= '1';
            end if;
        end if;
        -- ALARM <= '1' when (DRIV = '1' and IGN = '1' and BELTD = '0') or (PASS = '1' and IGN = '1' and BELTP = '0') else '0';
    end process;
end alarme ; -- alarme  