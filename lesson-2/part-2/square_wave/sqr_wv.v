// Generates a 5 MHz square wave given a 50 MHz clock input.

module sqr_wv (
	input clk_in, // input clock of 50 MHz
	output reg square_wave // output is a square wave of 5 MHz
);

// Define registers and signals
reg[3:0] counter;
reg clk_reg = 1'b0;

always @ (posedge clk_in)
begin
	// Count for 10 clock cycles
	if (counter < 4) begin
		counter <= counter + 1;
	end else begin
		counter <= 0;
		clk_reg <= ~clk_reg;
	end
	square_wave <= clk_reg;
end

endmodule
