library ieee;
use ieee.std_logic_1164.all;

entity d_ff_sync_reset_tb is
end d_ff_sync_reset_tb;

architecture behavior of d_ff_sync_reset_tb is
    component d_ff_sync_reset
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
    uut: d_ff_sync_reset port map (
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

    -- Stimoli su D e RESET (120 ns totali)
    stim_proc: process
    begin
        -- 0..15 ns: D=0, RESET=0 (al rising edge di 10ns -> Q='0')
        d <= '0'; reset <= '0';
        wait for 15 ns;
        -- 15..35 ns: D=1, RESET=0 (al rising edge di 30ns -> Q='1')
        d <= '1'; reset <= '0';
        wait for 20 ns;
        -- 35..45 ns: impulso di RESET fuori dal rising edge -> IGNORATO!
        d <= '1'; reset <= '1';
        wait for 10 ns;
        -- 45..65 ns: RESET torna a '0' (al rising edge di 50ns -> Q resta '1')
        d <= '1'; reset <= '0';
        wait for 20 ns;
        -- 65..80 ns: RESET='1' durante il rising edge di 70ns -> Q va a '0'!
        d <= '1'; reset <= '1';
        wait for 15 ns;
        -- 80..100 ns: RESET='0', D='1' (al rising edge di 90ns -> Q torna a '1')
        d <= '1'; reset <= '0';
        wait for 20 ns;
        -- 100..120 ns: D='0' (al rising edge di 110ns -> Q va a '0')
        d <= '0'; reset <= '0';
        wait for 20 ns;
        wait;
    end process;
end behavior;
