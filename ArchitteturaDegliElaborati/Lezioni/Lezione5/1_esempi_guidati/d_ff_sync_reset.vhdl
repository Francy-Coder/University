library ieee;
use ieee.std_logic_1164.all;

entity d_ff_sync_reset is
    port (
        CLK   : in  std_logic;
        RESET : in  std_logic;
        D     : in  std_logic;
        Q     : out std_logic
    );
end d_ff_sync_reset;

architecture rtl of d_ff_sync_reset is
begin
    ff_proc: process(CLK)
    begin
        if rising_edge(CLK) then
            if (RESET = '1') then
                Q <= '0';
            else
                Q <= D;
            end if;
        end if;
        -- L'if esterno (senza else) genera la memoria!
    end process;
end rtl;
