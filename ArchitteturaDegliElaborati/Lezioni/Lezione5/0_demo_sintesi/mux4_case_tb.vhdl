library ieee;
use ieee.std_logic_1164.all;

entity mux4_case_tb is
end mux4_case_tb;

architecture behavior of mux4_case_tb is
    component mux4_case
        port (
            a, b, c, d : in  std_logic;
            sel        : in  std_logic_vector(1 downto 0);
            u          : out std_logic
        );
    end component;

    signal a   : std_logic := '0';
    signal b   : std_logic := '1';
    signal c   : std_logic := '0';
    signal d   : std_logic := '1';
    signal sel : std_logic_vector(1 downto 0) := "00";
    signal u   : std_logic;
begin
    uut: mux4_case port map (
        a   => a,
        b   => b,
        c   => c,
        d   => d,
        sel => sel,
        u   => u
    );

    stim_proc: process
    begin
        sel <= "00"; wait for 10 ns;
        sel <= "01"; wait for 10 ns;
        sel <= "10"; wait for 10 ns;
        sel <= "11"; wait for 10 ns;
        wait;
    end process;
end behavior;
