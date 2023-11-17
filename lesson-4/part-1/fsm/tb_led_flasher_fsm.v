`timescale 1ns / 1ps

module tb_led_flasher_fsm ();

reg r_clk_in;
reg r_rst_in;
reg r_tog_flash;
wire w_led_o;

// Instantiate DUT
led_flasher_fsm #(.FLASH_RATE_mHz(1000)) dut
(
	.clk_in(r_clk_in),
	.rst_in(r_rst_in),
	.toggle_flash(r_tog_flash),
	.led_out(w_led_o)
);

// Generate clock
initial begin
	r_clk_in <= 1'b0;
	forever #10 r_clk_in <= ~r_clk_in;
end

// Generate stimulus
initial begin
	#5
	r_rst_in <= 1'b1;
	#1
	r_rst_in <= 1'b0;
	r_tog_flash <= 1'b0;
	#20
	r_tog_flash <= 1'b1;
	#20
	r_tog_flash <= 1'b0;
	#1000
	r_tog_flash <= 1'b1;
	#20
	r_tog_flash <= 1'b0;
	#1000
	r_tog_flash <= 1'b1;
	#20
	r_tog_flash <= 1'b0;
	#1000
	r_tog_flash <= 1'b1;
	#20
	r_tog_flash <= 1'b0;
	#1000
	r_tog_flash <= 1'b1;
	#20
	r_tog_flash <= 1'b0;
	#1000
	r_tog_flash <= 1'b1;
	#20
	r_tog_flash <= 1'b0;
	#1000
	r_tog_flash <= 1'b1;
	#20
	r_tog_flash <= 1'b0;
end

// Dump file
initial begin
	$dumpfile("led_flasher_fsm.vcd");
	$dumpvars(0, dut);
end
endmodule
