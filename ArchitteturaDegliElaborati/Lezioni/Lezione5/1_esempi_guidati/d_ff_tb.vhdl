library ieee;
use ieee.std_logic_1164.all;

entity d_ff_tb is
end d_ff_tb;

architecture behavior of d_ff_tb is
    component d_ff
        port (
            CLK : in  std_logic;
            D   : in  std_logic;
            Q   : out std_logic
        );
    end component;

    -- mod1/mod2: valori iniziali (clk parte da '1' cosi' a t=0 va a '0')
    signal clk : std_logic := '1';
    signal d   : std_logic := '0';
    signal q   : std_logic;
begin
    uut: d_ff port map (
        CLK => clk,
        D   => d,
        Q   => q
    );

    -- Processo di generazione del clock (periodo T = 20 ns)
    -- NB: sensitivity list VUOTA e nessun "wait;" finale!
    clock_proc: process
    begin
        clk <= not clk;
        wait for 10 ns;
    end process;

    -- Processo degli stimoli (durata complessiva = 120 ns)
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
