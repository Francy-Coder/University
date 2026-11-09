library ieee;
use ieee.std_logic_1164.all;

entity d_ff_fe_sync_reset_tb is
end d_ff_fe_sync_reset_tb;

architecture behavior of d_ff_fe_sync_reset_tb is
    component d_ff_fe_sync_reset
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
    uut: d_ff_fe_sync_reset port map (
        CLK   => clk,
        RESET => reset,
        D     => d,
        Q     => q
    );

    -- Clock period T = 20 ns
    -- Rising edge: 10, 30, 50, 70, 90, 110 ns
    -- Falling edge: 0, 20, 40, 60, 80, 100, 120 ns
    clock_proc: process
    begin
        clk <= not clk;
        wait for 10 ns;
    end process;

    -- Stimoli progettati per testare RESET su:
    -- 1) Fronte di salita (30 ns) -> deve essere IGNORATO
    -- 2) Fuori dai fronti (43..48 ns) -> deve essere IGNORATO
    -- 3) Fronte di discesa (60 ns) -> deve AZZERARE Q!
    stim_proc: process
    begin
        -- 0..15 ns: D=0, RESET=0
        d <= '0'; reset <= '0';
        wait for 15 ns;
        -- 15..25 ns: D=1 (al falling edge di 20ns -> Q va a '1')
        d <= '1'; reset <= '0';
        wait for 10 ns;
        -- 25..35 ns: RESET='1' sul RISING EDGE di 30ns -> IGNORATO (Q resta '1')
        d <= '1'; reset <= '1';
        wait for 10 ns;
        -- 35..43 ns: RESET='0' (al falling edge di 40ns -> Q resta '1')
        d <= '1'; reset <= '0';
        wait for 8 ns;
        -- 43..48 ns: Impulso di RESET lontano dai fronti -> IGNORATO (Q resta '1')
        d <= '1'; reset <= '1';
        wait for 5 ns;
        -- 48..55 ns: RESET='0' (attraversa il rising edge di 50ns)
        d <= '1'; reset <= '0';
        wait for 7 ns;
        -- 55..65 ns: RESET='1' sul FALLING EDGE di 60ns -> ATTIVO! Q va a '0'!
        d <= '1'; reset <= '1';
        wait for 10 ns;
        -- 65..85 ns: RESET='0', D='1' (al falling edge di 80ns -> Q torna a '1')
        d <= '1'; reset <= '0';
        wait for 20 ns;
        -- 85..120 ns: D='0' (al falling edge di 100ns -> Q va a '0')
        d <= '0'; reset <= '0';
        wait for 35 ns;
        wait;
    end process;
end behavior;
