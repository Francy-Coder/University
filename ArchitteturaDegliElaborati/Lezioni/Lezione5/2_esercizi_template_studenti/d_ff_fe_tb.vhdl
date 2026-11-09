library ieee;
use ieee.std_logic_1164.all;

entity d_ff_fe_tb is
end d_ff_fe_tb;

architecture behavior of d_ff_fe_tb is
    component d_ff_fe
        port (
            CLK : in  std_logic;
            D   : in  std_logic;
            Q   : out std_logic
        );
    end component;

    signal clk : std_logic := '1';
    signal d   : std_logic := '0';
    signal q   : std_logic;
begin
    uut: d_ff_fe port map (
        CLK => clk,
        D   => d,
        Q   => q
    );

    -- Clock period T = 20 ns (falling edge a 0, 20, 40, 60, 80, 100, 120 ns)
    clock_proc: process
    begin
        clk <= not clk;
        wait for 10 ns;
    end process;

    -- Stessi stimoli di d_ff_tb per confrontare rising_edge vs falling_edge
    stim_proc: process
    begin
        d <= '0';
        wait for 15 ns;
        d <= '1';
        wait for 25 ns;
        d <= '0';
        wait for 25 ns;
        d <= '1';
        wait for 15 ns;
        d <= '0';
        wait for 40 ns;
        wait;
    end process;
end behavior;
