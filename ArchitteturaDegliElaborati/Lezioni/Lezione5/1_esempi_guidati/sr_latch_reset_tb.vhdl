library ieee;
use ieee.std_logic_1164.all;

entity sr_latch_reset_tb is
end sr_latch_reset_tb;

architecture behavior of sr_latch_reset_tb is
    component sr_latch_reset
        port (
            S   : in  std_logic;
            R   : in  std_logic;
            CLR : in  std_logic;
            Q   : out std_logic
        );
    end component;

    signal S   : std_logic := '0';
    signal R   : std_logic := '0';
    signal CLR : std_logic := '0';
    signal Q   : std_logic;
begin
    uut: sr_latch_reset port map (
        S   => S,
        R   => R,
        CLR => CLR,
        Q   => Q
    );

    stim_proc: process
    begin
        -- 0..1 ns: riposo iniziale
        S <= '0'; R <= '0'; CLR <= '0'; wait for 1 ns;
        -- 1..2 ns: SET (Q -> '1')
        S <= '1'; R <= '0'; CLR <= '0'; wait for 1 ns;
        -- 2..4 ns: Mantenimento (Q resta '1')
        S <= '0'; R <= '0'; CLR <= '0'; wait for 2 ns;
        -- 4..5 ns: RESET (Q -> '0')
        S <= '0'; R <= '1'; CLR <= '0'; wait for 1 ns;
        -- 5..7 ns: Mantenimento (Q resta '0')
        S <= '0'; R <= '0'; CLR <= '0'; wait for 2 ns;
        -- 7..8 ns: SET (Q -> '1')
        S <= '1'; R <= '0'; CLR <= '0'; wait for 1 ns;
        -- 8..9 ns: Mantenimento (Q resta '1')
        S <= '0'; R <= '0'; CLR <= '0'; wait for 1 ns;
        -- 9..11 ns: CLR asincrono attivo (Q -> '0')
        S <= '0'; R <= '0'; CLR <= '1'; wait for 2 ns;
        -- 11..12 ns: CLR=0, SET=1 (Q -> '1')
        S <= '1'; R <= '0'; CLR <= '0'; wait for 1 ns;
        -- 12..13 ns: Mantenimento (Q resta '1')
        S <= '0'; R <= '0'; CLR <= '0'; wait for 1 ns;
        -- 13..14 ns: S=1 e CLR=1 insieme (CLR ha priorita' -> Q='0')
        S <= '1'; R <= '0'; CLR <= '1'; wait for 1 ns;
        -- 14..15 ns: Riposo finale
        S <= '0'; R <= '0'; CLR <= '0'; wait for 1 ns;
        wait;
    end process;
end behavior;
