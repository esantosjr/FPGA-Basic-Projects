library ieee;
use ieee.std_logic_1164.all;

entity sqr_wv is
port (
	clk_in: in std_logic;
	square_wave_out: out std_logic
     );
end sqr_wv;

architecture rtl of sqr_wv is
signal clk_reg : std_logic := '0';
-- signal count   : std_logic_vector(2 downto 0) := (others => '0');
signal count   : integer range 0 to 4;

begin
	process(clk_in)
	begin
		if rising_edge(clk_in) then
			if (count < 4) then
				count <= count+1;
			else
				count <= 0;
				clk_reg <= not clk_reg;
			end if;
		end if;
		square_wave_out <= clk_reg;
	end process;

end rtl;
