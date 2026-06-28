/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09-SP5-5
// Date      : Sat Jun 27 22:12:51 2026
/////////////////////////////////////////////////////////////


module dff_cell_W8 ( clk, rst_n, d, q );
  input [7:0] d;
  output [7:0] q;
  input clk, rst_n;
  wire   n1;

  DFFARX1_RVT \q_reg[7]  ( .D(d[7]), .CLK(clk), .RSTB(n1), .Q(q[7]) );
  DFFARX1_RVT \q_reg[6]  ( .D(d[6]), .CLK(clk), .RSTB(n1), .Q(q[6]) );
  DFFARX1_RVT \q_reg[5]  ( .D(d[5]), .CLK(clk), .RSTB(n1), .Q(q[5]) );
  DFFARX1_RVT \q_reg[4]  ( .D(d[4]), .CLK(clk), .RSTB(n1), .Q(q[4]) );
  DFFARX1_RVT \q_reg[3]  ( .D(d[3]), .CLK(clk), .RSTB(n1), .Q(q[3]) );
  DFFARX1_RVT \q_reg[2]  ( .D(d[2]), .CLK(clk), .RSTB(n1), .Q(q[2]) );
  DFFARX1_RVT \q_reg[1]  ( .D(d[1]), .CLK(clk), .RSTB(n1), .Q(q[1]) );
  DFFARX1_RVT \q_reg[0]  ( .D(d[0]), .CLK(clk), .RSTB(n1), .Q(q[0]) );
  NBUFFX2_RVT U3 ( .A(rst_n), .Y(n1) );
endmodule


module pipe_dff ( clk, rst_n, a, b, q_out );
  input [7:0] a;
  input [7:0] b;
  output [7:0] q_out;
  input clk, rst_n;
  wire   \intadd_0/CI , \intadd_0/n7 , \intadd_0/n6 , \intadd_0/n5 ,
         \intadd_0/n4 , \intadd_0/n3 , \intadd_0/n2 , n2, n3, n4, n5;
  wire   [7:0] ra;
  wire   [7:0] rb;
  wire   [7:0] sum;
  wire   [7:0] mon_q;

  dff_cell_W8 u_mon ( .clk(clk), .rst_n(n4), .d(sum), .q(mon_q) );
  DFFARX1_RVT \ra_reg[7]  ( .D(a[7]), .CLK(clk), .RSTB(n5), .Q(ra[7]) );
  DFFARX1_RVT \ra_reg[6]  ( .D(a[6]), .CLK(clk), .RSTB(rst_n), .Q(ra[6]) );
  DFFARX1_RVT \ra_reg[5]  ( .D(a[5]), .CLK(clk), .RSTB(rst_n), .Q(ra[5]) );
  DFFARX1_RVT \ra_reg[4]  ( .D(a[4]), .CLK(clk), .RSTB(rst_n), .Q(ra[4]) );
  DFFARX1_RVT \ra_reg[3]  ( .D(a[3]), .CLK(clk), .RSTB(n5), .Q(ra[3]) );
  DFFARX1_RVT \ra_reg[2]  ( .D(a[2]), .CLK(clk), .RSTB(rst_n), .Q(ra[2]) );
  DFFARX1_RVT \ra_reg[1]  ( .D(a[1]), .CLK(clk), .RSTB(n5), .Q(ra[1]) );
  DFFARX1_RVT \ra_reg[0]  ( .D(a[0]), .CLK(clk), .RSTB(rst_n), .Q(ra[0]) );
  DFFARX1_RVT \rb_reg[7]  ( .D(b[7]), .CLK(clk), .RSTB(n4), .Q(rb[7]) );
  DFFARX1_RVT \rb_reg[6]  ( .D(b[6]), .CLK(clk), .RSTB(n4), .Q(rb[6]) );
  DFFARX1_RVT \rb_reg[5]  ( .D(b[5]), .CLK(clk), .RSTB(n4), .Q(rb[5]) );
  DFFARX1_RVT \rb_reg[4]  ( .D(b[4]), .CLK(clk), .RSTB(n4), .Q(rb[4]) );
  DFFARX1_RVT \rb_reg[3]  ( .D(b[3]), .CLK(clk), .RSTB(n4), .Q(rb[3]) );
  DFFARX1_RVT \rb_reg[2]  ( .D(b[2]), .CLK(clk), .RSTB(n4), .Q(rb[2]) );
  DFFARX1_RVT \rb_reg[1]  ( .D(b[1]), .CLK(clk), .RSTB(n4), .Q(rb[1]) );
  DFFARX1_RVT \rb_reg[0]  ( .D(b[0]), .CLK(clk), .RSTB(rst_n), .Q(rb[0]) );
  DFFARX1_RVT \rc_reg[7]  ( .D(mon_q[7]), .CLK(clk), .RSTB(n4), .Q(q_out[7])
         );
  DFFARX1_RVT \rc_reg[6]  ( .D(mon_q[6]), .CLK(clk), .RSTB(n4), .Q(q_out[6])
         );
  DFFARX1_RVT \rc_reg[5]  ( .D(mon_q[5]), .CLK(clk), .RSTB(n4), .Q(q_out[5])
         );
  DFFARX1_RVT \rc_reg[4]  ( .D(mon_q[4]), .CLK(clk), .RSTB(n4), .Q(q_out[4])
         );
  DFFARX1_RVT \rc_reg[3]  ( .D(mon_q[3]), .CLK(clk), .RSTB(n4), .Q(q_out[3])
         );
  DFFARX1_RVT \rc_reg[2]  ( .D(mon_q[2]), .CLK(clk), .RSTB(n4), .Q(q_out[2])
         );
  DFFARX1_RVT \rc_reg[1]  ( .D(mon_q[1]), .CLK(clk), .RSTB(n4), .Q(q_out[1])
         );
  DFFARX1_RVT \rc_reg[0]  ( .D(mon_q[0]), .CLK(clk), .RSTB(n4), .Q(q_out[0])
         );
  FADDX1_RVT \intadd_0/U8  ( .A(rb[1]), .B(ra[1]), .CI(\intadd_0/CI ), .CO(
        \intadd_0/n7 ), .S(sum[1]) );
  FADDX1_RVT \intadd_0/U7  ( .A(rb[2]), .B(ra[2]), .CI(\intadd_0/n7 ), .CO(
        \intadd_0/n6 ), .S(sum[2]) );
  FADDX1_RVT \intadd_0/U6  ( .A(rb[3]), .B(ra[3]), .CI(\intadd_0/n6 ), .CO(
        \intadd_0/n5 ), .S(sum[3]) );
  FADDX1_RVT \intadd_0/U5  ( .A(rb[4]), .B(ra[4]), .CI(\intadd_0/n5 ), .CO(
        \intadd_0/n4 ), .S(sum[4]) );
  FADDX1_RVT \intadd_0/U4  ( .A(rb[5]), .B(ra[5]), .CI(\intadd_0/n4 ), .CO(
        \intadd_0/n3 ), .S(sum[5]) );
  FADDX1_RVT \intadd_0/U3  ( .A(rb[6]), .B(ra[6]), .CI(\intadd_0/n3 ), .CO(
        \intadd_0/n2 ), .S(sum[6]) );
  OA21X1_RVT U4 ( .A1(rb[0]), .A2(ra[0]), .A3(n3), .Y(sum[0]) );
  INVX0_RVT U5 ( .A(n3), .Y(\intadd_0/CI ) );
  XOR2X1_RVT U6 ( .A1(rb[7]), .A2(ra[7]), .Y(n2) );
  XOR2X1_RVT U7 ( .A1(\intadd_0/n2 ), .A2(n2), .Y(sum[7]) );
  NBUFFX2_RVT U8 ( .A(rst_n), .Y(n5) );
  NBUFFX2_RVT U9 ( .A(n5), .Y(n4) );
  NAND2X0_RVT U10 ( .A1(rb[0]), .A2(ra[0]), .Y(n3) );
endmodule

