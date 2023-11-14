`timescale 1ns / 1ps

module tb_led_flasher ();

reg r_clk_in;
reg r_tog_flash;
wire w_led_o;

// Instantiate DUT
led_flasher #(.FLASH_RATE_mHz(1000)) dut
(
	.clk_in(r_clk_in),
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
end

// Dump file
initial begin
	$dumpfile("led_flasher.vcd");
	$dumpvars(0, dut);
end
endmodule
