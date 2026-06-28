/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09-SP5-5
// Date      : Sat Jun 27 22:15:44 2026
/////////////////////////////////////////////////////////////


module razor_cell_W8 ( clk, clk_del, rst_n, d, q, error );
  input [7:0] d;
  output [7:0] q;
  input clk, clk_del, rst_n;
  output error;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31;
  wire   [7:0] shadow;

  DFFARX1_RVT \q_reg[7]  ( .D(d[7]), .CLK(clk), .RSTB(n31), .Q(q[7]) );
  DFFARX1_RVT \q_reg[6]  ( .D(d[6]), .CLK(clk), .RSTB(n31), .Q(q[6]) );
  DFFARX1_RVT \q_reg[5]  ( .D(d[5]), .CLK(clk), .RSTB(n31), .Q(q[5]) );
  DFFARX1_RVT \q_reg[4]  ( .D(d[4]), .CLK(clk), .RSTB(n31), .Q(q[4]), .QN(n4)
         );
  DFFARX1_RVT \q_reg[3]  ( .D(d[3]), .CLK(clk), .RSTB(n31), .Q(q[3]), .QN(n28)
         );
  DFFARX1_RVT \q_reg[2]  ( .D(d[2]), .CLK(clk), .RSTB(n31), .Q(q[2]) );
  DFFARX1_RVT \q_reg[1]  ( .D(d[1]), .CLK(clk), .RSTB(n31), .Q(q[1]), .QN(n29)
         );
  DFFARX1_RVT \q_reg[0]  ( .D(d[0]), .CLK(clk), .RSTB(n31), .Q(q[0]), .QN(n30)
         );
  LATCHX1_RVT \shadow_reg[4]  ( .CLK(clk_del), .D(d[4]), .Q(shadow[4]) );
  LATCHX1_RVT \shadow_reg[2]  ( .CLK(clk_del), .D(d[2]), .Q(shadow[2]) );
  LATCHX1_RVT \shadow_reg[1]  ( .CLK(clk_del), .D(d[1]), .Q(shadow[1]) );
  LATCHX1_RVT \shadow_reg[0]  ( .CLK(clk_del), .D(d[0]), .Q(shadow[0]) );
  LNANDX1_RVT \shadow_reg[3]  ( .RIN(n13), .SIN(n6), .QN(n5) );
  LNANDX1_RVT \shadow_reg[5]  ( .RIN(n11), .SIN(n9), .QN(n3) );
  LNANDX1_RVT \shadow_reg[6]  ( .RIN(n10), .SIN(n8), .QN(n1) );
  LNANDX1_RVT \shadow_reg[7]  ( .RIN(n12), .SIN(n7), .QN(n2) );
  XOR2X1_RVT U3 ( .A1(shadow[0]), .A2(n30), .Y(n26) );
  XNOR2X1_RVT U4 ( .A1(n5), .A2(n28), .Y(n23) );
  XOR2X1_RVT U5 ( .A1(shadow[1]), .A2(n29), .Y(n24) );
  NBUFFX2_RVT U6 ( .A(rst_n), .Y(n31) );
  INVX1_RVT U7 ( .A(d[7]), .Y(n14) );
  INVX0_RVT U8 ( .A(d[6]), .Y(n15) );
  INVX0_RVT U9 ( .A(d[5]), .Y(n16) );
  INVX0_RVT U10 ( .A(d[3]), .Y(n17) );
  XOR2X1_RVT U11 ( .A1(shadow[4]), .A2(n4), .Y(n20) );
  NAND2X0_RVT U12 ( .A1(clk_del), .A2(n17), .Y(n6) );
  NAND2X0_RVT U13 ( .A1(clk_del), .A2(n14), .Y(n7) );
  NAND2X0_RVT U14 ( .A1(clk_del), .A2(n15), .Y(n8) );
  NAND2X0_RVT U15 ( .A1(clk_del), .A2(n16), .Y(n9) );
  NAND2X0_RVT U16 ( .A1(d[6]), .A2(clk_del), .Y(n10) );
  NAND2X0_RVT U17 ( .A1(d[5]), .A2(clk_del), .Y(n11) );
  NAND2X0_RVT U18 ( .A1(d[7]), .A2(clk_del), .Y(n12) );
  NAND2X0_RVT U19 ( .A1(d[3]), .A2(clk_del), .Y(n13) );
  NOR2X0_RVT U20 ( .A1(n23), .A2(n22), .Y(n25) );
  XNOR2X1_RVT U21 ( .A1(n3), .A2(q[5]), .Y(n21) );
  XNOR2X1_RVT U22 ( .A1(n1), .A2(q[6]), .Y(n19) );
  XNOR2X1_RVT U23 ( .A1(n2), .A2(q[7]), .Y(n18) );
  AND4X1_RVT U24 ( .A1(n20), .A2(n21), .A3(n19), .A4(n18), .Y(n27) );
  XOR2X1_RVT U25 ( .A1(shadow[2]), .A2(q[2]), .Y(n22) );
  NAND4X0_RVT U26 ( .A1(n27), .A2(n26), .A3(n25), .A4(n24), .Y(error) );
endmodule


module pipe_razor ( clk, clk_del, rst_n, a, b, q_out, error );
  input [7:0] a;
  input [7:0] b;
  output [7:0] q_out;
  input clk, clk_del, rst_n;
  output error;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [7:0] ra;
  wire   [7:0] rb;
  wire   [7:0] sum;
  wire   [7:0] mon_q;

  razor_cell_W8 u_mon ( .clk(clk), .clk_del(clk_del), .rst_n(n9), .d(sum), .q(
        mon_q), .error(error) );
  DFFARX1_RVT \ra_reg[7]  ( .D(a[7]), .CLK(clk), .RSTB(n9), .Q(ra[7]) );
  DFFARX1_RVT \ra_reg[6]  ( .D(a[6]), .CLK(clk), .RSTB(rst_n), .Q(ra[6]) );
  DFFARX1_RVT \ra_reg[5]  ( .D(a[5]), .CLK(clk), .RSTB(rst_n), .Q(ra[5]) );
  DFFARX1_RVT \ra_reg[4]  ( .D(a[4]), .CLK(clk), .RSTB(rst_n), .Q(ra[4]) );
  DFFARX1_RVT \ra_reg[3]  ( .D(a[3]), .CLK(clk), .RSTB(n10), .Q(ra[3]) );
  DFFARX1_RVT \ra_reg[2]  ( .D(a[2]), .CLK(clk), .RSTB(rst_n), .Q(ra[2]) );
  DFFARX1_RVT \ra_reg[1]  ( .D(a[1]), .CLK(clk), .RSTB(n10), .Q(ra[1]) );
  DFFARX1_RVT \rb_reg[7]  ( .D(b[7]), .CLK(clk), .RSTB(rst_n), .Q(rb[7]) );
  DFFARX1_RVT \rb_reg[6]  ( .D(b[6]), .CLK(clk), .RSTB(n9), .Q(rb[6]) );
  DFFARX1_RVT \rb_reg[5]  ( .D(b[5]), .CLK(clk), .RSTB(n9), .Q(rb[5]) );
  DFFARX1_RVT \rb_reg[4]  ( .D(b[4]), .CLK(clk), .RSTB(n9), .Q(rb[4]) );
  DFFARX1_RVT \rb_reg[3]  ( .D(b[3]), .CLK(clk), .RSTB(n9), .Q(rb[3]) );
  DFFARX1_RVT \rb_reg[2]  ( .D(b[2]), .CLK(clk), .RSTB(n9), .Q(rb[2]) );
  DFFARX1_RVT \rb_reg[1]  ( .D(b[1]), .CLK(clk), .RSTB(n9), .Q(rb[1]) );
  DFFARX1_RVT \rc_reg[7]  ( .D(mon_q[7]), .CLK(clk), .RSTB(n9), .Q(q_out[7])
         );
  DFFARX1_RVT \rc_reg[6]  ( .D(mon_q[6]), .CLK(clk), .RSTB(n9), .Q(q_out[6])
         );
  DFFARX1_RVT \rc_reg[5]  ( .D(mon_q[5]), .CLK(clk), .RSTB(n9), .Q(q_out[5])
         );
  DFFARX1_RVT \rc_reg[4]  ( .D(mon_q[4]), .CLK(clk), .RSTB(n9), .Q(q_out[4])
         );
  DFFARX1_RVT \rc_reg[3]  ( .D(mon_q[3]), .CLK(clk), .RSTB(n9), .Q(q_out[3])
         );
  DFFARX1_RVT \rc_reg[2]  ( .D(mon_q[2]), .CLK(clk), .RSTB(n9), .Q(q_out[2])
         );
  DFFARX1_RVT \rc_reg[1]  ( .D(mon_q[1]), .CLK(clk), .RSTB(n9), .Q(q_out[1])
         );
  DFFARX1_RVT \rc_reg[0]  ( .D(mon_q[0]), .CLK(clk), .RSTB(n9), .Q(q_out[0])
         );
  DFFARX1_RVT \rb_reg[0]  ( .D(b[0]), .CLK(clk), .RSTB(n10), .Q(rb[0]) );
  DFFARX1_RVT \ra_reg[0]  ( .D(a[0]), .CLK(clk), .RSTB(rst_n), .Q(ra[0]) );
  NBUFFX4_RVT U4 ( .A(n10), .Y(n9) );
  HADDX2_RVT U5 ( .A0(rb[0]), .B0(ra[0]), .C1(n8), .SO(sum[0]) );
  NBUFFX2_RVT U6 ( .A(rst_n), .Y(n10) );
  XOR3X1_RVT U7 ( .A1(rb[7]), .A2(ra[7]), .A3(n2), .Y(sum[7]) );
  FADDX1_RVT U8 ( .A(rb[6]), .B(ra[6]), .CI(n3), .CO(n2), .S(sum[6]) );
  FADDX1_RVT U9 ( .A(rb[5]), .B(ra[5]), .CI(n4), .CO(n3), .S(sum[5]) );
  FADDX1_RVT U10 ( .A(rb[4]), .B(ra[4]), .CI(n5), .CO(n4), .S(sum[4]) );
  FADDX1_RVT U11 ( .A(rb[3]), .B(ra[3]), .CI(n6), .CO(n5), .S(sum[3]) );
  FADDX1_RVT U12 ( .A(rb[2]), .B(ra[2]), .CI(n7), .CO(n6), .S(sum[2]) );
  FADDX1_RVT U13 ( .A(rb[1]), .B(ra[1]), .CI(n8), .CO(n7), .S(sum[1]) );
endmodule

