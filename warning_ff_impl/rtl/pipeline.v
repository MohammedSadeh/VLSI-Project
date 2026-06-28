//============================================================
// pipeline.v -- identical small pipeline, three FF variants.
//
//   input regs (plain DFF) -> 8-bit adder (logic under test)
//                          -> monitored register
//                          -> output reg -> q_out
//
// Only the monitored register changes between the three tops,
// so every PPA difference isolates the flip-flop overhead.
// The adder is the critical path; sweep CLK_PERIOD to push it
// toward (and past) its timing limit.
//============================================================

// ---- Baseline: plain DFF on the monitored register ----
module pipe_dff (
  input        clk,
  input        rst_n,
  input  [7:0] a,
  input  [7:0] b,
  output [7:0] q_out
);
  reg  [7:0] ra, rb, rc;
  wire [7:0] sum, mon_q;

  always @(posedge clk or negedge rst_n)
    if (!rst_n) {ra, rb} <= 16'b0; else {ra, rb} <= {a, b};

  assign sum = ra + rb;              // logic under test

  dff_cell #(.W(8)) u_mon (.clk(clk), .rst_n(rst_n), .d(sum), .q(mon_q));

  always @(posedge clk or negedge rst_n)
    if (!rst_n) rc <= 8'b0; else rc <= mon_q;
  assign q_out = rc;
endmodule

// ---- Razor on the monitored register ----
module pipe_razor (
  input        clk,
  input        clk_del,
  input        rst_n,
  input  [7:0] a,
  input  [7:0] b,
  output [7:0] q_out,
  output       error
);
  reg  [7:0] ra, rb, rc;
  wire [7:0] sum, mon_q;

  always @(posedge clk or negedge rst_n)
    if (!rst_n) {ra, rb} <= 16'b0; else {ra, rb} <= {a, b};

  assign sum = ra + rb;

  razor_cell #(.W(8)) u_mon (.clk(clk), .clk_del(clk_del), .rst_n(rst_n),
                             .d(sum), .q(mon_q), .error(error));

  always @(posedge clk or negedge rst_n)
    if (!rst_n) rc <= 8'b0; else rc <= mon_q;
  assign q_out = rc;
endmodule

// ---- Warning FF on the monitored register ----
module pipe_warning (
  input        clk,
  input        rst_n,
  input  [7:0] a,
  input  [7:0] b,
  output [7:0] q_out,
  output       warning
);
  reg  [7:0] ra, rb, rc;
  wire [7:0] sum, mon_q;

  always @(posedge clk or negedge rst_n)
    if (!rst_n) {ra, rb} <= 16'b0; else {ra, rb} <= {a, b};

  assign sum = ra + rb;

  warning_cell #(.W(8)) u_mon (.clk(clk), .rst_n(rst_n),
                               .d(sum), .q(mon_q), .warning(warning));

  always @(posedge clk or negedge rst_n)
    if (!rst_n) rc <= 8'b0; else rc <= mon_q;
  assign q_out = rc;
endmodule
