library ieee;
use ieee.std_logic_1164.all;

entity mux4_case is
    port (
        a, b, c, d : in  std_logic;
        sel        : in  std_logic_vector(1 downto 0);
        u          : out std_logic
    );
end mux4_case;

architecture rtl of mux4_case is
begin
    mux_proc: process(a, b, c, d, sel)
    begin
        case sel is
            when "00" =>
                u <= a;
            when "01" =>
                u <= b;
            when "10" =>
                u <= c;
            when "11" =>
                u <= d;
            when others =>
                u <= 'X';
        end case;
    end process;
end rtl;
