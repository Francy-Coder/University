library ieee;
use ieee.std_logic_1164.all;

entity sr_latch_tb is
end sr_latch_tb;

architecture behavior of sr_latch_tb is
    component sr_latch
        port (
            S : in  std_logic;
            R : in  std_logic;
            Q : out std_logic
        );
    end component;

    signal S : std_logic := '0';
    signal R : std_logic := '0';
    signal Q : std_logic;
begin
    uut: sr_latch port map (
        S => S,
        R => R,
        Q => Q
    );

    stim_proc: process
    begin
        -- 0..1 ns: stato iniziale non definito ('U')
        S <= '0'; R <= '0'; wait for 1 ns;
        -- 1..2 ns: SET (Q -> '1')
        S <= '1'; R <= '0'; wait for 1 ns;
        -- 2..3 ns: Mantenimento (Q resta '1')
        S <= '0'; R <= '0'; wait for 1 ns;
        -- 3..4 ns: RESET (Q -> '0')
        S <= '0'; R <= '1'; wait for 1 ns;
        -- 4..5 ns: Mantenimento (Q resta '0')
        S <= '0'; R <= '0'; wait for 1 ns;
        -- 5..6 ns: SET (Q -> '1')
        S <= '1'; R <= '0'; wait for 1 ns;
        -- 6..7 ns: Mantenimento (Q resta '1')
        S <= '0'; R <= '0'; wait for 1 ns;
        -- 7..8 ns: RESET (Q -> '0')
        S <= '0'; R <= '1'; wait for 1 ns;
        -- 8..10 ns: Mantenimento (Q resta '0')
        S <= '0'; R <= '0'; wait for 2 ns;
        -- 10..11 ns: S=1 e R=1 contemporanei (priorita' a R -> Q='0')
        S <= '1'; R <= '1'; wait for 1 ns;
        -- 11..12 ns: Mantenimento
        S <= '0'; R <= '0'; wait for 1 ns;
        -- 12..13 ns: SET (Q -> '1')
        S <= '1'; R <= '0'; wait for 1 ns;
        -- 13..14 ns: R sale mentre S=1 (priorita' a R -> Q='0')
        S <= '1'; R <= '1'; wait for 1 ns;
        -- 14..15 ns: Ritorno a riposo
        S <= '0'; R <= '0'; wait for 1 ns;
        wait;
    end process;
end behavior;
