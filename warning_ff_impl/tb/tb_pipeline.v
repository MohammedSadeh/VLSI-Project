//`timescale 1ns/1ps
//============================================================
// tb_pipeline.v -- functional verification of pipe_warning.
// A reference model mirrors the pipeline exactly, so any
// datapath bug is flagged automatically. The warning signal
// is logged (its TIMING correctness is verified later with a
// gate-level SDF sim -- pure RTL has no real delays).
//============================================================
module tb_pipeline;

  reg        clk = 1'b0;
  reg        rst_n = 1'b0;
  reg  [7:0] a = 8'b0;
  reg  [7:0] b = 8'b0;
  wire [7:0] q_out;
  wire       warning;

  // DUT
  pipe_warning dut (.clk(clk), .rst_n(rst_n),
                    .a(a), .b(b), .q_out(q_out), .warning(warning));

  // 1 ns clock
  always #0.5 clk = ~clk;

  // ---- reference model: exact structural mirror of pipe_warning ----
  reg [7:0] m_ra, m_rb, m_mon, m_rc;
  always @(posedge clk or negedge rst_n)
    if (!rst_n) begin
      m_ra <= 8'b0; m_rb <= 8'b0; m_mon <= 8'b0; m_rc <= 8'b0;
    end else begin
      m_ra  <= a;
      m_rb  <= b;
      m_mon <= m_ra + m_rb;
      m_rc  <= m_mon;
    end

  integer i, errors = 0;

  // self-check
  always @(posedge clk)
    if (rst_n) begin
      if (q_out !== m_rc) begin
        $display("MISMATCH t=%0t  expected=%h  got=%h", $time, m_rc, q_out);
        errors = errors + 1;
      end
    end

  initial begin
    $dumpfile("pipe.vcd");
    $dumpvars(0, tb_pipeline);

    rst_n = 1'b0; a = 8'b0; b = 8'b0;
    repeat (2) @(posedge clk);
    rst_n = 1'b1;

    // drive 50 random vectors
    for (i = 0; i < 50; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
    end

    repeat (5) @(posedge clk);
    if (errors == 0) $display("PASS: pipeline datapath verified, 0 mismatches.");
    else             $display("FAIL: %0d mismatches.", errors);
    $finish;
  end

endmodule
