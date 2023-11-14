`timescale 1ns / 1ps

module tb_sqr_wv();

// Define signals and registers
reg r_clk_in;
wire sqr_wv_out;

// Instantiate model
sqr_wv dut
(
	.clk_in(r_clk_in),
	.square_wave(sqr_wv_out)
);

// Generate clock
initial begin
	r_clk_in <= 1'b0;
	forever #10 r_clk_in <= ~r_clk_in; // Generates 50 MHz clock (10ns each semi-ycle)
end

// Generate stimulus: not necessary for this design

// Dump file
initial begin
	$dumpfile("sqr_wv.vcd");
	$dumpvars(0, dut);
end

endmodule
