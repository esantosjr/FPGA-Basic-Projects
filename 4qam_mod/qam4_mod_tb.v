`timescale 1ns / 1ps

module qam4_mod_tb;

reg clk;
reg reset;
reg [1:0] bits_to_send;
parameter clk_period = 10; // 10ns period

// Generates reset signal after 2 periods of clock
initial
    begin
        reset = 1'b1;
        #(2*clk_period)
        reset = 1'b0;
    end

// Generates clock of 100 MHz for simulation
initial clk = 1'b1;
always #(clk_period/2) clk = ~clk;

always @(posedge clk or negedge reset) begin
    if (reset == 1) begin
        bits_to_send  <= 'd0;
    end else if (clk == 1) begin
        bits_to_send  <= bits_to_send + 'd1;
    end
end

qam4_mod qam4_mapper(
    .input_bits(bits_to_send),
    .a_m1(),
    .a_m2()
);

endmodule
