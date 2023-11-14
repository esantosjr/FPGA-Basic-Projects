`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2023 09:35:22 AM
// Design Name: 
// Module Name: tb_or_gate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_or_gate();

reg r_clk_in;
reg [5:0] r_or_in;
wire z_or_out;

// Instantiate the or_gate component
or_gate dut
(
    .clk_in(r_clk_in),
    .or_in (r_or_in),
    .or_out(z_or_out)
);

initial begin // used to initiate variables, non-synthesizable
    // Clock generation
    r_clk_in <= 1'b0;
    forever #10 r_clk_in <= ~r_clk_in; // 10ns --> period of each semi-cycle. Thus clock is 50 MHz.
end

initial begin
    // Stimulus
    r_or_in <= 6'b000000;
    #20
    r_or_in <= 6'b000001;
    #20
    r_or_in <= 6'b000011;
    #20
    r_or_in <= 6'b000111;
    #20
    r_or_in <= 6'b001111;
    #20
    r_or_in <= 6'b011111;
    #20
    r_or_in <= 6'b111111;
end

initial begin
    // Dump results
    $dumpfile("or_gate.vcd");
    $dumpvars(0, dut);
    $monitor ("simtime = %g, r_or_in = %b, z_or_out = %b", $time, r_or_in, z_or_out);
end

endmodule
