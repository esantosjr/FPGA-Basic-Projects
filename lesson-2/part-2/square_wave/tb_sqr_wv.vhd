library ieee;
use ieee.std_logic_1164.all;

entity tb_sqr_wv is
end tb_sqr_wv;

architecture behavioral of tb_sqr_wv is
-- Define variables
constant clk_period_div_2 : time := 10 ns;
signal clk_sig		  : std_logic := '0';
signal sqr_wv_sig	  : std_logic := '0';
begin

-- Instantiate component
dut : entity work.sqr_wv
port map
(
	clk_in => clk_sig,
	square_wave_out => sqr_wv_sig
);

-- Generate clock
clk_gen: process
begin
	clk_sig <= '0';
	wait for clk_period_div_2;
	clk_sig <= '1';
	wait for clk_period_div_2;
end process;

-- Stimulus - not necessary for this design

end architecture behavioral;
