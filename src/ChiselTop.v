module ChiselTop(
  input        clock,
  input        reset,
  input  [7:0] io_ui_in,
  output [7:0] io_uo_out,
  input  [7:0] io_uio_in,
  output [7:0] io_uio_out,
  output [7:0] io_uio_oe
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [7:0] _add_T_1 = io_ui_in + io_uio_in; // @[ChiselTop.scala 21:19]
  reg [31:0] cntReg; // @[ChiselTop.scala 24:23]
  reg  ledReg; // @[ChiselTop.scala 25:23]
  wire [31:0] _cntReg_T_1 = cntReg + 32'h1; // @[ChiselTop.scala 26:20]
  wire [6:0] add = _add_T_1[6:0]; // @[ChiselTop.scala 20:24 21:7]
  assign io_uo_out = {ledReg,add}; // @[ChiselTop.scala 31:23]
  assign io_uio_out = 8'h0; // @[ChiselTop.scala 16:14]
  assign io_uio_oe = 8'h0; // @[ChiselTop.scala 18:13]
  always @(posedge clock) begin
    if (reset) begin // @[ChiselTop.scala 24:23]
      cntReg <= 32'h0; // @[ChiselTop.scala 24:23]
    end else if (cntReg == 32'h17d7840) begin // @[ChiselTop.scala 27:32]
      cntReg <= 32'h0; // @[ChiselTop.scala 28:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[ChiselTop.scala 26:10]
    end
    if (reset) begin // @[ChiselTop.scala 25:23]
      ledReg <= 1'h0; // @[ChiselTop.scala 25:23]
    end else if (cntReg == 32'h17d7840) begin // @[ChiselTop.scala 27:32]
      ledReg <= ~ledReg; // @[ChiselTop.scala 29:12]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  ledReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
