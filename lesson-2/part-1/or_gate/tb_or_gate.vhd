library ieee;
use ieee.std_logic_1164.all;

entity tb_or_gate is
end tb_or_gate;

architecture behavioral of tb_or_gate is
-- Defining the signals
constant clk_period_div_2 : time := 10 ns;
signal clk_sig		  : std_logic := '0';
signal or_in_sig	  : std_logic_vector(5 downto 0) := (others => '0');
signal or_out_sig	  : std_logic := '0';

begin

-- Instantiate the or_gate component
dut : entity work.or_gate
port map
(
	clk_in => clk_sig,
	or_in => or_in_sig,
	or_out => or_out_sig
);

-- Generate clock
clk_gen: process
begin
	clk_sig <= '0';
	wait for clk_period_div_2;
	clk_sig <= '1';
	wait for clk_period_div_2;
end process;

-- Generate stimulus
stimulus: process
begin
	or_in_sig <= (others => '0');
	wait for 2*clk_period_div_2;
	or_in_sig <= "000001";
	wait for 2*clk_period_div_2;
        or_in_sig <= "000011";
	wait for 2*clk_period_div_2;
        or_in_sig <= "000111";
	wait for 2*clk_period_div_2;
        or_in_sig <= "001111";
	wait for 2*clk_period_div_2;
        or_in_sig <= "011111";
	wait for 2*clk_period_div_2;
        or_in_sig <= "111111";
	wait for 2*clk_period_div_2;
end process;

end architecture behavioral;
