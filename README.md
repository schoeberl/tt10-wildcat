![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# Tiny Tapeout Wildcat

[Wildcat](https://github.com/schoeberl/wildcat) is an educational RISC-V core.
This tapeout contains the bare minimum: an assembler coded *blinking* LED
(In fact it counts up and displays the value on the 7-segment display).
No memory, no caches, no SPI based Flash (what was originally planned).

[GDS Viewer](https://gds-viewer.tinytapeout.com/?model=https://schoeberl.github.io/tt10-wildcat/tinytapeout.gds.gltf)

- [Read the documentation for project](docs/info.md)

You need RISC-V tools installed.

After checkout build with:
```
git submodule update --init --recursive
make
```

Generates the Verilog file for Tiny Tapeout (or for
tests in an FPGA). Pin definitions and top-level included
for the Basys 3 and Nexys A7 boards.