library ieee;
use ieee.std_logic_1164.all;

entity d_ff_fe_sync_reset is
    port (
        CLK   : in  std_logic;
        RESET : in  std_logic;
        D     : in  std_logic;
        Q     : out std_logic
    );
end d_ff_fe_sync_reset;

architecture rtl of d_ff_fe_sync_reset is
begin
    ff_proc: process(CLK)
    begin
        -- your code here
			if falling_edge(CLK) then
				if RESET = '1' then
					Q <= '0';
				else
					Q <= D;
				end if;
			end if;
        -- end of your code
    end process;
end rtl;
