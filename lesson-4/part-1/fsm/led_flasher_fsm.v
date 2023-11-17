// Toggle flash at configured rate when 'toggle_flash' is high
// Implements the logic using a Moore Finite State Machine

module led_flasher_fsm # (
	parameter FLASH_RATE_mHz = 1000 // default rate is 1 Hz
) 
(
	input clk_in,
	input rst_in, // Synchronous reset
	input toggle_flash,
	output reg led_out
);

// How many clock cycles are equivalent to the configured flash rate?
localparam FLASH_CYCLES = 50000000 / ((2*1000)/FLASH_RATE_mHz);
reg[26:0] counter;
reg led_state = 1'b0;

localparam STATE_SIZE = 2;

localparam RESET_STATE = 0,
		   LED_ENABLED = 1,
		   LED_DISABLED = 2;

reg [STATE_SIZE-1:0] next_state, curr_state;

always @ (posedge clk_in)
begin
	if (rst_in) begin
		curr_state <= RESET_STATE;
	end else begin
		curr_state <= next_state;
	end
end

always @ (posedge clk_in)
begin
	if (toggle_flash == 1) begin		
		if (curr_state == LED_DISABLED) begin		
			next_state <= LED_ENABLED;
			counter <= 0;
		end else begin
			next_state <= LED_DISABLED;
		end
	end
end

always @ (posedge clk_in)
begin
	case (curr_state)
		RESET_STATE : begin
			counter <= 0;
		end

		LED_ENABLED : begin
			if (counter < 3) begin
				counter <= counter + 1;
			end else begin
				counter <= 0;
				led_state <= ~led_state; 
			end
		end

		LED_DISABLED : begin
			led_state <= 1'b0;
		end
	endcase

	led_out <= led_state;
end

endmodule
