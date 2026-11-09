library ieee;
use ieee.std_logic_1164.all;

entity sr_latch is
    port (
        S : in  std_logic;
        R : in  std_logic;
        Q : out std_logic
    );
end sr_latch;

architecture rtl of sr_latch is
begin
    latch_proc: process(S, R)
    begin
        if (R = '1') then
            Q <= '0';
        elsif (S = '1') then
            Q <= '1';
        end if;
        -- Assenza del ramo else: mantiene lo stato precedente ($dlatch)
    end process;
end rtl;
