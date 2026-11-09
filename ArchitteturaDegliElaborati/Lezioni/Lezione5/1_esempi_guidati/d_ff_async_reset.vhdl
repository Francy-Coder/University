library ieee;
use ieee.std_logic_1164.all;

entity d_ff_async_reset is
    port (
        CLK   : in  std_logic;
        RESET : in  std_logic;
        D     : in  std_logic;
        Q     : out std_logic
    );
end d_ff_async_reset;

architecture rtl of d_ff_async_reset is
begin
    -- NB: RESET e' nella sensitivity list per agire immediatamente!
    ff_proc: process(CLK, RESET)
    begin
        if (RESET = '1') then
            Q <= '0'; -- Effetto immediato (asincrono)
        elsif rising_edge(CLK) then
            Q <= D;   -- Effetto sincronizzato sul fronte di salita
        end if;
    end process;
end rtl;
