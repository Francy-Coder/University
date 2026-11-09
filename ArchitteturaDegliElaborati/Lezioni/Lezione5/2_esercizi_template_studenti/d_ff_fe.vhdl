library ieee;
use ieee.std_logic_1164.all;

entity d_ff_fe is
    port (
        CLK : in  std_logic;
        D   : in  std_logic;
        Q   : out std_logic
    );
end d_ff_fe;

architecture rtl of d_ff_fe is
begin
    ff_proc: process(CLK)
    begin
        -- your code here

        -- end of your code
    end process;
end rtl;
