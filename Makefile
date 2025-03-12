blink:
	make -C wildcat app APP=asm/apps/blink.s
	sbt "runMain ChiselTop"

# Test the Chisel design
run-test:
	sbt test

# generate the Verilog
run-verilog:
	sbt run


openlane:
	openlane openlane.json
	openlane --last-run --flow openinklayout openlane.json

synth:
	./wildcat/vivado_synth.sh -t basys3_top -p xc7a100tcsg324-1 -x nexysA7.xdc -o build src/basys3_top.v src/tt_um_schoeberl_wildcat.v src/ChiselTop.v

cp-bit:
	scp masca@chipdesign1.compute.dtu.dk:~/tt10-wildcat/build/basys3_top.bit .

# Configure the Basys3 or NexysA7 with open source tools

config:
	openocd -f 7series.txt
