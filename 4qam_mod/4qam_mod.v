`timescale 1ns / 1ps

module qam4_mod(
    input  [1:0] input_bits,
    output signed [1:0] a_m1,
    output signed [1:0] a_m2
);

// Input bits -- Output symbol
// (00)       -- (-1, -1)
// (01)       -- (-1, +1)
// (11)       -- (+1, +1)
// (10)       -- (+1, -1)
assign a_m1 = (input_bits[1] == 0) ? -1 : +1;
assign a_m2 = (input_bits[0] == 0) ? -1 : +1;

endmodule
