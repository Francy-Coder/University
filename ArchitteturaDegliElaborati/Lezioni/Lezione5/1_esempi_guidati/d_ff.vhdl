library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
    port (
        CLK : in  std_logic;
        D   : in  std_logic;
        Q   : out std_logic
    );
end d_ff;

architecture rtl of d_ff is
begin
    ff_proc: process(CLK)
    begin
        if rising_edge(CLK) then
            Q <= D;
        end if;
        -- Manca il ramo else: sintetizza un Flip-Flop D ($dff)
    end process;
end rtl;
