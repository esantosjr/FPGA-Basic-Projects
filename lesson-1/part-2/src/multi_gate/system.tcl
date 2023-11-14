set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN ENABLE [current_design]
 
# ----------------------------------------------------------------------------------
# Important! Do not remove this constraint!
# This property ensures that all unused pins are set to high impedance.
# If the constraint is removed, all unused pins have to be set to HiZ in the top level file.
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
# ----------------------------------------------------------------------------------

# Buttons
set_property -dict {PACKAGE_PIN AB15 IOSTANDARD LVCMOS33} [get_ports {btn0_in}]
set_property -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS33} [get_ports {btn1_in}]

set_property -dict {PACKAGE_PIN AB14 IOSTANDARD LVCMOS33} [get_ports {c_in}]
set_property -dict {PACKAGE_PIN W12 IOSTANDARD LVCMOS33} [get_ports {d_in}]

# SoM LEDs
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS18} [get_ports {led1_out}]
# set_property -dict {PACKAGE_PIN P9 IOSTANDARD LVCMOS18} [get_ports {led2_out}]
# set_property -dict {PACKAGE_PIN K5 IOSTANDARD LVCMOS18} [get_ports {led3_out}]

# PL_100_MHz_Oscillator
set_property -dict {PACKAGE_PIN AD4 IOSTANDARD DIFF_SSTL12_DCI} [get_ports {clk_in_n}]
set_property -dict {PACKAGE_PIN AD5 IOSTANDARD DIFF_SSTL12_DCI} [get_ports {clk_in_p}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_in_n]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_in_p]

# clocks timing constraints
# create_clock -period 10.000 [get_ports clk]
