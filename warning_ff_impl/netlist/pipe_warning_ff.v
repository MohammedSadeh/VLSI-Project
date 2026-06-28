/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09-SP5-5
// Date      : Sat Jun 27 22:17:46 2026
/////////////////////////////////////////////////////////////


module delay_line_LEN4 ( in, out );
  input in;
  output out;
  wire   in;
  assign out = in;

endmodule


module delay_line_LEN3 ( in, out );
  input in;
  output out;
  wire   in;
  assign out = in;

endmodule


module sr_latch ( s, r, q );
  input s, r;
  output q;
  wire   n1;

  INVX0_RVT U1 ( .A(r), .Y(n1) );
  OA21X1_RVT U2 ( .A1(q), .A2(s), .A3(n1), .Y(q) );
endmodule


module warning_cell_W8 ( clk, rst_n, d, q, warning );
  input [7:0] d;
  output [7:0] q;
  input clk, rst_n;
  output warning;
  wire   d_del, clk_del, set_pulse, n2, n4, n1, n5;

  delay_line_LEN4 u_dl ( .in(d[7]), .out(d_del) );
  delay_line_LEN3 u_wd ( .in(clk), .out(clk_del) );
  sr_latch u_sr ( .s(set_pulse), .r(n4), .q(warning) );
  DFFARX1_RVT \q_reg[6]  ( .D(d[6]), .CLK(clk), .RSTB(n5), .Q(q[6]) );
  DFFARX1_RVT \q_reg[5]  ( .D(d[5]), .CLK(clk), .RSTB(n5), .Q(q[5]) );
  DFFARX1_RVT \q_reg[4]  ( .D(d[4]), .CLK(clk), .RSTB(n5), .Q(q[4]) );
  DFFARX1_RVT \q_reg[3]  ( .D(d[3]), .CLK(clk), .RSTB(n5), .Q(q[3]) );
  DFFARX1_RVT \q_reg[2]  ( .D(d[2]), .CLK(clk), .RSTB(n5), .Q(q[2]) );
  DFFARX1_RVT \q_reg[1]  ( .D(d[1]), .CLK(clk), .RSTB(n5), .Q(q[1]) );
  DFFARX1_RVT \q_reg[0]  ( .D(d[0]), .CLK(clk), .RSTB(n5), .Q(q[0]) );
  INVX0_RVT U3 ( .A(clk), .Y(n4) );
  AOI21X2_RVT U5 ( .A1(d_del), .A2(d[7]), .A3(clk_del), .Y(n2) );
  OA221X1_RVT U6 ( .A1(1'b0), .A2(clk), .A3(d_del), .A4(d[7]), .A5(n2), .Y(
        set_pulse) );
  DFFASX1_RVT \q_reg[7]  ( .D(n1), .CLK(clk), .SETB(n5), .QN(q[7]) );
  INVX0_RVT U7 ( .A(d[7]), .Y(n1) );
  NBUFFX2_RVT U8 ( .A(rst_n), .Y(n5) );
endmodule


module pipe_warning ( clk, rst_n, a, b, q_out, warning );
  input [7:0] a;
  input [7:0] b;
  output [7:0] q_out;
  input clk, rst_n;
  output warning;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [7:0] ra;
  wire   [7:0] rb;
  wire   [7:0] sum;
  wire   [7:0] mon_q;

  warning_cell_W8 u_mon ( .clk(clk), .rst_n(n20), .d(sum), .q(mon_q), 
        .warning(warning) );
  DFFARX1_RVT \rb_reg[6]  ( .D(b[6]), .CLK(clk), .RSTB(n20), .Q(rb[6]) );
  DFFARX1_RVT \rb_reg[5]  ( .D(b[5]), .CLK(clk), .RSTB(n20), .Q(rb[5]) );
  DFFARX1_RVT \rb_reg[3]  ( .D(b[3]), .CLK(clk), .RSTB(n20), .Q(rb[3]) );
  DFFARX1_RVT \rb_reg[2]  ( .D(b[2]), .CLK(clk), .RSTB(n20), .Q(rb[2]) );
  DFFARX1_RVT \rb_reg[1]  ( .D(b[1]), .CLK(clk), .RSTB(n20), .Q(rb[1]) );
  DFFARX1_RVT \rc_reg[7]  ( .D(mon_q[7]), .CLK(clk), .RSTB(n20), .Q(q_out[7])
         );
  DFFARX1_RVT \rc_reg[6]  ( .D(mon_q[6]), .CLK(clk), .RSTB(n20), .Q(q_out[6])
         );
  DFFARX1_RVT \rc_reg[5]  ( .D(mon_q[5]), .CLK(clk), .RSTB(n20), .Q(q_out[5])
         );
  DFFARX1_RVT \rc_reg[4]  ( .D(mon_q[4]), .CLK(clk), .RSTB(n20), .Q(q_out[4])
         );
  DFFARX1_RVT \rc_reg[3]  ( .D(mon_q[3]), .CLK(clk), .RSTB(n20), .Q(q_out[3])
         );
  DFFARX1_RVT \rc_reg[2]  ( .D(mon_q[2]), .CLK(clk), .RSTB(n20), .Q(q_out[2])
         );
  DFFARX1_RVT \rc_reg[1]  ( .D(mon_q[1]), .CLK(clk), .RSTB(n20), .Q(q_out[1])
         );
  DFFARX1_RVT \rc_reg[0]  ( .D(mon_q[0]), .CLK(clk), .RSTB(n20), .Q(q_out[0])
         );
  DFFASX1_RVT \rb_reg[7]  ( .D(n19), .CLK(clk), .SETB(n20), .QN(rb[7]) );
  DFFASX1_RVT \ra_reg[7]  ( .D(n18), .CLK(clk), .SETB(n21), .QN(ra[7]) );
  DFFASX1_RVT \ra_reg[6]  ( .D(n17), .CLK(clk), .SETB(rst_n), .QN(ra[6]) );
  DFFASX1_RVT \ra_reg[5]  ( .D(n16), .CLK(clk), .SETB(rst_n), .QN(ra[5]) );
  DFFASX1_RVT \ra_reg[4]  ( .D(n15), .CLK(clk), .SETB(rst_n), .QN(ra[4]) );
  DFFASX1_RVT \rb_reg[4]  ( .D(n14), .CLK(clk), .SETB(n20), .QN(rb[4]) );
  DFFASX1_RVT \ra_reg[3]  ( .D(n13), .CLK(clk), .SETB(n21), .QN(ra[3]) );
  DFFASX1_RVT \ra_reg[2]  ( .D(n12), .CLK(clk), .SETB(rst_n), .QN(ra[2]) );
  DFFASX1_RVT \ra_reg[1]  ( .D(n11), .CLK(clk), .SETB(n21), .QN(ra[1]) );
  DFFASX1_RVT \ra_reg[0]  ( .D(n10), .CLK(clk), .SETB(rst_n), .QN(ra[0]) );
  DFFASX1_RVT \rb_reg[0]  ( .D(n9), .CLK(clk), .SETB(rst_n), .QN(rb[0]) );
  INVX0_RVT U4 ( .A(b[4]), .Y(n14) );
  INVX0_RVT U5 ( .A(b[0]), .Y(n9) );
  INVX0_RVT U6 ( .A(a[0]), .Y(n10) );
  INVX0_RVT U7 ( .A(a[1]), .Y(n11) );
  INVX0_RVT U8 ( .A(a[2]), .Y(n12) );
  INVX0_RVT U9 ( .A(a[3]), .Y(n13) );
  INVX0_RVT U10 ( .A(a[4]), .Y(n15) );
  INVX0_RVT U11 ( .A(a[5]), .Y(n16) );
  INVX0_RVT U12 ( .A(a[6]), .Y(n17) );
  INVX0_RVT U13 ( .A(a[7]), .Y(n18) );
  INVX0_RVT U14 ( .A(b[7]), .Y(n19) );
  FADDX1_RVT U15 ( .A(rb[4]), .B(ra[4]), .CI(n2), .CO(n6), .S(sum[4]) );
  FADDX1_RVT U16 ( .A(rb[3]), .B(ra[3]), .CI(n3), .CO(n2), .S(sum[3]) );
  FADDX1_RVT U17 ( .A(rb[2]), .B(ra[2]), .CI(n4), .CO(n3), .S(sum[2]) );
  FADDX1_RVT U18 ( .A(rb[1]), .B(ra[1]), .CI(n5), .CO(n4), .S(sum[1]) );
  HADDX1_RVT U19 ( .A0(rb[0]), .B0(ra[0]), .C1(n5), .SO(sum[0]) );
  FADDX1_RVT U20 ( .A(rb[5]), .B(ra[5]), .CI(n6), .CO(n7), .S(sum[5]) );
  FADDX1_RVT U21 ( .A(rb[6]), .B(ra[6]), .CI(n7), .CO(n8), .S(sum[6]) );
  FADDX1_RVT U22 ( .A(ra[7]), .B(n8), .CI(rb[7]), .S(sum[7]) );
  NBUFFX2_RVT U23 ( .A(rst_n), .Y(n21) );
  NBUFFX2_RVT U24 ( .A(n21), .Y(n20) );
endmodule

