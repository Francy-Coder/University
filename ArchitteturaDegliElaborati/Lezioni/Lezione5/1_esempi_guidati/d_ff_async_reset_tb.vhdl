library ieee;
use ieee.std_logic_1164.all;

entity d_ff_async_reset_tb is
end d_ff_async_reset_tb;

architecture behavior of d_ff_async_reset_tb is
    component d_ff_async_reset
        port (
            CLK   : in  std_logic;
            RESET : in  std_logic;
            D     : in  std_logic;
            Q     : out std_logic
        );
    end component;

    signal clk   : std_logic := '1';
    signal reset : std_logic := '0';
    signal d     : std_logic := '0';
    signal q     : std_logic;
begin
    uut: d_ff_async_reset port map (
        CLK   => clk,
        RESET => reset,
        D     => d,
        Q     => q
    );

    -- Clock con periodo T = 20 ns (rising edge a 10, 30, 50, 70, 90, 110 ns)
    clock_proc: process
    begin
        clk <= not clk;
        wait for 10 ns;
    end process;

    -- Stessi identici stimoli del caso sincrono per confronto diretto!
    stim_proc: process
    begin
        -- 0..15 ns: D=0, RESET=0 (a 10ns -> Q='0')
        d <= '0'; reset <= '0';
        wait for 15 ns;
        -- 15..35 ns: D=1, RESET=0 (a 30ns -> Q='1')
        d <= '1'; reset <= '0';
        wait for 20 ns;
        -- 35..45 ns: RESET='1' fuori dal fronte -> Q va IMMEDIATAMENTE a '0'!
        d <= '1'; reset <= '1';
        wait for 10 ns;
        -- 45..65 ns: RESET='0' (a 50ns rising edge -> Q torna a '1')
        d <= '1'; reset <= '0';
        wait for 20 ns;
        -- 65..80 ns: RESET='1' a 65ns -> Q va IMMEDIATAMENTE a '0'!
        d <= '1'; reset <= '1';
        wait for 15 ns;
        -- 80..100 ns: RESET='0', D='1' (a 90ns -> Q torna a '1')
        d <= '1'; reset <= '0';
        wait for 20 ns;
        -- 100..120 ns: D='0' (a 110ns -> Q va a '0')
        d <= '0'; reset <= '0';
        wait for 20 ns;
        wait;
    end process;
end behavior;
