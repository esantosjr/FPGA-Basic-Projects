VERILOG_FILES = led_flasher_fsm.v tb_led_flasher_fsm.v
OUT_FILE = led_flasher_fsm.vvp
WAVE_FILE = led_flasher_fsm.vcd

IVERILOG = iverilog
GTK_WAVE = gtkwave
RUN_SIM = vvp

all:
	$(IVERILOG) -o $(OUT_FILE) $(VERILOG_FILES)

run:
	$(RUN_SIM) $(OUT_FILE)

wave:
	$(GTK_WAVE) $(WAVE_FILE) 

clean:
	rm *.vcd *.vvp
