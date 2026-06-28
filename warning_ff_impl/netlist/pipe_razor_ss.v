/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09-SP5-5
// Date      : Sat Jun 27 22:16:52 2026
/////////////////////////////////////////////////////////////


module razor_cell_W8 ( clk, clk_del, d, q, error, rst_n_BAR );
  input [7:0] d;
  output [7:0] q;
  input clk, clk_del, rst_n_BAR;
  output error;
  wire   rst_n, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17;
  wire   [7:0] shadow;
  assign rst_n = rst_n_BAR;

  DFFARX1_RVT \q_reg[7]  ( .D(d[7]), .CLK(clk), .RSTB(n17), .Q(q[7]), .QN(n12)
         );
  DFFARX1_RVT \q_reg[6]  ( .D(d[6]), .CLK(clk), .RSTB(n17), .Q(q[6]), .QN(n16)
         );
  DFFARX1_RVT \q_reg[5]  ( .D(d[5]), .CLK(clk), .RSTB(n17), .Q(q[5]), .QN(n11)
         );
  DFFARX1_RVT \q_reg[4]  ( .D(d[4]), .CLK(clk), .RSTB(n17), .Q(q[4]), .QN(n15)
         );
  DFFARX1_RVT \q_reg[3]  ( .D(d[3]), .CLK(clk), .RSTB(n17), .Q(q[3]), .QN(n10)
         );
  DFFARX1_RVT \q_reg[2]  ( .D(d[2]), .CLK(clk), .RSTB(n17), .Q(q[2]), .QN(n14)
         );
  DFFARX1_RVT \q_reg[1]  ( .D(d[1]), .CLK(clk), .RSTB(n17), .Q(q[1]), .QN(n9)
         );
  DFFARX1_RVT \q_reg[0]  ( .D(d[0]), .CLK(clk), .RSTB(n17), .Q(q[0]), .QN(n13)
         );
  LATCHX1_RVT \shadow_reg[7]  ( .CLK(clk_del), .D(d[7]), .Q(shadow[7]) );
  LATCHX1_RVT \shadow_reg[6]  ( .CLK(clk_del), .D(d[6]), .Q(shadow[6]) );
  LATCHX1_RVT \shadow_reg[5]  ( .CLK(clk_del), .D(d[5]), .Q(shadow[5]) );
  LATCHX1_RVT \shadow_reg[4]  ( .CLK(clk_del), .D(d[4]), .Q(shadow[4]) );
  LATCHX1_RVT \shadow_reg[3]  ( .CLK(clk_del), .D(d[3]), .Q(shadow[3]) );
  LATCHX1_RVT \shadow_reg[2]  ( .CLK(clk_del), .D(d[2]), .Q(shadow[2]) );
  LATCHX1_RVT \shadow_reg[1]  ( .CLK(clk_del), .D(d[1]), .Q(shadow[1]) );
  LATCHX1_RVT \shadow_reg[0]  ( .CLK(clk_del), .D(d[0]), .Q(shadow[0]) );
  INVX2_RVT U3 ( .A(rst_n), .Y(n17) );
  AOI22X1_RVT U4 ( .A1(n12), .A2(shadow[7]), .A3(n16), .A4(shadow[6]), .Y(n1)
         );
  OA221X1_RVT U5 ( .A1(n12), .A2(shadow[7]), .A3(n16), .A4(shadow[6]), .A5(n1), 
        .Y(n8) );
  AOI22X1_RVT U6 ( .A1(n11), .A2(shadow[5]), .A3(n15), .A4(shadow[4]), .Y(n2)
         );
  OA221X1_RVT U7 ( .A1(n11), .A2(shadow[5]), .A3(n15), .A4(shadow[4]), .A5(n2), 
        .Y(n7) );
  AOI22X1_RVT U8 ( .A1(n10), .A2(shadow[3]), .A3(n14), .A4(shadow[2]), .Y(n3)
         );
  OA221X1_RVT U9 ( .A1(n10), .A2(shadow[3]), .A3(n14), .A4(shadow[2]), .A5(n3), 
        .Y(n6) );
  AOI22X1_RVT U10 ( .A1(n9), .A2(shadow[1]), .A3(n13), .A4(shadow[0]), .Y(n4)
         );
  OA221X1_RVT U11 ( .A1(n9), .A2(shadow[1]), .A3(n13), .A4(shadow[0]), .A5(n4), 
        .Y(n5) );
  NAND4X0_RVT U12 ( .A1(n8), .A2(n7), .A3(n6), .A4(n5), .Y(error) );
endmodule


module pipe_razor ( clk, clk_del, rst_n, a, b, q_out, error );
  input [7:0] a;
  input [7:0] b;
  output [7:0] q_out;
  input clk, clk_del, rst_n;
  output error;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48;
  wire   [7:0] ra;
  wire   [7:0] rb;
  wire   [7:0] sum;
  wire   [7:0] mon_q;

  razor_cell_W8 u_mon ( .clk(clk), .clk_del(clk_del), .d(sum), .q(mon_q), 
        .error(error), .rst_n_BAR(n2) );
  DFFARX1_RVT \ra_reg[7]  ( .D(a[7]), .CLK(clk), .RSTB(rst_n), .Q(ra[7]) );
  DFFARX1_RVT \ra_reg[6]  ( .D(a[6]), .CLK(clk), .RSTB(n5), .Q(ra[6]) );
  DFFARX1_RVT \ra_reg[5]  ( .D(a[5]), .CLK(clk), .RSTB(n4), .Q(ra[5]) );
  DFFARX1_RVT \ra_reg[4]  ( .D(a[4]), .CLK(clk), .RSTB(n3), .Q(ra[4]) );
  DFFARX1_RVT \ra_reg[3]  ( .D(a[3]), .CLK(clk), .RSTB(rst_n), .Q(ra[3]) );
  DFFARX1_RVT \ra_reg[2]  ( .D(a[2]), .CLK(clk), .RSTB(n5), .Q(ra[2]) );
  DFFARX1_RVT \ra_reg[1]  ( .D(a[1]), .CLK(clk), .RSTB(n4), .Q(ra[1]) );
  DFFARX1_RVT \ra_reg[0]  ( .D(a[0]), .CLK(clk), .RSTB(n3), .Q(ra[0]) );
  DFFARX1_RVT \rb_reg[7]  ( .D(b[7]), .CLK(clk), .RSTB(n4), .Q(rb[7]) );
  DFFARX1_RVT \rb_reg[6]  ( .D(b[6]), .CLK(clk), .RSTB(rst_n), .Q(rb[6]) );
  DFFARX1_RVT \rb_reg[5]  ( .D(b[5]), .CLK(clk), .RSTB(n5), .Q(rb[5]) );
  DFFARX1_RVT \rb_reg[4]  ( .D(b[4]), .CLK(clk), .RSTB(n4), .Q(rb[4]) );
  DFFARX1_RVT \rb_reg[3]  ( .D(b[3]), .CLK(clk), .RSTB(n3), .Q(rb[3]) );
  DFFARX1_RVT \rb_reg[2]  ( .D(b[2]), .CLK(clk), .RSTB(rst_n), .Q(rb[2]) );
  DFFARX1_RVT \rb_reg[1]  ( .D(b[1]), .CLK(clk), .RSTB(n5), .Q(rb[1]) );
  DFFARX1_RVT \rb_reg[0]  ( .D(b[0]), .CLK(clk), .RSTB(n3), .Q(rb[0]) );
  DFFARX1_RVT \rc_reg[7]  ( .D(mon_q[7]), .CLK(clk), .RSTB(n4), .Q(q_out[7])
         );
  DFFARX1_RVT \rc_reg[6]  ( .D(mon_q[6]), .CLK(clk), .RSTB(n3), .Q(q_out[6])
         );
  DFFARX1_RVT \rc_reg[5]  ( .D(mon_q[5]), .CLK(clk), .RSTB(rst_n), .Q(q_out[5]) );
  DFFARX1_RVT \rc_reg[4]  ( .D(mon_q[4]), .CLK(clk), .RSTB(n5), .Q(q_out[4])
         );
  DFFARX1_RVT \rc_reg[3]  ( .D(mon_q[3]), .CLK(clk), .RSTB(n4), .Q(q_out[3])
         );
  DFFARX1_RVT \rc_reg[2]  ( .D(mon_q[2]), .CLK(clk), .RSTB(n3), .Q(q_out[2])
         );
  DFFARX1_RVT \rc_reg[1]  ( .D(mon_q[1]), .CLK(clk), .RSTB(rst_n), .Q(q_out[1]) );
  DFFARX1_RVT \rc_reg[0]  ( .D(mon_q[0]), .CLK(clk), .RSTB(n5), .Q(q_out[0])
         );
  INVX0_RVT U4 ( .A(n15), .Y(n16) );
  INVX0_RVT U5 ( .A(n17), .Y(n14) );
  INVX0_RVT U6 ( .A(n39), .Y(n27) );
  INVX0_RVT U7 ( .A(n36), .Y(n26) );
  INVX0_RVT U8 ( .A(n48), .Y(n7) );
  INVX0_RVT U9 ( .A(n10), .Y(n6) );
  INVX0_RVT U10 ( .A(n44), .Y(n11) );
  INVX0_RVT U11 ( .A(n30), .Y(n20) );
  INVX0_RVT U12 ( .A(n28), .Y(n22) );
  INVX0_RVT U13 ( .A(n38), .Y(n40) );
  INVX0_RVT U14 ( .A(rst_n), .Y(n2) );
  INVX0_RVT U15 ( .A(n2), .Y(n3) );
  INVX0_RVT U16 ( .A(n2), .Y(n4) );
  INVX0_RVT U17 ( .A(n2), .Y(n5) );
  AND2X1_RVT U18 ( .A1(rb[1]), .A2(ra[1]), .Y(n9) );
  OR2X1_RVT U19 ( .A1(rb[1]), .A2(ra[1]), .Y(n10) );
  NOR2X0_RVT U20 ( .A1(n9), .A2(n6), .Y(n8) );
  AND2X1_RVT U21 ( .A1(rb[0]), .A2(ra[0]), .Y(n48) );
  XNOR2X1_RVT U22 ( .A1(n8), .A2(n7), .Y(sum[1]) );
  OR2X1_RVT U23 ( .A1(ra[2]), .A2(rb[2]), .Y(n44) );
  AOI21X1_RVT U24 ( .A1(n10), .A2(n48), .A3(n9), .Y(n45) );
  NAND2X0_RVT U25 ( .A1(ra[2]), .A2(rb[2]), .Y(n43) );
  OA21X1_RVT U26 ( .A1(n11), .A2(n45), .A3(n43), .Y(n13) );
  NOR2X0_RVT U27 ( .A1(ra[3]), .A2(rb[3]), .Y(n17) );
  AND2X1_RVT U28 ( .A1(ra[3]), .A2(rb[3]), .Y(n15) );
  NOR2X0_RVT U29 ( .A1(n17), .A2(n15), .Y(n12) );
  XNOR2X1_RVT U30 ( .A1(n13), .A2(n12), .Y(sum[3]) );
  NAND2X0_RVT U31 ( .A1(n44), .A2(n14), .Y(n19) );
  OA21X1_RVT U32 ( .A1(n17), .A2(n43), .A3(n16), .Y(n18) );
  OAI21X1_RVT U33 ( .A1(n19), .A2(n45), .A3(n18), .Y(n37) );
  AND2X1_RVT U34 ( .A1(rb[4]), .A2(ra[4]), .Y(n30) );
  OR2X1_RVT U35 ( .A1(rb[4]), .A2(ra[4]), .Y(n25) );
  NAND2X0_RVT U36 ( .A1(n20), .A2(n25), .Y(n21) );
  XNOR2X1_RVT U37 ( .A1(n37), .A2(n21), .Y(sum[4]) );
  AO21X1_RVT U38 ( .A1(n37), .A2(n25), .A3(n30), .Y(n24) );
  AND2X1_RVT U39 ( .A1(ra[5]), .A2(rb[5]), .Y(n28) );
  OR2X1_RVT U40 ( .A1(ra[5]), .A2(rb[5]), .Y(n29) );
  NAND2X0_RVT U41 ( .A1(n22), .A2(n29), .Y(n23) );
  XNOR2X1_RVT U42 ( .A1(n24), .A2(n23), .Y(sum[5]) );
  OR2X1_RVT U43 ( .A1(ra[6]), .A2(rb[6]), .Y(n39) );
  AND2X1_RVT U44 ( .A1(n25), .A2(n29), .Y(n36) );
  NOR2X0_RVT U45 ( .A1(n27), .A2(n26), .Y(n32) );
  AO21X1_RVT U46 ( .A1(n30), .A2(n29), .A3(n28), .Y(n35) );
  AND2X1_RVT U47 ( .A1(ra[6]), .A2(rb[6]), .Y(n38) );
  AO21X1_RVT U48 ( .A1(n35), .A2(n39), .A3(n38), .Y(n31) );
  AO21X1_RVT U49 ( .A1(n37), .A2(n32), .A3(n31), .Y(n34) );
  XNOR2X1_RVT U50 ( .A1(ra[7]), .A2(rb[7]), .Y(n33) );
  XNOR2X1_RVT U51 ( .A1(n34), .A2(n33), .Y(sum[7]) );
  AO21X1_RVT U52 ( .A1(n37), .A2(n36), .A3(n35), .Y(n42) );
  NAND2X0_RVT U53 ( .A1(n40), .A2(n39), .Y(n41) );
  XNOR2X1_RVT U54 ( .A1(n42), .A2(n41), .Y(sum[6]) );
  AND2X1_RVT U55 ( .A1(n44), .A2(n43), .Y(n46) );
  XNOR2X1_RVT U56 ( .A1(n46), .A2(n45), .Y(sum[2]) );
  NOR2X0_RVT U57 ( .A1(rb[0]), .A2(ra[0]), .Y(n47) );
  NOR2X0_RVT U58 ( .A1(n48), .A2(n47), .Y(sum[0]) );
endmodule

