`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2023 09:29:14 AM
// Design Name: 
// Module Name: or_gate
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

module or_gate (
    input clk_in,
    input [5:0] or_in,
    output reg or_out
    // output or_out
);

always @ (posedge clk_in)
begin 
	// assign or_out = or_in[5] | or_in[4] | or_in[3] | or_in[2] | or_in[1] | or_in[0];
	or_out <= or_in[5] | or_in[4] | or_in[3] | or_in[2] | or_in[1] | or_in[0]; 
end
endmodule
