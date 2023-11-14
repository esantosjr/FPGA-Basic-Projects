// Toggle flash at configured rate when 'toggle_flash' is high

module led_flasher # (
	parameter FLASH_RATE_mHz = 1000 // default rate is 1 Hz
) 
(
	input clk_in,
	input toggle_flash,
	output reg led_out
);

// How many clock cycles are equivalent to the configured flash rate?
localparam FLASH_CYCLES = 50000000 / ((2*1000)/FLASH_RATE_mHz);
reg[26:0] counter;
reg led_state = 1'b0;
reg led_activated = 1'b0;

always @ (posedge clk_in)
begin
	if (toggle_flash == 1) begin
		led_activated <= ~led_activated;
		counter <= 0;
	end

	if (led_activated == 1) begin
		if (counter < 3) begin
			counter <= counter + 1;
		end else begin
			counter <= 0;
			led_state <= ~led_state; 
		end
	end else begin
		led_state <= 1'b0;
	end

	led_out <= led_state;
end

endmodule
