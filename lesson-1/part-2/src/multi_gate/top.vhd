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
  
    -- BUTTONS
    btn0_in : in std_logic; -- a_in
    btn1_in : in std_logic; -- b_in
    c_in    : in std_logic;
    d_in    : in std_logic;
    
    -- SoM LED
    led1_out : out std_logic
  );
end toplevel;

architecture rtl of toplevel is

---------------------------------------------------------------------------------------------------
-- signals
---------------------------------------------------------------------------------------------------
signal clk : std_logic;

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
        led1_out <= (btn0_in and btn1_in and c_in) or d_in ;
    end if;
end process toggle_op;

end rtl;
