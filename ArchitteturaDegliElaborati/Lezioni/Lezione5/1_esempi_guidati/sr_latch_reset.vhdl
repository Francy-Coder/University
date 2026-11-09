library ieee;
use ieee.std_logic_1164.all;

entity sr_latch_reset is
    port (
        S   : in  std_logic;
        R   : in  std_logic;
        CLR : in  std_logic; -- Asynchronous reset
        Q   : out std_logic
    );
end sr_latch_reset;

architecture rtl of sr_latch_reset is
begin
    latch_proc: process(CLR, S, R)
    begin
        if (CLR = '1') then
            Q <= '0';
        elsif (R = '1') then
            Q <= '0';
        elsif (S = '1') then
            Q <= '1';
        end if;
        -- Assenza del ramo else: mantiene lo stato precedente
    end process;
end rtl;
