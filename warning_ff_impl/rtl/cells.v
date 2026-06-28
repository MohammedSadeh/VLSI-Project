//============================================================
// cells.v -- flip-flop variants under comparison
//   1. dff_cell     : plain D flip-flop  (baseline)
//   2. razor_cell   : Razor FF, error-free-operation model
//   3. warning_cell : reference Warning FF  (REPLACE with yours
//                     if your module/port names differ)
//============================================================

// ---------- 1. Plain D flip-flop (baseline) ----------
module dff_cell #(parameter W = 8) (
  input              clk,
  input              rst_n,
  input  [W-1:0]     d,
  output reg [W-1:0] q
);
  always @(posedge clk or negedge rst_n)
    if (!rst_n) q <= {W{1'b0}};
    else        q <= d;
endmodule

// ---------- 2. Razor flip-flop (baseline #2) ----------
// Error-free-operation model: main DFF + shadow latch on a
// delayed clock + XOR comparator. This is the configuration
// Ernst et al. measured for the ~3% error-free overhead.
// The restore mux is omitted (it does not switch when there
// are no errors); add it if you want to model recovery power.
module razor_cell #(parameter W = 8) (
  input              clk,
  input              clk_del,   // delayed clock (half period)
  input              rst_n,
  input  [W-1:0]     d,
  output reg [W-1:0] q,
  output             error
);
  reg [W-1:0] shadow;
  always @(posedge clk or negedge rst_n)
    if (!rst_n) q <= {W{1'b0}};
    else        q <= d;

  // transparent-high shadow latch on the delayed clock
  always @(*)
    if (clk_del) shadow = d;

  assign error = |(q ^ shadow);
endmodule

// ---------- 3a. dont_touch delay element ----------
// LEN buffers in series. Preserved at synthesis with
// set_dont_touch (see dc/synth.tcl). NOTE: a short chain will
// NOT realize a true Delta in silicon -- the length must be
// characterized/sized to hit your target delay. This models
// the AREA and POWER of the delay element honestly; it does
// not by itself prove the warning TIMING (do that with a
// gate-level SDF timing sim).
module delay_line #(parameter LEN = 4) (
  input  in,
  output out
);
  wire [LEN:0] n;
  assign n[0] = in;
  genvar i;
  generate
    for (i = 0; i < LEN; i = i + 1) begin : dl
      buf u_b (n[i+1], n[i]);
    end
  endgenerate
  assign out = n[LEN];
endmodule

// ---------- 3b. cross-coupled NOR SR latch ----------
module sr_latch (
  input  s,        // set   = (T_p AND WD)
  input  r,        // reset = per-cycle clear
  output q
);
  wire qb;
  nor u_n0 (q,  r,  qb);
  nor u_n1 (qb, s,  q);
endmodule

// ---------- 3c. Warning flip-flop (reference) ----------
// Monitors the most timing-critical bit (MSB of the adder).
// Replace this whole module with your finalized warning_ff if
// your internals differ -- the pipeline top only needs the
// ports (clk, rst_n, d, q, warning).
module warning_cell #(parameter W = 8) (
  input              clk,
  input              rst_n,
  input  [W-1:0]     d,
  output reg [W-1:0] q,
  output             warning
);
  // main capture (a plain DFF -- data path is untouched)
  always @(posedge clk or negedge rst_n)
    if (!rst_n) q <= {W{1'b0}};
    else        q <= d;

  wire mon = d[W-1];                 // critical bit

  // transition detector: D xor delayed-D -> T_p pulse (width ~Delta)
  wire d_del;
  delay_line #(.LEN(4)) u_dl (.in(mon), .out(d_del));
  wire t_p = mon ^ d_del;

  // guard-window generator: CLK and NOT(delayed CLK) -> WD = [0, t_d]
  wire clk_del;
  delay_line #(.LEN(3)) u_wd (.in(clk), .out(clk_del));
  wire wd = clk & ~clk_del;

  // window sampler: SR latch set when T_p overlaps WD, cleared each cycle
  wire set_pulse = t_p & wd;
  wire clr       = ~clk;
  sr_latch u_sr (.s(set_pulse), .r(clr), .q(warning));
endmodule
