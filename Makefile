
# Test the Chisel design
run-test:
	sbt test

# generate the Verilog
run-verilog:
	sbt run

# Configure the Basys3 with open source tools

config:
	openocd -f 7series.txt
