
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
	./wildcat/vivado_synth.sh -t tt_um_schoeberl_wildcat -p xc7a100tcsg324-1 -x nexysA7.xdc -o build src/tt_um_schoeberl_wildcat.v src/ChiselTop.v

# Configure the Basys3 or NexysA7 with open source tools

config:
	openocd -f 7series.txt
