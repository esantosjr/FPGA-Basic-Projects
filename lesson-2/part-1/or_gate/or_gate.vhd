library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
port (
	clk_in : in std_logic;
	or_in  : in std_logic_vector(5 downto 0);
	or_out : out std_logic	
     );
end or_gate;

architecture rtl of or_gate is
begin
	process(clk_in)
	begin
		if rising_edge(clk_in) then
			or_out <= or_in(5) or or_in(4) or or_in(3) or or_in(2) or or_in(1) or or_in(0);
		end if;
	end process;

end rtl;
