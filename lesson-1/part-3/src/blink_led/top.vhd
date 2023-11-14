---------------------------------------------------------------------------------------------------
-- libraries
---------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library UNISIM;
use UNISIM.VComponents.all;

---------------------------------------------------------------------------------------------------
-- entity declaration
---------------------------------------------------------------------------------------------------
entity toplevel is  
  port (
    -- Clock
    clk_in_n : in std_logic;
    clk_in_p : in std_logic;
    
    -- SoM LED
    led1_out : out std_logic
  );
end toplevel;

architecture rtl of toplevel is

---------------------------------------------------------------------------------------------------
-- signals
---------------------------------------------------------------------------------------------------
signal clk : std_logic;
signal led_status : std_logic;

constant END_COUNT_1S : integer := 100000000;
signal counter : integer range 0 to END_COUNT_1S-1;

begin

clk_single_ended : IBUFDS
port map (
    I => clk_in_p,
    IB => clk_in_n,
    O => clk
);

toggle_op : process (clk) is
begin
    if rising_edge (clk) then
        if (counter < END_COUNT_1S-1) then
            counter <= counter + 1;
        else
            counter <= 0;
            led_status <= not led_status;            
        end if;
    end if;
end process toggle_op;

led1_out <= led_status;

end rtl;
