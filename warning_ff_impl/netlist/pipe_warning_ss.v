/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09-SP5-5
// Date      : Sat Jun 27 22:18:52 2026
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

  OA21X1_RVT U2 ( .A1(q), .A2(s), .A3(n1), .Y(q) );
  INVX0_RVT U1 ( .A(r), .Y(n1) );
endmodule


module warning_cell_W8 ( clk, d, q, warning, rst_n_BAR );
  input [7:0] d;
  output [7:0] q;
  input clk, rst_n_BAR;
  output warning;
  wire   d_del, clk_del, set_pulse, n2, n4, n6, n7;

  delay_line_LEN4 u_dl ( .in(d[7]), .out(d_del) );
  delay_line_LEN3 u_wd ( .in(clk), .out(clk_del) );
  sr_latch u_sr ( .s(set_pulse), .r(n4), .q(warning) );
  DFFARX1_RVT \q_reg[7]  ( .D(n6), .CLK(clk), .RSTB(n7), .Q(q[7]) );
  DFFARX1_RVT \q_reg[6]  ( .D(d[6]), .CLK(clk), .RSTB(n7), .Q(q[6]) );
  DFFARX1_RVT \q_reg[5]  ( .D(d[5]), .CLK(clk), .RSTB(n7), .Q(q[5]) );
  DFFARX1_RVT \q_reg[4]  ( .D(d[4]), .CLK(clk), .RSTB(n7), .Q(q[4]) );
  DFFARX1_RVT \q_reg[3]  ( .D(d[3]), .CLK(clk), .RSTB(n7), .Q(q[3]) );
  DFFARX1_RVT \q_reg[2]  ( .D(d[2]), .CLK(clk), .RSTB(n7), .Q(q[2]) );
  DFFARX1_RVT \q_reg[1]  ( .D(d[1]), .CLK(clk), .RSTB(n7), .Q(q[1]) );
  DFFARX1_RVT \q_reg[0]  ( .D(d[0]), .CLK(clk), .RSTB(n7), .Q(q[0]) );
  OA221X1_RVT U6 ( .A1(1'b0), .A2(clk), .A3(n6), .A4(n6), .A5(n2), .Y(
        set_pulse) );
  AOI21X1_RVT U5 ( .A1(d_del), .A2(d[7]), .A3(clk_del), .Y(n2) );
  INVX0_RVT U3 ( .A(clk), .Y(n4) );
  NBUFFX2_RVT U7 ( .A(d[7]), .Y(n6) );
  INVX2_RVT U8 ( .A(rst_n_BAR), .Y(n7) );
endmodule


module pipe_warning ( clk, rst_n, a, b, q_out, warning );
  input [7:0] a;
  input [7:0] b;
  output [7:0] q_out;
  input clk, rst_n;
  output warning;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93;
  wire   [7:0] ra;
  wire   [7:0] rb;
  wire   [7:0] sum;
  wire   [7:0] mon_q;

  warning_cell_W8 u_mon ( .clk(clk), .d(sum), .q(mon_q), .warning(warning), 
        .rst_n_BAR(n51) );
  DFFARX1_RVT \ra_reg[7]  ( .D(a[7]), .CLK(clk), .RSTB(rst_n), .QN(n43) );
  DFFARX1_RVT \ra_reg[6]  ( .D(a[6]), .CLK(clk), .RSTB(n2), .Q(ra[6]), .QN(n18) );
  DFFARX1_RVT \ra_reg[5]  ( .D(a[5]), .CLK(clk), .RSTB(rst_n), .Q(ra[5]), .QN(
        n48) );
  DFFARX1_RVT \ra_reg[4]  ( .D(a[4]), .CLK(clk), .RSTB(rst_n), .QN(n46) );
  DFFARX1_RVT \ra_reg[3]  ( .D(a[3]), .CLK(clk), .RSTB(n2), .Q(ra[3]), .QN(n34) );
  DFFARX1_RVT \ra_reg[2]  ( .D(a[2]), .CLK(clk), .RSTB(n2), .QN(n35) );
  DFFARX1_RVT \ra_reg[1]  ( .D(a[1]), .CLK(clk), .RSTB(n2), .QN(n50) );
  DFFARX1_RVT \ra_reg[0]  ( .D(a[0]), .CLK(clk), .RSTB(n2), .Q(ra[0]), .QN(n45) );
  DFFARX1_RVT \rb_reg[6]  ( .D(b[6]), .CLK(clk), .RSTB(n2), .Q(rb[6]), .QN(n19) );
  DFFARX1_RVT \rb_reg[4]  ( .D(b[4]), .CLK(clk), .RSTB(n2), .QN(n47) );
  DFFARX1_RVT \rb_reg[3]  ( .D(b[3]), .CLK(clk), .RSTB(rst_n), .Q(rb[3]), .QN(
        n41) );
  DFFARX1_RVT \rb_reg[2]  ( .D(b[2]), .CLK(clk), .RSTB(n2), .QN(n37) );
  DFFARX1_RVT \rb_reg[1]  ( .D(b[1]), .CLK(clk), .RSTB(n2), .QN(n49) );
  DFFARX1_RVT \rb_reg[0]  ( .D(b[0]), .CLK(clk), .RSTB(n2), .Q(rb[0]), .QN(n44) );
  DFFARX1_RVT \rc_reg[7]  ( .D(mon_q[7]), .CLK(clk), .RSTB(n2), .Q(q_out[7])
         );
  DFFARX1_RVT \rc_reg[6]  ( .D(mon_q[6]), .CLK(clk), .RSTB(n2), .Q(q_out[6])
         );
  DFFARX1_RVT \rc_reg[5]  ( .D(mon_q[5]), .CLK(clk), .RSTB(rst_n), .Q(q_out[5]) );
  DFFARX1_RVT \rc_reg[4]  ( .D(mon_q[4]), .CLK(clk), .RSTB(n2), .Q(q_out[4])
         );
  DFFARX1_RVT \rc_reg[3]  ( .D(mon_q[3]), .CLK(clk), .RSTB(n2), .Q(q_out[3])
         );
  DFFARX1_RVT \rc_reg[2]  ( .D(mon_q[2]), .CLK(clk), .RSTB(n2), .Q(q_out[2])
         );
  DFFARX1_RVT \rc_reg[1]  ( .D(mon_q[1]), .CLK(clk), .RSTB(rst_n), .Q(q_out[1]) );
  DFFARX1_RVT \rc_reg[0]  ( .D(mon_q[0]), .CLK(clk), .RSTB(n2), .Q(q_out[0])
         );
  DFFASX1_RVT \rb_reg[7]  ( .D(n93), .CLK(clk), .SETB(n2), .QN(rb[7]) );
  DFFASX1_RVT \rb_reg[5]  ( .D(n92), .CLK(clk), .SETB(n2), .Q(n39), .QN(rb[5])
         );
  INVX0_RVT U4 ( .A(n89), .Y(n11) );
  INVX1_RVT U5 ( .A(n73), .Y(n88) );
  OR2X4_RVT U6 ( .A1(n27), .A2(n65), .Y(n67) );
  INVX1_RVT U7 ( .A(n17), .Y(n71) );
  INVX0_RVT U8 ( .A(n42), .Y(n75) );
  INVX4_RVT U9 ( .A(n51), .Y(n2) );
  OA21X1_RVT U10 ( .A1(n59), .A2(n87), .A3(n33), .Y(n91) );
  INVX0_RVT U11 ( .A(n59), .Y(n9) );
  INVX1_RVT U12 ( .A(n10), .Y(n80) );
  NOR2X0_RVT U13 ( .A1(n88), .A2(n87), .Y(n32) );
  INVX1_RVT U14 ( .A(n5), .Y(n78) );
  INVX1_RVT U15 ( .A(n70), .Y(n16) );
  INVX0_RVT U16 ( .A(n63), .Y(n14) );
  INVX0_RVT U17 ( .A(n66), .Y(n15) );
  INVX1_RVT U18 ( .A(n3), .Y(n21) );
  INVX0_RVT U19 ( .A(n87), .Y(n25) );
  INVX1_RVT U20 ( .A(n33), .Y(n86) );
  INVX0_RVT U21 ( .A(n44), .Y(n31) );
  OR2X1_RVT U22 ( .A1(n46), .A2(n47), .Y(n33) );
  INVX0_RVT U23 ( .A(n45), .Y(n30) );
  INVX0_RVT U24 ( .A(n48), .Y(n23) );
  AND2X1_RVT U25 ( .A1(n40), .A2(ra[5]), .Y(n89) );
  AND2X1_RVT U26 ( .A1(n50), .A2(n49), .Y(n27) );
  NAND3X0_RVT U27 ( .A1(n64), .A2(n21), .A3(n58), .Y(n13) );
  NAND2X0_RVT U28 ( .A1(n35), .A2(n37), .Y(n58) );
  AND2X1_RVT U29 ( .A1(n34), .A2(n41), .Y(n3) );
  INVX1_RVT U30 ( .A(n27), .Y(n64) );
  INVX0_RVT U31 ( .A(n4), .Y(n7) );
  OA21X1_RVT U32 ( .A1(n82), .A2(n4), .A3(n74), .Y(n10) );
  AND2X1_RVT U33 ( .A1(n12), .A2(n11), .Y(n4) );
  NOR3X0_RVT U34 ( .A1(n82), .A2(n87), .A3(n88), .Y(n20) );
  OR2X2_RVT U35 ( .A1(rb[5]), .A2(n23), .Y(n73) );
  AND2X1_RVT U36 ( .A1(n46), .A2(n47), .Y(n87) );
  INVX0_RVT U37 ( .A(n6), .Y(n12) );
  OR3X1_RVT U38 ( .A1(n89), .A2(n83), .A3(n6), .Y(n5) );
  AND2X1_RVT U39 ( .A1(n86), .A2(n73), .Y(n6) );
  INVX0_RVT U40 ( .A(n35), .Y(n36) );
  INVX0_RVT U41 ( .A(n37), .Y(n38) );
  OR2X1_RVT U42 ( .A1(n42), .A2(n70), .Y(n72) );
  AO21X1_RVT U43 ( .A1(n61), .A2(n21), .A3(n57), .Y(n70) );
  AND2X1_RVT U44 ( .A1(ra[3]), .A2(rb[3]), .Y(n57) );
  AND2X1_RVT U45 ( .A1(n38), .A2(n36), .Y(n61) );
  NOR2X0_RVT U46 ( .A1(n8), .A2(n7), .Y(n85) );
  AND2X1_RVT U47 ( .A1(n9), .A2(n32), .Y(n8) );
  AO21X1_RVT U48 ( .A1(n15), .A2(n14), .A3(n13), .Y(n17) );
  AND2X1_RVT U49 ( .A1(n28), .A2(n29), .Y(n63) );
  AND2X1_RVT U50 ( .A1(n30), .A2(n31), .Y(n66) );
  AND2X1_RVT U51 ( .A1(n17), .A2(n16), .Y(n52) );
  INVX1_RVT U52 ( .A(n50), .Y(n28) );
  INVX0_RVT U53 ( .A(n49), .Y(n29) );
  OR2X1_RVT U54 ( .A1(n82), .A2(n75), .Y(n77) );
  INVX0_RVT U55 ( .A(b[5]), .Y(n92) );
  INVX0_RVT U56 ( .A(b[7]), .Y(n93) );
  OAI21X1_RVT U57 ( .A1(n69), .A2(n65), .A3(n64), .Y(n22) );
  NAND3X0_RVT U58 ( .A1(n26), .A2(n42), .A3(n24), .Y(n76) );
  AND2X1_RVT U59 ( .A1(n25), .A2(n73), .Y(n24) );
  XNOR2X2_RVT U60 ( .A1(rb[7]), .A2(n43), .Y(n42) );
  INVX0_RVT U61 ( .A(n82), .Y(n26) );
  AND2X1_RVT U62 ( .A1(n18), .A2(n19), .Y(n82) );
  OA21X1_RVT U63 ( .A1(n81), .A2(n80), .A3(n79), .Y(sum[7]) );
  XNOR2X1_RVT U64 ( .A1(n85), .A2(n84), .Y(sum[6]) );
  XNOR2X1_RVT U65 ( .A1(n91), .A2(n90), .Y(sum[5]) );
  NOR2X0_RVT U66 ( .A1(n89), .A2(n88), .Y(n90) );
  INVX1_RVT U67 ( .A(n39), .Y(n40) );
  INVX0_RVT U68 ( .A(rst_n), .Y(n51) );
  INVX0_RVT U69 ( .A(n58), .Y(n53) );
  INVX0_RVT U70 ( .A(n61), .Y(n54) );
  OA21X1_RVT U71 ( .A1(n53), .A2(n22), .A3(n54), .Y(n56) );
  NOR2X0_RVT U72 ( .A1(n57), .A2(n3), .Y(n55) );
  XNOR2X1_RVT U73 ( .A1(n56), .A2(n55), .Y(sum[3]) );
  NBUFFX2_RVT U74 ( .A(n52), .Y(n59) );
  NOR2X0_RVT U75 ( .A1(n86), .A2(n87), .Y(n60) );
  XNOR2X1_RVT U76 ( .A1(n59), .A2(n60), .Y(sum[4]) );
  OR2X1_RVT U77 ( .A1(n61), .A2(n53), .Y(n62) );
  XOR2X1_RVT U78 ( .A1(n22), .A2(n62), .Y(sum[2]) );
  NBUFFX2_RVT U79 ( .A(n63), .Y(n65) );
  NBUFFX2_RVT U80 ( .A(n66), .Y(n69) );
  XNOR2X1_RVT U81 ( .A1(n67), .A2(n69), .Y(sum[1]) );
  NOR2X0_RVT U82 ( .A1(rb[0]), .A2(ra[0]), .Y(n68) );
  NOR2X0_RVT U83 ( .A1(n69), .A2(n68), .Y(sum[0]) );
  OA22X1_RVT U84 ( .A1(n42), .A2(n20), .A3(n71), .A4(n72), .Y(n81) );
  AND2X1_RVT U85 ( .A1(ra[6]), .A2(rb[6]), .Y(n83) );
  INVX0_RVT U86 ( .A(n83), .Y(n74) );
  OA22X1_RVT U87 ( .A1(n78), .A2(n77), .A3(n76), .A4(n52), .Y(n79) );
  NOR2X0_RVT U88 ( .A1(n83), .A2(n82), .Y(n84) );
endmodule

