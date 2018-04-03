FPGA_ARCH=synth_ice40
PROJECT=hello-world

all: $(PROJECT).bitstream

%.blif : %.v
	yosys -q -p "$(FPGA_ARCH) -top main -blif $@" $^

%.asc : %.pcf %.blif
	arachne-pnr -q -d 1k -P tq144 -o $@ -p $^

%.bitstream : %.asc
	icepack $< $@

flash: $(PROJECT).bitstream
	iceprog	$<

clean:
	rm -f $(PROJECT).blif $(PROJECT).asc $(PROJECT).bitstream
