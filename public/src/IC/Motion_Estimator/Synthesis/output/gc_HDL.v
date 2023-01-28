/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP4
// Date      : Sun Dec 20 16:13:40 2020
/////////////////////////////////////////////////////////////


module control_DW01_inc_0 ( A, SUM );
  input [12:0] A;
  output [12:0] SUM;

  wire   [12:2] carry;

  HADDX1_LVT U1_1_11 ( .A0(A[11]), .B0(carry[11]), .C1(carry[12]), .SO(SUM[11]) );
  HADDX1_LVT U1_1_7 ( .A0(A[7]), .B0(carry[7]), .C1(carry[8]), .SO(SUM[7]) );
  HADDX1_LVT U1_1_2 ( .A0(A[2]), .B0(carry[2]), .C1(carry[3]), .SO(SUM[2]) );
  HADDX1_HVT U1_1_9 ( .A0(A[9]), .B0(carry[9]), .C1(carry[10]), .SO(SUM[9]) );
  HADDX1_LVT U1_1_8 ( .A0(A[8]), .B0(carry[8]), .C1(carry[9]), .SO(SUM[8]) );
  HADDX1_LVT U1_1_10 ( .A0(A[10]), .B0(carry[10]), .C1(carry[11]), .SO(SUM[10]) );
  HADDX1_LVT U1_1_5 ( .A0(A[5]), .B0(carry[5]), .C1(carry[6]), .SO(SUM[5]) );
  HADDX1_LVT U1_1_6 ( .A0(A[6]), .B0(carry[6]), .C1(carry[7]), .SO(SUM[6]) );
  HADDX1_LVT U1_1_4 ( .A0(A[4]), .B0(carry[4]), .C1(carry[5]), .SO(SUM[4]) );
  HADDX1_LVT U1_1_3 ( .A0(A[3]), .B0(carry[3]), .C1(carry[4]), .SO(SUM[3]) );
  HADDX1_LVT U1_1_1 ( .A0(A[1]), .B0(A[0]), .C1(carry[2]), .SO(SUM[1]) );
  INVX1_LVT U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1_LVT U2 ( .A1(carry[12]), .A2(A[12]), .Y(SUM[12]) );
endmodule


module control ( clock, start, S1S2mux, newDist, CompStart, PEready, VectorX, 
        VectorY, AddressR, AddressS1, AddressS2 );
  output [15:0] S1S2mux;
  output [15:0] newDist;
  output [15:0] PEready;
  output [3:0] VectorX;
  output [3:0] VectorY;
  output [7:0] AddressR;
  output [9:0] AddressS1;
  output [9:0] AddressS2;
  input clock, start;
  output CompStart;
  wire   \AddressS2[3]_snps_int_wire , \AddressS2[2]_snps_int_wire ,
         \AddressS2[1]_snps_int_wire , n143, N251, n142, n133, n135, n136,
         n138, net8330, net8333, net8415, net8432, net8438, net8437, net8445,
         net8444, net8451, net8459, net8766, net8782, net8785, net8794,
         net8801, net8859, net8915, net12014, net12247, net12358, net12357,
         net12367, net12393, net12534, net12533, net12593, net12592, net12654,
         net12677, net12685, net12699, net12706, net12738, net12759, net12832,
         net12994, net13392, net9073, net8945, net12926, net12527, net12414,
         net9281, net8430, net14682, net12950, n140, n141, net8421, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n11, n13, n14, n15, n17, n18, n19, n20, n22,
         n24, n27, n28, n29, n30, n31, n33, n34, n35, n36, n37, n38, n39, n44,
         n45, n46, n47, n52, n53, n54, n55, n57, n58, n59, n60, n61, n63, n64,
         n65, n66, n68, n69, n70, n71, n72, n74, n75, n76, n77, n78, n79, n84,
         n85, n86, n87, n88, n89, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n119, n120, n121, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n134;
  wire   [12:8] count;
  wire   [12:0] count_temp;
  assign S1S2mux[0] = 1'b1;
  assign AddressS2[1] = net8438;
  assign AddressR[1] = net8438;
  assign AddressS1[1] = net8438;
  assign VectorX[1] = net8437;
  assign VectorX[2] = net8445;
  assign AddressS2[2] = net8445;
  assign AddressR[2] = net8445;
  assign AddressS1[2] = net8445;
  assign S1S2mux[8] = net8451;
  assign S1S2mux[15] = net8801;
  assign S1S2mux[14] = net8859;
  assign VectorX[0] = net8915;
  assign newDist[15] = net12014;
  assign AddressS1[0] = net12358;
  assign AddressR[0] = net12358;
  assign AddressS2[0] = net12358;
  assign S1S2mux[12] = net12654;
  assign AddressS1[3] = net12699;
  assign AddressS2[3] = net12832;
  assign AddressR[3] = net12832;
  assign VectorX[3] = net12994;
  assign AddressS2[4] = 1'b1;
  assign AddressS1[4] = 1'b0;

  DFFSSRX1_LVT \count_reg[12]  ( .D(count_temp[12]), .SETB(n138), .RSTB(start), 
        .CLK(clock), .Q(count[12]), .QN(n22) );
  control_DW01_inc_0 add_146 ( .A({count, AddressR[7:4], net12832, net8444, 
        net8438, net8915}), .SUM(count_temp) );
  DFFX1_LVT \count_reg[0]  ( .D(n79), .CLK(clock), .Q(n143), .QN(n136) );
  INVX0_HVT \count_reg[3]/U4  ( .A(n138), .Y(n75) );
  DFFSSRX2_LVT \count_reg[11]  ( .D(1'b0), .SETB(n91), .RSTB(count_temp[11]), 
        .CLK(clock), .Q(count[11]), .QN(n131) );
  DFFSSRX1_LVT \count_reg[6]  ( .D(1'b0), .SETB(n91), .RSTB(count_temp[6]), 
        .CLK(clock), .Q(AddressR[6]), .QN(n124) );
  DFFX1_LVT \count_reg[1]  ( .D(n77), .CLK(clock), .Q(
        \AddressS2[1]_snps_int_wire ), .QN(n135) );
  DFFSSRX1_LVT \count_reg[5]  ( .D(count_temp[5]), .SETB(1'b1), .RSTB(n134), 
        .CLK(clock), .Q(AddressR[5]), .QN(n85) );
  DFFSSRX2_LVT \count_reg[10]  ( .D(1'b0), .SETB(n91), .RSTB(count_temp[10]), 
        .CLK(clock), .Q(count[10]), .QN(n121) );
  DFFSSRX1_LVT \count_reg[8]  ( .D(1'b0), .SETB(n91), .RSTB(count_temp[8]), 
        .CLK(clock), .Q(count[8]), .QN(n92) );
  DFFSSRX2_LVT \count_reg[7]  ( .D(1'b0), .SETB(n91), .RSTB(count_temp[7]), 
        .CLK(clock), .Q(AddressR[7]), .QN(n127) );
  DFFX2_LVT \count_reg[2]  ( .D(n78), .CLK(clock), .Q(
        \AddressS2[2]_snps_int_wire ), .QN(n133) );
  DFFSSRX1_LVT \count_reg[9]  ( .D(count_temp[9]), .SETB(1'b1), .RSTB(n134), 
        .CLK(clock), .Q(count[9]), .QN(n84) );
  DFFSSRX1_LVT \count_reg[4]  ( .D(count_temp[4]), .SETB(1'b1), .RSTB(n134), 
        .CLK(clock), .Q(AddressR[4]), .QN(n52) );
  DFFX1_LVT \count_reg[3]  ( .D(n76), .CLK(clock), .Q(
        \AddressS2[3]_snps_int_wire ), .QN(n142) );
  NBUFFX2_HVT U3 ( .A(n87), .Y(n29) );
  DELLN2X2_HVT U4 ( .A(net12414), .Y(net8438) );
  AND2X2_HVT U6 ( .A1(n13), .A2(net12685), .Y(n70) );
  AND2X1_LVT U7 ( .A1(n54), .A2(n71), .Y(n58) );
  OR2X2_LVT U8 ( .A1(n142), .A2(n133), .Y(net8421) );
  AO21X1_LVT U9 ( .A1(net8432), .A2(net12654), .A3(n140), .Y(S1S2mux[13]) );
  NAND2X1_LVT U12 ( .A1(net12685), .A2(net8794), .Y(S1S2mux[2]) );
  DELLN2X2_LVT U13 ( .A(n57), .Y(n1) );
  AND2X1_LVT U14 ( .A1(net12685), .A2(n136), .Y(n71) );
  AND3X1_LVT U15 ( .A1(n136), .A2(net8459), .A3(net8859), .Y(n45) );
  AND3X1_LVT U16 ( .A1(net12677), .A2(n72), .A3(n29), .Y(n61) );
  NOR2X4_LVT U17 ( .A1(n17), .A2(n13), .Y(n72) );
  IBUFFX2_HVT U18 ( .A(n30), .Y(n97) );
  INVX1_LVT U19 ( .A(net12699), .Y(net12994) );
  NBUFFX2_LVT U20 ( .A(n4), .Y(net12699) );
  INVX0_LVT U21 ( .A(net8445), .Y(net8785) );
  AND2X1_LVT U22 ( .A1(n30), .A2(n124), .Y(n2) );
  DELLN2X2_HVT U23 ( .A(n59), .Y(newDist[5]) );
  OR2X1_LVT U24 ( .A1(n9), .A2(n7), .Y(n53) );
  AND2X1_LVT U25 ( .A1(n46), .A2(n70), .Y(n65) );
  NBUFFX2_LVT U26 ( .A(n89), .Y(n3) );
  NBUFFX2_HVT U27 ( .A(n31), .Y(n89) );
  DELLN2X2_HVT U28 ( .A(n45), .Y(newDist[14]) );
  DELLN2X2_HVT U29 ( .A(n60), .Y(newDist[3]) );
  DELLN2X2_HVT U30 ( .A(n61), .Y(newDist[2]) );
  DELLN1X2_HVT U31 ( .A(n64), .Y(newDist[8]) );
  INVX1_LVT U32 ( .A(n130), .Y(n132) );
  NAND2X0_HVT U33 ( .A1(n5), .A2(n37), .Y(N251) );
  AO21X1_LVT U34 ( .A1(AddressR[5]), .A2(AddressR[4]), .A3(n35), .Y(n103) );
  AO21X1_LVT U35 ( .A1(AddressR[6]), .A2(n97), .A3(n20), .Y(n109) );
  OAI22X1_LVT U36 ( .A1(n38), .A2(n44), .A3(n120), .A4(n74), .Y(n125) );
  AND2X1_LVT U37 ( .A1(n38), .A2(n44), .Y(n74) );
  DELLN1X2_HVT U38 ( .A(n65), .Y(newDist[9]) );
  AO21X1_LVT U39 ( .A1(count[10]), .A2(n14), .A3(n132), .Y(VectorY[2]) );
  INVX0_HVT U40 ( .A(n19), .Y(net8859) );
  NBUFFX2_HVT U41 ( .A(n66), .Y(newDist[13]) );
  NBUFFX2_HVT U42 ( .A(n68), .Y(newDist[6]) );
  INVX0_LVT U43 ( .A(\AddressS2[2]_snps_int_wire ), .Y(net12759) );
  AO21X1_LVT U44 ( .A1(net9073), .A2(net12414), .A3(net12393), .Y(S1S2mux[6])
         );
  NBUFFX2_LVT U45 ( .A(net9073), .Y(net8444) );
  DELLN1X2_LVT U46 ( .A(net12533), .Y(net8445) );
  INVX1_LVT U47 ( .A(net12994), .Y(net12832) );
  NAND2X0_LVT U48 ( .A1(net8782), .A2(net12759), .Y(S1S2mux[4]) );
  INVX0_LVT U49 ( .A(\AddressS2[2]_snps_int_wire ), .Y(net12527) );
  NBUFFX2_LVT U50 ( .A(net8945), .Y(n4) );
  AND2X1_LVT U51 ( .A1(n92), .A2(n84), .Y(n5) );
  INVX1_LVT U52 ( .A(count[10]), .Y(n6) );
  NBUFFX2_LVT U53 ( .A(net12527), .Y(n7) );
  INVX0_LVT U54 ( .A(net12527), .Y(net9073) );
  NAND2X0_LVT U55 ( .A1(n39), .A2(n127), .Y(n8) );
  NAND2X0_HVT U56 ( .A1(n2), .A2(n127), .Y(net8415) );
  NBUFFX2_HVT U57 ( .A(n135), .Y(net12685) );
  AND2X1_LVT U58 ( .A1(n28), .A2(net12593), .Y(n55) );
  DELLN2X2_HVT U59 ( .A(n55), .Y(newDist[11]) );
  NOR3X0_LVT U60 ( .A1(net8451), .A2(n7), .A3(net8415), .Y(n86) );
  INVX0_LVT U61 ( .A(n136), .Y(n13) );
  INVX0_HVT U62 ( .A(net12706), .Y(net12592) );
  NBUFFX2_LVT U63 ( .A(net8330), .Y(n9) );
  AO21X2_HVT U64 ( .A1(count[9]), .A2(count[8]), .A3(n5), .Y(VectorY[1]) );
  INVX0_LVT U65 ( .A(net8451), .Y(net12367) );
  AND2X1_LVT U67 ( .A1(n18), .A2(n136), .Y(n11) );
  INVX0_LVT U68 ( .A(n11), .Y(S1S2mux[1]) );
  INVX0_LVT U69 ( .A(net12414), .Y(n17) );
  NAND2X0_HVT U70 ( .A1(VectorY[0]), .A2(n44), .Y(n14) );
  AND2X1_LVT U71 ( .A1(net8782), .A2(net12759), .Y(n87) );
  AND2X1_LVT U72 ( .A1(n22), .A2(n131), .Y(n15) );
  AO21X1_LVT U73 ( .A1(net12706), .A2(net8945), .A3(net8766), .Y(S1S2mux[11])
         );
  AND2X1_LVT U74 ( .A1(net8794), .A2(n17), .Y(n18) );
  XOR2X1_LVT U75 ( .A1(n130), .A2(count[11]), .Y(VectorY[3]) );
  INVX0_LVT U76 ( .A(net8421), .Y(n141) );
  NBUFFX2_LVT U77 ( .A(net8421), .Y(net12738) );
  NBUFFX2_LVT U78 ( .A(n142), .Y(net12926) );
  INVX0_LVT U79 ( .A(n133), .Y(net12533) );
  AND2X1_LVT U81 ( .A1(n140), .A2(net14682), .Y(net8801) );
  AND2X1_HVT U82 ( .A1(net12677), .A2(net8801), .Y(net12014) );
  INVX0_LVT U83 ( .A(net9281), .Y(net14682) );
  INVX0_HVT U84 ( .A(net8430), .Y(net9281) );
  IBUFFX2_HVT U85 ( .A(net9281), .Y(net8915) );
  NBUFFX2_LVT U86 ( .A(net12950), .Y(net8430) );
  INVX0_LVT U87 ( .A(net8430), .Y(net12357) );
  NBUFFX2_LVT U88 ( .A(n143), .Y(net12950) );
  NBUFFX2_LVT U89 ( .A(net12950), .Y(net8432) );
  INVX0_LVT U90 ( .A(n19), .Y(n140) );
  NAND2X0_LVT U91 ( .A1(\AddressS2[1]_snps_int_wire ), .A2(n143), .Y(net8330)
         );
  NAND2X0_LVT U92 ( .A1(n141), .A2(net8437), .Y(n19) );
  NBUFFX2_LVT U93 ( .A(\AddressS2[1]_snps_int_wire ), .Y(net8437) );
  AO21X1_LVT U94 ( .A1(net8945), .A2(net8437), .A3(n141), .Y(S1S2mux[10]) );
  AO21X1_LVT U95 ( .A1(net8432), .A2(net8444), .A3(S1S2mux[6]), .Y(S1S2mux[5])
         );
  INVX0_LVT U96 ( .A(net12926), .Y(net8945) );
  AND2X1_LVT U97 ( .A1(net12534), .A2(net12926), .Y(net8794) );
  INVX0_LVT U98 ( .A(n135), .Y(net12414) );
  AO21X1_LVT U99 ( .A1(net12358), .A2(n4), .A3(S1S2mux[10]), .Y(S1S2mux[9]) );
  AND3X1_LVT U100 ( .A1(net12677), .A2(net12706), .A3(n29), .Y(n60) );
  INVX0_LVT U101 ( .A(net8330), .Y(net12706) );
  AND2X1_LVT U102 ( .A1(n54), .A2(n70), .Y(n66) );
  DELLN3X2_HVT U103 ( .A(n2), .Y(n20) );
  NAND2X0_LVT U104 ( .A1(n5), .A2(n37), .Y(n31) );
  AND2X1_LVT U105 ( .A1(n86), .A2(n72), .Y(n68) );
  NAND2X0_HVT U106 ( .A1(n5), .A2(n121), .Y(n130) );
  INVX0_HVT U107 ( .A(n20), .Y(n104) );
  AND3X2_HVT U108 ( .A1(net8333), .A2(net12358), .A3(n18), .Y(newDist[1]) );
  IBUFFX2_HVT U109 ( .A(n58), .Y(n24) );
  INVX1_LVT U110 ( .A(n24), .Y(newDist[12]) );
  NAND2X0_LVT U111 ( .A1(n87), .A2(n9), .Y(S1S2mux[3]) );
  INVX0_LVT U112 ( .A(n63), .Y(n27) );
  INVX0_LVT U113 ( .A(n27), .Y(n28) );
  AND3X1_LVT U114 ( .A1(net8785), .A2(net12699), .A3(net13392), .Y(n63) );
  AND2X1_LVT U115 ( .A1(n46), .A2(n71), .Y(n64) );
  INVX0_LVT U116 ( .A(n8), .Y(net13392) );
  INVX0_LVT U117 ( .A(n8), .Y(net8333) );
  AND2X1_LVT U118 ( .A1(newDist[1]), .A2(CompStart), .Y(PEready[1]) );
  AND2X1_HVT U119 ( .A1(net8333), .A2(n11), .Y(newDist[0]) );
  AND2X1_LVT U120 ( .A1(n52), .A2(n85), .Y(n30) );
  INVX1_LVT U121 ( .A(count[8]), .Y(VectorY[0]) );
  INVX1_LVT U122 ( .A(AddressR[6]), .Y(n33) );
  NBUFFX2_LVT U123 ( .A(n86), .Y(n34) );
  INVX1_LVT U124 ( .A(n97), .Y(n35) );
  NBUFFX2_LVT U125 ( .A(n31), .Y(CompStart) );
  INVX1_LVT U126 ( .A(AddressR[4]), .Y(n36) );
  AND2X1_LVT U127 ( .A1(n34), .A2(n71), .Y(n57) );
  AND2X1_LVT U128 ( .A1(n34), .A2(net12593), .Y(newDist[7]) );
  INVX0_LVT U129 ( .A(net12738), .Y(net12654) );
  NBUFFX2_LVT U130 ( .A(net12393), .Y(net8451) );
  INVX0_LVT U131 ( .A(\AddressS2[3]_snps_int_wire ), .Y(net8782) );
  NBUFFX2_LVT U132 ( .A(net8333), .Y(net12677) );
  INVX0_LVT U133 ( .A(net12357), .Y(net12358) );
  AND2X1_LVT U134 ( .A1(n121), .A2(n15), .Y(n37) );
  INVX1_LVT U135 ( .A(AddressR[5]), .Y(n38) );
  AND2X1_LVT U136 ( .A1(n70), .A2(n86), .Y(n59) );
  NAND2X0_LVT U137 ( .A1(net12367), .A2(n53), .Y(S1S2mux[7]) );
  INVX0_LVT U138 ( .A(net12592), .Y(net12593) );
  AND2X1_LVT U139 ( .A1(n30), .A2(n124), .Y(n39) );
  INVX0_LVT U140 ( .A(net12533), .Y(net12534) );
  INVX1_LVT U141 ( .A(count[9]), .Y(n44) );
  NAND4X1_HVT U142 ( .A1(n131), .A2(count[12]), .A3(net12014), .A4(n132), .Y(
        n138) );
  NAND2X0_HVT U143 ( .A1(n127), .A2(n131), .Y(n129) );
  AND2X1_HVT U144 ( .A1(newDist[0]), .A2(CompStart), .Y(PEready[0]) );
  AND2X1_LVT U145 ( .A1(net13392), .A2(net8766), .Y(n54) );
  NBUFFX2_HVT U146 ( .A(net13392), .Y(net8459) );
  NBUFFX2_LVT U147 ( .A(n28), .Y(n46) );
  AO21X2_HVT U148 ( .A1(AddressR[7]), .A2(n104), .A3(net8459), .Y(n117) );
  IBUFFX2_HVT U149 ( .A(n1), .Y(n47) );
  INVX1_LVT U150 ( .A(n47), .Y(newDist[4]) );
  NAND2X0_HVT U151 ( .A1(n95), .A2(n44), .Y(n98) );
  NBUFFX2_LVT U152 ( .A(\AddressS2[3]_snps_int_wire ), .Y(net12393) );
  IBUFFX2_HVT U153 ( .A(net8459), .Y(net12247) );
  AND2X1_HVT U154 ( .A1(n94), .A2(n36), .Y(n69) );
  AND2X1_LVT U155 ( .A1(n72), .A2(n63), .Y(newDist[10]) );
  XOR3X1_LVT U156 ( .A1(n109), .A2(n112), .A3(n111), .Y(AddressS2[7]) );
  XOR3X1_LVT U157 ( .A1(n117), .A2(n116), .A3(n115), .Y(AddressS2[8]) );
  XNOR3X1_LVT U158 ( .A1(n69), .A2(n100), .A3(n103), .Y(AddressS2[6]) );
  AO21X1_HVT U159 ( .A1(count[8]), .A2(net12247), .A3(n95), .Y(n94) );
  AO21X1_LVT U160 ( .A1(count[9]), .A2(n96), .A3(n105), .Y(n102) );
  XOR2X1_LVT U161 ( .A1(n106), .A2(count[11]), .Y(n113) );
  XNOR3X1_HVT U162 ( .A1(count[10]), .A2(n33), .A3(n125), .Y(AddressS1[7]) );
  XNOR3X1_HVT U163 ( .A1(count[11]), .A2(n127), .A3(n128), .Y(AddressS1[8]) );
  XNOR3X1_LVT U164 ( .A1(count[9]), .A2(AddressR[5]), .A3(n120), .Y(
        AddressS1[6]) );
  OA21X1_HVT U165 ( .A1(n75), .A2(count_temp[3]), .A3(start), .Y(n76) );
  OA21X1_HVT U166 ( .A1(n75), .A2(count_temp[1]), .A3(start), .Y(n77) );
  OA21X1_HVT U167 ( .A1(n75), .A2(count_temp[2]), .A3(start), .Y(n78) );
  OA21X1_HVT U168 ( .A1(n75), .A2(count_temp[0]), .A3(start), .Y(n79) );
  NBUFFX2_LVT U173 ( .A(n31), .Y(n88) );
  NAND2X0_HVT U174 ( .A1(net8459), .A2(VectorY[0]), .Y(n96) );
  NAND2X0_HVT U175 ( .A1(n33), .A2(n6), .Y(n126) );
  NAND2X0_HVT U176 ( .A1(n105), .A2(n6), .Y(n106) );
  XOR2X1_HVT U177 ( .A1(n98), .A2(count[10]), .Y(n107) );
  AO22X1_HVT U178 ( .A1(AddressR[6]), .A2(count[10]), .A3(n126), .A4(n125), 
        .Y(n128) );
  XOR2X1_HVT U179 ( .A1(AddressR[4]), .A2(n93), .Y(AddressS2[5]) );
  XOR2X1_HVT U180 ( .A1(count[8]), .A2(AddressR[4]), .Y(AddressS1[5]) );
  NAND2X0_HVT U181 ( .A1(AddressR[4]), .A2(count[8]), .Y(n120) );
  INVX0_LVT U182 ( .A(net12738), .Y(net8766) );
  NAND2X0_LVT U183 ( .A1(start), .A2(n138), .Y(n91) );
  INVX1_LVT U184 ( .A(n91), .Y(n134) );
  INVX1_LVT U185 ( .A(n96), .Y(n95) );
  INVX1_LVT U186 ( .A(n94), .Y(n93) );
  INVX1_LVT U187 ( .A(n98), .Y(n105) );
  INVX1_LVT U188 ( .A(n102), .Y(n100) );
  INVX1_LVT U189 ( .A(n107), .Y(n112) );
  INVX1_LVT U190 ( .A(n103), .Y(n99) );
  NAND2X0_LVT U191 ( .A1(n100), .A2(n99), .Y(n101) );
  AO22X1_LVT U192 ( .A1(n103), .A2(n102), .A3(n69), .A4(n101), .Y(n111) );
  INVX1_LVT U193 ( .A(n113), .Y(n116) );
  INVX1_LVT U194 ( .A(n111), .Y(n108) );
  NAND2X0_LVT U195 ( .A1(n108), .A2(n107), .Y(n110) );
  AO22X1_LVT U196 ( .A1(n112), .A2(n111), .A3(n110), .A4(n109), .Y(n115) );
  INVX1_LVT U197 ( .A(n115), .Y(n114) );
  NAND2X0_LVT U198 ( .A1(n114), .A2(n113), .Y(n119) );
  AO22X1_LVT U199 ( .A1(n119), .A2(n117), .A3(n116), .A4(n115), .Y(
        AddressS2[9]) );
  AO22X1_LVT U200 ( .A1(n129), .A2(n128), .A3(count[11]), .A4(AddressR[7]), 
        .Y(AddressS1[9]) );
  AND2X1_LVT U201 ( .A1(n61), .A2(CompStart), .Y(PEready[2]) );
  AND2X1_LVT U202 ( .A1(n60), .A2(CompStart), .Y(PEready[3]) );
  AND2X1_LVT U203 ( .A1(n57), .A2(n89), .Y(PEready[4]) );
  AND2X1_LVT U204 ( .A1(n59), .A2(N251), .Y(PEready[5]) );
  AND2X1_LVT U205 ( .A1(n68), .A2(N251), .Y(PEready[6]) );
  AND2X1_LVT U206 ( .A1(newDist[7]), .A2(N251), .Y(PEready[7]) );
  AND2X1_LVT U207 ( .A1(n64), .A2(n3), .Y(PEready[8]) );
  AND2X1_LVT U208 ( .A1(n65), .A2(n88), .Y(PEready[9]) );
  AND2X1_LVT U209 ( .A1(newDist[10]), .A2(n3), .Y(PEready[10]) );
  AND2X1_LVT U210 ( .A1(n55), .A2(n88), .Y(PEready[11]) );
  AND2X1_LVT U211 ( .A1(n58), .A2(n89), .Y(PEready[12]) );
  AND2X1_LVT U212 ( .A1(n66), .A2(n88), .Y(PEready[13]) );
  AND2X1_LVT U213 ( .A1(n45), .A2(n3), .Y(PEready[14]) );
  AND2X1_LVT U214 ( .A1(net12014), .A2(n88), .Y(PEready[15]) );
endmodule


module PE_14_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(carry[1]), .CI(B[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN1X2_HVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_HVT U2 ( .A1(A[0]), .A2(n1), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_14_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  FADDX1_HVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  OR2X1_LVT U1 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  XNOR2X1_LVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_14_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX1_LVT U1 ( .A(B[4]), .Y(n4) );
  INVX0_LVT U2 ( .A(B[0]), .Y(n8) );
  XNOR2X1_LVT U3 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U4 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U5 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U6 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U7 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U8 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U9 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U10 ( .A(B[1]), .Y(n7) );
endmodule


module PE_14 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N7, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22,
         N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36,
         N37, N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  AO22X1_LVT U3 ( .A1(S1[7]), .A2(S1S2mux), .A3(S2[7]), .A4(n53), .Y(N17) );
  AO22X1_LVT U4 ( .A1(S1[6]), .A2(S1S2mux), .A3(S2[6]), .A4(n53), .Y(N16) );
  AO22X1_LVT U5 ( .A1(S1[5]), .A2(S1S2mux), .A3(S2[5]), .A4(n53), .Y(N15) );
  AO22X1_LVT U14 ( .A1(S1[0]), .A2(S1S2mux), .A3(S2[0]), .A4(n53), .Y(N10) );
  AO221X1_LVT U15 ( .A1(n42), .A2(difference[7]), .A3(N41), .A4(n40), .A5(n21), 
        .Y(AccumulateIn[7]) );
  AO22X1_LVT U16 ( .A1(N33), .A2(n52), .A3(n14), .A4(N25), .Y(difference[7])
         );
  AO221X1_LVT U17 ( .A1(n42), .A2(difference[6]), .A3(N40), .A4(n40), .A5(n35), 
        .Y(AccumulateIn[6]) );
  AO22X1_LVT U18 ( .A1(N32), .A2(n52), .A3(N24), .A4(n38), .Y(difference[6])
         );
  AO221X1_LVT U19 ( .A1(n42), .A2(difference[5]), .A3(N39), .A4(n40), .A5(n36), 
        .Y(AccumulateIn[5]) );
  AO22X1_LVT U20 ( .A1(N31), .A2(n52), .A3(N23), .A4(n14), .Y(difference[5])
         );
  AO221X1_LVT U21 ( .A1(n42), .A2(difference[4]), .A3(N38), .A4(n41), .A5(n35), 
        .Y(AccumulateIn[4]) );
  AO22X1_LVT U22 ( .A1(N30), .A2(n52), .A3(N22), .A4(n38), .Y(difference[4])
         );
  AO221X1_LVT U23 ( .A1(n42), .A2(difference[3]), .A3(N37), .A4(n40), .A5(n21), 
        .Y(AccumulateIn[3]) );
  AO221X1_LVT U25 ( .A1(n42), .A2(difference[2]), .A3(N36), .A4(n39), .A5(n36), 
        .Y(AccumulateIn[2]) );
  AO221X1_LVT U27 ( .A1(newDist), .A2(difference[1]), .A3(N35), .A4(n39), .A5(
        n21), .Y(AccumulateIn[1]) );
  AO221X1_LVT U29 ( .A1(newDist), .A2(n11), .A3(N34), .A4(n39), .A5(n35), .Y(
        AccumulateIn[0]) );
  PE_14_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_14_DW01_sub_0 sub_83 ( .A({N17, N16, N15, N14, N13, N12, N11, n20}), .B(R), .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_14_DW01_sub_1 sub_79 ( .A(R), .B({N17, N16, N15, N14, N13, N12, N11, n20}), .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  DFFX1_HVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_HVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  DFFX1_HVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_HVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_HVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  AO22X1_LVT U9 ( .A1(R[7]), .A2(n30), .A3(n31), .A4(n32), .Y(n4) );
  INVX0_HVT U10 ( .A(n8), .Y(N14) );
  INVX0_HVT U11 ( .A(n17), .Y(N13) );
  AO22X1_HVT U12 ( .A1(S1[2]), .A2(S1S2mux), .A3(S2[2]), .A4(n53), .Y(N12) );
  AOI22X1_LVT U13 ( .A1(S1[3]), .A2(S1S2mux), .A3(S2[3]), .A4(n53), .Y(n17) );
  INVX1_LVT U24 ( .A(N29), .Y(n5) );
  INVX1_LVT U26 ( .A(N21), .Y(n6) );
  INVX1_LVT U28 ( .A(N27), .Y(n23) );
  INVX1_LVT U30 ( .A(N19), .Y(n24) );
  INVX1_LVT U31 ( .A(N20), .Y(n16) );
  INVX1_LVT U32 ( .A(N28), .Y(n15) );
  INVX1_LVT U33 ( .A(N26), .Y(n27) );
  INVX1_LVT U34 ( .A(N18), .Y(n28) );
  INVX0_LVT U35 ( .A(N17), .Y(n30) );
  OAI22X1_LVT U36 ( .A1(n5), .A2(n14), .A3(n6), .A4(n52), .Y(difference[3]) );
  NBUFFX2_LVT U37 ( .A(n29), .Y(n7) );
  AOI22X1_LVT U38 ( .A1(S1[4]), .A2(S1S2mux), .A3(S2[4]), .A4(n53), .Y(n8) );
  INVX0_HVT U39 ( .A(n4), .Y(n52) );
  AND2X1_LVT U40 ( .A1(R[4]), .A2(n8), .Y(n9) );
  AND2X1_LVT U41 ( .A1(R[5]), .A2(n50), .Y(n10) );
  OR3X1_LVT U42 ( .A1(n9), .A2(n10), .A3(n47), .Y(n48) );
  OAI22X2_LVT U43 ( .A1(n23), .A2(n38), .A3(n24), .A4(n7), .Y(difference[1])
         );
  NBUFFX2_HVT U44 ( .A(N7), .Y(n38) );
  DELLN2X2_HVT U45 ( .A(difference[0]), .Y(n11) );
  OR2X1_LVT U46 ( .A1(R[6]), .A2(n51), .Y(n12) );
  OR2X1_LVT U47 ( .A1(R[5]), .A2(n50), .Y(n13) );
  AND3X1_LVT U48 ( .A1(n48), .A2(n13), .A3(n12), .Y(n49) );
  NBUFFX2_HVT U49 ( .A(n37), .Y(n14) );
  AO22X2_HVT U50 ( .A1(S1[1]), .A2(S1S2mux), .A3(S2[1]), .A4(n53), .Y(N11) );
  OAI22X2_HVT U51 ( .A1(n15), .A2(n4), .A3(n16), .A4(n7), .Y(difference[2]) );
  NBUFFX2_HVT U52 ( .A(N7), .Y(n37) );
  AOI22X1_LVT U53 ( .A1(S1[2]), .A2(S1S2mux), .A3(S2[2]), .A4(n53), .Y(n18) );
  IBUFFX2_HVT U54 ( .A(N10), .Y(n19) );
  INVX1_LVT U55 ( .A(n19), .Y(n20) );
  AND2X4_LVT U56 ( .A1(Carry), .A2(n40), .Y(n21) );
  AOI22X1_LVT U57 ( .A1(S1[1]), .A2(S1S2mux), .A3(S2[1]), .A4(n53), .Y(n22) );
  INVX0_LVT U58 ( .A(n4), .Y(n29) );
  OR2X1_LVT U59 ( .A1(R[4]), .A2(n8), .Y(n25) );
  OR2X1_LVT U60 ( .A1(R[3]), .A2(n17), .Y(n26) );
  AND3X1_LVT U61 ( .A1(n46), .A2(n26), .A3(n25), .Y(n47) );
  OAI22X1_LVT U62 ( .A1(n27), .A2(n37), .A3(n28), .A4(n29), .Y(difference[0])
         );
  AO221X1_LVT U63 ( .A1(R[2]), .A2(n18), .A3(R[3]), .A4(n17), .A5(n45), .Y(n46) );
  OA222X1_LVT U64 ( .A1(R[2]), .A2(n18), .A3(R[1]), .A4(n44), .A5(n43), .A6(
        n22), .Y(n45) );
  AND2X1_LVT U65 ( .A1(n43), .A2(n22), .Y(n44) );
  OR2X1_LVT U66 ( .A1(n30), .A2(R[7]), .Y(n32) );
  AO22X1_LVT U67 ( .A1(R[7]), .A2(n30), .A3(n31), .A4(n32), .Y(N7) );
  AO21X1_LVT U68 ( .A1(R[6]), .A2(n51), .A3(n49), .Y(n31) );
  NOR2X1_LVT U69 ( .A1(n34), .A2(N10), .Y(n43) );
  INVX0_LVT U70 ( .A(R[0]), .Y(n34) );
  NBUFFX2_LVT U71 ( .A(n41), .Y(n39) );
  NBUFFX2_LVT U72 ( .A(n41), .Y(n40) );
  INVX1_LVT U73 ( .A(n41), .Y(n42) );
  NAND2X0_LVT U74 ( .A1(n39), .A2(Carry), .Y(n33) );
  INVX1_LVT U75 ( .A(newDist), .Y(n41) );
  INVX0_LVT U76 ( .A(n33), .Y(n35) );
  INVX0_HVT U77 ( .A(n33), .Y(n36) );
  INVX1_LVT U78 ( .A(N15), .Y(n50) );
  INVX1_LVT U79 ( .A(N16), .Y(n51) );
  INVX1_LVT U80 ( .A(S1S2mux), .Y(n53) );
endmodule


module PE_13_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN2X2_LVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_HVT U2 ( .A1(A[0]), .A2(n1), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_13_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_HVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  OR2X2_LVT U1 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  XNOR2X1_LVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_13_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  IBUFFX2_HVT U1 ( .A(B[0]), .Y(n8) );
  INVX1_LVT U2 ( .A(B[3]), .Y(n5) );
  XNOR2X1_LVT U3 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX0_HVT U4 ( .A(B[2]), .Y(n6) );
  INVX0_HVT U5 ( .A(B[1]), .Y(n7) );
  OR2X1_LVT U6 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U7 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U8 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U9 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U10 ( .A(B[4]), .Y(n4) );
endmodule


module PE_13 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N12, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25,
         N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39,
         N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  PE_13_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_13_DW01_sub_0 sub_83 ( .A({n36, n35, n37, n34, n11, n32, n38, n40}), .B(R), .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_13_DW01_sub_1 sub_79 ( .A(R), .B({n36, n35, n37, n34, n11, n32, n38, N10}), .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  MUX21X2_LVT U3 ( .A1(S2[0]), .A2(S1[0]), .S0(n45), .Y(N10) );
  INVX0_LVT U4 ( .A(n35), .Y(n4) );
  NBUFFX2_LVT U5 ( .A(N16), .Y(n35) );
  INVX0_HVT U9 ( .A(N16), .Y(n64) );
  INVX0_HVT U10 ( .A(S1[3]), .Y(n26) );
  INVX0_LVT U11 ( .A(S2[3]), .Y(n25) );
  INVX0_LVT U12 ( .A(R[5]), .Y(n8) );
  OR2X1_HVT U13 ( .A1(R[5]), .A2(n62), .Y(n9) );
  INVX0_HVT U14 ( .A(S1[1]), .Y(n29) );
  INVX0_HVT U15 ( .A(S2[1]), .Y(n28) );
  OR2X1_LVT U16 ( .A1(n14), .A2(n60), .Y(n12) );
  INVX1_LVT U17 ( .A(n75), .Y(n5) );
  INVX1_LVT U18 ( .A(n18), .Y(n11) );
  NAND2X0_HVT U19 ( .A1(n5), .A2(n42), .Y(AccumulateIn[2]) );
  OR2X2_LVT U20 ( .A1(n77), .A2(n33), .Y(AccumulateIn[0]) );
  OR2X2_LVT U21 ( .A1(n73), .A2(n33), .Y(AccumulateIn[4]) );
  OR2X2_LVT U22 ( .A1(n74), .A2(n33), .Y(AccumulateIn[3]) );
  MUX21X2_LVT U23 ( .A1(n28), .A2(n29), .S0(n39), .Y(n27) );
  MUX21X2_LVT U24 ( .A1(S2[6]), .A2(S1[6]), .S0(n31), .Y(N16) );
  NBUFFX2_LVT U25 ( .A(n44), .Y(n6) );
  INVX0_HVT U26 ( .A(n43), .Y(n44) );
  OA21X1_LVT U27 ( .A1(R[1]), .A2(n27), .A3(R[0]), .Y(n55) );
  INVX0_LVT U28 ( .A(n45), .Y(n30) );
  OR2X2_LVT U29 ( .A1(R[6]), .A2(n64), .Y(n10) );
  INVX0_LVT U30 ( .A(N12), .Y(n7) );
  INVX0_LVT U31 ( .A(N12), .Y(n56) );
  OR2X1_LVT U32 ( .A1(n7), .A2(R[2]), .Y(n58) );
  DELLN2X2_LVT U33 ( .A(N14), .Y(n34) );
  INVX0_LVT U34 ( .A(N14), .Y(n61) );
  MUX21X1_LVT U35 ( .A1(S2[4]), .A2(S1[4]), .S0(n23), .Y(N14) );
  NOR2X0_LVT U36 ( .A1(n8), .A2(N15), .Y(n13) );
  MUX21X1_LVT U37 ( .A1(S1[5]), .A2(S2[5]), .S0(n30), .Y(N15) );
  MUX21X1_LVT U38 ( .A1(n25), .A2(n26), .S0(n23), .Y(n24) );
  AND3X1_LVT U39 ( .A1(n9), .A2(n12), .A3(n10), .Y(n63) );
  INVX0_LVT U40 ( .A(N15), .Y(n62) );
  OR2X1_LVT U41 ( .A1(n17), .A2(n13), .Y(n14) );
  OR2X2_LVT U42 ( .A1(n76), .A2(n46), .Y(AccumulateIn[1]) );
  INVX0_LVT U43 ( .A(n42), .Y(n15) );
  INVX0_LVT U44 ( .A(n42), .Y(n46) );
  OA221X1_LVT U45 ( .A1(R[5]), .A2(n62), .A3(R[6]), .A4(n64), .A5(n12), .Y(n16) );
  AND2X1_LVT U46 ( .A1(R[4]), .A2(n61), .Y(n17) );
  NBUFFX2_LVT U47 ( .A(n24), .Y(n18) );
  DELLN2X2_HVT U48 ( .A(difference[0]), .Y(n19) );
  AOI22X1_LVT U49 ( .A1(R[7]), .A2(n68), .A3(n67), .A4(n66), .Y(n49) );
  INVX0_LVT U50 ( .A(n43), .Y(n45) );
  NAND2X0_LVT U51 ( .A1(R[3]), .A2(n24), .Y(n20) );
  NAND2X0_LVT U52 ( .A1(n57), .A2(n58), .Y(n21) );
  NAND2X1_LVT U53 ( .A1(R[2]), .A2(n56), .Y(n22) );
  NAND3X0_LVT U54 ( .A1(n21), .A2(n20), .A3(n22), .Y(n59) );
  NBUFFX2_LVT U55 ( .A(S1S2mux), .Y(n39) );
  INVX0_LVT U56 ( .A(n56), .Y(n32) );
  NBUFFX2_LVT U57 ( .A(n39), .Y(n23) );
  INVX0_LVT U58 ( .A(n27), .Y(n38) );
  OR2X2_LVT U59 ( .A1(n70), .A2(n15), .Y(AccumulateIn[7]) );
  OR2X2_LVT U60 ( .A1(n71), .A2(n15), .Y(AccumulateIn[6]) );
  OR2X2_LVT U61 ( .A1(n72), .A2(n46), .Y(AccumulateIn[5]) );
  NBUFFX2_HVT U62 ( .A(n48), .Y(n47) );
  INVX0_LVT U63 ( .A(n30), .Y(n31) );
  MUX21X1_LVT U64 ( .A1(S2[2]), .A2(S1[2]), .S0(n44), .Y(N12) );
  MUX21X1_LVT U65 ( .A1(N35), .A2(difference[1]), .S0(n52), .Y(n76) );
  AND2X4_LVT U66 ( .A1(Carry), .A2(n69), .Y(n33) );
  MUX21X1_HVT U67 ( .A1(N36), .A2(difference[2]), .S0(n53), .Y(n75) );
  IBUFFX2_HVT U68 ( .A(n68), .Y(n36) );
  NBUFFX2_HVT U69 ( .A(N15), .Y(n37) );
  DELLN2X2_HVT U70 ( .A(newDist), .Y(n51) );
  DELLN2X2_HVT U71 ( .A(newDist), .Y(n53) );
  DELLN2X2_HVT U72 ( .A(newDist), .Y(n52) );
  INVX0_LVT U73 ( .A(S1S2mux), .Y(n43) );
  INVX0_LVT U74 ( .A(n54), .Y(n40) );
  AO21X1_LVT U75 ( .A1(R[6]), .A2(n64), .A3(n63), .Y(n41) );
  INVX0_LVT U76 ( .A(N10), .Y(n54) );
  MUX21X1_HVT U77 ( .A1(N20), .A2(N28), .S0(n50), .Y(difference[2]) );
  NAND2X0_LVT U78 ( .A1(Carry), .A2(n69), .Y(n42) );
  AOI22X1_LVT U79 ( .A1(R[7]), .A2(n68), .A3(n41), .A4(n66), .Y(n50) );
  AOI22X1_LVT U80 ( .A1(R[7]), .A2(n68), .A3(n67), .A4(n66), .Y(n48) );
  MUX21X1_HVT U81 ( .A1(N34), .A2(n19), .S0(n53), .Y(n77) );
  MUX21X1_HVT U82 ( .A1(N25), .A2(N33), .S0(n49), .Y(difference[7]) );
  MUX21X1_HVT U83 ( .A1(N24), .A2(N32), .S0(n47), .Y(difference[6]) );
  MUX21X1_HVT U84 ( .A1(N23), .A2(N31), .S0(n49), .Y(difference[5]) );
  MUX21X1_HVT U85 ( .A1(N22), .A2(N30), .S0(n47), .Y(difference[4]) );
  MUX21X1_HVT U86 ( .A1(N21), .A2(N29), .S0(n49), .Y(difference[3]) );
  MUX21X1_HVT U87 ( .A1(S2[7]), .A2(S1[7]), .S0(n6), .Y(N17) );
  INVX1_LVT U88 ( .A(N17), .Y(n68) );
  AO22X1_LVT U89 ( .A1(n27), .A2(R[1]), .A3(n55), .A4(n54), .Y(n57) );
  OA221X1_LVT U90 ( .A1(R[3]), .A2(n18), .A3(R[4]), .A4(n61), .A5(n59), .Y(n60) );
  AO21X1_LVT U91 ( .A1(R[6]), .A2(n4), .A3(n16), .Y(n67) );
  INVX1_LVT U92 ( .A(R[7]), .Y(n65) );
  NAND2X0_LVT U93 ( .A1(N17), .A2(n65), .Y(n66) );
  MUX21X1_LVT U94 ( .A1(N41), .A2(difference[7]), .S0(n51), .Y(n70) );
  INVX1_LVT U95 ( .A(n52), .Y(n69) );
  MUX21X1_LVT U96 ( .A1(N40), .A2(difference[6]), .S0(n51), .Y(n71) );
  MUX21X1_LVT U97 ( .A1(N39), .A2(difference[5]), .S0(n51), .Y(n72) );
  MUX21X1_LVT U98 ( .A1(N38), .A2(difference[4]), .S0(n53), .Y(n73) );
  MUX21X1_LVT U99 ( .A1(N37), .A2(difference[3]), .S0(n52), .Y(n74) );
  MUX21X1_LVT U100 ( .A1(N19), .A2(N27), .S0(n48), .Y(difference[1]) );
  MUX21X1_LVT U101 ( .A1(N18), .A2(N26), .S0(n50), .Y(difference[0]) );
endmodule


module PE_12_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(
        SUM[1]) );
  XOR2X1_LVT U1 ( .A1(A[0]), .A2(n1), .Y(SUM[0]) );
  DELLN1X2_HVT U2 ( .A(B[0]), .Y(n1) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_12_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  FADDX1_HVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  XNOR2X1_HVT U1 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U2 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_12_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX0_HVT U1 ( .A(B[1]), .Y(n7) );
  INVX0_HVT U2 ( .A(B[2]), .Y(n6) );
  XNOR2X1_LVT U3 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U4 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX0_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U7 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U8 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U9 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_12 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  PE_12_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_12_DW01_sub_0 sub_83 ( .A({n14, n17, n16, n19, n24, n21, n25, n15}), .B(R), .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_12_DW01_sub_1 sub_79 ( .A(R), .B({n14, n17, n16, n19, n24, n21, n25, n18}), .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  DFFSSRX1_LVT \Accumulate_reg[7]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[7]), .CLK(clock), .Q(Accumulate[7]) );
  DFFSSRX1_LVT \Accumulate_reg[0]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[0]), .CLK(clock), .Q(Accumulate[0]) );
  DFFSSRX1_LVT \Accumulate_reg[1]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[1]), .CLK(clock), .Q(Accumulate[1]) );
  DFFSSRX1_LVT \Accumulate_reg[2]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[2]), .CLK(clock), .Q(Accumulate[2]) );
  DFFSSRX1_LVT \Accumulate_reg[4]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[4]), .CLK(clock), .Q(Accumulate[4]) );
  DFFSSRX2_LVT \Accumulate_reg[3]  ( .D(n67), .SETB(n62), .RSTB(1'b1), .CLK(
        clock), .Q(Accumulate[3]) );
  OR2X2_LVT U3 ( .A1(n70), .A2(n11), .Y(AccumulateIn[0]) );
  OR2X2_LVT U4 ( .A1(n69), .A2(n11), .Y(AccumulateIn[1]) );
  OR2X1_LVT U5 ( .A1(n68), .A2(n26), .Y(AccumulateIn[2]) );
  AND2X4_LVT U9 ( .A1(Carry), .A2(n61), .Y(n26) );
  DELLN1X2_HVT U10 ( .A(difference[0]), .Y(n4) );
  MUX21X1_HVT U11 ( .A1(N34), .A2(n4), .S0(n42), .Y(n70) );
  NAND2X0_LVT U12 ( .A1(n61), .A2(Carry), .Y(n62) );
  AOI22X2_LVT U13 ( .A1(R[7]), .A2(n60), .A3(n12), .A4(n58), .Y(n5) );
  MUX21X1_LVT U14 ( .A1(S2[2]), .A2(S1[2]), .S0(n36), .Y(N12) );
  DELLN1X2_HVT U15 ( .A(N15), .Y(n16) );
  NAND2X0_HVT U16 ( .A1(n52), .A2(R[4]), .Y(n6) );
  NAND2X0_HVT U17 ( .A1(R[5]), .A2(n54), .Y(n7) );
  AO21X1_LVT U18 ( .A1(R[6]), .A2(n56), .A3(n55), .Y(n59) );
  AO21X1_LVT U19 ( .A1(R[6]), .A2(n56), .A3(n55), .Y(n12) );
  MUX21X2_LVT U20 ( .A1(N22), .A2(N30), .S0(n13), .Y(difference[4]) );
  MUX21X1_LVT U21 ( .A1(N23), .A2(N31), .S0(n5), .Y(difference[5]) );
  AOI22X1_LVT U22 ( .A1(R[7]), .A2(n60), .A3(n59), .A4(n58), .Y(n8) );
  INVX0_LVT U23 ( .A(N13), .Y(n9) );
  INVX0_LVT U24 ( .A(N13), .Y(n51) );
  INVX0_LVT U25 ( .A(S1S2mux), .Y(n35) );
  AND2X1_LVT U26 ( .A1(Carry), .A2(n61), .Y(n11) );
  MUX21X1_LVT U27 ( .A1(S2[1]), .A2(S1[1]), .S0(n34), .Y(N11) );
  DELLN1X2_HVT U28 ( .A(N14), .Y(n19) );
  INVX0_LVT U29 ( .A(n20), .Y(n21) );
  NBUFFX2_HVT U30 ( .A(N11), .Y(n25) );
  OR2X2_LVT U31 ( .A1(R[5]), .A2(n54), .Y(n40) );
  MUX21X1_LVT U32 ( .A1(N18), .A2(N26), .S0(n8), .Y(difference[0]) );
  NAND3X0_LVT U33 ( .A1(n10), .A2(n6), .A3(n7), .Y(n53) );
  OAI221X1_LVT U34 ( .A1(R[3]), .A2(n9), .A3(R[4]), .A4(n52), .A5(n50), .Y(n10) );
  IBUFFX2_HVT U35 ( .A(n9), .Y(n24) );
  MUX21X1_LVT U36 ( .A1(N41), .A2(difference[7]), .S0(n42), .Y(n63) );
  MUX21X2_LVT U37 ( .A1(N25), .A2(N33), .S0(n5), .Y(difference[7]) );
  MUX21X1_LVT U38 ( .A1(N36), .A2(difference[2]), .S0(newDist), .Y(n68) );
  MUX21X1_LVT U39 ( .A1(N24), .A2(N32), .S0(n13), .Y(difference[6]) );
  MUX21X1_LVT U40 ( .A1(S2[5]), .A2(S1[5]), .S0(n22), .Y(N15) );
  MUX21X1_LVT U41 ( .A1(S2[4]), .A2(S1[4]), .S0(n37), .Y(N14) );
  NAND2X0_LVT U42 ( .A1(n44), .A2(N12), .Y(n49) );
  NBUFFX2_LVT U43 ( .A(n23), .Y(n13) );
  NBUFFX2_LVT U44 ( .A(S1S2mux), .Y(n34) );
  MUX21X1_LVT U45 ( .A1(S2[6]), .A2(S1[6]), .S0(n22), .Y(N16) );
  IBUFFX2_HVT U46 ( .A(n60), .Y(n14) );
  INVX0_LVT U47 ( .A(N17), .Y(n60) );
  NBUFFX2_LVT U48 ( .A(N10), .Y(n15) );
  MUX21X1_LVT U49 ( .A1(S2[3]), .A2(S1[3]), .S0(n37), .Y(N13) );
  MUX21X1_HVT U50 ( .A1(N40), .A2(difference[6]), .S0(n42), .Y(n64) );
  DELLN1X2_LVT U51 ( .A(N16), .Y(n17) );
  IBUFFX2_HVT U52 ( .A(n45), .Y(n18) );
  INVX0_LVT U53 ( .A(N10), .Y(n45) );
  INVX0_LVT U54 ( .A(N12), .Y(n20) );
  INVX0_LVT U55 ( .A(n35), .Y(n22) );
  OR2X2_LVT U56 ( .A1(n63), .A2(n26), .Y(AccumulateIn[7]) );
  OR2X2_LVT U57 ( .A1(n66), .A2(n11), .Y(AccumulateIn[4]) );
  AOI22X1_LVT U58 ( .A1(R[7]), .A2(n60), .A3(n12), .A4(n58), .Y(n23) );
  INVX0_LVT U59 ( .A(N14), .Y(n52) );
  MUX21X1_HVT U60 ( .A1(N35), .A2(difference[1]), .S0(n43), .Y(n69) );
  INVX0_LVT U61 ( .A(n35), .Y(n37) );
  MUX21X1_LVT U62 ( .A1(S2[0]), .A2(S1[0]), .S0(n34), .Y(N10) );
  MUX21X1_LVT U63 ( .A1(N21), .A2(N29), .S0(n5), .Y(difference[3]) );
  AND2X1_LVT U64 ( .A1(n40), .A2(n41), .Y(n27) );
  AND2X1_LVT U65 ( .A1(n53), .A2(n27), .Y(n55) );
  INVX0_LVT U66 ( .A(N11), .Y(n47) );
  INVX0_LVT U67 ( .A(N16), .Y(n56) );
  NBUFFX2_LVT U68 ( .A(newDist), .Y(n42) );
  NBUFFX2_LVT U69 ( .A(newDist), .Y(n43) );
  INVX1_LVT U70 ( .A(n65), .Y(n39) );
  INVX1_LVT U71 ( .A(n64), .Y(n38) );
  OR2X1_LVT U72 ( .A1(R[6]), .A2(n56), .Y(n41) );
  INVX0_LVT U79 ( .A(N15), .Y(n54) );
  INVX0_LVT U80 ( .A(n35), .Y(n36) );
  NAND2X0_HVT U81 ( .A1(n38), .A2(n62), .Y(AccumulateIn[6]) );
  NAND2X0_HVT U82 ( .A1(n39), .A2(n62), .Y(AccumulateIn[5]) );
  MUX21X1_HVT U83 ( .A1(N20), .A2(N28), .S0(n8), .Y(difference[2]) );
  MUX21X1_HVT U84 ( .A1(S2[7]), .A2(S1[7]), .S0(n36), .Y(N17) );
  INVX1_LVT U85 ( .A(R[2]), .Y(n44) );
  OA21X1_LVT U86 ( .A1(R[1]), .A2(n47), .A3(R[0]), .Y(n46) );
  AO22X1_LVT U87 ( .A1(R[1]), .A2(n47), .A3(n46), .A4(n45), .Y(n48) );
  AO222X1_LVT U88 ( .A1(n51), .A2(R[3]), .A3(n48), .A4(n49), .A5(n20), .A6(
        R[2]), .Y(n50) );
  INVX1_LVT U89 ( .A(R[7]), .Y(n57) );
  NAND2X0_LVT U90 ( .A1(N17), .A2(n57), .Y(n58) );
  INVX1_LVT U91 ( .A(n43), .Y(n61) );
  MUX21X1_LVT U92 ( .A1(N39), .A2(difference[5]), .S0(n42), .Y(n65) );
  MUX21X1_LVT U93 ( .A1(N38), .A2(difference[4]), .S0(newDist), .Y(n66) );
  MUX21X1_LVT U94 ( .A1(N37), .A2(difference[3]), .S0(n43), .Y(n67) );
  MUX21X1_LVT U95 ( .A1(N19), .A2(N27), .S0(n23), .Y(difference[1]) );
endmodule


module PE_11_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN1X2_HVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_HVT U2 ( .A1(A[0]), .A2(n1), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_11_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_HVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XOR3X1_LVT U2_7 ( .A1(A[7]), .A2(n1), .A3(carry[7]), .Y(DIFF[7]) );
  OR2X1_LVT U1 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX0_HVT U2 ( .A(B[5]), .Y(n3) );
  XNOR2X1_HVT U3 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX1_LVT U4 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U5 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_11_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX1_LVT U1 ( .A(B[5]), .Y(n3) );
  INVX0_LVT U2 ( .A(B[6]), .Y(n2) );
  INVX0_LVT U3 ( .A(B[7]), .Y(n1) );
  IBUFFX2_HVT U4 ( .A(B[0]), .Y(n8) );
  XNOR2X1_HVT U5 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX0_HVT U6 ( .A(B[1]), .Y(n7) );
  OR2X1_LVT U7 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX0_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U10 ( .A(B[3]), .Y(n5) );
endmodule


module PE_11 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  PE_11_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_11_DW01_sub_0 sub_83 ( .A({n12, n11, n25, n13, n10, n9, n14, n8}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_11_DW01_sub_1 sub_79 ( .A(R), .B({n12, N16, n25, n13, n10, n9, n14, N10}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  NBUFFX2_HVT U3 ( .A(N11), .Y(n14) );
  INVX0_LVT U4 ( .A(n24), .Y(n16) );
  AOI22X1_LVT U5 ( .A1(R[7]), .A2(n51), .A3(n50), .A4(n49), .Y(n4) );
  NBUFFX2_LVT U9 ( .A(n29), .Y(n27) );
  MUX21X1_LVT U10 ( .A1(N34), .A2(n7), .S0(n33), .Y(n61) );
  NBUFFX2_LVT U11 ( .A(n29), .Y(n6) );
  NBUFFX2_LVT U12 ( .A(Carry), .Y(n28) );
  DELLN2X2_LVT U13 ( .A(N14), .Y(n13) );
  MUX21X1_LVT U14 ( .A1(difference[7]), .A2(N41), .S0(n52), .Y(n54) );
  OR2X1_LVT U15 ( .A1(n59), .A2(n6), .Y(AccumulateIn[2]) );
  OR2X1_LVT U16 ( .A1(n61), .A2(n6), .Y(AccumulateIn[0]) );
  NAND2X0_LVT U17 ( .A1(n31), .A2(n53), .Y(AccumulateIn[6]) );
  NAND2X0_LVT U18 ( .A1(n30), .A2(n53), .Y(AccumulateIn[7]) );
  NAND2X0_LVT U19 ( .A1(n52), .A2(n28), .Y(n53) );
  OR2X1_LVT U20 ( .A1(n57), .A2(n27), .Y(AccumulateIn[4]) );
  OR2X1_LVT U21 ( .A1(n58), .A2(n22), .Y(AccumulateIn[3]) );
  OR2X1_LVT U22 ( .A1(n60), .A2(n27), .Y(AccumulateIn[1]) );
  INVX1_LVT U23 ( .A(N15), .Y(n45) );
  MUX21X1_LVT U24 ( .A1(S2[1]), .A2(S1[1]), .S0(n15), .Y(N11) );
  NBUFFX2_LVT U25 ( .A(n5), .Y(n15) );
  INVX0_LVT U26 ( .A(N13), .Y(n41) );
  IBUFFX2_HVT U27 ( .A(n45), .Y(n25) );
  NBUFFX2_LVT U28 ( .A(S1S2mux), .Y(n5) );
  MUX21X1_LVT U29 ( .A1(N35), .A2(difference[1]), .S0(n32), .Y(n60) );
  DELLN2X2_HVT U30 ( .A(difference[0]), .Y(n7) );
  MUX21X1_HVT U31 ( .A1(N39), .A2(difference[5]), .S0(newDist), .Y(n56) );
  INVX0_LVT U32 ( .A(n34), .Y(n8) );
  MUX21X1_LVT U33 ( .A1(S2[0]), .A2(S1[0]), .S0(n26), .Y(N10) );
  MUX21X1_HVT U34 ( .A1(N40), .A2(difference[6]), .S0(n33), .Y(n55) );
  NBUFFX2_LVT U35 ( .A(N12), .Y(n9) );
  OR2X1_LVT U36 ( .A1(n37), .A2(R[2]), .Y(n39) );
  INVX0_LVT U37 ( .A(N12), .Y(n37) );
  NBUFFX2_HVT U38 ( .A(N13), .Y(n10) );
  IBUFFX2_HVT U39 ( .A(n47), .Y(n11) );
  INVX0_LVT U40 ( .A(N16), .Y(n47) );
  INVX0_HVT U41 ( .A(n51), .Y(n12) );
  INVX0_LVT U42 ( .A(N17), .Y(n51) );
  MUX21X1_LVT U43 ( .A1(S2[5]), .A2(S1[5]), .S0(n21), .Y(N15) );
  MUX21X1_HVT U44 ( .A1(N36), .A2(difference[2]), .S0(n33), .Y(n59) );
  MUX21X2_LVT U45 ( .A1(N29), .A2(N21), .S0(n16), .Y(difference[3]) );
  MUX21X1_HVT U46 ( .A1(N38), .A2(difference[4]), .S0(n33), .Y(n57) );
  INVX1_LVT U47 ( .A(n17), .Y(n23) );
  AO22X1_LVT U48 ( .A1(R[7]), .A2(n51), .A3(n50), .A4(n49), .Y(n17) );
  OR2X1_LVT U49 ( .A1(R[3]), .A2(n41), .Y(n18) );
  OR2X1_LVT U50 ( .A1(R[4]), .A2(n43), .Y(n19) );
  AND3X1_LVT U51 ( .A1(n19), .A2(n18), .A3(n40), .Y(n42) );
  INVX0_LVT U52 ( .A(N14), .Y(n43) );
  MUX21X1_LVT U53 ( .A1(S2[6]), .A2(S1[6]), .S0(n21), .Y(N16) );
  NAND2X0_HVT U54 ( .A1(N17), .A2(n48), .Y(n49) );
  NBUFFX2_LVT U55 ( .A(S1S2mux), .Y(n20) );
  MUX21X2_LVT U56 ( .A1(N18), .A2(N26), .S0(n23), .Y(difference[0]) );
  MUX21X2_LVT U57 ( .A1(N19), .A2(N27), .S0(n4), .Y(difference[1]) );
  NBUFFX2_LVT U58 ( .A(n20), .Y(n21) );
  NBUFFX2_HVT U59 ( .A(newDist), .Y(n32) );
  INVX0_LVT U60 ( .A(n54), .Y(n30) );
  INVX0_LVT U61 ( .A(n55), .Y(n31) );
  INVX1_LVT U62 ( .A(n32), .Y(n52) );
  NBUFFX2_LVT U63 ( .A(newDist), .Y(n33) );
  OR2X1_LVT U64 ( .A1(n56), .A2(n22), .Y(AccumulateIn[5]) );
  AND2X1_LVT U65 ( .A1(n28), .A2(n52), .Y(n22) );
  INVX0_HVT U66 ( .A(n17), .Y(n24) );
  INVX0_LVT U67 ( .A(N10), .Y(n34) );
  NBUFFX2_LVT U68 ( .A(n5), .Y(n26) );
  AND2X1_LVT U69 ( .A1(Carry), .A2(n52), .Y(n29) );
  MUX21X1_HVT U70 ( .A1(S2[4]), .A2(S1[4]), .S0(n20), .Y(N14) );
  MUX21X1_HVT U71 ( .A1(N25), .A2(N33), .S0(n24), .Y(difference[7]) );
  MUX21X1_HVT U72 ( .A1(N24), .A2(N32), .S0(n4), .Y(difference[6]) );
  MUX21X1_HVT U73 ( .A1(N23), .A2(N31), .S0(n24), .Y(difference[5]) );
  MUX21X1_HVT U74 ( .A1(N22), .A2(N30), .S0(n4), .Y(difference[4]) );
  MUX21X1_HVT U75 ( .A1(N20), .A2(N28), .S0(n23), .Y(difference[2]) );
  INVX0_LVT U76 ( .A(N11), .Y(n36) );
  MUX21X1_HVT U77 ( .A1(S2[7]), .A2(S1[7]), .S0(n21), .Y(N17) );
  MUX21X1_LVT U78 ( .A1(S2[3]), .A2(S1[3]), .S0(n26), .Y(N13) );
  MUX21X1_LVT U79 ( .A1(S2[2]), .A2(S1[2]), .S0(n20), .Y(N12) );
  OA21X1_LVT U80 ( .A1(R[1]), .A2(n36), .A3(R[0]), .Y(n35) );
  AO22X1_LVT U81 ( .A1(n36), .A2(R[1]), .A3(n35), .A4(n34), .Y(n38) );
  AO222X1_LVT U82 ( .A1(R[3]), .A2(n41), .A3(n38), .A4(n39), .A5(R[2]), .A6(
        n37), .Y(n40) );
  AO221X1_LVT U83 ( .A1(R[5]), .A2(n45), .A3(n43), .A4(R[4]), .A5(n42), .Y(n44) );
  OA221X1_LVT U84 ( .A1(R[5]), .A2(n45), .A3(R[6]), .A4(n47), .A5(n44), .Y(n46) );
  AO21X1_LVT U85 ( .A1(R[6]), .A2(n47), .A3(n46), .Y(n50) );
  INVX1_LVT U86 ( .A(R[7]), .Y(n48) );
  MUX21X1_LVT U87 ( .A1(N37), .A2(difference[3]), .S0(n32), .Y(n58) );
endmodule


module PE_10_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN1X2_HVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_HVT U2 ( .A1(A[0]), .A2(n1), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(A[0]), .A2(B[0]), .Y(carry[1]) );
endmodule


module PE_10_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX0_HVT U1 ( .A(B[5]), .Y(n3) );
  INVX0_HVT U2 ( .A(B[4]), .Y(n4) );
  XNOR2X1_LVT U3 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U4 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U5 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U6 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_10_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX1_LVT U1 ( .A(B[1]), .Y(n7) );
  INVX0_HVT U2 ( .A(B[4]), .Y(n4) );
  INVX0_LVT U3 ( .A(B[5]), .Y(n3) );
  XNOR2X1_LVT U4 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U5 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX0_LVT U6 ( .A(B[0]), .Y(n8) );
  INVX1_LVT U7 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U8 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U9 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U10 ( .A(B[2]), .Y(n6) );
endmodule


module PE_10 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  PE_10_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_10_DW01_sub_0 sub_83 ( .A({n44, N16, n45, n46, N13, n18, n5, N10}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_10_DW01_sub_1 sub_79 ( .A(R), .B({n44, N16, N15, n46, N13, n18, n5, N10}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  DFFSSRX1_LVT \Accumulate_reg[7]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[7]), .CLK(clock), .Q(Accumulate[7]) );
  DFFSSRX1_LVT \Accumulate_reg[4]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[4]), .CLK(clock), .Q(Accumulate[4]) );
  DFFSSRX1_LVT \Accumulate_reg[6]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[6]), .CLK(clock), .Q(Accumulate[6]) );
  DFFSSRX1_LVT \Accumulate_reg[3]  ( .D(n75), .SETB(n70), .RSTB(1'b1), .CLK(
        clock), .Q(Accumulate[3]) );
  DFFX1_HVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_HVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  DFFX1_HVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_HVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  NAND2X1_LVT U3 ( .A1(R[2]), .A2(n56), .Y(n50) );
  DELLN1X2_HVT U4 ( .A(difference[1]), .Y(n4) );
  MUX21X2_LVT U5 ( .A1(n20), .A2(n19), .S0(n13), .Y(n9) );
  INVX0_LVT U9 ( .A(S2[3]), .Y(n19) );
  INVX0_LVT U10 ( .A(S1[3]), .Y(n20) );
  INVX0_LVT U11 ( .A(S2[0]), .Y(n11) );
  INVX0_HVT U12 ( .A(n9), .Y(N13) );
  INVX1_LVT U13 ( .A(N17), .Y(n68) );
  OR2X1_LVT U14 ( .A1(n78), .A2(n15), .Y(AccumulateIn[0]) );
  INVX0_HVT U15 ( .A(n10), .Y(N10) );
  MUX21X1_LVT U16 ( .A1(S2[2]), .A2(S1[2]), .S0(n21), .Y(N12) );
  DELLN3X2_LVT U17 ( .A(N12), .Y(n18) );
  MUX21X1_HVT U18 ( .A1(S2[1]), .A2(S1[1]), .S0(n8), .Y(n5) );
  MUX21X1_LVT U19 ( .A1(S2[1]), .A2(S1[1]), .S0(n24), .Y(N11) );
  OR2X1_LVT U20 ( .A1(n71), .A2(n31), .Y(AccumulateIn[7]) );
  INVX0_LVT U21 ( .A(S1[0]), .Y(n12) );
  INVX0_HVT U22 ( .A(R[7]), .Y(n65) );
  AOI22X1_HVT U23 ( .A1(R[7]), .A2(n68), .A3(n67), .A4(n66), .Y(n36) );
  AND2X1_LVT U24 ( .A1(n69), .A2(Carry), .Y(n25) );
  INVX0_LVT U25 ( .A(n16), .Y(n70) );
  INVX0_LVT U26 ( .A(n23), .Y(n6) );
  INVX0_LVT U27 ( .A(S1S2mux), .Y(n23) );
  NBUFFX2_LVT U28 ( .A(n6), .Y(n47) );
  INVX0_LVT U29 ( .A(n6), .Y(n7) );
  INVX1_LVT U30 ( .A(n7), .Y(n8) );
  IBUFFX2_HVT U31 ( .A(n68), .Y(n44) );
  INVX0_LVT U32 ( .A(n24), .Y(n14) );
  MUX21X1_LVT U33 ( .A1(n11), .A2(n12), .S0(n47), .Y(n10) );
  NBUFFX2_LVT U34 ( .A(n14), .Y(n13) );
  AND2X1_LVT U35 ( .A1(Carry), .A2(n69), .Y(n16) );
  MUX21X1_LVT U36 ( .A1(N34), .A2(n29), .S0(n53), .Y(n78) );
  NBUFFX2_LVT U37 ( .A(n25), .Y(n30) );
  INVX0_LVT U38 ( .A(n70), .Y(n15) );
  NBUFFX2_LVT U39 ( .A(n40), .Y(n17) );
  INVX0_LVT U40 ( .A(n61), .Y(n46) );
  OR2X1_LVT U41 ( .A1(n56), .A2(R[2]), .Y(n58) );
  INVX0_LVT U42 ( .A(n14), .Y(n21) );
  INVX0_LVT U43 ( .A(n23), .Y(n24) );
  AND2X1_LVT U44 ( .A1(n26), .A2(n27), .Y(n22) );
  AND2X1_LVT U45 ( .A1(n62), .A2(n22), .Y(n64) );
  OR2X1_LVT U46 ( .A1(R[5]), .A2(n63), .Y(n26) );
  OR2X1_HVT U47 ( .A1(R[6]), .A2(n40), .Y(n27) );
  MUX21X1_HVT U48 ( .A1(N35), .A2(n4), .S0(newDist), .Y(n77) );
  MUX21X2_LVT U49 ( .A1(N19), .A2(N27), .S0(n28), .Y(difference[1]) );
  INVX0_LVT U50 ( .A(N15), .Y(n63) );
  MUX21X1_LVT U51 ( .A1(S2[5]), .A2(S1[5]), .S0(n8), .Y(N15) );
  NBUFFX2_LVT U52 ( .A(n38), .Y(n28) );
  OR2X2_LVT U53 ( .A1(n72), .A2(n31), .Y(AccumulateIn[6]) );
  OR2X2_LVT U54 ( .A1(n74), .A2(n31), .Y(AccumulateIn[4]) );
  DELLN2X2_HVT U55 ( .A(difference[0]), .Y(n29) );
  INVX0_LVT U56 ( .A(n63), .Y(n45) );
  INVX0_LVT U57 ( .A(N11), .Y(n55) );
  NBUFFX2_LVT U58 ( .A(n16), .Y(n31) );
  INVX0_HVT U59 ( .A(S2[6]), .Y(n41) );
  INVX0_HVT U60 ( .A(S1[6]), .Y(n42) );
  NAND2X0_LVT U61 ( .A1(R[3]), .A2(n9), .Y(n48) );
  INVX0_HVT U62 ( .A(n17), .Y(N16) );
  NBUFFX2_LVT U63 ( .A(newDist), .Y(n53) );
  AOI22X1_LVT U64 ( .A1(R[7]), .A2(n68), .A3(n67), .A4(n66), .Y(n37) );
  INVX0_LVT U65 ( .A(R[4]), .Y(n39) );
  AOI22X1_LVT U66 ( .A1(R[7]), .A2(n68), .A3(n67), .A4(n66), .Y(n38) );
  NAND2X0_LVT U71 ( .A1(n39), .A2(N14), .Y(n52) );
  INVX0_LVT U72 ( .A(n47), .Y(n43) );
  MUX21X1_LVT U73 ( .A1(S1[4]), .A2(S2[4]), .S0(n43), .Y(N14) );
  MUX21X1_LVT U74 ( .A1(n42), .A2(n41), .S0(n43), .Y(n40) );
  INVX0_LVT U75 ( .A(N14), .Y(n61) );
  NAND2X0_LVT U76 ( .A1(n58), .A2(n57), .Y(n49) );
  NAND3X0_LVT U77 ( .A1(n49), .A2(n48), .A3(n50), .Y(n59) );
  INVX0_LVT U78 ( .A(N12), .Y(n56) );
  OR2X1_HVT U79 ( .A1(R[3]), .A2(n9), .Y(n51) );
  AND3X1_LVT U80 ( .A1(n59), .A2(n52), .A3(n51), .Y(n60) );
  MUX21X1_HVT U81 ( .A1(S2[7]), .A2(S1[7]), .S0(n8), .Y(N17) );
  OA21X1_LVT U82 ( .A1(R[1]), .A2(n55), .A3(R[0]), .Y(n54) );
  AO22X1_LVT U83 ( .A1(R[1]), .A2(n55), .A3(n54), .A4(n10), .Y(n57) );
  AO221X1_LVT U84 ( .A1(R[5]), .A2(n63), .A3(R[4]), .A4(n61), .A5(n60), .Y(n62) );
  AO21X1_LVT U85 ( .A1(R[6]), .A2(n17), .A3(n64), .Y(n67) );
  NAND2X0_LVT U86 ( .A1(N17), .A2(n65), .Y(n66) );
  MUX21X1_LVT U87 ( .A1(N25), .A2(N33), .S0(n36), .Y(difference[7]) );
  MUX21X1_LVT U88 ( .A1(N41), .A2(difference[7]), .S0(n53), .Y(n71) );
  INVX1_LVT U89 ( .A(newDist), .Y(n69) );
  MUX21X1_LVT U90 ( .A1(N24), .A2(N32), .S0(n37), .Y(difference[6]) );
  MUX21X1_LVT U91 ( .A1(N40), .A2(difference[6]), .S0(n53), .Y(n72) );
  MUX21X1_LVT U92 ( .A1(N23), .A2(N31), .S0(n36), .Y(difference[5]) );
  MUX21X1_LVT U93 ( .A1(N39), .A2(difference[5]), .S0(n53), .Y(n73) );
  OR2X1_LVT U94 ( .A1(n73), .A2(n25), .Y(AccumulateIn[5]) );
  MUX21X1_LVT U95 ( .A1(N22), .A2(N30), .S0(n37), .Y(difference[4]) );
  MUX21X1_LVT U96 ( .A1(N38), .A2(difference[4]), .S0(newDist), .Y(n74) );
  MUX21X1_LVT U97 ( .A1(N21), .A2(N29), .S0(n36), .Y(difference[3]) );
  MUX21X1_LVT U98 ( .A1(N37), .A2(difference[3]), .S0(n53), .Y(n75) );
  MUX21X1_LVT U99 ( .A1(N20), .A2(N28), .S0(n37), .Y(difference[2]) );
  MUX21X1_LVT U100 ( .A1(N36), .A2(difference[2]), .S0(newDist), .Y(n76) );
  OR2X1_LVT U101 ( .A1(n76), .A2(n30), .Y(AccumulateIn[2]) );
  OR2X1_LVT U102 ( .A1(n77), .A2(n30), .Y(AccumulateIn[1]) );
  MUX21X1_LVT U103 ( .A1(N18), .A2(N26), .S0(n38), .Y(difference[0]) );
endmodule


module PE_9_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(
        SUM[1]) );
  XOR2X1_LVT U1 ( .A1(A[0]), .A2(n1), .Y(SUM[0]) );
  DELLN1X2_HVT U2 ( .A(B[0]), .Y(n1) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_9_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_HVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  INVX0_HVT U1 ( .A(B[7]), .Y(n1) );
  XNOR2X1_HVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X2_LVT U3 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_9_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  IBUFFX2_HVT U1 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U2 ( .A(B[4]), .Y(n4) );
  INVX0_HVT U3 ( .A(B[5]), .Y(n3) );
  INVX0_HVT U4 ( .A(B[7]), .Y(n1) );
  XNOR2X1_HVT U5 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  IBUFFX2_HVT U6 ( .A(B[3]), .Y(n5) );
  INVX0_HVT U7 ( .A(B[1]), .Y(n7) );
  INVX0_LVT U8 ( .A(B[0]), .Y(n8) );
  INVX0_HVT U9 ( .A(B[2]), .Y(n6) );
  OR2X1_LVT U10 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_9 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  PE_9_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_9_DW01_sub_0 sub_83 ( .A({N17, N16, n7, n14, n18, n16, n15, n17}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_9_DW01_sub_1 sub_79 ( .A(R), .B({N17, N16, N15, n14, N13, n16, n15, N10}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  MUX21X2_LVT U3 ( .A1(S2[1]), .A2(S1[1]), .S0(n33), .Y(N11) );
  DELLN2X2_HVT U4 ( .A(difference[0]), .Y(n23) );
  MUX21X1_LVT U5 ( .A1(N26), .A2(N18), .S0(n11), .Y(difference[0]) );
  INVX0_LVT U9 ( .A(N16), .Y(n56) );
  AND2X1_LVT U10 ( .A1(R[5]), .A2(n54), .Y(n4) );
  AND2X1_LVT U11 ( .A1(R[4]), .A2(n13), .Y(n5) );
  OR3X1_LVT U12 ( .A1(n4), .A2(n5), .A3(n52), .Y(n53) );
  MUX21X1_LVT U13 ( .A1(N34), .A2(n23), .S0(newDist), .Y(n71) );
  INVX1_LVT U14 ( .A(N14), .Y(n13) );
  MUX21X1_LVT U15 ( .A1(N37), .A2(difference[3]), .S0(n43), .Y(n67) );
  MUX21X1_HVT U16 ( .A1(difference[6]), .A2(N40), .S0(n61), .Y(n64) );
  NBUFFX2_HVT U17 ( .A(N12), .Y(n16) );
  NBUFFX2_HVT U18 ( .A(N11), .Y(n15) );
  MUX21X1_LVT U19 ( .A1(N19), .A2(N27), .S0(n36), .Y(difference[1]) );
  NBUFFX2_LVT U20 ( .A(n32), .Y(n6) );
  OR2X2_HVT U21 ( .A1(R[3]), .A2(n51), .Y(n29) );
  DELLN2X2_LVT U22 ( .A(N13), .Y(n18) );
  IBUFFX2_HVT U23 ( .A(n54), .Y(n7) );
  INVX0_LVT U24 ( .A(N15), .Y(n54) );
  OR2X2_LVT U25 ( .A1(n63), .A2(n70), .Y(AccumulateIn[7]) );
  AO21X2_HVT U26 ( .A1(R[6]), .A2(n56), .A3(n55), .Y(n59) );
  MUX21X1_LVT U27 ( .A1(N25), .A2(N33), .S0(n35), .Y(difference[7]) );
  INVX0_LVT U28 ( .A(R[7]), .Y(n57) );
  NAND2X0_LVT U29 ( .A1(n40), .A2(n24), .Y(AccumulateIn[6]) );
  NAND2X0_LVT U30 ( .A1(n31), .A2(n24), .Y(AccumulateIn[0]) );
  INVX0_LVT U31 ( .A(N13), .Y(n51) );
  NAND2X0_LVT U32 ( .A1(R[3]), .A2(n51), .Y(n26) );
  NBUFFX2_LVT U33 ( .A(n33), .Y(n8) );
  AND2X1_LVT U34 ( .A1(n26), .A2(n28), .Y(n9) );
  NAND2X0_LVT U35 ( .A1(n37), .A2(n25), .Y(AccumulateIn[2]) );
  NAND2X0_LVT U36 ( .A1(n41), .A2(n25), .Y(AccumulateIn[5]) );
  NAND2X0_LVT U37 ( .A1(n9), .A2(n27), .Y(n50) );
  NBUFFX2_LVT U38 ( .A(S1S2mux), .Y(n10) );
  NAND2X0_LVT U39 ( .A1(R[2]), .A2(n47), .Y(n28) );
  AO22X1_LVT U40 ( .A1(R[7]), .A2(n60), .A3(n20), .A4(n58), .Y(n11) );
  NBUFFX2_LVT U41 ( .A(n58), .Y(n12) );
  INVX1_LVT U42 ( .A(n13), .Y(n14) );
  MUX21X2_LVT U43 ( .A1(N20), .A2(N28), .S0(n19), .Y(difference[2]) );
  MUX21X1_LVT U44 ( .A1(S2[2]), .A2(S1[2]), .S0(n6), .Y(N12) );
  INVX0_LVT U45 ( .A(n44), .Y(n17) );
  INVX0_LVT U46 ( .A(N10), .Y(n44) );
  OR2X1_LVT U47 ( .A1(n47), .A2(R[2]), .Y(n49) );
  MUX21X1_LVT U48 ( .A1(S2[3]), .A2(S1[3]), .S0(n32), .Y(N13) );
  MUX21X1_LVT U49 ( .A1(N21), .A2(N29), .S0(n35), .Y(difference[3]) );
  AOI22X1_LVT U50 ( .A1(R[7]), .A2(n60), .A3(n59), .A4(n12), .Y(n19) );
  AO21X1_LVT U51 ( .A1(R[6]), .A2(n56), .A3(n55), .Y(n20) );
  NBUFFX2_LVT U52 ( .A(n36), .Y(n21) );
  MUX21X1_HVT U53 ( .A1(N36), .A2(difference[2]), .S0(n42), .Y(n68) );
  DELLN1X2_HVT U54 ( .A(difference[1]), .Y(n22) );
  INVX0_LVT U55 ( .A(n71), .Y(n31) );
  OR2X2_LVT U56 ( .A1(n67), .A2(n39), .Y(AccumulateIn[3]) );
  MUX21X1_HVT U57 ( .A1(N38), .A2(difference[4]), .S0(n42), .Y(n66) );
  MUX21X1_HVT U58 ( .A1(N39), .A2(difference[5]), .S0(n42), .Y(n65) );
  OR2X2_LVT U59 ( .A1(n66), .A2(n70), .Y(AccumulateIn[4]) );
  NBUFFX2_LVT U60 ( .A(n38), .Y(n24) );
  OR2X2_LVT U61 ( .A1(n69), .A2(n39), .Y(AccumulateIn[1]) );
  NBUFFX2_LVT U62 ( .A(n62), .Y(n25) );
  NAND2X0_LVT U63 ( .A1(n48), .A2(n49), .Y(n27) );
  OR2X1_LVT U64 ( .A1(R[4]), .A2(n13), .Y(n30) );
  AND3X1_LVT U65 ( .A1(n50), .A2(n30), .A3(n29), .Y(n52) );
  NAND2X0_LVT U66 ( .A1(n61), .A2(Carry), .Y(n38) );
  MUX21X1_LVT U67 ( .A1(S2[0]), .A2(S1[0]), .S0(n34), .Y(N10) );
  MUX21X1_HVT U68 ( .A1(N35), .A2(n22), .S0(n43), .Y(n69) );
  INVX0_LVT U69 ( .A(N11), .Y(n46) );
  NAND2X0_LVT U70 ( .A1(n61), .A2(Carry), .Y(n62) );
  INVX0_LVT U71 ( .A(n64), .Y(n40) );
  INVX0_LVT U72 ( .A(n68), .Y(n37) );
  NBUFFX2_LVT U73 ( .A(newDist), .Y(n43) );
  NBUFFX2_LVT U74 ( .A(newDist), .Y(n42) );
  MUX21X1_LVT U75 ( .A1(N41), .A2(difference[7]), .S0(n42), .Y(n63) );
  INVX1_LVT U76 ( .A(n65), .Y(n41) );
  AOI22X1_LVT U77 ( .A1(R[7]), .A2(n60), .A3(n20), .A4(n58), .Y(n36) );
  AOI22X1_LVT U78 ( .A1(R[7]), .A2(n60), .A3(n59), .A4(n12), .Y(n35) );
  NBUFFX2_LVT U79 ( .A(n10), .Y(n32) );
  NBUFFX2_LVT U80 ( .A(n10), .Y(n33) );
  NBUFFX2_LVT U81 ( .A(S1S2mux), .Y(n34) );
  INVX0_LVT U82 ( .A(n62), .Y(n39) );
  INVX0_LVT U83 ( .A(n38), .Y(n70) );
  MUX21X1_HVT U84 ( .A1(N24), .A2(N32), .S0(n21), .Y(difference[6]) );
  MUX21X1_HVT U85 ( .A1(N23), .A2(N31), .S0(n35), .Y(difference[5]) );
  MUX21X1_HVT U86 ( .A1(N22), .A2(N30), .S0(n21), .Y(difference[4]) );
  INVX0_LVT U87 ( .A(N12), .Y(n47) );
  MUX21X1_LVT U88 ( .A1(S2[7]), .A2(S1[7]), .S0(n34), .Y(N17) );
  MUX21X1_LVT U89 ( .A1(S2[6]), .A2(S1[6]), .S0(n8), .Y(N16) );
  MUX21X1_LVT U90 ( .A1(S2[5]), .A2(S1[5]), .S0(n8), .Y(N15) );
  MUX21X1_LVT U91 ( .A1(S2[4]), .A2(S1[4]), .S0(n34), .Y(N14) );
  INVX1_LVT U92 ( .A(N17), .Y(n60) );
  OA21X1_LVT U93 ( .A1(R[1]), .A2(n46), .A3(R[0]), .Y(n45) );
  AO22X1_LVT U94 ( .A1(n46), .A2(R[1]), .A3(n45), .A4(n44), .Y(n48) );
  OA221X1_LVT U95 ( .A1(R[5]), .A2(n54), .A3(R[6]), .A4(n56), .A5(n53), .Y(n55) );
  NAND2X0_LVT U96 ( .A1(N17), .A2(n57), .Y(n58) );
  INVX1_LVT U97 ( .A(n43), .Y(n61) );
endmodule


module PE_8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   net13677, \carry[7] , \carry[6] , \carry[5] , \carry[4] , \carry[3] ,
         \carry[2] , \carry[1] ;

  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(\carry[1] ), .CO(\carry[2] ), .S(
        SUM[1]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(\carry[2] ), .CO(\carry[3] ), .S(
        SUM[2]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(\carry[3] ), .CO(\carry[4] ), .S(
        SUM[3]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(\carry[4] ), .CO(\carry[5] ), .S(
        SUM[4]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(\carry[5] ), .CO(\carry[6] ), .S(
        SUM[5]) );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(\carry[6] ), .CO(\carry[7] ), .S(
        SUM[6]) );
  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(\carry[7] ), .CO(SUM[8]), .S(
        SUM[7]) );
  AND2X1_LVT U1 ( .A1(B[0]), .A2(A[0]), .Y(\carry[1] ) );
  DELLN1X2_HVT U2 ( .A(B[0]), .Y(net13677) );
  XOR2X1_HVT U3 ( .A1(A[0]), .A2(net13677), .Y(SUM[0]) );
endmodule


module PE_8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  XOR3X1_LVT U2_7 ( .A1(A[7]), .A2(n1), .A3(carry[7]), .Y(DIFF[7]) );
  OR2X2_LVT U1 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX0_HVT U2 ( .A(B[3]), .Y(n5) );
  XNOR2X1_HVT U3 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX1_LVT U4 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U5 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U6 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U7 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_8_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX0_LVT U1 ( .A(B[7]), .Y(n1) );
  INVX0_HVT U2 ( .A(B[2]), .Y(n6) );
  XNOR2X1_HVT U3 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX0_HVT U4 ( .A(B[1]), .Y(n7) );
  OR2X1_LVT U5 ( .A1(A[0]), .A2(n8), .Y(carry[1]) );
  INVX0_LVT U6 ( .A(B[6]), .Y(n2) );
  INVX0_LVT U7 ( .A(B[0]), .Y(n8) );
  INVX1_LVT U8 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U9 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U10 ( .A(B[3]), .Y(n5) );
endmodule


module PE_8 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N14, N15, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27,
         N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41,
         Carry, net8153, net8966, net9201, net9220, net9233, net12267,
         net12850, net13060, net13368, net13540, net13816, net14704, net14720,
         net14803, net8963, net8155, net14666, N11, net9195, net9194, net13090,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  PE_8_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_8_DW01_sub_0 sub_83 ( .A({net13816, net14720, n44, n45, net9201, net13540, 
        net12267, n46}), .B(R), .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, 
        N27, N26}) );
  PE_8_DW01_sub_1 sub_79 ( .A(R), .B({net13816, net14720, n44, n45, net9201, 
        net13540, net12267, N10}), .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, 
        N20, N19, N18}) );
  DFFSSRX1_LVT \Accumulate_reg[6]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[6]), .CLK(clock), .Q(Accumulate[6]) );
  DFFSSRX1_LVT \Accumulate_reg[0]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[0]), .CLK(clock), .Q(Accumulate[0]) );
  DFFSSRX1_LVT \Accumulate_reg[2]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[2]), .CLK(clock), .Q(Accumulate[2]) );
  DFFSSRX1_LVT \Accumulate_reg[5]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[5]), .CLK(clock), .Q(Accumulate[5]) );
  DFFSSRX1_LVT \Accumulate_reg[1]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[1]), .CLK(clock), .Q(Accumulate[1]) );
  DFFSSRX1_LVT \Accumulate_reg[3]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[3]), .CLK(clock), .Q(Accumulate[3]) );
  DFFSSRX1_LVT \Accumulate_reg[4]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[4]), .CLK(clock), .Q(Accumulate[4]) );
  DFFSSRX2_LVT \Accumulate_reg[7]  ( .D(n68), .SETB(n67), .RSTB(1'b1), .CLK(
        clock), .Q(Accumulate[7]) );
  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  MUX21X1_LVT U3 ( .A1(n30), .A2(n31), .S0(n40), .Y(n4) );
  MUX21X1_LVT U4 ( .A1(n30), .A2(n31), .S0(n40), .Y(n33) );
  MUX21X1_LVT U5 ( .A1(n6), .A2(n7), .S0(net13060), .Y(n5) );
  IBUFFX16_HVT U9 ( .A(S2[6]), .Y(n6) );
  IBUFFX16_HVT U10 ( .A(S1[6]), .Y(n7) );
  MUX21X1_LVT U11 ( .A1(N41), .A2(difference[7]), .S0(n65), .Y(n68) );
  INVX1_LVT U12 ( .A(n64), .Y(n66) );
  INVX0_HVT U13 ( .A(n17), .Y(n44) );
  INVX0_HVT U14 ( .A(S1[0]), .Y(net9195) );
  NBUFFX2_LVT U15 ( .A(newDist), .Y(n64) );
  NBUFFX2_LVT U16 ( .A(newDist), .Y(n65) );
  NBUFFX2_LVT U17 ( .A(n43), .Y(n8) );
  MUX21X1_LVT U18 ( .A1(N24), .A2(N32), .S0(net12850), .Y(difference[6]) );
  MUX21X1_LVT U19 ( .A1(N19), .A2(N27), .S0(net9220), .Y(difference[1]) );
  INVX0_LVT U20 ( .A(n41), .Y(n42) );
  INVX0_HVT U21 ( .A(n41), .Y(net8966) );
  INVX0_HVT U22 ( .A(n11), .Y(N10) );
  OR2X1_LVT U23 ( .A1(R[6]), .A2(n5), .Y(net8963) );
  NAND2X0_HVT U24 ( .A1(n14), .A2(n22), .Y(n9) );
  NAND3X0_LVT U25 ( .A1(n10), .A2(n39), .A3(n23), .Y(n26) );
  INVX1_LVT U26 ( .A(n9), .Y(n10) );
  MUX21X2_LVT U27 ( .A1(net9194), .A2(net9195), .S0(net13090), .Y(n11) );
  MUX21X2_LVT U28 ( .A1(S2[7]), .A2(S1[7]), .S0(net14704), .Y(N17) );
  NAND2X0_HVT U29 ( .A1(n66), .A2(Carry), .Y(n67) );
  MUX21X1_LVT U30 ( .A1(N25), .A2(N33), .S0(net9233), .Y(difference[7]) );
  INVX0_LVT U31 ( .A(S2[0]), .Y(net9194) );
  INVX1_LVT U32 ( .A(R[1]), .Y(n12) );
  INVX1_LVT U33 ( .A(R[3]), .Y(n14) );
  INVX1_LVT U34 ( .A(R[4]), .Y(n15) );
  INVX1_LVT U35 ( .A(R[5]), .Y(n16) );
  OA21X1_LVT U36 ( .A1(n39), .A2(n14), .A3(n20), .Y(n19) );
  AND2X1_LVT U37 ( .A1(n22), .A2(n23), .Y(n21) );
  AND2X1_LVT U38 ( .A1(n26), .A2(n25), .Y(n24) );
  OA21X1_LVT U39 ( .A1(n17), .A2(R[5]), .A3(net8963), .Y(n27) );
  NAND2X0_LVT U40 ( .A1(R[2]), .A2(n29), .Y(n28) );
  INVX1_LVT U41 ( .A(S2[2]), .Y(n30) );
  INVX1_LVT U42 ( .A(S1[2]), .Y(n31) );
  NAND2X0_LVT U43 ( .A1(n33), .A2(R[2]), .Y(n20) );
  NAND2X0_LVT U44 ( .A1(n12), .A2(N11), .Y(n34) );
  NAND3X0_LVT U45 ( .A1(n11), .A2(R[0]), .A3(n34), .Y(n35) );
  NAND2X0_LVT U46 ( .A1(n13), .A2(R[1]), .Y(n36) );
  NAND2X0_LVT U47 ( .A1(n35), .A2(n36), .Y(n29) );
  NAND2X0_LVT U48 ( .A1(n4), .A2(n29), .Y(n37) );
  NAND4X0_LVT U49 ( .A1(n28), .A2(n37), .A3(n19), .A4(n21), .Y(n32) );
  NAND3X0_LVT U50 ( .A1(n45), .A2(n15), .A3(n23), .Y(n25) );
  OR2X1_LVT U51 ( .A1(N14), .A2(n15), .Y(n22) );
  OR2X1_LVT U52 ( .A1(N15), .A2(n16), .Y(n23) );
  INVX1_LVT U53 ( .A(n4), .Y(net13540) );
  INVX0_LVT U54 ( .A(N11), .Y(n13) );
  INVX0_HVT U55 ( .A(n13), .Y(net12267) );
  INVX1_LVT U56 ( .A(n38), .Y(n45) );
  INVX0_LVT U57 ( .A(N14), .Y(n38) );
  IBUFFX2_HVT U58 ( .A(N15), .Y(n17) );
  AND3X1_LVT U59 ( .A1(n32), .A2(n24), .A3(n27), .Y(net14666) );
  INVX0_LVT U60 ( .A(n18), .Y(net9201) );
  NBUFFX2_LVT U61 ( .A(N10), .Y(n46) );
  NBUFFX2_LVT U62 ( .A(S1S2mux), .Y(n43) );
  MUX21X1_HVT U63 ( .A1(S2[3]), .A2(S1[3]), .S0(n42), .Y(n39) );
  INVX0_LVT U64 ( .A(n39), .Y(n18) );
  NBUFFX2_LVT U65 ( .A(n8), .Y(n40) );
  AND3X1_LVT U66 ( .A1(n27), .A2(n24), .A3(n32), .Y(net8155) );
  INVX0_LVT U67 ( .A(S1S2mux), .Y(n41) );
  NBUFFX2_LVT U68 ( .A(n42), .Y(net13090) );
  NBUFFX2_LVT U69 ( .A(net13090), .Y(net14704) );
  MUX21X1_LVT U70 ( .A1(S2[1]), .A2(S1[1]), .S0(n8), .Y(N11) );
  MUX21X1_LVT U71 ( .A1(N18), .A2(N26), .S0(n51), .Y(difference[0]) );
  DELLN2X2_HVT U72 ( .A(difference[0]), .Y(net13368) );
  AOI22X1_LVT U73 ( .A1(R[7]), .A2(n48), .A3(n49), .A4(n50), .Y(n51) );
  DELLN2X2_LVT U74 ( .A(n51), .Y(net12850) );
  AO21X1_LVT U75 ( .A1(R[6]), .A2(n5), .A3(net14666), .Y(n49) );
  AO21X1_LVT U76 ( .A1(R[6]), .A2(n5), .A3(net8155), .Y(n47) );
  INVX1_LVT U77 ( .A(N17), .Y(n48) );
  IBUFFX2_HVT U78 ( .A(n48), .Y(net13816) );
  AOI22X1_LVT U79 ( .A1(R[7]), .A2(n48), .A3(n47), .A4(n50), .Y(net9233) );
  AOI22X1_LVT U80 ( .A1(R[7]), .A2(n48), .A3(n47), .A4(n50), .Y(net9220) );
  NAND2X0_LVT U81 ( .A1(N17), .A2(net8153), .Y(n50) );
  OR2X1_LVT U82 ( .A1(n75), .A2(n54), .Y(AccumulateIn[0]) );
  NBUFFX2_LVT U83 ( .A(net9220), .Y(net14803) );
  INVX0_LVT U84 ( .A(n5), .Y(net14720) );
  OR2X1_LVT U85 ( .A1(n74), .A2(n54), .Y(AccumulateIn[1]) );
  MUX21X1_HVT U86 ( .A1(N35), .A2(difference[1]), .S0(n64), .Y(n74) );
  MUX21X1_LVT U87 ( .A1(N21), .A2(N29), .S0(net9233), .Y(difference[3]) );
  MUX21X1_HVT U88 ( .A1(N37), .A2(difference[3]), .S0(n64), .Y(n72) );
  MUX21X1_HVT U89 ( .A1(N39), .A2(difference[5]), .S0(n64), .Y(n70) );
  OR2X4_HVT U90 ( .A1(n70), .A2(n52), .Y(AccumulateIn[5]) );
  OR2X2_LVT U91 ( .A1(n69), .A2(n55), .Y(AccumulateIn[6]) );
  MUX21X1_LVT U92 ( .A1(net13368), .A2(N34), .S0(n66), .Y(n75) );
  MUX21X1_LVT U93 ( .A1(N20), .A2(N28), .S0(net14803), .Y(difference[2]) );
  OR2X2_LVT U94 ( .A1(n72), .A2(n53), .Y(AccumulateIn[3]) );
  INVX0_LVT U95 ( .A(n67), .Y(n53) );
  MUX21X1_LVT U96 ( .A1(N22), .A2(N30), .S0(net12850), .Y(difference[4]) );
  AND2X1_LVT U97 ( .A1(Carry), .A2(n66), .Y(n52) );
  NBUFFX2_LVT U98 ( .A(n43), .Y(net13060) );
  OR2X2_LVT U99 ( .A1(n73), .A2(n55), .Y(AccumulateIn[2]) );
  OR2X2_LVT U100 ( .A1(n71), .A2(n53), .Y(AccumulateIn[4]) );
  NBUFFX2_HVT U101 ( .A(n52), .Y(n54) );
  NBUFFX2_HVT U102 ( .A(n52), .Y(n55) );
  MUX21X1_LVT U111 ( .A1(S2[4]), .A2(S1[4]), .S0(net8966), .Y(N14) );
  MUX21X1_LVT U112 ( .A1(S2[5]), .A2(S1[5]), .S0(net13060), .Y(N15) );
  MUX21X1_HVT U113 ( .A1(N23), .A2(N31), .S0(net9233), .Y(difference[5]) );
  INVX1_LVT U114 ( .A(R[7]), .Y(net8153) );
  MUX21X1_LVT U115 ( .A1(N40), .A2(difference[6]), .S0(newDist), .Y(n69) );
  MUX21X1_LVT U116 ( .A1(N38), .A2(difference[4]), .S0(n65), .Y(n71) );
  MUX21X1_LVT U117 ( .A1(N36), .A2(difference[2]), .S0(n65), .Y(n73) );
endmodule


module PE_7_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(carry[1]), .CI(B[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN2X2_LVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_HVT U2 ( .A1(A[0]), .A2(n1), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_7_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  XOR3X2_LVT U2_7 ( .A1(A[7]), .A2(n1), .A3(carry[7]), .Y(DIFF[7]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_0 ( .A(A[0]), .B(n8), .CI(1'b1), .CO(carry[1]), .S(DIFF[0]) );
  INVX0_LVT U1 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U2 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U3 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U4 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U5 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U6 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U7 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U8 ( .A(B[0]), .Y(n8) );
endmodule


module PE_7_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XOR3X2_LVT U2_7 ( .A1(A[7]), .A2(n1), .A3(carry[7]), .Y(DIFF[7]) );
  INVX0_LVT U1 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U2 ( .A(B[0]), .Y(n8) );
  INVX1_LVT U3 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U4 ( .A(B[4]), .Y(n4) );
  INVX0_HVT U5 ( .A(B[2]), .Y(n6) );
  XNOR2X1_LVT U6 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U7 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U8 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U9 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U10 ( .A(B[5]), .Y(n3) );
endmodule


module PE_7 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24,
         N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  PE_7_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_7_DW01_sub_0 sub_83 ( .A({N17, n9, n19, N14, n22, n17, N11, N10}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_7_DW01_sub_1 sub_79 ( .A(R), .B({N17, N16, n19, N14, n22, N12, N11, N10}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  DFFSSRX1_LVT \Accumulate_reg[4]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[4]), .CLK(clock), .Q(Accumulate[4]) );
  DFFSSRX1_LVT \Accumulate_reg[7]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[7]), .CLK(clock), .Q(Accumulate[7]) );
  DFFSSRX1_LVT \Accumulate_reg[6]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[6]), .CLK(clock), .Q(Accumulate[6]) );
  DFFSSRX1_LVT \Accumulate_reg[5]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[5]), .CLK(clock), .Q(Accumulate[5]) );
  DFFSSRX1_LVT \Accumulate_reg[2]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[2]), .CLK(clock), .Q(Accumulate[2]) );
  DFFSSRX1_LVT \Accumulate_reg[1]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[1]), .CLK(clock), .Q(Accumulate[1]) );
  DFFSSRX1_LVT \Accumulate_reg[0]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[0]), .CLK(clock), .Q(Accumulate[0]) );
  DFFSSRX1_LVT \Accumulate_reg[3]  ( .D(n77), .SETB(n72), .RSTB(1'b1), .CLK(
        clock), .Q(Accumulate[3]) );
  AND2X1_LVT U3 ( .A1(Carry), .A2(n71), .Y(n11) );
  MUX21X2_LVT U4 ( .A1(N29), .A2(N21), .S0(n21), .Y(difference[3]) );
  MUX21X2_LVT U5 ( .A1(N30), .A2(N22), .S0(n20), .Y(difference[4]) );
  MUX21X1_LVT U9 ( .A1(N26), .A2(N18), .S0(n4), .Y(difference[0]) );
  DELLN1X2_HVT U10 ( .A(difference[0]), .Y(n24) );
  DELLN3X2_LVT U11 ( .A(n15), .Y(n22) );
  INVX0_HVT U12 ( .A(S1[1]), .Y(n34) );
  INVX0_LVT U13 ( .A(S1[4]), .Y(n14) );
  INVX0_LVT U14 ( .A(S2[4]), .Y(n13) );
  INVX1_LVT U15 ( .A(R[3]), .Y(n5) );
  AND2X1_LVT U16 ( .A1(R[5]), .A2(n64), .Y(n49) );
  DELLN1X2_HVT U17 ( .A(N16), .Y(n9) );
  AOI22X1_LVT U18 ( .A1(R[7]), .A2(n70), .A3(n23), .A4(n68), .Y(n47) );
  AOI22X1_LVT U19 ( .A1(R[7]), .A2(n70), .A3(n23), .A4(n68), .Y(n48) );
  INVX0_LVT U20 ( .A(R[7]), .Y(n67) );
  MUX21X1_LVT U21 ( .A1(N19), .A2(N27), .S0(n47), .Y(difference[1]) );
  AO22X1_LVT U22 ( .A1(R[7]), .A2(n70), .A3(n69), .A4(n68), .Y(n4) );
  OR2X2_LVT U23 ( .A1(n78), .A2(n11), .Y(AccumulateIn[2]) );
  MUX21X2_LVT U24 ( .A1(N32), .A2(N24), .S0(n20), .Y(difference[6]) );
  INVX0_LVT U25 ( .A(n6), .Y(n20) );
  INVX0_HVT U26 ( .A(n15), .Y(n16) );
  OR2X1_LVT U27 ( .A1(n5), .A2(n15), .Y(n26) );
  INVX0_LVT U28 ( .A(n47), .Y(n21) );
  MUX21X2_LVT U29 ( .A1(S2[3]), .A2(S1[3]), .S0(n52), .Y(n15) );
  AOI22X2_HVT U30 ( .A1(R[7]), .A2(n70), .A3(n69), .A4(n68), .Y(n6) );
  INVX0_LVT U31 ( .A(N17), .Y(n70) );
  AND3X1_LVT U32 ( .A1(n30), .A2(n31), .A3(n63), .Y(n7) );
  MUX21X2_LVT U33 ( .A1(n36), .A2(n37), .S0(n53), .Y(n35) );
  IBUFFX2_HVT U34 ( .A(S1[0]), .Y(n37) );
  NBUFFX2_LVT U35 ( .A(n29), .Y(n8) );
  NBUFFX2_LVT U36 ( .A(S1S2mux), .Y(n51) );
  AO21X1_LVT U37 ( .A1(R[6]), .A2(n66), .A3(n7), .Y(n23) );
  INVX0_LVT U38 ( .A(n32), .Y(N11) );
  NAND2X0_LVT U39 ( .A1(Carry), .A2(n71), .Y(n72) );
  OR2X2_LVT U40 ( .A1(n76), .A2(n38), .Y(AccumulateIn[4]) );
  OR2X2_LVT U41 ( .A1(n74), .A2(n38), .Y(AccumulateIn[6]) );
  OR2X2_LVT U42 ( .A1(n75), .A2(n10), .Y(AccumulateIn[5]) );
  MUX21X1_LVT U43 ( .A1(n24), .A2(N34), .S0(n71), .Y(n80) );
  DELLN1X2_LVT U44 ( .A(newDist), .Y(n56) );
  INVX0_HVT U45 ( .A(n35), .Y(N10) );
  OR2X2_LVT U46 ( .A1(n73), .A2(n10), .Y(AccumulateIn[7]) );
  MUX21X2_LVT U47 ( .A1(n33), .A2(n34), .S0(n51), .Y(n32) );
  INVX0_HVT U48 ( .A(S2[1]), .Y(n33) );
  INVX0_LVT U49 ( .A(n72), .Y(n10) );
  INVX0_LVT U50 ( .A(n72), .Y(n38) );
  INVX0_LVT U51 ( .A(n12), .Y(N14) );
  MUX21X1_LVT U52 ( .A1(n13), .A2(n14), .S0(n52), .Y(n12) );
  IBUFFX2_HVT U53 ( .A(N15), .Y(n18) );
  MUX21X1_LVT U54 ( .A1(S2[5]), .A2(S1[5]), .S0(n8), .Y(N15) );
  INVX0_LVT U55 ( .A(S2[0]), .Y(n36) );
  IBUFFX2_HVT U56 ( .A(n58), .Y(n17) );
  INVX0_LVT U57 ( .A(N12), .Y(n58) );
  INVX1_LVT U58 ( .A(n18), .Y(n19) );
  MUX21X1_LVT U59 ( .A1(N25), .A2(N33), .S0(n48), .Y(difference[7]) );
  MUX21X1_LVT U60 ( .A1(N20), .A2(N28), .S0(n48), .Y(difference[2]) );
  MUX21X2_LVT U61 ( .A1(N31), .A2(N23), .S0(n21), .Y(difference[5]) );
  MUX21X1_HVT U62 ( .A1(N36), .A2(difference[2]), .S0(n56), .Y(n78) );
  AO22X1_LVT U63 ( .A1(R[1]), .A2(n32), .A3(n35), .A4(n57), .Y(n59) );
  OR2X1_LVT U64 ( .A1(n49), .A2(n50), .Y(n25) );
  OR2X1_LVT U65 ( .A1(n25), .A2(n62), .Y(n63) );
  AND2X1_LVT U66 ( .A1(R[4]), .A2(n12), .Y(n50) );
  MUX21X1_HVT U67 ( .A1(N35), .A2(difference[1]), .S0(n55), .Y(n79) );
  NAND2X0_LVT U68 ( .A1(n60), .A2(n59), .Y(n27) );
  NAND2X0_HVT U69 ( .A1(R[2]), .A2(n58), .Y(n28) );
  NAND3X0_LVT U70 ( .A1(n27), .A2(n26), .A3(n28), .Y(n61) );
  NBUFFX2_LVT U71 ( .A(S1S2mux), .Y(n29) );
  OR2X1_LVT U72 ( .A1(R[5]), .A2(n64), .Y(n30) );
  OR2X1_LVT U73 ( .A1(R[6]), .A2(n66), .Y(n31) );
  AND3X1_LVT U74 ( .A1(n63), .A2(n31), .A3(n30), .Y(n65) );
  INVX0_LVT U75 ( .A(N15), .Y(n64) );
  OR2X2_LVT U76 ( .A1(n79), .A2(n11), .Y(AccumulateIn[1]) );
  OR2X2_LVT U77 ( .A1(n80), .A2(n11), .Y(AccumulateIn[0]) );
  NBUFFX2_LVT U78 ( .A(newDist), .Y(n54) );
  NBUFFX2_LVT U79 ( .A(newDist), .Y(n55) );
  OR2X1_LVT U88 ( .A1(n58), .A2(R[2]), .Y(n60) );
  NBUFFX2_LVT U89 ( .A(n29), .Y(n52) );
  NBUFFX2_LVT U90 ( .A(n29), .Y(n53) );
  MUX21X1_LVT U91 ( .A1(S2[7]), .A2(S1[7]), .S0(n8), .Y(N17) );
  MUX21X1_LVT U92 ( .A1(S2[6]), .A2(S1[6]), .S0(n53), .Y(N16) );
  MUX21X1_LVT U93 ( .A1(S2[2]), .A2(S1[2]), .S0(n51), .Y(N12) );
  INVX1_LVT U94 ( .A(N16), .Y(n66) );
  OA21X1_LVT U95 ( .A1(R[1]), .A2(n32), .A3(R[0]), .Y(n57) );
  OA221X1_LVT U96 ( .A1(R[3]), .A2(n16), .A3(R[4]), .A4(n12), .A5(n61), .Y(n62) );
  AO21X1_LVT U97 ( .A1(R[6]), .A2(n66), .A3(n65), .Y(n69) );
  NAND2X0_LVT U98 ( .A1(N17), .A2(n67), .Y(n68) );
  MUX21X1_LVT U99 ( .A1(N41), .A2(difference[7]), .S0(n54), .Y(n73) );
  INVX1_LVT U100 ( .A(n55), .Y(n71) );
  MUX21X1_LVT U101 ( .A1(N40), .A2(difference[6]), .S0(n54), .Y(n74) );
  MUX21X1_LVT U102 ( .A1(N39), .A2(difference[5]), .S0(n54), .Y(n75) );
  MUX21X1_LVT U103 ( .A1(N38), .A2(difference[4]), .S0(n56), .Y(n76) );
  MUX21X1_LVT U104 ( .A1(N37), .A2(difference[3]), .S0(n55), .Y(n77) );
endmodule


module PE_6_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(carry[2]), .CI(B[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX2_LVT U1_1 ( .A(A[1]), .B(carry[1]), .CI(B[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN2X2_LVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_HVT U2 ( .A1(n1), .A2(A[0]), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_6_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  XOR3X2_LVT U2_7 ( .A1(A[7]), .A2(n1), .A3(carry[7]), .Y(DIFF[7]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XNOR2X1_HVT U1 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U2 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_6_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX0_LVT U1 ( .A(B[7]), .Y(n1) );
  XNOR2X1_HVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U3 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX0_LVT U4 ( .A(B[3]), .Y(n5) );
  INVX0_LVT U5 ( .A(B[0]), .Y(n8) );
  INVX0_LVT U6 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U7 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U8 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U9 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U10 ( .A(B[2]), .Y(n6) );
endmodule


module PE_6 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  PE_6_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference[7:2], 
        n16, difference[0]}), .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, 
        N36, N35, N34}) );
  PE_6_DW01_sub_0 sub_83 ( .A({N17, N16, n11, N14, N13, n29, N11, N10}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_6_DW01_sub_1 sub_79 ( .A(R), .B({N17, N16, n11, N14, N13, n29, N11, N10}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  DELLN1X2_HVT U3 ( .A(difference[0]), .Y(n4) );
  NAND2X0_LVT U4 ( .A1(N27), .A2(n13), .Y(n31) );
  INVX0_HVT U5 ( .A(S1[4]), .Y(n25) );
  INVX0_HVT U9 ( .A(S2[4]), .Y(n24) );
  INVX1_LVT U10 ( .A(S2[6]), .Y(n6) );
  INVX1_LVT U11 ( .A(S1[6]), .Y(n7) );
  INVX1_LVT U12 ( .A(S1[0]), .Y(n38) );
  INVX0_HVT U13 ( .A(n40), .Y(n42) );
  MUX21X1_LVT U14 ( .A1(S2[7]), .A2(S1[7]), .S0(n12), .Y(N17) );
  INVX1_LVT U15 ( .A(n73), .Y(n20) );
  INVX1_LVT U16 ( .A(n19), .Y(n39) );
  MUX21X2_LVT U17 ( .A1(n34), .A2(n33), .S0(n39), .Y(n32) );
  OR2X1_HVT U18 ( .A1(R[3]), .A2(n32), .Y(n14) );
  DELLN1X2_LVT U19 ( .A(n32), .Y(n10) );
  MUX21X1_LVT U20 ( .A1(n38), .A2(n37), .S0(n39), .Y(n36) );
  INVX0_LVT U21 ( .A(n18), .Y(n19) );
  IBUFFX2_HVT U22 ( .A(n5), .Y(N16) );
  MUX21X2_LVT U23 ( .A1(n25), .A2(n24), .S0(n26), .Y(n23) );
  OA21X1_LVT U24 ( .A1(R[1]), .A2(n27), .A3(R[0]), .Y(n50) );
  INVX0_HVT U25 ( .A(S2[0]), .Y(n37) );
  MUX21X1_HVT U26 ( .A1(n7), .A2(n6), .S0(n26), .Y(n5) );
  INVX0_LVT U27 ( .A(n19), .Y(n26) );
  NBUFFX2_LVT U28 ( .A(S1S2mux), .Y(n12) );
  MUX21X1_LVT U29 ( .A1(N20), .A2(N28), .S0(n41), .Y(difference[2]) );
  INVX0_LVT U30 ( .A(n62), .Y(n41) );
  NBUFFX2_LVT U31 ( .A(n12), .Y(n8) );
  OR2X2_LVT U32 ( .A1(n65), .A2(n72), .Y(AccumulateIn[7]) );
  NAND2X0_LVT U33 ( .A1(n63), .A2(Carry), .Y(n35) );
  AO22X1_LVT U34 ( .A1(R[7]), .A2(n61), .A3(n60), .A4(n59), .Y(n62) );
  AO21X1_LVT U35 ( .A1(R[6]), .A2(n5), .A3(n57), .Y(n60) );
  AOI22X1_LVT U36 ( .A1(R[7]), .A2(n61), .A3(n60), .A4(n59), .Y(n9) );
  INVX0_LVT U37 ( .A(n23), .Y(N14) );
  MUX21X1_LVT U38 ( .A1(S2[2]), .A2(S1[2]), .S0(n8), .Y(N12) );
  OR2X1_LVT U39 ( .A1(R[4]), .A2(n23), .Y(n15) );
  MUX21X1_HVT U40 ( .A1(N37), .A2(difference[3]), .S0(n47), .Y(n69) );
  MUX21X1_HVT U41 ( .A1(N38), .A2(difference[4]), .S0(n48), .Y(n68) );
  NAND2X0_HVT U42 ( .A1(n31), .A2(n30), .Y(difference[1]) );
  MUX21X1_HVT U43 ( .A1(N39), .A2(difference[5]), .S0(newDist), .Y(n67) );
  MUX21X1_HVT U44 ( .A1(N40), .A2(difference[6]), .S0(newDist), .Y(n66) );
  OR2X2_LVT U45 ( .A1(n66), .A2(n72), .Y(AccumulateIn[6]) );
  INVX0_LVT U46 ( .A(n64), .Y(n72) );
  DELLN2X2_LVT U47 ( .A(N15), .Y(n11) );
  INVX0_LVT U48 ( .A(n27), .Y(N11) );
  INVX1_LVT U49 ( .A(n17), .Y(n27) );
  OR2X2_LVT U50 ( .A1(n67), .A2(n43), .Y(AccumulateIn[5]) );
  OR2X2_LVT U51 ( .A1(n69), .A2(n43), .Y(AccumulateIn[3]) );
  NBUFFX2_LVT U52 ( .A(n9), .Y(n13) );
  AND3X1_LVT U53 ( .A1(n14), .A2(n53), .A3(n15), .Y(n54) );
  NAND2X0_LVT U54 ( .A1(n31), .A2(n30), .Y(n16) );
  INVX0_LVT U55 ( .A(n9), .Y(n40) );
  INVX0_LVT U56 ( .A(N17), .Y(n61) );
  NAND2X0_HVT U57 ( .A1(N17), .A2(n58), .Y(n59) );
  MUX21X1_LVT U58 ( .A1(S1[1]), .A2(S2[1]), .S0(n18), .Y(n17) );
  INVX0_LVT U59 ( .A(n36), .Y(N10) );
  INVX0_LVT U60 ( .A(n10), .Y(N13) );
  INVX0_LVT U61 ( .A(S1S2mux), .Y(n18) );
  NAND2X0_HVT U62 ( .A1(n20), .A2(n64), .Y(AccumulateIn[0]) );
  NAND2X0_HVT U63 ( .A1(n45), .A2(n35), .Y(AccumulateIn[2]) );
  OR2X1_LVT U64 ( .A1(R[5]), .A2(n56), .Y(n21) );
  OR2X1_LVT U65 ( .A1(R[6]), .A2(n5), .Y(n22) );
  AND3X1_LVT U66 ( .A1(n55), .A2(n22), .A3(n21), .Y(n57) );
  INVX0_LVT U67 ( .A(N15), .Y(n56) );
  MUX21X1_HVT U68 ( .A1(N35), .A2(difference[1]), .S0(n47), .Y(n71) );
  INVX0_LVT U69 ( .A(N12), .Y(n28) );
  INVX1_LVT U70 ( .A(n28), .Y(n29) );
  IBUFFX2_HVT U71 ( .A(S2[3]), .Y(n33) );
  IBUFFX2_HVT U72 ( .A(S1[3]), .Y(n34) );
  NAND2X0_LVT U73 ( .A1(N19), .A2(n40), .Y(n30) );
  MUX21X1_HVT U74 ( .A1(N34), .A2(n4), .S0(n48), .Y(n73) );
  NBUFFX2_LVT U75 ( .A(newDist), .Y(n48) );
  NBUFFX2_LVT U76 ( .A(newDist), .Y(n47) );
  INVX0_LVT U77 ( .A(n68), .Y(n44) );
  INVX0_LVT U78 ( .A(n71), .Y(n46) );
  INVX1_LVT U79 ( .A(n70), .Y(n45) );
  NAND2X0_LVT U80 ( .A1(n63), .A2(Carry), .Y(n64) );
  MUX21X1_LVT U81 ( .A1(N26), .A2(N18), .S0(n62), .Y(difference[0]) );
  INVX0_LVT U82 ( .A(n64), .Y(n43) );
  NAND2X0_HVT U83 ( .A1(n44), .A2(n35), .Y(AccumulateIn[4]) );
  NAND2X0_LVT U84 ( .A1(n46), .A2(n35), .Y(AccumulateIn[1]) );
  MUX21X1_HVT U85 ( .A1(S2[5]), .A2(S1[5]), .S0(n8), .Y(N15) );
  MUX21X1_HVT U86 ( .A1(N25), .A2(N33), .S0(n41), .Y(difference[7]) );
  MUX21X1_HVT U87 ( .A1(N24), .A2(N32), .S0(n42), .Y(difference[6]) );
  MUX21X1_HVT U88 ( .A1(N23), .A2(N31), .S0(n41), .Y(difference[5]) );
  MUX21X1_HVT U89 ( .A1(N22), .A2(N30), .S0(n42), .Y(difference[4]) );
  MUX21X1_HVT U90 ( .A1(N21), .A2(N29), .S0(n13), .Y(difference[3]) );
  INVX1_LVT U91 ( .A(R[2]), .Y(n49) );
  NAND2X0_LVT U92 ( .A1(N12), .A2(n49), .Y(n52) );
  AO22X1_LVT U93 ( .A1(R[1]), .A2(n27), .A3(n50), .A4(n36), .Y(n51) );
  AO222X1_LVT U94 ( .A1(n32), .A2(R[3]), .A3(n51), .A4(n52), .A5(R[2]), .A6(
        n28), .Y(n53) );
  AO221X1_LVT U95 ( .A1(R[5]), .A2(n56), .A3(R[4]), .A4(n23), .A5(n54), .Y(n55) );
  INVX1_LVT U96 ( .A(R[7]), .Y(n58) );
  MUX21X1_LVT U97 ( .A1(N41), .A2(difference[7]), .S0(n47), .Y(n65) );
  INVX1_LVT U98 ( .A(n47), .Y(n63) );
  MUX21X1_LVT U99 ( .A1(N36), .A2(difference[2]), .S0(n48), .Y(n70) );
endmodule


module PE_5_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX2_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN1X2_HVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_HVT U2 ( .A1(n1), .A2(A[0]), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_5_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  XOR3X2_LVT U2_7 ( .A1(A[7]), .A2(n1), .A3(carry[7]), .Y(DIFF[7]) );
  XNOR2X1_HVT U1 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U2 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_5_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX1_LVT U1 ( .A(B[1]), .Y(n7) );
  INVX0_HVT U2 ( .A(B[7]), .Y(n1) );
  IBUFFX2_HVT U3 ( .A(B[5]), .Y(n3) );
  INVX0_LVT U4 ( .A(B[3]), .Y(n5) );
  XNOR2X1_LVT U5 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U6 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX0_LVT U7 ( .A(B[0]), .Y(n8) );
  INVX1_LVT U8 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U9 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U10 ( .A(B[2]), .Y(n6) );
endmodule


module PE_5 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  PE_5_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_5_DW01_sub_0 sub_83 ( .A({N17, n31, n6, n7, n44, n30, n32, n22}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_5_DW01_sub_1 sub_79 ( .A(R), .B({N17, N16, n6, n7, n44, n30, n32, n33}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  OR2X2_HVT U3 ( .A1(n77), .A2(n34), .Y(AccumulateIn[1]) );
  OR2X2_LVT U4 ( .A1(n75), .A2(n21), .Y(AccumulateIn[3]) );
  DELLN3X2_LVT U5 ( .A(N14), .Y(n7) );
  AND2X1_LVT U9 ( .A1(n40), .A2(n39), .Y(n4) );
  AND2X1_LVT U10 ( .A1(n4), .A2(n64), .Y(n9) );
  OR2X2_LVT U11 ( .A1(R[5]), .A2(n65), .Y(n39) );
  AO21X2_LVT U12 ( .A1(R[6]), .A2(n66), .A3(n9), .Y(n68) );
  OR2X1_LVT U13 ( .A1(n27), .A2(R[7]), .Y(n67) );
  IBUFFX2_HVT U14 ( .A(N15), .Y(n5) );
  INVX1_LVT U15 ( .A(n5), .Y(n6) );
  MUX21X1_HVT U16 ( .A1(S2[5]), .A2(S1[5]), .S0(n51), .Y(N15) );
  INVX0_LVT U17 ( .A(N13), .Y(n62) );
  INVX1_LVT U18 ( .A(R[3]), .Y(n20) );
  INVX0_HVT U19 ( .A(S1[2]), .Y(n25) );
  INVX0_HVT U20 ( .A(S2[2]), .Y(n24) );
  NAND2X0_HVT U21 ( .A1(R[4]), .A2(n63), .Y(n19) );
  INVX1_LVT U22 ( .A(n54), .Y(n70) );
  INVX0_LVT U23 ( .A(S2[7]), .Y(n28) );
  INVX0_HVT U24 ( .A(S1[7]), .Y(n29) );
  NBUFFX2_LVT U25 ( .A(newDist), .Y(n54) );
  NBUFFX2_LVT U26 ( .A(newDist), .Y(n53) );
  OR2X1_LVT U27 ( .A1(n73), .A2(n42), .Y(AccumulateIn[5]) );
  DELLN1X2_HVT U28 ( .A(difference[1]), .Y(n8) );
  MUX21X1_LVT U29 ( .A1(S2[1]), .A2(S1[1]), .S0(n50), .Y(N11) );
  INVX0_LVT U30 ( .A(n47), .Y(n12) );
  MUX21X1_HVT U31 ( .A1(N35), .A2(n8), .S0(n54), .Y(n77) );
  OR2X1_LVT U32 ( .A1(R[3]), .A2(n62), .Y(n10) );
  OR2X1_LVT U33 ( .A1(R[4]), .A2(n63), .Y(n11) );
  NAND3X0_LVT U34 ( .A1(n10), .A2(n11), .A3(n61), .Y(n17) );
  INVX0_LVT U35 ( .A(N14), .Y(n63) );
  MUX21X2_LVT U36 ( .A1(N31), .A2(N23), .S0(n12), .Y(difference[5]) );
  MUX21X2_LVT U37 ( .A1(N24), .A2(N32), .S0(n43), .Y(difference[6]) );
  MUX21X2_LVT U38 ( .A1(N22), .A2(N30), .S0(n43), .Y(difference[4]) );
  NBUFFX2_HVT U39 ( .A(n15), .Y(n43) );
  AO21X1_LVT U40 ( .A1(R[6]), .A2(n66), .A3(n9), .Y(n13) );
  INVX0_LVT U41 ( .A(n27), .Y(N17) );
  AO22X1_LVT U42 ( .A1(R[7]), .A2(n27), .A3(n13), .A4(n67), .Y(n69) );
  MUX21X2_LVT U43 ( .A1(n29), .A2(n28), .S0(n45), .Y(n27) );
  MUX21X2_LVT U44 ( .A1(N26), .A2(N18), .S0(n14), .Y(difference[0]) );
  AO22X1_LVT U45 ( .A1(R[7]), .A2(n27), .A3(n68), .A4(n67), .Y(n14) );
  AOI22X1_LVT U46 ( .A1(R[7]), .A2(n27), .A3(n13), .A4(n67), .Y(n15) );
  MUX21X1_LVT U47 ( .A1(N20), .A2(N28), .S0(n48), .Y(difference[2]) );
  MUX21X2_LVT U48 ( .A1(N25), .A2(N33), .S0(n47), .Y(difference[7]) );
  OR2X1_LVT U49 ( .A1(n76), .A2(n42), .Y(AccumulateIn[2]) );
  MUX21X1_HVT U50 ( .A1(N40), .A2(difference[6]), .S0(n53), .Y(n72) );
  NBUFFX2_LVT U51 ( .A(n34), .Y(n16) );
  IBUFFX2_HVT U52 ( .A(n23), .Y(n30) );
  INVX0_LVT U53 ( .A(n41), .Y(n51) );
  OR2X4_LVT U54 ( .A1(n78), .A2(n16), .Y(AccumulateIn[0]) );
  OR2X4_LVT U55 ( .A1(n72), .A2(n16), .Y(AccumulateIn[6]) );
  NBUFFX2_LVT U56 ( .A(n34), .Y(n42) );
  NAND2X0_LVT U57 ( .A1(R[5]), .A2(n65), .Y(n18) );
  NAND3X0_LVT U58 ( .A1(n17), .A2(n19), .A3(n18), .Y(n64) );
  OR2X1_LVT U59 ( .A1(n20), .A2(N13), .Y(n35) );
  OR2X2_LVT U60 ( .A1(n74), .A2(n21), .Y(AccumulateIn[4]) );
  AND2X4_LVT U61 ( .A1(Carry), .A2(n70), .Y(n21) );
  INVX0_LVT U62 ( .A(n69), .Y(n48) );
  DELLN1X2_LVT U63 ( .A(N11), .Y(n32) );
  MUX21X1_LVT U64 ( .A1(N37), .A2(difference[3]), .S0(n54), .Y(n75) );
  MUX21X1_LVT U65 ( .A1(n24), .A2(n25), .S0(n52), .Y(n23) );
  INVX0_LVT U66 ( .A(n56), .Y(n33) );
  INVX0_LVT U67 ( .A(n62), .Y(n44) );
  MUX21X1_LVT U68 ( .A1(N21), .A2(N29), .S0(n47), .Y(difference[3]) );
  MUX21X1_LVT U69 ( .A1(S2[6]), .A2(S1[6]), .S0(n51), .Y(N16) );
  INVX0_LVT U70 ( .A(n23), .Y(N12) );
  INVX0_LVT U71 ( .A(N15), .Y(n65) );
  NBUFFX2_LVT U72 ( .A(n33), .Y(n22) );
  DELLN2X2_HVT U73 ( .A(difference[0]), .Y(n26) );
  MUX21X1_HVT U74 ( .A1(N38), .A2(difference[4]), .S0(n53), .Y(n74) );
  MUX21X1_HVT U75 ( .A1(N39), .A2(difference[5]), .S0(n53), .Y(n73) );
  MUX21X1_HVT U76 ( .A1(N36), .A2(difference[2]), .S0(newDist), .Y(n76) );
  MUX21X2_LVT U77 ( .A1(S2[4]), .A2(S1[4]), .S0(n46), .Y(N14) );
  INVX0_LVT U78 ( .A(n45), .Y(n46) );
  IBUFFX2_HVT U79 ( .A(n66), .Y(n31) );
  INVX0_LVT U80 ( .A(N16), .Y(n66) );
  AND2X1_LVT U81 ( .A1(Carry), .A2(n70), .Y(n34) );
  NAND2X0_LVT U82 ( .A1(n59), .A2(n60), .Y(n36) );
  NAND2X0_LVT U83 ( .A1(R[2]), .A2(n23), .Y(n37) );
  NAND3X0_LVT U84 ( .A1(n36), .A2(n35), .A3(n37), .Y(n61) );
  INVX0_LVT U85 ( .A(n41), .Y(n52) );
  INVX0_LVT U86 ( .A(n49), .Y(n38) );
  INVX0_LVT U87 ( .A(n49), .Y(n50) );
  OR2X1_LVT U88 ( .A1(R[6]), .A2(n66), .Y(n40) );
  MUX21X2_LVT U89 ( .A1(N19), .A2(N27), .S0(n15), .Y(difference[1]) );
  INVX0_LVT U90 ( .A(S1S2mux), .Y(n41) );
  INVX0_LVT U91 ( .A(S1S2mux), .Y(n49) );
  INVX0_LVT U92 ( .A(n52), .Y(n45) );
  OR2X1_HVT U93 ( .A1(n71), .A2(n21), .Y(AccumulateIn[7]) );
  INVX0_LVT U94 ( .A(n69), .Y(n47) );
  INVX0_LVT U95 ( .A(N10), .Y(n56) );
  INVX0_LVT U96 ( .A(N11), .Y(n58) );
  MUX21X1_HVT U97 ( .A1(N34), .A2(n26), .S0(n53), .Y(n78) );
  MUX21X1_LVT U98 ( .A1(S2[3]), .A2(S1[3]), .S0(n38), .Y(N13) );
  MUX21X1_LVT U99 ( .A1(S2[0]), .A2(S1[0]), .S0(n38), .Y(N10) );
  INVX1_LVT U100 ( .A(R[2]), .Y(n55) );
  NAND2X0_LVT U101 ( .A1(N12), .A2(n55), .Y(n60) );
  OA21X1_LVT U102 ( .A1(R[1]), .A2(n58), .A3(R[0]), .Y(n57) );
  AO22X1_LVT U103 ( .A1(n58), .A2(R[1]), .A3(n57), .A4(n56), .Y(n59) );
  MUX21X1_LVT U104 ( .A1(N41), .A2(difference[7]), .S0(n53), .Y(n71) );
endmodule


module PE_4_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(carry[1]), .CI(B[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN2X2_LVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_HVT U2 ( .A1(n1), .A2(A[0]), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_4_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  FADDX1_HVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  OR2X1_LVT U1 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  XNOR2X1_HVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_4_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  IBUFFX2_HVT U1 ( .A(B[1]), .Y(n7) );
  INVX0_LVT U2 ( .A(B[2]), .Y(n6) );
  INVX0_LVT U3 ( .A(B[0]), .Y(n8) );
  INVX0_LVT U4 ( .A(B[3]), .Y(n5) );
  XNOR2X1_HVT U5 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U6 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U7 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U8 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U9 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U10 ( .A(B[4]), .Y(n4) );
endmodule


module PE_4 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  PE_4_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_4_DW01_sub_0 sub_83 ( .A({n21, N16, N15, n23, n33, n12, n34, n19}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_4_DW01_sub_1 sub_79 ( .A(R), .B({n21, N16, N15, n23, N13, n12, N11, N10}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  DFFX2_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  NBUFFX2_HVT U3 ( .A(S1S2mux), .Y(n25) );
  MUX21X1_LVT U4 ( .A1(S1[1]), .A2(S2[1]), .S0(n5), .Y(N11) );
  OR2X1_LVT U5 ( .A1(n75), .A2(n42), .Y(AccumulateIn[2]) );
  NBUFFX2_LVT U9 ( .A(n20), .Y(n42) );
  NBUFFX2_LVT U10 ( .A(n44), .Y(n4) );
  NBUFFX2_LVT U11 ( .A(n37), .Y(n5) );
  OR2X4_HVT U12 ( .A1(R[5]), .A2(n26), .Y(n48) );
  AND3X1_LVT U13 ( .A1(n63), .A2(n49), .A3(n48), .Y(n16) );
  MUX21X2_LVT U14 ( .A1(n28), .A2(n27), .S0(n32), .Y(n26) );
  INVX1_LVT U15 ( .A(n38), .Y(n32) );
  INVX0_HVT U16 ( .A(n29), .Y(N16) );
  INVX1_LVT U17 ( .A(R[0]), .Y(n14) );
  INVX0_LVT U18 ( .A(R[1]), .Y(n13) );
  INVX0_HVT U19 ( .A(S1[5]), .Y(n28) );
  INVX0_HVT U20 ( .A(S2[5]), .Y(n27) );
  INVX0_HVT U21 ( .A(S2[6]), .Y(n30) );
  INVX0_HVT U22 ( .A(S1[6]), .Y(n31) );
  INVX1_LVT U23 ( .A(n73), .Y(n10) );
  INVX0_HVT U24 ( .A(n11), .Y(n12) );
  INVX0_LVT U25 ( .A(n22), .Y(n35) );
  AND2X4_LVT U26 ( .A1(Carry), .A2(n69), .Y(n22) );
  MUX21X1_LVT U27 ( .A1(N23), .A2(N31), .S0(n46), .Y(difference[5]) );
  NAND2X0_LVT U28 ( .A1(n60), .A2(R[3]), .Y(n6) );
  NAND2X0_LVT U29 ( .A1(n58), .A2(n57), .Y(n7) );
  NAND2X0_LVT U30 ( .A1(R[2]), .A2(n11), .Y(n8) );
  NAND3X0_LVT U31 ( .A1(n7), .A2(n6), .A3(n8), .Y(n59) );
  NBUFFX2_LVT U32 ( .A(n37), .Y(n9) );
  NAND2X0_HVT U33 ( .A1(N12), .A2(n53), .Y(n58) );
  OR2X1_LVT U34 ( .A1(n70), .A2(n40), .Y(AccumulateIn[7]) );
  IBUFFX2_HVT U35 ( .A(n26), .Y(N15) );
  NAND2X0_LVT U36 ( .A1(n10), .A2(n35), .Y(AccumulateIn[4]) );
  OR2X1_LVT U37 ( .A1(R[6]), .A2(n29), .Y(n49) );
  AO21X1_LVT U38 ( .A1(R[6]), .A2(n29), .A3(n16), .Y(n67) );
  MUX21X1_LVT U39 ( .A1(n31), .A2(n30), .S0(n32), .Y(n29) );
  MUX21X1_LVT U40 ( .A1(S2[4]), .A2(S1[4]), .S0(n39), .Y(N14) );
  OR2X1_LVT U41 ( .A1(n15), .A2(n61), .Y(n63) );
  MUX21X1_LVT U42 ( .A1(N24), .A2(N32), .S0(n46), .Y(difference[6]) );
  MUX21X1_LVT U43 ( .A1(S2[0]), .A2(S1[0]), .S0(n25), .Y(N10) );
  INVX0_LVT U44 ( .A(N12), .Y(n11) );
  MUX21X1_LVT U45 ( .A1(S2[2]), .A2(S1[2]), .S0(n25), .Y(N12) );
  AOI21X1_LVT U46 ( .A1(n13), .A2(N11), .A3(n14), .Y(n55) );
  OR2X1_LVT U47 ( .A1(n18), .A2(n17), .Y(n15) );
  AND2X1_LVT U48 ( .A1(R[5]), .A2(n26), .Y(n17) );
  AND2X1_LVT U49 ( .A1(R[4]), .A2(n62), .Y(n18) );
  INVX0_LVT U50 ( .A(n54), .Y(n19) );
  INVX0_LVT U51 ( .A(N10), .Y(n54) );
  AND2X1_LVT U52 ( .A1(Carry), .A2(n69), .Y(n20) );
  OR2X2_LVT U53 ( .A1(n72), .A2(n42), .Y(AccumulateIn[5]) );
  MUX21X2_LVT U54 ( .A1(N19), .A2(N27), .S0(n44), .Y(difference[1]) );
  INVX0_LVT U55 ( .A(S1S2mux), .Y(n37) );
  INVX0_LVT U56 ( .A(n9), .Y(n38) );
  IBUFFX2_HVT U57 ( .A(n68), .Y(n21) );
  INVX1_LVT U58 ( .A(N17), .Y(n68) );
  MUX21X1_LVT U59 ( .A1(S2[3]), .A2(S1[3]), .S0(n39), .Y(N13) );
  INVX0_LVT U60 ( .A(n9), .Y(n39) );
  MUX21X1_HVT U61 ( .A1(N39), .A2(difference[5]), .S0(n50), .Y(n72) );
  NBUFFX2_LVT U62 ( .A(N14), .Y(n23) );
  NBUFFX2_LVT U63 ( .A(n60), .Y(n24) );
  INVX0_LVT U64 ( .A(N14), .Y(n62) );
  IBUFFX2_HVT U65 ( .A(n24), .Y(n33) );
  INVX0_LVT U66 ( .A(N13), .Y(n60) );
  IBUFFX2_HVT U67 ( .A(n56), .Y(n34) );
  AO21X1_LVT U68 ( .A1(R[6]), .A2(n29), .A3(n64), .Y(n45) );
  MUX21X2_LVT U69 ( .A1(N26), .A2(N18), .S0(n36), .Y(difference[0]) );
  AO22X1_LVT U70 ( .A1(R[7]), .A2(n68), .A3(n67), .A4(n66), .Y(n36) );
  DELLN2X2_HVT U71 ( .A(newDist), .Y(n52) );
  DELLN2X2_HVT U72 ( .A(newDist), .Y(n50) );
  DELLN1X2_HVT U73 ( .A(newDist), .Y(n51) );
  INVX0_LVT U74 ( .A(n76), .Y(n43) );
  OR2X1_LVT U75 ( .A1(n71), .A2(n41), .Y(AccumulateIn[6]) );
  OR2X1_LVT U76 ( .A1(n74), .A2(n41), .Y(AccumulateIn[3]) );
  OR2X1_LVT U77 ( .A1(n77), .A2(n40), .Y(AccumulateIn[0]) );
  NBUFFX2_HVT U78 ( .A(n20), .Y(n40) );
  NBUFFX2_LVT U79 ( .A(n22), .Y(n41) );
  MUX21X1_HVT U80 ( .A1(N34), .A2(difference[0]), .S0(n52), .Y(n77) );
  NAND2X0_LVT U81 ( .A1(n43), .A2(n35), .Y(AccumulateIn[1]) );
  AOI22X1_LVT U82 ( .A1(R[7]), .A2(n68), .A3(n45), .A4(n66), .Y(n44) );
  MUX21X1_HVT U83 ( .A1(N35), .A2(difference[1]), .S0(n51), .Y(n76) );
  MUX21X1_LVT U84 ( .A1(N20), .A2(N28), .S0(n4), .Y(difference[2]) );
  NBUFFX2_LVT U85 ( .A(n47), .Y(n46) );
  AOI22X1_LVT U86 ( .A1(R[7]), .A2(n68), .A3(n45), .A4(n66), .Y(n47) );
  MUX21X1_LVT U87 ( .A1(N21), .A2(N29), .S0(n47), .Y(difference[3]) );
  AND3X1_LVT U88 ( .A1(n63), .A2(n49), .A3(n48), .Y(n64) );
  INVX0_LVT U89 ( .A(N11), .Y(n56) );
  MUX21X1_HVT U90 ( .A1(N25), .A2(N33), .S0(n46), .Y(difference[7]) );
  MUX21X1_HVT U91 ( .A1(N22), .A2(N30), .S0(n47), .Y(difference[4]) );
  MUX21X1_HVT U92 ( .A1(S2[7]), .A2(S1[7]), .S0(n38), .Y(N17) );
  INVX1_LVT U93 ( .A(R[2]), .Y(n53) );
  AO22X1_LVT U94 ( .A1(R[1]), .A2(n56), .A3(n55), .A4(n54), .Y(n57) );
  OA221X1_LVT U95 ( .A1(R[3]), .A2(n24), .A3(R[4]), .A4(n62), .A5(n59), .Y(n61) );
  INVX1_LVT U96 ( .A(R[7]), .Y(n65) );
  NAND2X0_LVT U97 ( .A1(N17), .A2(n65), .Y(n66) );
  MUX21X1_LVT U98 ( .A1(N41), .A2(difference[7]), .S0(n50), .Y(n70) );
  INVX1_LVT U99 ( .A(n51), .Y(n69) );
  MUX21X1_LVT U100 ( .A1(N40), .A2(difference[6]), .S0(n50), .Y(n71) );
  MUX21X1_LVT U101 ( .A1(N38), .A2(difference[4]), .S0(n52), .Y(n73) );
  MUX21X1_LVT U102 ( .A1(N37), .A2(difference[3]), .S0(n51), .Y(n74) );
  MUX21X1_LVT U103 ( .A1(N36), .A2(difference[2]), .S0(n52), .Y(n75) );
endmodule


module PE_3_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(
        SUM[1]) );
  IBUFFX2_HVT U1 ( .A(B[0]), .Y(n1) );
  INVX1_LVT U2 ( .A(n1), .Y(n2) );
  XOR2X1_HVT U3 ( .A1(n2), .A2(A[0]), .Y(SUM[0]) );
  AND2X1_LVT U4 ( .A1(A[0]), .A2(B[0]), .Y(carry[1]) );
endmodule


module PE_3_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  NBUFFX2_LVT U1 ( .A(A[0]), .Y(n1) );
  OR2X2_LVT U2 ( .A1(n9), .A2(A[0]), .Y(carry[1]) );
  XNOR2X1_LVT U3 ( .A1(n1), .A2(n9), .Y(DIFF[0]) );
  INVX1_LVT U4 ( .A(B[7]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[6]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[5]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[4]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[3]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[2]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[1]), .Y(n8) );
  INVX1_LVT U11 ( .A(B[0]), .Y(n9) );
endmodule


module PE_3_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX0_LVT U1 ( .A(B[4]), .Y(n4) );
  INVX0_LVT U2 ( .A(B[0]), .Y(n8) );
  XNOR2X1_LVT U3 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX0_HVT U4 ( .A(B[1]), .Y(n7) );
  INVX0_HVT U5 ( .A(B[2]), .Y(n6) );
  OR2X1_LVT U6 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U7 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U8 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U9 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U10 ( .A(B[3]), .Y(n5) );
endmodule


module PE_3 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24,
         N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  PE_3_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_3_DW01_sub_0 sub_83 ( .A({N17, N16, N15, n22, N13, n20, n47, n45}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_3_DW01_sub_1 sub_79 ( .A(R), .B({N17, N16, N15, n22, N13, n20, n47, n45}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  OR2X2_LVT U3 ( .A1(n27), .A2(n75), .Y(AccumulateIn[2]) );
  AOI22X1_LVT U4 ( .A1(R[7]), .A2(n67), .A3(n10), .A4(n65), .Y(n4) );
  INVX0_LVT U5 ( .A(n39), .Y(n33) );
  MUX21X2_LVT U9 ( .A1(n41), .A2(n40), .S0(n12), .Y(n39) );
  INVX0_HVT U10 ( .A(n17), .Y(N16) );
  INVX1_LVT U11 ( .A(n52), .Y(n68) );
  INVX0_HVT U12 ( .A(S1[5]), .Y(n16) );
  INVX0_HVT U13 ( .A(S2[5]), .Y(n15) );
  OR2X1_LVT U14 ( .A1(R[5]), .A2(n14), .Y(n31) );
  INVX0_HVT U15 ( .A(n14), .Y(N15) );
  INVX0_HVT U16 ( .A(S2[6]), .Y(n18) );
  INVX0_HVT U17 ( .A(S1[6]), .Y(n19) );
  OR2X1_LVT U18 ( .A1(n71), .A2(n50), .Y(AccumulateIn[6]) );
  INVX1_LVT U19 ( .A(n39), .Y(n20) );
  AO21X2_LVT U20 ( .A1(R[6]), .A2(n17), .A3(n63), .Y(n10) );
  AO21X1_LVT U21 ( .A1(R[6]), .A2(n17), .A3(n63), .Y(n66) );
  INVX1_LVT U22 ( .A(n21), .Y(n34) );
  MUX21X1_HVT U23 ( .A1(N36), .A2(difference[2]), .S0(newDist), .Y(n75) );
  NBUFFX2_LVT U24 ( .A(n42), .Y(n5) );
  MUX21X2_LVT U25 ( .A1(S2[7]), .A2(S1[7]), .S0(n11), .Y(N17) );
  IBUFFX2_HVT U26 ( .A(n46), .Y(n11) );
  INVX0_LVT U27 ( .A(n8), .Y(n6) );
  MUX21X1_LVT U28 ( .A1(N21), .A2(N29), .S0(n38), .Y(difference[3]) );
  NBUFFX2_HVT U29 ( .A(S1S2mux), .Y(n8) );
  AOI22X1_LVT U30 ( .A1(R[7]), .A2(n67), .A3(n66), .A4(n65), .Y(n7) );
  MUX21X1_LVT U31 ( .A1(S2[1]), .A2(S1[1]), .S0(n8), .Y(N11) );
  AOI22X1_LVT U32 ( .A1(R[7]), .A2(n67), .A3(n65), .A4(n10), .Y(n26) );
  AND2X1_LVT U33 ( .A1(n31), .A2(n32), .Y(n9) );
  AND2X1_LVT U34 ( .A1(n9), .A2(n62), .Y(n63) );
  MUX21X1_LVT U35 ( .A1(N19), .A2(N27), .S0(n26), .Y(difference[1]) );
  IBUFFX2_HVT U36 ( .A(n7), .Y(n23) );
  MUX21X2_LVT U37 ( .A1(n44), .A2(n43), .S0(n35), .Y(n42) );
  IBUFFX2_HVT U38 ( .A(S2[3]), .Y(n43) );
  MUX21X1_HVT U39 ( .A1(S1[0]), .A2(S2[0]), .S0(n34), .Y(n45) );
  NBUFFX2_LVT U40 ( .A(n26), .Y(n37) );
  OR2X2_LVT U41 ( .A1(n74), .A2(n50), .Y(AccumulateIn[3]) );
  INVX0_LVT U42 ( .A(N11), .Y(n56) );
  NBUFFX2_LVT U43 ( .A(n46), .Y(n12) );
  DELLN2X2_HVT U44 ( .A(difference[0]), .Y(n13) );
  MUX21X1_LVT U45 ( .A1(N24), .A2(N32), .S0(n37), .Y(difference[6]) );
  MUX21X1_LVT U46 ( .A1(N22), .A2(N30), .S0(n37), .Y(difference[4]) );
  OR2X2_LVT U47 ( .A1(n76), .A2(n36), .Y(AccumulateIn[1]) );
  MUX21X1_LVT U48 ( .A1(n16), .A2(n15), .S0(n35), .Y(n14) );
  MUX21X2_LVT U49 ( .A1(n19), .A2(n18), .S0(n6), .Y(n17) );
  INVX0_LVT U50 ( .A(n46), .Y(n21) );
  NBUFFX2_LVT U51 ( .A(N14), .Y(n22) );
  INVX0_LVT U52 ( .A(n23), .Y(n38) );
  MUX21X1_HVT U53 ( .A1(N35), .A2(difference[1]), .S0(n52), .Y(n76) );
  IBUFFX2_HVT U54 ( .A(n5), .Y(N13) );
  MUX21X1_LVT U55 ( .A1(S1[4]), .A2(S2[4]), .S0(n6), .Y(N14) );
  INVX0_LVT U56 ( .A(N14), .Y(n61) );
  MUX21X1_LVT U57 ( .A1(N23), .A2(N31), .S0(n38), .Y(difference[5]) );
  AND2X1_LVT U58 ( .A1(R[5]), .A2(n14), .Y(n24) );
  AND2X1_LVT U59 ( .A1(R[4]), .A2(n61), .Y(n25) );
  OR3X1_LVT U60 ( .A1(n24), .A2(n25), .A3(n60), .Y(n62) );
  MUX21X1_LVT U61 ( .A1(N25), .A2(N33), .S0(n4), .Y(difference[7]) );
  INVX0_LVT U62 ( .A(n69), .Y(n27) );
  MUX21X1_LVT U63 ( .A1(N20), .A2(N28), .S0(n4), .Y(difference[2]) );
  NAND2X0_LVT U64 ( .A1(R[3]), .A2(n42), .Y(n28) );
  NAND2X0_LVT U65 ( .A1(n57), .A2(n58), .Y(n29) );
  NAND2X0_LVT U66 ( .A1(R[2]), .A2(n39), .Y(n30) );
  NAND3X0_LVT U67 ( .A1(n29), .A2(n28), .A3(n30), .Y(n59) );
  OR2X1_LVT U68 ( .A1(R[6]), .A2(n17), .Y(n32) );
  INVX0_LVT U69 ( .A(n21), .Y(n35) );
  OR2X2_LVT U70 ( .A1(n27), .A2(n70), .Y(AccumulateIn[7]) );
  OR2X2_LVT U71 ( .A1(n27), .A2(n72), .Y(AccumulateIn[5]) );
  INVX0_LVT U72 ( .A(N10), .Y(n54) );
  AND2X4_LVT U73 ( .A1(Carry), .A2(n68), .Y(n36) );
  NBUFFX2_HVT U74 ( .A(newDist), .Y(n51) );
  NBUFFX2_HVT U75 ( .A(newDist), .Y(n52) );
  INVX0_HVT U76 ( .A(S1[2]), .Y(n41) );
  INVX0_HVT U77 ( .A(S1[3]), .Y(n44) );
  INVX0_HVT U78 ( .A(S2[2]), .Y(n40) );
  INVX0_LVT U79 ( .A(N17), .Y(n67) );
  NAND2X0_LVT U80 ( .A1(Carry), .A2(n68), .Y(n69) );
  INVX0_LVT U81 ( .A(R[0]), .Y(n49) );
  INVX0_LVT U82 ( .A(R[1]), .Y(n48) );
  INVX0_LVT U83 ( .A(S1S2mux), .Y(n46) );
  MUX21X1_LVT U84 ( .A1(S1[0]), .A2(S2[0]), .S0(n34), .Y(N10) );
  INVX0_LVT U85 ( .A(n56), .Y(n47) );
  AOI21X1_LVT U86 ( .A1(n48), .A2(N11), .A3(n49), .Y(n55) );
  MUX21X1_HVT U87 ( .A1(N34), .A2(n13), .S0(newDist), .Y(n77) );
  INVX0_HVT U88 ( .A(n69), .Y(n50) );
  INVX1_LVT U89 ( .A(R[2]), .Y(n53) );
  NAND2X0_LVT U90 ( .A1(n33), .A2(n53), .Y(n58) );
  AO22X1_LVT U91 ( .A1(R[1]), .A2(n56), .A3(n54), .A4(n55), .Y(n57) );
  OA221X1_LVT U92 ( .A1(R[3]), .A2(n5), .A3(R[4]), .A4(n61), .A5(n59), .Y(n60)
         );
  INVX1_LVT U93 ( .A(R[7]), .Y(n64) );
  NAND2X0_LVT U94 ( .A1(N17), .A2(n64), .Y(n65) );
  MUX21X1_LVT U95 ( .A1(N41), .A2(difference[7]), .S0(n51), .Y(n70) );
  MUX21X1_LVT U96 ( .A1(N40), .A2(difference[6]), .S0(n51), .Y(n71) );
  MUX21X1_LVT U97 ( .A1(N39), .A2(difference[5]), .S0(n51), .Y(n72) );
  MUX21X1_LVT U98 ( .A1(N38), .A2(difference[4]), .S0(n51), .Y(n73) );
  OR2X1_LVT U99 ( .A1(n73), .A2(n36), .Y(AccumulateIn[4]) );
  MUX21X1_LVT U100 ( .A1(N37), .A2(difference[3]), .S0(n52), .Y(n74) );
  MUX21X1_LVT U101 ( .A1(N18), .A2(N26), .S0(n7), .Y(difference[0]) );
  OR2X1_LVT U102 ( .A1(n77), .A2(n36), .Y(AccumulateIn[0]) );
endmodule


module PE_2_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN1X2_HVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_HVT U2 ( .A1(n1), .A2(A[0]), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_2_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_HVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  OR2X1_LVT U1 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  XNOR2X1_HVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_2_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  IBUFFX16_LVT U1 ( .A(B[4]), .Y(n4) );
  XNOR2X1_LVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U3 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX0_LVT U4 ( .A(B[1]), .Y(n7) );
  INVX1_HVT U5 ( .A(B[0]), .Y(n8) );
  INVX0_LVT U6 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U7 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U8 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U9 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U10 ( .A(B[3]), .Y(n5) );
endmodule


module PE_2 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  PE_2_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_2_DW01_sub_0 sub_83 ( .A({n17, n15, N15, N14, N13, n20, n18, n6}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_2_DW01_sub_1 sub_79 ( .A(R), .B({n17, n15, N15, N14, N13, N12, n18, N10}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  DFFX1_HVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  INVX0_LVT U3 ( .A(N11), .Y(n4) );
  INVX0_LVT U4 ( .A(N11), .Y(n49) );
  OR2X1_LVT U5 ( .A1(n13), .A2(n12), .Y(n5) );
  OR2X1_LVT U9 ( .A1(n5), .A2(n53), .Y(n55) );
  AND2X1_HVT U10 ( .A1(R[5]), .A2(n36), .Y(n12) );
  MUX21X1_LVT U11 ( .A1(n38), .A2(n37), .S0(n42), .Y(n36) );
  MUX21X1_LVT U12 ( .A1(n40), .A2(n41), .S0(n24), .Y(n39) );
  INVX0_HVT U13 ( .A(n21), .Y(n24) );
  DELLN1X2_HVT U14 ( .A(N16), .Y(n15) );
  MUX21X1_LVT U15 ( .A1(N19), .A2(N27), .S0(n34), .Y(difference[1]) );
  NBUFFX2_LVT U16 ( .A(newDist), .Y(n45) );
  MUX21X1_LVT U17 ( .A1(S2[2]), .A2(S1[2]), .S0(n24), .Y(N12) );
  INVX0_LVT U18 ( .A(N12), .Y(n19) );
  NBUFFX2_LVT U19 ( .A(N10), .Y(n6) );
  MUX21X1_LVT U20 ( .A1(S2[0]), .A2(S1[0]), .S0(n23), .Y(N10) );
  OR2X2_LVT U21 ( .A1(n66), .A2(n7), .Y(AccumulateIn[4]) );
  OR2X2_LVT U22 ( .A1(n65), .A2(n7), .Y(AccumulateIn[5]) );
  OR2X2_LVT U23 ( .A1(n67), .A2(n7), .Y(AccumulateIn[3]) );
  INVX1_LVT U24 ( .A(n42), .Y(n16) );
  AND2X1_HVT U25 ( .A1(Carry), .A2(n62), .Y(n7) );
  NBUFFX2_HVT U26 ( .A(n30), .Y(n32) );
  OR2X1_LVT U27 ( .A1(R[5]), .A2(n36), .Y(n43) );
  MUX21X2_LVT U28 ( .A1(N18), .A2(N26), .S0(n35), .Y(difference[0]) );
  MUX21X1_LVT U29 ( .A1(N41), .A2(difference[7]), .S0(n45), .Y(n63) );
  NBUFFX2_LVT U30 ( .A(n30), .Y(n31) );
  OR2X1_LVT U31 ( .A1(R[3]), .A2(n14), .Y(n28) );
  MUX21X1_LVT U32 ( .A1(S2[6]), .A2(S1[6]), .S0(n16), .Y(N16) );
  INVX0_LVT U33 ( .A(n4), .Y(n18) );
  MUX21X1_HVT U34 ( .A1(N36), .A2(difference[2]), .S0(n45), .Y(n68) );
  MUX21X1_HVT U35 ( .A1(N39), .A2(difference[5]), .S0(n45), .Y(n65) );
  MUX21X1_HVT U36 ( .A1(N38), .A2(difference[4]), .S0(newDist), .Y(n66) );
  NAND2X0_HVT U37 ( .A1(R[3]), .A2(n39), .Y(n8) );
  NAND2X0_LVT U38 ( .A1(n50), .A2(n51), .Y(n9) );
  NAND2X0_LVT U39 ( .A1(R[2]), .A2(n19), .Y(n10) );
  NAND3X0_LVT U40 ( .A1(n9), .A2(n8), .A3(n10), .Y(n52) );
  AO21X1_LVT U41 ( .A1(R[6]), .A2(n57), .A3(n56), .Y(n60) );
  MUX21X1_HVT U42 ( .A1(N37), .A2(difference[3]), .S0(newDist), .Y(n67) );
  AND2X1_LVT U43 ( .A1(n44), .A2(n43), .Y(n11) );
  AND2X1_LVT U44 ( .A1(n55), .A2(n11), .Y(n56) );
  AND2X1_LVT U45 ( .A1(R[4]), .A2(n54), .Y(n13) );
  NBUFFX2_LVT U46 ( .A(n39), .Y(n14) );
  INVX0_LVT U47 ( .A(n21), .Y(n23) );
  IBUFFX2_HVT U48 ( .A(n61), .Y(n17) );
  INVX0_LVT U49 ( .A(n22), .Y(n42) );
  MUX21X1_LVT U50 ( .A1(S2[4]), .A2(S1[4]), .S0(n23), .Y(N14) );
  INVX0_LVT U51 ( .A(n21), .Y(n22) );
  INVX0_LVT U52 ( .A(n19), .Y(n20) );
  INVX0_LVT U53 ( .A(S1S2mux), .Y(n21) );
  DELLN2X2_HVT U54 ( .A(difference[0]), .Y(n25) );
  NBUFFX2_LVT U55 ( .A(n34), .Y(n26) );
  AO21X1_LVT U56 ( .A1(R[6]), .A2(n57), .A3(n56), .Y(n27) );
  OR2X1_LVT U57 ( .A1(R[4]), .A2(n54), .Y(n29) );
  AND3X1_LVT U58 ( .A1(n29), .A2(n28), .A3(n52), .Y(n53) );
  INVX0_LVT U59 ( .A(N14), .Y(n54) );
  INVX0_HVT U60 ( .A(S2[3]), .Y(n40) );
  INVX0_HVT U61 ( .A(S1[3]), .Y(n41) );
  INVX0_LVT U62 ( .A(N16), .Y(n57) );
  INVX0_HVT U63 ( .A(n36), .Y(N15) );
  INVX0_HVT U64 ( .A(n14), .Y(N13) );
  INVX1_LVT U65 ( .A(S1[5]), .Y(n38) );
  INVX1_LVT U66 ( .A(S2[5]), .Y(n37) );
  OR2X1_LVT U67 ( .A1(n64), .A2(n31), .Y(AccumulateIn[6]) );
  OR2X1_LVT U68 ( .A1(n63), .A2(n31), .Y(AccumulateIn[7]) );
  OR2X1_LVT U69 ( .A1(n68), .A2(n32), .Y(AccumulateIn[2]) );
  OR2X1_LVT U70 ( .A1(n69), .A2(n31), .Y(AccumulateIn[1]) );
  AND2X1_LVT U71 ( .A1(Carry), .A2(n62), .Y(n30) );
  OR2X1_LVT U72 ( .A1(n70), .A2(n32), .Y(AccumulateIn[0]) );
  AOI22X1_LVT U73 ( .A1(R[7]), .A2(n61), .A3(n60), .A4(n59), .Y(n34) );
  AOI22X1_LVT U74 ( .A1(R[7]), .A2(n61), .A3(n60), .A4(n59), .Y(n33) );
  OR2X1_LVT U75 ( .A1(R[6]), .A2(n57), .Y(n44) );
  AOI22X1_LVT U76 ( .A1(R[7]), .A2(n61), .A3(n27), .A4(n59), .Y(n35) );
  NAND2X0_LVT U77 ( .A1(N12), .A2(n46), .Y(n51) );
  INVX0_LVT U78 ( .A(N10), .Y(n47) );
  MUX21X1_LVT U79 ( .A1(S2[1]), .A2(S1[1]), .S0(n22), .Y(N11) );
  MUX21X1_HVT U80 ( .A1(N34), .A2(n25), .S0(newDist), .Y(n70) );
  MUX21X1_HVT U81 ( .A1(N25), .A2(N33), .S0(n33), .Y(difference[7]) );
  MUX21X1_HVT U82 ( .A1(N24), .A2(N32), .S0(n26), .Y(difference[6]) );
  MUX21X1_HVT U83 ( .A1(N23), .A2(N31), .S0(n33), .Y(difference[5]) );
  MUX21X1_HVT U84 ( .A1(N22), .A2(N30), .S0(n26), .Y(difference[4]) );
  MUX21X1_HVT U85 ( .A1(N21), .A2(N29), .S0(n33), .Y(difference[3]) );
  MUX21X1_HVT U86 ( .A1(N20), .A2(N28), .S0(n35), .Y(difference[2]) );
  MUX21X1_HVT U87 ( .A1(S2[7]), .A2(S1[7]), .S0(n16), .Y(N17) );
  INVX1_LVT U88 ( .A(N17), .Y(n61) );
  INVX1_LVT U89 ( .A(R[2]), .Y(n46) );
  OA21X1_LVT U90 ( .A1(R[1]), .A2(n49), .A3(R[0]), .Y(n48) );
  AO22X1_LVT U91 ( .A1(R[1]), .A2(n49), .A3(n47), .A4(n48), .Y(n50) );
  INVX1_LVT U92 ( .A(R[7]), .Y(n58) );
  NAND2X0_LVT U93 ( .A1(N17), .A2(n58), .Y(n59) );
  INVX1_LVT U94 ( .A(newDist), .Y(n62) );
  MUX21X1_LVT U95 ( .A1(N40), .A2(difference[6]), .S0(n45), .Y(n64) );
  MUX21X1_LVT U96 ( .A1(N35), .A2(difference[1]), .S0(newDist), .Y(n69) );
endmodule


module PE_1_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   net13045, \carry[7] , \carry[6] , \carry[5] , \carry[4] , \carry[3] ,
         \carry[2] , \carry[1] ;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(\carry[7] ), .CO(SUM[8]), .S(
        SUM[7]) );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(\carry[6] ), .CO(\carry[7] ), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(\carry[5] ), .CO(\carry[6] ), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(\carry[4] ), .CO(\carry[5] ), .S(
        SUM[4]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(\carry[1] ), .CO(\carry[2] ), .S(
        SUM[1]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(\carry[3] ), .CO(\carry[4] ), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(\carry[2] ), .CO(\carry[3] ), .S(
        SUM[2]) );
  AND2X1_LVT U1 ( .A1(B[0]), .A2(A[0]), .Y(\carry[1] ) );
  DELLN2X2_LVT U2 ( .A(B[0]), .Y(net13045) );
  XOR2X1_HVT U3 ( .A1(A[0]), .A2(net13045), .Y(SUM[0]) );
endmodule


module PE_1_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XOR3X1_LVT U2_7 ( .A1(A[7]), .A2(n1), .A3(carry[7]), .Y(DIFF[7]) );
  XNOR2X1_HVT U1 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U2 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_1_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XOR3X1_LVT U2_7 ( .A1(A[7]), .A2(n1), .A3(carry[7]), .Y(DIFF[7]) );
  INVX0_LVT U1 ( .A(B[0]), .Y(n8) );
  INVX0_LVT U2 ( .A(B[1]), .Y(n7) );
  INVX0_LVT U3 ( .A(B[3]), .Y(n5) );
  INVX1_HVT U4 ( .A(B[2]), .Y(n6) );
  INVX0_LVT U5 ( .A(B[6]), .Y(n2) );
  XNOR2X1_LVT U6 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U7 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U8 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U9 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U10 ( .A(B[4]), .Y(n4) );
endmodule


module PE_1 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23, N24,
         N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38,
         N39, N40, N41, Carry, net7929, net7933, net9289, net9288, net12992,
         net13034, net13153, net13684, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DFFX1_LVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  PE_1_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference[7:1], 
        net13034}), .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, 
        N34}) );
  PE_1_DW01_sub_0 sub_83 ( .A({net13153, net13684, n44, n40, n41, n39, n42, 
        n55}), .B(R), .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_1_DW01_sub_1 sub_79 ( .A(R), .B({net13153, net13684, n44, n40, n41, n39, 
        n42, N10}), .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18})
         );
  DFFSSRX1_LVT \Accumulate_reg[6]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[6]), .CLK(clock), .Q(Accumulate[6]) );
  DFFSSRX1_LVT \Accumulate_reg[5]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[5]), .CLK(clock), .Q(Accumulate[5]) );
  DFFSSRX1_LVT \Accumulate_reg[1]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[1]), .CLK(clock), .Q(Accumulate[1]) );
  DFFSSRX1_LVT \Accumulate_reg[2]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[2]), .CLK(clock), .Q(Accumulate[2]) );
  DFFSSRX1_LVT \Accumulate_reg[4]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[4]), .CLK(clock), .Q(Accumulate[4]) );
  DFFSSRX1_LVT \Accumulate_reg[0]  ( .D(1'b0), .SETB(1'b0), .RSTB(
        AccumulateIn[0]), .CLK(clock), .Q(Accumulate[0]) );
  DFFSSRX1_LVT \Accumulate_reg[3]  ( .D(n83), .SETB(n78), .RSTB(1'b1), .CLK(
        clock), .Q(Accumulate[3]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFASX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .SETB(
        1'b1), .Q(Accumulate[7]) );
  OR2X2_LVT U3 ( .A1(n80), .A2(n32), .Y(AccumulateIn[6]) );
  AND2X1_LVT U4 ( .A1(n21), .A2(n18), .Y(n4) );
  MUX21X1_LVT U5 ( .A1(N24), .A2(N32), .S0(net12992), .Y(difference[6]) );
  IBUFFX2_LVT U9 ( .A(n20), .Y(n29) );
  OR2X1_LVT U10 ( .A1(n13), .A2(n12), .Y(n5) );
  OR2X2_LVT U11 ( .A1(n74), .A2(n5), .Y(net7933) );
  AND2X1_HVT U12 ( .A1(R[5]), .A2(n76), .Y(n12) );
  MUX21X1_LVT U13 ( .A1(S2[0]), .A2(S1[0]), .S0(n64), .Y(N10) );
  NAND2X0_HVT U14 ( .A1(net7933), .A2(n15), .Y(n9) );
  INVX1_LVT U15 ( .A(N11), .Y(n33) );
  INVX0_LVT U16 ( .A(n70), .Y(n39) );
  INVX0_HVT U17 ( .A(S1[3]), .Y(n36) );
  INVX0_HVT U18 ( .A(S2[3]), .Y(n35) );
  INVX0_LVT U19 ( .A(n20), .Y(net9288) );
  MUX21X1_LVT U20 ( .A1(N22), .A2(N30), .S0(net12992), .Y(difference[4]) );
  MUX21X1_HVT U21 ( .A1(N23), .A2(N31), .S0(n29), .Y(difference[5]) );
  NAND2X1_LVT U22 ( .A1(n77), .A2(Carry), .Y(n78) );
  NBUFFX2_LVT U23 ( .A(newDist), .Y(n66) );
  AND2X1_LVT U24 ( .A1(n49), .A2(n51), .Y(n6) );
  NOR2X0_LVT U25 ( .A1(R[5]), .A2(n76), .Y(n7) );
  MUX21X2_LVT U26 ( .A1(N19), .A2(N27), .S0(n4), .Y(difference[1]) );
  DELLN2X2_HVT U27 ( .A(net13034), .Y(n8) );
  OR2X2_LVT U28 ( .A1(n84), .A2(n32), .Y(AccumulateIn[2]) );
  OR2X2_LVT U29 ( .A1(n82), .A2(n53), .Y(AccumulateIn[4]) );
  NAND2X0_HVT U30 ( .A1(n7), .A2(n17), .Y(n10) );
  AND2X1_LVT U31 ( .A1(n10), .A2(n11), .Y(n15) );
  AND2X1_LVT U32 ( .A1(n25), .A2(n24), .Y(n11) );
  IBUFFX2_HVT U33 ( .A(N15), .Y(n43) );
  AND2X1_LVT U34 ( .A1(R[4]), .A2(n75), .Y(n13) );
  INVX0_LVT U35 ( .A(n78), .Y(n46) );
  INVX0_LVT U37 ( .A(n33), .Y(n42) );
  NAND2X0_LVT U38 ( .A1(net7933), .A2(n15), .Y(n21) );
  MUX21X1_LVT U39 ( .A1(S2[6]), .A2(S1[6]), .S0(n64), .Y(N16) );
  MUX21X1_LVT U40 ( .A1(N25), .A2(N33), .S0(n29), .Y(difference[7]) );
  NAND2X0_LVT U41 ( .A1(n6), .A2(n50), .Y(n73) );
  MUX21X1_LVT U42 ( .A1(N21), .A2(N29), .S0(n29), .Y(difference[3]) );
  MUX21X1_LVT U43 ( .A1(n22), .A2(n23), .S0(net9288), .Y(n26) );
  INVX0_LVT U44 ( .A(N17), .Y(n27) );
  MUX21X2_LVT U45 ( .A1(S2[7]), .A2(S1[7]), .S0(n38), .Y(N17) );
  INVX1_LVT U46 ( .A(R[6]), .Y(n16) );
  OR2X1_LVT U47 ( .A1(N16), .A2(n16), .Y(n17) );
  OA22X1_LVT U48 ( .A1(net7929), .A2(n28), .A3(n19), .A4(n17), .Y(n18) );
  NAND2X0_LVT U49 ( .A1(n18), .A2(n9), .Y(n20) );
  INVX1_LVT U50 ( .A(N20), .Y(n22) );
  INVX1_LVT U51 ( .A(N28), .Y(n23) );
  INVX1_LVT U52 ( .A(n26), .Y(difference[2]) );
  DELLN1X2_HVT U53 ( .A(N16), .Y(net13684) );
  NAND2X0_HVT U54 ( .A1(N16), .A2(n16), .Y(n24) );
  AND2X1_LVT U55 ( .A1(n21), .A2(n18), .Y(net9289) );
  IBUFFX2_HVT U56 ( .A(n27), .Y(net13153) );
  INVX0_LVT U57 ( .A(n27), .Y(n28) );
  NAND2X0_LVT U58 ( .A1(net7929), .A2(N17), .Y(n25) );
  INVX0_LVT U59 ( .A(n25), .Y(n19) );
  MUX21X1_LVT U60 ( .A1(N18), .A2(N26), .S0(net9289), .Y(net13034) );
  MUX21X1_LVT U61 ( .A1(n35), .A2(n36), .S0(n45), .Y(n34) );
  NBUFFX2_LVT U62 ( .A(S1S2mux), .Y(n30) );
  MUX21X1_LVT U63 ( .A1(S1[4]), .A2(S2[4]), .S0(n37), .Y(N14) );
  INVX0_LVT U64 ( .A(n37), .Y(n38) );
  MUX21X1_HVT U65 ( .A1(N36), .A2(difference[2]), .S0(n66), .Y(n84) );
  MUX21X1_HVT U66 ( .A1(N38), .A2(difference[4]), .S0(n66), .Y(n82) );
  NBUFFX2_LVT U67 ( .A(n34), .Y(n31) );
  MUX21X1_LVT U68 ( .A1(S2[5]), .A2(S1[5]), .S0(n45), .Y(N15) );
  NBUFFX2_LVT U69 ( .A(n30), .Y(n64) );
  NBUFFX2_LVT U70 ( .A(n52), .Y(n54) );
  NBUFFX2_LVT U71 ( .A(n52), .Y(n32) );
  OR2X1_LVT U72 ( .A1(n85), .A2(n53), .Y(AccumulateIn[1]) );
  NBUFFX2_LVT U73 ( .A(n30), .Y(n65) );
  INVX0_LVT U74 ( .A(n65), .Y(n37) );
  MUX21X1_LVT U75 ( .A1(difference[7]), .A2(N41), .S0(n77), .Y(n79) );
  MUX21X1_HVT U76 ( .A1(N37), .A2(difference[3]), .S0(newDist), .Y(n83) );
  MUX21X1_HVT U77 ( .A1(N39), .A2(difference[5]), .S0(newDist), .Y(n81) );
  MUX21X1_HVT U78 ( .A1(N40), .A2(difference[6]), .S0(newDist), .Y(n80) );
  MUX21X1_LVT U79 ( .A1(S2[2]), .A2(S1[2]), .S0(n65), .Y(N12) );
  NBUFFX2_LVT U80 ( .A(N14), .Y(n40) );
  IBUFFX2_HVT U81 ( .A(n31), .Y(n41) );
  MUX21X1_LVT U82 ( .A1(S2[1]), .A2(S1[1]), .S0(n63), .Y(N11) );
  INVX1_LVT U83 ( .A(n43), .Y(n44) );
  NBUFFX2_LVT U84 ( .A(n63), .Y(n45) );
  NBUFFX2_LVT U85 ( .A(net9288), .Y(net12992) );
  MUX21X1_HVT U86 ( .A1(N35), .A2(difference[1]), .S0(n66), .Y(n85) );
  OR2X1_LVT U87 ( .A1(R[3]), .A2(n31), .Y(n47) );
  OR2X1_LVT U88 ( .A1(R[4]), .A2(n75), .Y(n48) );
  AND3X1_LVT U89 ( .A1(n73), .A2(n48), .A3(n47), .Y(n74) );
  INVX0_HVT U90 ( .A(N14), .Y(n75) );
  MUX21X1_HVT U91 ( .A1(N34), .A2(n8), .S0(n66), .Y(n86) );
  NAND2X0_LVT U92 ( .A1(R[3]), .A2(n34), .Y(n49) );
  NAND2X0_LVT U93 ( .A1(n71), .A2(n72), .Y(n50) );
  NAND2X0_LVT U94 ( .A1(R[2]), .A2(n70), .Y(n51) );
  AND2X1_LVT U95 ( .A1(Carry), .A2(n77), .Y(n52) );
  INVX0_LVT U96 ( .A(N12), .Y(n70) );
  INVX0_LVT U97 ( .A(N15), .Y(n76) );
  INVX0_HVT U98 ( .A(n68), .Y(n55) );
  NBUFFX2_LVT U99 ( .A(n52), .Y(n53) );
  OR2X1_LVT U100 ( .A1(n81), .A2(n46), .Y(AccumulateIn[5]) );
  OR2X1_LVT U101 ( .A1(n79), .A2(n46), .Y(AccumulateIn[7]) );
  OR2X1_LVT U102 ( .A1(n86), .A2(n54), .Y(AccumulateIn[0]) );
  INVX0_LVT U110 ( .A(N10), .Y(n68) );
  NBUFFX2_LVT U111 ( .A(S1S2mux), .Y(n63) );
  INVX1_LVT U112 ( .A(R[2]), .Y(n67) );
  NAND2X0_LVT U113 ( .A1(N12), .A2(n67), .Y(n72) );
  OA21X1_LVT U114 ( .A1(R[1]), .A2(n33), .A3(R[0]), .Y(n69) );
  AO22X1_LVT U115 ( .A1(R[1]), .A2(n33), .A3(n68), .A4(n69), .Y(n71) );
  INVX1_LVT U116 ( .A(R[7]), .Y(net7929) );
  INVX1_LVT U117 ( .A(newDist), .Y(n77) );
endmodule


module PE_0_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(
        SUM[6]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(
        SUM[5]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(
        SUM[4]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(
        SUM[3]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(
        SUM[2]) );
  FADDX1_LVT U1_1 ( .A(A[1]), .B(carry[1]), .CI(B[1]), .CO(carry[2]), .S(
        SUM[1]) );
  DELLN2X2_HVT U1 ( .A(B[0]), .Y(n1) );
  XOR2X1_LVT U2 ( .A1(A[0]), .A2(n1), .Y(SUM[0]) );
  AND2X1_LVT U3 ( .A1(B[0]), .A2(A[0]), .Y(carry[1]) );
endmodule


module PE_0_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  OR2X1_LVT U1 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  XNOR2X1_HVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PE_0_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX0_HVT U1 ( .A(B[6]), .Y(n2) );
  XNOR2X1_LVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  OR2X1_LVT U3 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX0_LVT U4 ( .A(B[3]), .Y(n5) );
  INVX0_LVT U5 ( .A(B[4]), .Y(n4) );
  INVX0_LVT U6 ( .A(B[0]), .Y(n8) );
  INVX0_LVT U7 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U8 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U9 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U10 ( .A(B[2]), .Y(n6) );
endmodule


module PE_0 ( clock, R, S1, S2, S1S2mux, newDist, Accumulate, Rpipe );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  output [7:0] Rpipe;
  input clock, S1S2mux, newDist;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37,
         N38, N39, N40, N41, Carry, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Rpipe_reg[7]  ( .D(R[7]), .CLK(clock), .Q(Rpipe[7]) );
  DFFX1_LVT \Rpipe_reg[6]  ( .D(R[6]), .CLK(clock), .Q(Rpipe[6]) );
  DFFX1_LVT \Rpipe_reg[3]  ( .D(R[3]), .CLK(clock), .Q(Rpipe[3]) );
  DFFX1_LVT \Rpipe_reg[2]  ( .D(R[2]), .CLK(clock), .Q(Rpipe[2]) );
  DFFX1_LVT \Rpipe_reg[1]  ( .D(R[1]), .CLK(clock), .Q(Rpipe[1]) );
  DFFX1_LVT \Rpipe_reg[0]  ( .D(R[0]), .CLK(clock), .Q(Rpipe[0]) );
  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  PE_0_DW01_add_0 add_85 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PE_0_DW01_sub_0 sub_83 ( .A({n29, N16, N15, N14, n39, n44, n42, n38}), .B(R), 
        .CI(1'b0), .DIFF({N33, N32, N31, N30, N29, N28, N27, N26}) );
  PE_0_DW01_sub_1 sub_79 ( .A(R), .B({n29, N16, N15, N14, n39, n44, n42, n30}), 
        .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, N20, N19, N18}) );
  DFFX1_HVT \Rpipe_reg[4]  ( .D(R[4]), .CLK(clock), .Q(Rpipe[4]) );
  DFFX2_LVT \Rpipe_reg[5]  ( .D(R[5]), .CLK(clock), .Q(Rpipe[5]) );
  DELLN1X2_LVT U3 ( .A(N13), .Y(n39) );
  NAND2X0_LVT U4 ( .A1(R[3]), .A2(n61), .Y(n6) );
  OR2X1_LVT U5 ( .A1(R[3]), .A2(n61), .Y(n45) );
  AND2X1_LVT U9 ( .A1(n23), .A2(n24), .Y(n4) );
  AO21X1_LVT U10 ( .A1(R[6]), .A2(n18), .A3(n19), .Y(n65) );
  AO21X1_HVT U11 ( .A1(R[6]), .A2(n18), .A3(n19), .Y(n5) );
  NAND2X0_LVT U12 ( .A1(n4), .A2(n22), .Y(n62) );
  NAND2X0_HVT U13 ( .A1(R[5]), .A2(n15), .Y(n23) );
  MUX21X1_LVT U14 ( .A1(N24), .A2(N32), .S0(n26), .Y(difference[6]) );
  NAND2X0_HVT U15 ( .A1(N12), .A2(n53), .Y(n59) );
  MUX21X1_LVT U16 ( .A1(S2[3]), .A2(S1[3]), .S0(n48), .Y(N13) );
  INVX0_HVT U17 ( .A(S1[4]), .Y(n35) );
  INVX0_HVT U18 ( .A(S2[4]), .Y(n36) );
  MUX21X1_LVT U19 ( .A1(n16), .A2(n17), .S0(n43), .Y(n15) );
  INVX0_HVT U20 ( .A(n15), .Y(N15) );
  MUX21X1_LVT U21 ( .A1(N29), .A2(N21), .S0(n27), .Y(difference[3]) );
  AOI22X1_LVT U22 ( .A1(R[7]), .A2(n66), .A3(n64), .A4(n5), .Y(n28) );
  NBUFFX2_HVT U23 ( .A(n40), .Y(n26) );
  MUX21X1_HVT U24 ( .A1(N35), .A2(difference[1]), .S0(n51), .Y(n74) );
  MUX21X1_HVT U25 ( .A1(N37), .A2(difference[3]), .S0(n51), .Y(n72) );
  MUX21X1_LVT U26 ( .A1(N23), .A2(N31), .S0(n28), .Y(difference[5]) );
  NAND2X0_LVT U27 ( .A1(n58), .A2(n59), .Y(n7) );
  NAND2X0_LVT U28 ( .A1(R[2]), .A2(n57), .Y(n8) );
  NAND3X0_LVT U29 ( .A1(n7), .A2(n6), .A3(n8), .Y(n60) );
  OR2X2_LVT U30 ( .A1(n74), .A2(n41), .Y(AccumulateIn[1]) );
  OR2X2_LVT U31 ( .A1(n68), .A2(n41), .Y(AccumulateIn[7]) );
  NOR2X0_HVT U32 ( .A1(n15), .A2(R[5]), .Y(n9) );
  NOR2X0_LVT U33 ( .A1(n12), .A2(R[6]), .Y(n10) );
  NOR2X0_LVT U34 ( .A1(n9), .A2(n10), .Y(n11) );
  MUX21X1_LVT U35 ( .A1(n13), .A2(n14), .S0(n49), .Y(n12) );
  INVX0_LVT U36 ( .A(n12), .Y(N16) );
  INVX0_LVT U37 ( .A(S2[6]), .Y(n13) );
  INVX0_LVT U38 ( .A(S1[6]), .Y(n14) );
  INVX0_LVT U39 ( .A(S1[5]), .Y(n16) );
  INVX0_LVT U40 ( .A(S2[5]), .Y(n17) );
  INVX0_LVT U41 ( .A(N16), .Y(n18) );
  AND2X1_LVT U42 ( .A1(n62), .A2(n11), .Y(n19) );
  MUX21X1_LVT U43 ( .A1(N19), .A2(N27), .S0(n40), .Y(difference[1]) );
  NAND2X0_HVT U44 ( .A1(Carry), .A2(n67), .Y(n20) );
  AND2X1_LVT U45 ( .A1(n67), .A2(Carry), .Y(n21) );
  AND2X1_LVT U46 ( .A1(n67), .A2(Carry), .Y(n32) );
  INVX0_LVT U47 ( .A(n20), .Y(n41) );
  INVX0_HVT U48 ( .A(n56), .Y(n42) );
  INVX0_HVT U49 ( .A(N11), .Y(n56) );
  INVX0_LVT U50 ( .A(n47), .Y(n37) );
  NAND3X0_LVT U51 ( .A1(n60), .A2(n46), .A3(n45), .Y(n22) );
  NAND2X0_LVT U52 ( .A1(R[4]), .A2(n34), .Y(n24) );
  MUX21X1_LVT U53 ( .A1(N22), .A2(N30), .S0(n26), .Y(difference[4]) );
  AOI22X1_LVT U54 ( .A1(R[7]), .A2(n66), .A3(n65), .A4(n64), .Y(n25) );
  INVX0_LVT U55 ( .A(n28), .Y(n27) );
  IBUFFX2_HVT U56 ( .A(n66), .Y(n29) );
  INVX0_LVT U57 ( .A(n47), .Y(n49) );
  INVX0_LVT U58 ( .A(n47), .Y(n48) );
  INVX0_LVT U59 ( .A(n34), .Y(N14) );
  NBUFFX2_LVT U60 ( .A(N10), .Y(n30) );
  INVX0_LVT U61 ( .A(S1S2mux), .Y(n47) );
  MUX21X2_LVT U62 ( .A1(S2[1]), .A2(S1[1]), .S0(n37), .Y(N11) );
  MUX21X1_LVT U63 ( .A1(S2[2]), .A2(S1[2]), .S0(n49), .Y(N12) );
  MUX21X1_LVT U64 ( .A1(N34), .A2(n31), .S0(n52), .Y(n75) );
  DELLN2X2_HVT U65 ( .A(difference[0]), .Y(n31) );
  INVX0_LVT U66 ( .A(n51), .Y(n67) );
  INVX0_LVT U67 ( .A(N11), .Y(n33) );
  MUX21X1_LVT U68 ( .A1(n36), .A2(n35), .S0(n48), .Y(n34) );
  INVX0_LVT U69 ( .A(S1S2mux), .Y(n43) );
  NBUFFX2_LVT U70 ( .A(n30), .Y(n38) );
  MUX21X1_LVT U71 ( .A1(S2[0]), .A2(S1[0]), .S0(n50), .Y(N10) );
  OR2X2_LVT U72 ( .A1(n72), .A2(n21), .Y(AccumulateIn[3]) );
  OR2X2_LVT U73 ( .A1(n73), .A2(n21), .Y(AccumulateIn[2]) );
  OR2X2_LVT U74 ( .A1(n69), .A2(n21), .Y(AccumulateIn[6]) );
  OR2X2_LVT U75 ( .A1(n71), .A2(n32), .Y(AccumulateIn[4]) );
  OR2X2_LVT U76 ( .A1(n70), .A2(n32), .Y(AccumulateIn[5]) );
  OR2X2_LVT U77 ( .A1(n75), .A2(n32), .Y(AccumulateIn[0]) );
  NBUFFX2_HVT U78 ( .A(newDist), .Y(n51) );
  INVX0_LVT U79 ( .A(N17), .Y(n66) );
  NBUFFX2_LVT U80 ( .A(newDist), .Y(n52) );
  OR2X1_LVT U81 ( .A1(R[4]), .A2(n34), .Y(n46) );
  AOI22X1_LVT U82 ( .A1(R[7]), .A2(n66), .A3(n5), .A4(n64), .Y(n40) );
  INVX0_LVT U83 ( .A(N13), .Y(n61) );
  MUX21X1_HVT U84 ( .A1(N25), .A2(N33), .S0(n28), .Y(difference[7]) );
  INVX0_LVT U85 ( .A(n43), .Y(n50) );
  MUX21X1_HVT U86 ( .A1(N20), .A2(N28), .S0(n25), .Y(difference[2]) );
  INVX0_LVT U87 ( .A(n57), .Y(n44) );
  INVX0_LVT U88 ( .A(N10), .Y(n54) );
  INVX0_LVT U89 ( .A(N12), .Y(n57) );
  MUX21X1_HVT U90 ( .A1(S2[7]), .A2(S1[7]), .S0(n50), .Y(N17) );
  INVX1_LVT U91 ( .A(R[2]), .Y(n53) );
  OA21X1_LVT U92 ( .A1(R[1]), .A2(n33), .A3(R[0]), .Y(n55) );
  AO22X1_LVT U93 ( .A1(R[1]), .A2(n56), .A3(n55), .A4(n54), .Y(n58) );
  INVX1_LVT U94 ( .A(R[7]), .Y(n63) );
  NAND2X0_LVT U95 ( .A1(N17), .A2(n63), .Y(n64) );
  MUX21X1_LVT U96 ( .A1(N41), .A2(difference[7]), .S0(n52), .Y(n68) );
  MUX21X1_LVT U97 ( .A1(N40), .A2(difference[6]), .S0(newDist), .Y(n69) );
  MUX21X1_LVT U98 ( .A1(N39), .A2(difference[5]), .S0(newDist), .Y(n70) );
  MUX21X1_LVT U99 ( .A1(N38), .A2(difference[4]), .S0(n52), .Y(n71) );
  MUX21X1_LVT U100 ( .A1(N36), .A2(difference[2]), .S0(n52), .Y(n73) );
  MUX21X1_LVT U101 ( .A1(N18), .A2(N26), .S0(n25), .Y(difference[0]) );
endmodule


module PEend_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   \carry[7] , \carry[6] , \carry[5] , \carry[4] , \carry[3] ,
         \carry[2] , \carry[1] , n1;

  FADDX1_LVT U1_1 ( .A(A[1]), .B(B[1]), .CI(\carry[1] ), .CO(\carry[2] ), .S(
        SUM[1]) );
  FADDX1_LVT U1_2 ( .A(A[2]), .B(B[2]), .CI(\carry[2] ), .CO(\carry[3] ), .S(
        SUM[2]) );
  FADDX1_LVT U1_3 ( .A(A[3]), .B(B[3]), .CI(\carry[3] ), .CO(\carry[4] ), .S(
        SUM[3]) );
  FADDX1_LVT U1_4 ( .A(A[4]), .B(B[4]), .CI(\carry[4] ), .CO(\carry[5] ), .S(
        SUM[4]) );
  FADDX1_LVT U1_5 ( .A(A[5]), .B(B[5]), .CI(\carry[5] ), .CO(\carry[6] ), .S(
        SUM[5]) );
  FADDX1_LVT U1_6 ( .A(A[6]), .B(B[6]), .CI(\carry[6] ), .CO(\carry[7] ), .S(
        SUM[6]) );
  FADDX1_LVT U1_7 ( .A(A[7]), .B(B[7]), .CI(\carry[7] ), .CO(SUM[8]), .S(
        SUM[7]) );
  AND2X1_LVT U1 ( .A1(B[0]), .A2(A[0]), .Y(\carry[1] ) );
  DELLN2X2_HVT U2 ( .A(B[0]), .Y(n1) );
  XOR2X1_LVT U3 ( .A1(A[0]), .A2(n1), .Y(SUM[0]) );
endmodule


module PEend_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  OR2X1_LVT U1 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  XNOR2X1_LVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX1_LVT U3 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U4 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U5 ( .A(B[5]), .Y(n3) );
  INVX1_LVT U6 ( .A(B[4]), .Y(n4) );
  INVX1_LVT U7 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U8 ( .A(B[2]), .Y(n6) );
  INVX1_LVT U9 ( .A(B[1]), .Y(n7) );
  INVX1_LVT U10 ( .A(B[0]), .Y(n8) );
endmodule


module PEend_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [8:0] carry;

  FADDX1_LVT U2_7 ( .A(A[7]), .B(n1), .CI(carry[7]), .S(DIFF[7]) );
  FADDX1_LVT U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FADDX1_LVT U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FADDX1_LVT U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FADDX1_LVT U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FADDX1_LVT U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FADDX1_LVT U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INVX0_LVT U1 ( .A(B[2]), .Y(n6) );
  XNOR2X1_HVT U2 ( .A1(A[0]), .A2(n8), .Y(DIFF[0]) );
  INVX0_HVT U3 ( .A(B[5]), .Y(n3) );
  INVX0_LVT U4 ( .A(B[4]), .Y(n4) );
  INVX0_LVT U5 ( .A(B[0]), .Y(n8) );
  OR2X1_LVT U6 ( .A1(n8), .A2(A[0]), .Y(carry[1]) );
  INVX1_LVT U7 ( .A(B[7]), .Y(n1) );
  INVX1_LVT U8 ( .A(B[6]), .Y(n2) );
  INVX1_LVT U9 ( .A(B[3]), .Y(n5) );
  INVX1_LVT U10 ( .A(B[1]), .Y(n7) );
endmodule


module PEend ( clock, R, S1, S2, S1S2mux, newDist, Accumulate );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] Accumulate;
  input clock, S1S2mux, newDist;
  wire   N11, N13, N14, N15, N16, N18, N19, N20, N21, N22, N23, N24, N25, N26,
         N27, N28, N29, N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40,
         N41, Carry, net7849, net7854, net7856, net7867, net8651, net8950,
         net9267, net9425, net9424, net11827, net12905, net13057, net13094,
         net13189, net13277, net13358, net13489, net13520, net13727, net13785,
         net13784, N12, net8749, net8748, net7869, net13226, net13225,
         net13224, net9529, net9301, net8951, net7865, net7864, net7863,
         net7862, net13924, net13279, net13278, N17, net9530, net9528, net8936,
         net8935, net8934, net7880, net7879, net7878, net7876, net7875,
         net7874, net7873, net14642, net14581, net14571, net13485, net13280,
         N10, net9292, net8649, net7852, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24;
  wire   [7:0] AccumulateIn;
  wire   [7:0] difference;

  DFFX1_LVT \Accumulate_reg[0]  ( .D(AccumulateIn[0]), .CLK(clock), .Q(
        Accumulate[0]) );
  DFFX1_LVT \Accumulate_reg[7]  ( .D(AccumulateIn[7]), .CLK(clock), .Q(
        Accumulate[7]) );
  DFFX1_LVT \Accumulate_reg[6]  ( .D(AccumulateIn[6]), .CLK(clock), .Q(
        Accumulate[6]) );
  DFFX1_LVT \Accumulate_reg[5]  ( .D(AccumulateIn[5]), .CLK(clock), .Q(
        Accumulate[5]) );
  DFFX1_LVT \Accumulate_reg[4]  ( .D(AccumulateIn[4]), .CLK(clock), .Q(
        Accumulate[4]) );
  DFFX1_LVT \Accumulate_reg[3]  ( .D(AccumulateIn[3]), .CLK(clock), .Q(
        Accumulate[3]) );
  DFFX1_LVT \Accumulate_reg[2]  ( .D(AccumulateIn[2]), .CLK(clock), .Q(
        Accumulate[2]) );
  DFFX1_LVT \Accumulate_reg[1]  ( .D(AccumulateIn[1]), .CLK(clock), .Q(
        Accumulate[1]) );
  PEend_DW01_add_0 add_114 ( .A({1'b0, Accumulate}), .B({1'b0, difference}), 
        .CI(1'b0), .SUM({Carry, N41, N40, N39, N38, N37, N36, N35, N34}) );
  PEend_DW01_sub_0 sub_112 ( .A({net13489, N16, net13520, net13785, N13, 
        net13358, N11, net13727}), .B(R), .CI(1'b0), .DIFF({N33, N32, N31, N30, 
        N29, N28, N27, N26}) );
  PEend_DW01_sub_1 sub_108 ( .A(R), .B({net13489, N16, N15, net13785, N13, 
        net13358, N11, net13189}), .CI(1'b0), .DIFF({N25, N24, N23, N22, N21, 
        N20, N19, N18}) );
  NBUFFX2_LVT U3 ( .A(N17), .Y(n4) );
  MUX21X1_LVT U4 ( .A1(S2[7]), .A2(S1[7]), .S0(n10), .Y(N17) );
  NAND2X0_LVT U5 ( .A1(net14642), .A2(net7873), .Y(n5) );
  NAND2X0_LVT U9 ( .A1(R[5]), .A2(n21), .Y(n6) );
  NAND2X1_LVT U10 ( .A1(R[4]), .A2(n20), .Y(n7) );
  NAND3X0_LVT U11 ( .A1(n5), .A2(n6), .A3(n7), .Y(net7869) );
  AO22X2_HVT U12 ( .A1(R[7]), .A2(net7862), .A3(net9267), .A4(net7864), .Y(
        net11827) );
  NBUFFX2_LVT U13 ( .A(net13277), .Y(n8) );
  MUX21X1_HVT U14 ( .A1(net13279), .A2(net13278), .S0(net13280), .Y(net13277)
         );
  NBUFFX2_HVT U15 ( .A(S1S2mux), .Y(net9530) );
  INVX0_LVT U16 ( .A(net9530), .Y(net13280) );
  INVX0_HVT U17 ( .A(net9529), .Y(n9) );
  INVX0_LVT U18 ( .A(n9), .Y(n10) );
  OA21X1_LVT U19 ( .A1(net13224), .A2(R[1]), .A3(R[0]), .Y(net7878) );
  IBUFFX2_HVT U20 ( .A(net13485), .Y(N11) );
  INVX0_HVT U21 ( .A(n8), .Y(N16) );
  INVX0_HVT U22 ( .A(S2[6]), .Y(net13278) );
  INVX0_HVT U23 ( .A(S1[6]), .Y(net13279) );
  OR2X2_LVT U24 ( .A1(net7854), .A2(net9425), .Y(AccumulateIn[3]) );
  OR2X2_LVT U25 ( .A1(net7856), .A2(net9424), .Y(AccumulateIn[5]) );
  MUX21X1_LVT U26 ( .A1(net13225), .A2(net13226), .S0(net9529), .Y(net13224)
         );
  MUX21X1_LVT U27 ( .A1(N19), .A2(N27), .S0(net8951), .Y(difference[1]) );
  INVX0_LVT U28 ( .A(N12), .Y(net7876) );
  OR2X1_LVT U29 ( .A1(n11), .A2(net7849), .Y(AccumulateIn[0]) );
  MUX21X1_LVT U30 ( .A1(N34), .A2(n22), .S0(net8651), .Y(net7849) );
  INVX0_LVT U31 ( .A(n12), .Y(n11) );
  INVX0_LVT U32 ( .A(n12), .Y(n14) );
  MUX21X1_LVT U33 ( .A1(N25), .A2(N33), .S0(net8950), .Y(difference[7]) );
  MUX21X1_LVT U34 ( .A1(N26), .A2(N18), .S0(net12905), .Y(difference[0]) );
  IBUFFX2_HVT U35 ( .A(S2[1]), .Y(net13225) );
  NAND2X0_LVT U36 ( .A1(n17), .A2(Carry), .Y(n12) );
  NAND2X0_LVT U37 ( .A1(n17), .A2(Carry), .Y(n13) );
  OR2X2_LVT U38 ( .A1(n16), .A2(net9424), .Y(AccumulateIn[7]) );
  OR2X2_LVT U39 ( .A1(n15), .A2(n14), .Y(AccumulateIn[6]) );
  OR2X2_LVT U40 ( .A1(net7852), .A2(n14), .Y(AccumulateIn[1]) );
  MUX21X1_LVT U41 ( .A1(N41), .A2(difference[7]), .S0(net8649), .Y(n16) );
  INVX1_LVT U42 ( .A(n17), .Y(net8649) );
  MUX21X1_LVT U43 ( .A1(N40), .A2(difference[6]), .S0(net8649), .Y(n15) );
  MUX21X1_HVT U44 ( .A1(N39), .A2(difference[5]), .S0(net8649), .Y(net7856) );
  IBUFFX2_HVT U45 ( .A(newDist), .Y(n17) );
  INVX1_LVT U46 ( .A(n17), .Y(net8651) );
  INVX1_LVT U47 ( .A(n17), .Y(n18) );
  MUX21X1_LVT U48 ( .A1(N35), .A2(difference[1]), .S0(n18), .Y(net7852) );
  MUX21X1_LVT U49 ( .A1(N37), .A2(difference[3]), .S0(n18), .Y(net7854) );
  MUX21X1_LVT U50 ( .A1(N21), .A2(N29), .S0(net8950), .Y(difference[3]) );
  MUX21X1_HVT U51 ( .A1(N23), .A2(N31), .S0(net8950), .Y(difference[5]) );
  MUX21X1_HVT U52 ( .A1(N24), .A2(N32), .S0(net9292), .Y(difference[6]) );
  NBUFFX2_HVT U53 ( .A(net8951), .Y(net9292) );
  MUX21X1_HVT U54 ( .A1(N22), .A2(N30), .S0(net9292), .Y(difference[4]) );
  AND2X1_LVT U55 ( .A1(n19), .A2(net14571), .Y(net14642) );
  OR2X2_LVT U56 ( .A1(R[3]), .A2(net8934), .Y(net14571) );
  OR2X1_LVT U57 ( .A1(R[4]), .A2(n20), .Y(n19) );
  INVX0_LVT U58 ( .A(N14), .Y(n20) );
  AO222X1_LVT U59 ( .A1(R[3]), .A2(net8934), .A3(net7875), .A4(net7874), .A5(
        R[2]), .A6(net7876), .Y(net7873) );
  NAND2X0_LVT U60 ( .A1(net7880), .A2(N12), .Y(net7874) );
  INVX1_LVT U61 ( .A(R[2]), .Y(net7880) );
  AO22X1_LVT U62 ( .A1(net13485), .A2(R[1]), .A3(net7878), .A4(net7879), .Y(
        net7875) );
  INVX0_LVT U63 ( .A(N10), .Y(net7879) );
  INVX0_LVT U64 ( .A(net7879), .Y(net13189) );
  MUX21X1_LVT U65 ( .A1(S2[0]), .A2(S1[0]), .S0(net9528), .Y(N10) );
  NBUFFX2_LVT U66 ( .A(net14581), .Y(net9528) );
  MUX21X1_LVT U67 ( .A1(S2[2]), .A2(S1[2]), .S0(net9528), .Y(N12) );
  NBUFFX2_LVT U68 ( .A(S1S2mux), .Y(net14581) );
  NBUFFX2_LVT U69 ( .A(net14581), .Y(net9529) );
  NBUFFX2_LVT U70 ( .A(net13224), .Y(net13485) );
  MUX21X1_LVT U71 ( .A1(net8936), .A2(net8935), .S0(net13280), .Y(net8934) );
  INVX0_HVT U72 ( .A(net8934), .Y(N13) );
  NBUFFX2_LVT U73 ( .A(net9530), .Y(net13094) );
  INVX1_LVT U74 ( .A(S2[3]), .Y(net8935) );
  INVX0_HVT U75 ( .A(S1[3]), .Y(net8936) );
  AOI22X1_LVT U76 ( .A1(R[7]), .A2(net7862), .A3(net7863), .A4(net7864), .Y(
        net8951) );
  AO21X1_LVT U77 ( .A1(R[6]), .A2(n8), .A3(net9301), .Y(net7863) );
  INVX0_LVT U78 ( .A(N17), .Y(net7862) );
  AO22X1_LVT U79 ( .A1(R[7]), .A2(net7862), .A3(net9267), .A4(net7864), .Y(
        net12905) );
  AOI22X1_LVT U80 ( .A1(R[7]), .A2(net7862), .A3(net13924), .A4(net7864), .Y(
        net8950) );
  NAND2X0_LVT U81 ( .A1(n4), .A2(net7865), .Y(net7864) );
  INVX1_LVT U82 ( .A(R[7]), .Y(net7865) );
  AND3X1_LVT U83 ( .A1(net7869), .A2(net8749), .A3(net8748), .Y(net9301) );
  AO21X2_HVT U84 ( .A1(R[6]), .A2(net13277), .A3(net9301), .Y(net13924) );
  DELLN1X2_LVT U85 ( .A(n4), .Y(net13489) );
  AND3X1_LVT U86 ( .A1(net8748), .A2(net8749), .A3(net7869), .Y(net7867) );
  INVX0_LVT U87 ( .A(S1[1]), .Y(net13226) );
  INVX0_LVT U88 ( .A(N15), .Y(n21) );
  OR2X2_LVT U89 ( .A1(R[5]), .A2(n21), .Y(net8748) );
  OR2X1_LVT U90 ( .A1(R[6]), .A2(net13277), .Y(net8749) );
  IBUFFX2_HVT U91 ( .A(N14), .Y(net13784) );
  INVX1_LVT U92 ( .A(net7876), .Y(net13358) );
  MUX21X1_HVT U93 ( .A1(N38), .A2(difference[4]), .S0(net8651), .Y(n23) );
  INVX1_LVT U94 ( .A(net13784), .Y(net13785) );
  MUX21X1_LVT U95 ( .A1(S2[4]), .A2(S1[4]), .S0(net13094), .Y(N14) );
  NBUFFX2_LVT U96 ( .A(net13189), .Y(net13727) );
  DELLN1X2_HVT U97 ( .A(N15), .Y(net13520) );
  MUX21X2_LVT U98 ( .A1(S2[5]), .A2(S1[5]), .S0(net13057), .Y(N15) );
  DELLN2X2_HVT U99 ( .A(difference[0]), .Y(n22) );
  NBUFFX2_LVT U100 ( .A(net13094), .Y(net13057) );
  OR2X1_LVT U101 ( .A1(n24), .A2(n11), .Y(AccumulateIn[2]) );
  OR2X1_LVT U102 ( .A1(n23), .A2(net9425), .Y(AccumulateIn[4]) );
  MUX21X1_LVT U103 ( .A1(N28), .A2(N20), .S0(net11827), .Y(difference[2]) );
  INVX0_HVT U104 ( .A(n13), .Y(net9424) );
  INVX0_HVT U105 ( .A(n13), .Y(net9425) );
  AO21X1_LVT U106 ( .A1(R[6]), .A2(n8), .A3(net7867), .Y(net9267) );
  MUX21X1_LVT U107 ( .A1(N36), .A2(difference[2]), .S0(net8651), .Y(n24) );
endmodule


module PEtotal ( clock, R, S1, S2, S1S2mux, newDist, Accumulate );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  input [15:0] S1S2mux;
  input [15:0] newDist;
  output [127:0] Accumulate;
  input clock;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69;
  wire   [7:0] Rpipe0;
  wire   [7:0] Rpipe1;
  wire   [7:0] Rpipe2;
  wire   [7:0] Rpipe3;
  wire   [7:0] Rpipe4;
  wire   [7:0] Rpipe5;
  wire   [7:0] Rpipe6;
  wire   [7:0] Rpipe7;
  wire   [7:0] Rpipe8;
  wire   [7:0] Rpipe9;
  wire   [7:0] Rpipe10;
  wire   [7:0] Rpipe11;
  wire   [7:0] Rpipe12;
  wire   [7:0] Rpipe13;
  wire   [7:0] Rpipe14;

  PE_14 pe0 ( .clock(clock), .R(R), .S1({n67, n63, n59, n55, n51, n47, n45, n3}), .S2({n37, n33, n29, n25, n21, n17, n15, n9}), .S1S2mux(S1S2mux[0]), 
        .newDist(newDist[0]), .Accumulate(Accumulate[7:0]), .Rpipe(Rpipe0) );
  PE_13 pe1 ( .clock(clock), .R(Rpipe0), .S1({n67, n63, n59, n55, n51, n48, 
        n44, n41}), .S2({n37, n33, n29, n25, n21, n17, n13, n9}), .S1S2mux(
        S1S2mux[1]), .newDist(newDist[1]), .Accumulate(Accumulate[15:8]), 
        .Rpipe(Rpipe1) );
  PE_12 pe2 ( .clock(clock), .R(Rpipe1), .S1({n67, n63, n59, n55, n51, n47, 
        n44, n42}), .S2({n37, n33, n29, n25, n21, n17, n13, n9}), .S1S2mux(
        S1S2mux[2]), .newDist(newDist[2]), .Accumulate(Accumulate[23:16]), 
        .Rpipe(Rpipe2) );
  PE_11 pe3 ( .clock(clock), .R(Rpipe2), .S1({n67, n63, n59, n55, n51, n47, 
        n44, n41}), .S2({n37, n33, n29, n25, n21, n17, n5, n9}), .S1S2mux(
        S1S2mux[3]), .newDist(newDist[3]), .Accumulate(Accumulate[31:24]), 
        .Rpipe(Rpipe3) );
  PE_10 pe4 ( .clock(clock), .R(Rpipe3), .S1({n67, n63, n59, n55, n51, n48, n7, 
        n6}), .S2({n37, n33, n29, n25, n21, n17, n14, n9}), .S1S2mux(
        S1S2mux[4]), .newDist(newDist[4]), .Accumulate(Accumulate[39:32]), 
        .Rpipe(Rpipe4) );
  PE_9 pe5 ( .clock(clock), .R(Rpipe4), .S1({n68, n64, n60, n56, n52, n2, n45, 
        n3}), .S2({n38, n34, n30, n26, n22, n18, n13, n10}), .S1S2mux(
        S1S2mux[5]), .newDist(newDist[5]), .Accumulate(Accumulate[47:40]), 
        .Rpipe(Rpipe5) );
  PE_8 pe6 ( .clock(clock), .R(Rpipe5), .S1({n69, n65, n61, n57, n53, n49, n45, 
        n3}), .S2({n39, n35, n31, n27, n23, n19, n5, n11}), .S1S2mux(
        S1S2mux[6]), .newDist(newDist[6]), .Accumulate(Accumulate[55:48]), 
        .Rpipe(Rpipe6) );
  PE_7 pe7 ( .clock(clock), .R(Rpipe6), .S1({n68, n64, n60, n56, n52, n49, n44, 
        n6}), .S2({n38, n34, n30, n26, n22, n18, n5, n10}), .S1S2mux(
        S1S2mux[7]), .newDist(newDist[7]), .Accumulate(Accumulate[63:56]), 
        .Rpipe(Rpipe7) );
  PE_6 pe8 ( .clock(clock), .R(Rpipe7), .S1({n69, n65, n61, n57, n53, n48, n4, 
        n41}), .S2({n39, n35, n31, n27, n23, n19, n13, n11}), .S1S2mux(n1), 
        .newDist(newDist[8]), .Accumulate(Accumulate[71:64]), .Rpipe(Rpipe8)
         );
  PE_5 pe9 ( .clock(clock), .R(Rpipe8), .S1({n68, n64, n60, n56, n52, n49, n7, 
        n6}), .S2({n38, n34, n30, n26, n22, n18, n14, n10}), .S1S2mux(
        S1S2mux[9]), .newDist(newDist[9]), .Accumulate(Accumulate[79:72]), 
        .Rpipe(Rpipe9) );
  PE_4 pe10 ( .clock(clock), .R(Rpipe9), .S1({n69, n65, n61, n57, n53, n48, n4, 
        n42}), .S2({n39, n35, n31, n27, n23, n19, n15, n11}), .S1S2mux(
        S1S2mux[10]), .newDist(newDist[10]), .Accumulate(Accumulate[87:80]), 
        .Rpipe(Rpipe10) );
  PE_3 pe11 ( .clock(clock), .R(Rpipe10), .S1({n68, n64, n60, n56, n52, n2, n7, 
        n6}), .S2({n38, n34, n30, n26, n22, n18, n15, n10}), .S1S2mux(
        S1S2mux[11]), .newDist(newDist[11]), .Accumulate(Accumulate[95:88]), 
        .Rpipe(Rpipe11) );
  PE_2 pe12 ( .clock(clock), .R(Rpipe11), .S1({n69, n65, n61, n57, n53, n2, n7, 
        n3}), .S2({n39, n35, n31, n27, n23, n19, n14, n11}), .S1S2mux(
        S1S2mux[12]), .newDist(newDist[12]), .Accumulate(Accumulate[103:96]), 
        .Rpipe(Rpipe12) );
  PE_1 pe13 ( .clock(clock), .R(Rpipe12), .S1({n69, n65, n61, n57, n53, n2, n4, 
        n42}), .S2({n39, n35, n31, n27, n23, n19, n5, n11}), .S1S2mux(
        S1S2mux[13]), .newDist(newDist[13]), .Accumulate(Accumulate[111:104]), 
        .Rpipe(Rpipe13) );
  PE_0 pe14 ( .clock(clock), .R(Rpipe13), .S1({n68, n64, n60, n56, n52, n47, 
        n4, n41}), .S2({n38, n34, n30, n26, n22, n18, n14, n10}), .S1S2mux(
        S1S2mux[14]), .newDist(newDist[14]), .Accumulate(Accumulate[119:112]), 
        .Rpipe(Rpipe14) );
  PEend pe15 ( .clock(clock), .R(Rpipe14), .S1({n68, n64, n60, n56, n52, n49, 
        n45, n42}), .S2({n38, n34, n30, n26, n22, n18, n15, n10}), .S1S2mux(
        S1S2mux[15]), .newDist(newDist[15]), .Accumulate(Accumulate[127:120])
         );
  NBUFFX2_LVT U1 ( .A(S1S2mux[8]), .Y(n1) );
  INVX0_LVT U2 ( .A(n36), .Y(n39) );
  INVX0_LVT U3 ( .A(n36), .Y(n37) );
  INVX1_LVT U4 ( .A(S2[1]), .Y(n12) );
  INVX0_HVT U5 ( .A(n12), .Y(n13) );
  INVX1_LVT U6 ( .A(S1[2]), .Y(n46) );
  INVX0_HVT U7 ( .A(n46), .Y(n2) );
  INVX0_HVT U8 ( .A(n46), .Y(n49) );
  INVX0_HVT U9 ( .A(n46), .Y(n48) );
  INVX0_LVT U10 ( .A(n54), .Y(n55) );
  INVX0_LVT U11 ( .A(n24), .Y(n25) );
  INVX0_LVT U12 ( .A(n12), .Y(n14) );
  INVX0_LVT U13 ( .A(n12), .Y(n15) );
  INVX0_LVT U14 ( .A(n8), .Y(n11) );
  INVX0_LVT U15 ( .A(n46), .Y(n47) );
  NBUFFX2_HVT U16 ( .A(S1[0]), .Y(n3) );
  INVX0_LVT U17 ( .A(S1[0]), .Y(n40) );
  NBUFFX2_HVT U18 ( .A(S1[1]), .Y(n4) );
  INVX0_LVT U19 ( .A(S1[1]), .Y(n43) );
  INVX0_LVT U20 ( .A(n43), .Y(n45) );
  INVX0_LVT U21 ( .A(n12), .Y(n5) );
  INVX0_LVT U22 ( .A(n16), .Y(n17) );
  INVX0_LVT U23 ( .A(n40), .Y(n6) );
  INVX0_HVT U24 ( .A(n43), .Y(n7) );
  INVX0_HVT U25 ( .A(n43), .Y(n44) );
  INVX0_LVT U26 ( .A(n8), .Y(n9) );
  INVX1_LVT U27 ( .A(S1[6]), .Y(n62) );
  INVX0_HVT U28 ( .A(n66), .Y(n68) );
  INVX0_HVT U29 ( .A(n58), .Y(n59) );
  INVX0_LVT U30 ( .A(n8), .Y(n10) );
  INVX0_LVT U31 ( .A(n40), .Y(n41) );
  INVX0_LVT U32 ( .A(n20), .Y(n22) );
  INVX0_LVT U33 ( .A(n32), .Y(n34) );
  INVX0_LVT U34 ( .A(n28), .Y(n30) );
  INVX0_LVT U35 ( .A(n24), .Y(n26) );
  INVX0_LVT U36 ( .A(n58), .Y(n60) );
  INVX0_LVT U37 ( .A(n36), .Y(n38) );
  INVX0_HVT U38 ( .A(n20), .Y(n23) );
  IBUFFX2_HVT U39 ( .A(n32), .Y(n33) );
  IBUFFX2_HVT U40 ( .A(n40), .Y(n42) );
  INVX0_HVT U41 ( .A(n28), .Y(n31) );
  INVX0_HVT U42 ( .A(n58), .Y(n61) );
  INVX0_LVT U43 ( .A(n20), .Y(n21) );
  INVX0_HVT U44 ( .A(n24), .Y(n27) );
  INVX0_HVT U45 ( .A(n28), .Y(n29) );
  INVX0_LVT U46 ( .A(n32), .Y(n35) );
  INVX0_LVT U47 ( .A(n66), .Y(n67) );
  INVX0_HVT U48 ( .A(n66), .Y(n69) );
  INVX1_LVT U49 ( .A(S1[3]), .Y(n50) );
  INVX1_LVT U50 ( .A(S2[2]), .Y(n16) );
  INVX1_LVT U51 ( .A(S1[4]), .Y(n54) );
  INVX1_LVT U52 ( .A(n50), .Y(n51) );
  INVX1_LVT U53 ( .A(n50), .Y(n52) );
  INVX1_LVT U54 ( .A(n16), .Y(n18) );
  INVX1_LVT U55 ( .A(n62), .Y(n65) );
  INVX1_LVT U56 ( .A(n54), .Y(n57) );
  INVX1_LVT U57 ( .A(n16), .Y(n19) );
  INVX1_LVT U58 ( .A(n50), .Y(n53) );
  INVX1_LVT U59 ( .A(n62), .Y(n63) );
  INVX1_LVT U60 ( .A(n62), .Y(n64) );
  INVX1_LVT U61 ( .A(n54), .Y(n56) );
  INVX1_LVT U62 ( .A(S2[0]), .Y(n8) );
  INVX1_LVT U63 ( .A(S2[3]), .Y(n20) );
  INVX1_LVT U64 ( .A(S2[6]), .Y(n32) );
  INVX1_LVT U65 ( .A(S1[7]), .Y(n66) );
  INVX1_LVT U66 ( .A(S2[7]), .Y(n36) );
  INVX1_LVT U67 ( .A(S1[5]), .Y(n58) );
  INVX1_LVT U68 ( .A(S2[5]), .Y(n28) );
  INVX1_LVT U69 ( .A(S2[4]), .Y(n24) );
endmodule


module Comparator ( clock, CompStart, PEout, PEready, vectorX, vectorY, 
        BestDist, motionX, motionY );
  input [127:0] PEout;
  input [15:0] PEready;
  input [3:0] vectorX;
  input [3:0] vectorY;
  output [7:0] BestDist;
  output [3:0] motionX;
  output [3:0] motionY;
  input clock, CompStart;
  wire   n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264;

  DFFX1_LVT \BestDist_reg[7]  ( .D(n137), .CLK(clock), .Q(BestDist[7]), .QN(
        n10) );
  DFFX1_LVT \motionY_reg[0]  ( .D(n127), .CLK(clock), .Q(motionY[0]) );
  DFFX1_LVT \motionX_reg[3]  ( .D(n126), .CLK(clock), .Q(motionX[3]) );
  DFFX1_LVT \motionX_reg[2]  ( .D(n125), .CLK(clock), .Q(motionX[2]) );
  DFFX1_LVT \motionX_reg[1]  ( .D(n124), .CLK(clock), .Q(motionX[1]) );
  DFFX1_LVT \motionX_reg[0]  ( .D(n123), .CLK(clock), .Q(motionX[0]) );
  DFFX1_LVT \motionY_reg[1]  ( .D(n128), .CLK(clock), .Q(motionY[1]) );
  DFFX1_LVT \motionY_reg[2]  ( .D(n129), .CLK(clock), .Q(motionY[2]) );
  DFFX1_LVT \motionY_reg[3]  ( .D(n130), .CLK(clock), .Q(motionY[3]) );
  DFFX1_LVT \BestDist_reg[0]  ( .D(n138), .CLK(clock), .Q(BestDist[0]), .QN(
        n243) );
  DFFX1_LVT \BestDist_reg[6]  ( .D(n136), .CLK(clock), .Q(BestDist[6]), .QN(
        n263) );
  DFFX1_LVT \BestDist_reg[3]  ( .D(n133), .CLK(clock), .Q(BestDist[3]), .QN(
        n252) );
  DFFX1_LVT \BestDist_reg[2]  ( .D(n132), .CLK(clock), .Q(BestDist[2]), .QN(
        n248) );
  DFFX1_LVT \BestDist_reg[5]  ( .D(n135), .CLK(clock), .Q(BestDist[5]), .QN(
        n260) );
  DFFX1_LVT \BestDist_reg[1]  ( .D(n131), .CLK(clock), .Q(BestDist[1]), .QN(
        n245) );
  DFFX1_LVT \BestDist_reg[4]  ( .D(n134), .CLK(clock), .Q(BestDist[4]), .QN(
        n256) );
  OR2X2_LVT U3 ( .A1(n42), .A2(n236), .Y(n239) );
  NOR3X0_LVT U4 ( .A1(n149), .A2(n49), .A3(n29), .Y(n73) );
  INVX1_LVT U5 ( .A(PEready[4]), .Y(n149) );
  DELLN1X2_HVT U6 ( .A(n11), .Y(n1) );
  NOR2X0_LVT U7 ( .A1(n68), .A2(n158), .Y(n26) );
  DELLN3X2_LVT U8 ( .A(n112), .Y(n2) );
  NAND3X0_LVT U9 ( .A1(n19), .A2(n20), .A3(n21), .Y(n3) );
  INVX0_HVT U10 ( .A(n58), .Y(n121) );
  INVX0_LVT U11 ( .A(n121), .Y(n122) );
  DELLN1X2_LVT U12 ( .A(PEready[13]), .Y(n58) );
  AND2X1_HVT U13 ( .A1(PEready[9]), .A2(n72), .Y(n76) );
  AND3X2_HVT U14 ( .A1(n157), .A2(PEready[10]), .A3(n77), .Y(n74) );
  NAND2X0_LVT U15 ( .A1(PEout[48]), .A2(n120), .Y(n14) );
  NAND2X0_LVT U16 ( .A1(PEready[3]), .A2(n31), .Y(n4) );
  AND2X1_HVT U17 ( .A1(n29), .A2(n118), .Y(n80) );
  INVX0_HVT U18 ( .A(n7), .Y(n56) );
  NAND3X0_LVT U19 ( .A1(PEready[7]), .A2(n147), .A3(n75), .Y(n67) );
  NAND2X0_LVT U20 ( .A1(PEready[8]), .A2(n75), .Y(n7) );
  NBUFFX2_LVT U21 ( .A(n78), .Y(n86) );
  INVX1_LVT U22 ( .A(n142), .Y(n141) );
  INVX0_LVT U23 ( .A(PEready[7]), .Y(n148) );
  AND2X1_LVT U24 ( .A1(n69), .A2(n207), .Y(n17) );
  NAND2X0_HVT U25 ( .A1(PEout[96]), .A2(n86), .Y(n62) );
  NAND2X0_HVT U26 ( .A1(PEout[112]), .A2(n81), .Y(n53) );
  INVX0_HVT U27 ( .A(n15), .Y(n27) );
  AND2X1_LVT U28 ( .A1(n148), .A2(n147), .Y(n5) );
  NAND2X0_HVT U29 ( .A1(PEready[11]), .A2(n77), .Y(n6) );
  INVX0_LVT U30 ( .A(n65), .Y(n49) );
  AND2X1_LVT U31 ( .A1(n62), .A2(n60), .Y(n8) );
  AND2X1_LVT U32 ( .A1(n174), .A2(n173), .Y(n9) );
  AOI21X1_LVT U33 ( .A1(n242), .A2(n32), .A3(n142), .Y(n33) );
  AO221X1_LVT U34 ( .A1(PEout[69]), .A2(n106), .A3(PEout[93]), .A4(n91), .A5(
        n190), .Y(n191) );
  AND2X1_HVT U35 ( .A1(PEready[12]), .A2(n146), .Y(n78) );
  AOI222X1_LVT U36 ( .A1(PEout[113]), .A2(n84), .A3(n229), .A4(n79), .A5(
        PEout[121]), .A6(n139), .Y(n11) );
  AO221X1_LVT U37 ( .A1(PEout[71]), .A2(n56), .A3(PEout[95]), .A4(n91), .A5(
        n161), .Y(n162) );
  AO221X1_LVT U38 ( .A1(PEout[70]), .A2(n56), .A3(PEout[94]), .A4(n91), .A5(
        n181), .Y(n182) );
  AOI22X1_LVT U39 ( .A1(PEout[57]), .A2(n107), .A3(PEout[97]), .A4(n86), .Y(
        n19) );
  NAND2X0_LVT U40 ( .A1(PEout[0]), .A2(n110), .Y(n12) );
  NAND2X0_LVT U41 ( .A1(PEout[8]), .A2(n104), .Y(n13) );
  NAND3X0_LVT U42 ( .A1(n12), .A2(n13), .A3(n14), .Y(n167) );
  INVX0_LVT U43 ( .A(n118), .Y(n120) );
  AO222X1_LVT U44 ( .A1(PEout[114]), .A2(n84), .A3(n221), .A4(n79), .A5(
        PEout[122]), .A6(n140), .Y(n15) );
  INVX0_HVT U45 ( .A(n150), .Y(n29) );
  NBUFFX2_LVT U46 ( .A(n74), .Y(n95) );
  OR2X1_LVT U47 ( .A1(n209), .A2(n211), .Y(n16) );
  OR2X1_LVT U48 ( .A1(n16), .A2(n210), .Y(n212) );
  AO222X1_LVT U49 ( .A1(PEout[115]), .A2(n85), .A3(n212), .A4(n63), .A5(
        PEout[123]), .A6(n139), .Y(n36) );
  INVX0_LVT U50 ( .A(PEready[11]), .Y(n157) );
  AND2X1_HVT U51 ( .A1(PEout[83]), .A2(n95), .Y(n18) );
  OR3X1_LVT U52 ( .A1(n17), .A2(n18), .A3(n97), .Y(n210) );
  NAND3X0_LVT U53 ( .A1(n19), .A2(n20), .A3(n21), .Y(n229) );
  AOI221X1_LVT U54 ( .A1(PEout[65]), .A2(n106), .A3(PEout[89]), .A4(n90), .A5(
        n228), .Y(n20) );
  AOI221X1_LVT U55 ( .A1(n226), .A2(n108), .A3(PEout[81]), .A4(n94), .A5(n96), 
        .Y(n21) );
  AO222X1_LVT U56 ( .A1(PEout[113]), .A2(n84), .A3(n3), .A4(n79), .A5(
        PEout[121]), .A6(n139), .Y(n22) );
  AND2X1_LVT U57 ( .A1(PEready[14]), .A2(n165), .Y(n81) );
  AO22X1_LVT U58 ( .A1(PEout[20]), .A2(n28), .A3(PEout[28]), .A4(n50), .Y(n197) );
  IBUFFX2_HVT U59 ( .A(n4), .Y(n50) );
  IBUFFX2_HVT U60 ( .A(CompStart), .Y(n142) );
  NAND2X0_LVT U61 ( .A1(PEout[120]), .A2(n139), .Y(n55) );
  NAND3X2_LVT U62 ( .A1(PEready[2]), .A2(n31), .A3(n35), .Y(n51) );
  MUX21X1_LVT U63 ( .A1(n245), .A2(n1), .S0(n115), .Y(n246) );
  MUX21X2_LVT U64 ( .A1(n252), .A2(n251), .S0(n44), .Y(n253) );
  NBUFFX2_LVT U65 ( .A(n34), .Y(n44) );
  AOI21X1_LVT U66 ( .A1(n32), .A2(n242), .A3(n142), .Y(n34) );
  AND2X1_LVT U67 ( .A1(n152), .A2(n153), .Y(n23) );
  AND2X1_LVT U68 ( .A1(n65), .A2(n150), .Y(n24) );
  AND2X1_LVT U69 ( .A1(n24), .A2(n149), .Y(n71) );
  NAND2X0_LVT U70 ( .A1(n8), .A2(n61), .Y(n171) );
  NAND2X0_LVT U71 ( .A1(PEout[80]), .A2(n94), .Y(n60) );
  NBUFFX2_LVT U72 ( .A(n82), .Y(n25) );
  NBUFFX2_HVT U73 ( .A(n227), .Y(n69) );
  INVX0_LVT U74 ( .A(n51), .Y(n28) );
  INVX0_LVT U75 ( .A(n64), .Y(n104) );
  NBUFFX2_LVT U76 ( .A(n71), .Y(n30) );
  NBUFFX2_LVT U77 ( .A(n71), .Y(n31) );
  AO22X1_LVT U78 ( .A1(n239), .A2(n240), .A3(n238), .A4(n10), .Y(n32) );
  NBUFFX2_LVT U79 ( .A(n153), .Y(n35) );
  INVX0_LVT U80 ( .A(n237), .Y(n262) );
  AND2X1_LVT U81 ( .A1(n237), .A2(n263), .Y(n45) );
  INVX0_LVT U82 ( .A(n83), .Y(n85) );
  INVX0_LVT U83 ( .A(n7), .Y(n106) );
  INVX0_LVT U84 ( .A(n255), .Y(n37) );
  INVX0_HVT U85 ( .A(n254), .Y(n255) );
  AO221X1_LVT U86 ( .A1(n109), .A2(n189), .A3(PEout[85]), .A4(n94), .A5(n96), 
        .Y(n192) );
  INVX0_LVT U87 ( .A(n64), .Y(n38) );
  INVX0_LVT U88 ( .A(n64), .Y(n105) );
  NAND2X0_LVT U89 ( .A1(n110), .A2(PEout[1]), .Y(n39) );
  NAND2X0_LVT U90 ( .A1(PEout[9]), .A2(n104), .Y(n40) );
  NAND2X0_HVT U91 ( .A1(PEout[49]), .A2(n119), .Y(n41) );
  NAND3X0_LVT U92 ( .A1(n39), .A2(n40), .A3(n41), .Y(n223) );
  INVX0_LVT U93 ( .A(n118), .Y(n119) );
  OR2X1_LVT U94 ( .A1(n46), .A2(n45), .Y(n42) );
  INVX0_LVT U95 ( .A(PEready[12]), .Y(n143) );
  NBUFFX2_LVT U96 ( .A(n108), .Y(n109) );
  NBUFFX2_HVT U97 ( .A(n73), .Y(n89) );
  NAND2X0_LVT U98 ( .A1(n22), .A2(n245), .Y(n230) );
  NAND3X0_LVT U99 ( .A1(n23), .A2(n151), .A3(n30), .Y(n159) );
  INVX0_LVT U100 ( .A(PEready[3]), .Y(n153) );
  INVX0_LVT U101 ( .A(PEready[2]), .Y(n152) );
  INVX0_HVT U102 ( .A(PEready[1]), .Y(n151) );
  AO221X1_LVT U103 ( .A1(n109), .A2(n160), .A3(PEout[87]), .A4(n95), .A5(n66), 
        .Y(n163) );
  AO222X1_LVT U104 ( .A1(PEout[7]), .A2(n70), .A3(PEout[15]), .A4(n105), .A5(
        PEout[55]), .A6(n120), .Y(n154) );
  NBUFFX2_LVT U105 ( .A(n33), .Y(n43) );
  NAND3X0_LVT U106 ( .A1(n172), .A2(n57), .A3(n9), .Y(n175) );
  NAND2X0_HVT U107 ( .A1(PEout[104]), .A2(n122), .Y(n174) );
  AND2X1_LVT U108 ( .A1(n258), .A2(n260), .Y(n46) );
  NBUFFX2_LVT U109 ( .A(n34), .Y(n47) );
  NBUFFX2_LVT U110 ( .A(n34), .Y(n48) );
  AO222X1_LVT U111 ( .A1(PEout[118]), .A2(n85), .A3(n63), .A4(n185), .A5(
        PEout[126]), .A6(n140), .Y(n237) );
  INVX0_LVT U112 ( .A(PEready[10]), .Y(n144) );
  INVX0_LVT U113 ( .A(n67), .Y(n52) );
  NAND2X0_LVT U114 ( .A1(n175), .A2(n79), .Y(n54) );
  AND3X1_LVT U115 ( .A1(n54), .A2(n53), .A3(n55), .Y(n112) );
  NOR2X0_LVT U116 ( .A1(PEready[15]), .A2(PEready[14]), .Y(n79) );
  INVX0_LVT U117 ( .A(n165), .Y(n139) );
  OR3X1_LVT U118 ( .A1(n197), .A2(n196), .A3(n195), .Y(n198) );
  AO22X1_LVT U119 ( .A1(PEout[19]), .A2(n28), .A3(PEout[27]), .A4(n50), .Y(
        n206) );
  INVX0_LVT U120 ( .A(n4), .Y(n101) );
  INVX0_HVT U121 ( .A(n97), .Y(n57) );
  NBUFFX2_LVT U122 ( .A(n26), .Y(n97) );
  NAND4X0_LVT U123 ( .A1(PEready[1]), .A2(n35), .A3(n30), .A4(n152), .Y(n64)
         );
  OR2X1_LVT U124 ( .A1(n114), .A2(n113), .Y(n59) );
  OR2X1_LVT U125 ( .A1(n59), .A2(n234), .Y(n235) );
  AND2X1_LVT U126 ( .A1(n254), .A2(n256), .Y(n113) );
  NBUFFX2_LVT U127 ( .A(n222), .Y(n111) );
  NAND2X0_LVT U128 ( .A1(n170), .A2(n108), .Y(n61) );
  INVX0_LVT U129 ( .A(PEready[5]), .Y(n150) );
  AO22X1_LVT U130 ( .A1(PEout[18]), .A2(n102), .A3(PEout[26]), .A4(n100), .Y(
        n215) );
  NOR2X4_HVT U131 ( .A1(PEready[15]), .A2(PEready[14]), .Y(n63) );
  NBUFFX2_LVT U132 ( .A(n80), .Y(n93) );
  AO221X1_LVT U133 ( .A1(n69), .A2(n180), .A3(PEout[86]), .A4(n95), .A5(n66), 
        .Y(n183) );
  NAND2X0_LVT U134 ( .A1(n5), .A2(n75), .Y(n158) );
  INVX0_LVT U135 ( .A(PEready[8]), .Y(n147) );
  INVX0_LVT U136 ( .A(PEready[6]), .Y(n65) );
  INVX0_LVT U137 ( .A(n49), .Y(n118) );
  NBUFFX2_LVT U138 ( .A(n97), .Y(n66) );
  INVX0_LVT U139 ( .A(PEready[9]), .Y(n145) );
  INVX0_LVT U140 ( .A(n158), .Y(n227) );
  OR2X1_HVT U141 ( .A1(n159), .A2(PEready[0]), .Y(n68) );
  IBUFFX2_HVT U142 ( .A(n165), .Y(n140) );
  AND2X1_LVT U143 ( .A1(n250), .A2(n252), .Y(n114) );
  INVX0_LVT U144 ( .A(n36), .Y(n251) );
  INVX0_LVT U145 ( .A(PEready[15]), .Y(n165) );
  NBUFFX2_LVT U146 ( .A(n222), .Y(n70) );
  AND3X1_LVT U147 ( .A1(n77), .A2(n144), .A3(n157), .Y(n72) );
  AND2X1_LVT U148 ( .A1(n72), .A2(n145), .Y(n75) );
  AND2X1_LVT U149 ( .A1(n143), .A2(n146), .Y(n77) );
  AOI21X1_LVT U150 ( .A1(n241), .A2(n242), .A3(n142), .Y(n82) );
  AO22X1_LVT U151 ( .A1(PEout[21]), .A2(n102), .A3(PEout[29]), .A4(n101), .Y(
        n188) );
  AO22X1_LVT U152 ( .A1(PEout[23]), .A2(n28), .A3(PEout[31]), .A4(n101), .Y(
        n156) );
  AO22X1_LVT U153 ( .A1(PEout[22]), .A2(n102), .A3(PEout[30]), .A4(n100), .Y(
        n179) );
  INVX0_LVT U154 ( .A(n51), .Y(n103) );
  INVX1_LVT U155 ( .A(n81), .Y(n83) );
  INVX0_LVT U156 ( .A(n83), .Y(n84) );
  INVX0_LVT U157 ( .A(n238), .Y(n176) );
  AO222X1_LVT U158 ( .A1(n63), .A2(n166), .A3(PEout[119]), .A4(n85), .A5(
        PEout[127]), .A6(n139), .Y(n238) );
  NBUFFX2_HVT U159 ( .A(n78), .Y(n87) );
  NBUFFX2_LVT U160 ( .A(n73), .Y(n88) );
  INVX0_LVT U161 ( .A(n6), .Y(n90) );
  INVX0_HVT U162 ( .A(n6), .Y(n91) );
  INVX0_LVT U163 ( .A(n159), .Y(n222) );
  NBUFFX2_LVT U164 ( .A(n80), .Y(n92) );
  NBUFFX2_LVT U165 ( .A(n74), .Y(n94) );
  NBUFFX2_LVT U166 ( .A(n26), .Y(n96) );
  NBUFFX2_LVT U167 ( .A(n76), .Y(n98) );
  NBUFFX2_LVT U168 ( .A(n76), .Y(n99) );
  INVX0_LVT U169 ( .A(n4), .Y(n100) );
  INVX0_LVT U170 ( .A(n51), .Y(n102) );
  INVX0_LVT U171 ( .A(n67), .Y(n107) );
  NBUFFX2_LVT U172 ( .A(n227), .Y(n108) );
  NBUFFX2_LVT U173 ( .A(n222), .Y(n110) );
  MUX21X1_LVT U174 ( .A1(motionX[3]), .A2(vectorX[3]), .S0(n116), .Y(n126) );
  INVX0_LVT U175 ( .A(PEready[13]), .Y(n146) );
  MUX21X1_LVT U176 ( .A1(n256), .A2(n255), .S0(n43), .Y(n257) );
  NBUFFX2_LVT U177 ( .A(n33), .Y(n115) );
  NBUFFX2_LVT U178 ( .A(n82), .Y(n117) );
  NBUFFX2_LVT U179 ( .A(n82), .Y(n116) );
  AO22X1_LVT U180 ( .A1(PEout[63]), .A2(n52), .A3(PEout[103]), .A4(n87), .Y(
        n164) );
  AO22X1_LVT U181 ( .A1(PEout[39]), .A2(n89), .A3(PEout[47]), .A4(n93), .Y(
        n155) );
  OR3X1_LVT U182 ( .A1(n156), .A2(n155), .A3(n154), .Y(n160) );
  AO22X1_LVT U183 ( .A1(PEout[111]), .A2(n122), .A3(PEout[79]), .A4(n98), .Y(
        n161) );
  OR3X1_LVT U184 ( .A1(n164), .A2(n163), .A3(n162), .Y(n166) );
  AO21X1_LVT U185 ( .A1(BestDist[7]), .A2(n238), .A3(n142), .Y(n137) );
  AOI22X1_LVT U186 ( .A1(PEout[88]), .A2(n90), .A3(PEout[72]), .A4(n99), .Y(
        n173) );
  AO22X1_LVT U187 ( .A1(PEout[16]), .A2(n103), .A3(PEout[24]), .A4(n101), .Y(
        n169) );
  AO22X1_LVT U188 ( .A1(PEout[32]), .A2(n88), .A3(PEout[40]), .A4(n92), .Y(
        n168) );
  OR3X1_LVT U189 ( .A1(n169), .A2(n168), .A3(n167), .Y(n170) );
  AOI221X1_LVT U190 ( .A1(PEout[56]), .A2(n107), .A3(PEout[64]), .A4(n106), 
        .A5(n171), .Y(n172) );
  NAND2X0_LVT U191 ( .A1(BestDist[7]), .A2(n176), .Y(n242) );
  AO22X1_LVT U192 ( .A1(PEout[62]), .A2(n107), .A3(PEout[102]), .A4(n87), .Y(
        n184) );
  AO22X1_LVT U193 ( .A1(PEout[38]), .A2(n89), .A3(PEout[46]), .A4(n93), .Y(
        n178) );
  AO222X1_LVT U194 ( .A1(PEout[6]), .A2(n70), .A3(PEout[14]), .A4(n38), .A5(
        PEout[54]), .A6(n120), .Y(n177) );
  OR3X1_LVT U195 ( .A1(n179), .A2(n178), .A3(n177), .Y(n180) );
  AO22X1_LVT U196 ( .A1(PEout[110]), .A2(n58), .A3(PEout[78]), .A4(n99), .Y(
        n181) );
  OR3X1_LVT U197 ( .A1(n184), .A2(n183), .A3(n182), .Y(n185) );
  NAND2X0_LVT U198 ( .A1(BestDist[6]), .A2(n262), .Y(n240) );
  AO22X1_LVT U199 ( .A1(PEout[61]), .A2(n52), .A3(PEout[101]), .A4(n87), .Y(
        n193) );
  AO22X1_LVT U200 ( .A1(PEout[37]), .A2(n89), .A3(PEout[45]), .A4(n93), .Y(
        n187) );
  AO222X1_LVT U201 ( .A1(PEout[5]), .A2(n111), .A3(PEout[13]), .A4(n38), .A5(
        PEout[53]), .A6(n119), .Y(n186) );
  OR3X1_LVT U202 ( .A1(n188), .A2(n187), .A3(n186), .Y(n189) );
  AO22X1_LVT U203 ( .A1(PEout[109]), .A2(n58), .A3(PEout[77]), .A4(n98), .Y(
        n190) );
  OR3X1_LVT U204 ( .A1(n193), .A2(n192), .A3(n191), .Y(n194) );
  AO222X1_LVT U205 ( .A1(PEout[117]), .A2(n85), .A3(n63), .A4(n194), .A5(
        PEout[125]), .A6(n140), .Y(n258) );
  AO22X1_LVT U206 ( .A1(PEout[60]), .A2(n52), .A3(PEout[100]), .A4(n86), .Y(
        n202) );
  AO22X1_LVT U207 ( .A1(PEout[36]), .A2(n88), .A3(PEout[44]), .A4(n92), .Y(
        n196) );
  AO222X1_LVT U208 ( .A1(PEout[4]), .A2(n111), .A3(PEout[12]), .A4(n105), .A5(
        PEout[52]), .A6(n120), .Y(n195) );
  AO221X1_LVT U209 ( .A1(n109), .A2(n198), .A3(PEout[84]), .A4(n95), .A5(n97), 
        .Y(n201) );
  AO22X1_LVT U210 ( .A1(PEout[108]), .A2(n58), .A3(PEout[76]), .A4(n99), .Y(
        n199) );
  AO221X1_LVT U211 ( .A1(PEout[68]), .A2(n56), .A3(PEout[92]), .A4(n90), .A5(
        n199), .Y(n200) );
  OR3X1_LVT U212 ( .A1(n202), .A2(n200), .A3(n201), .Y(n203) );
  AO222X1_LVT U213 ( .A1(PEout[116]), .A2(n84), .A3(n203), .A4(n79), .A5(
        PEout[124]), .A6(n140), .Y(n254) );
  AO22X1_LVT U214 ( .A1(PEout[59]), .A2(n52), .A3(PEout[99]), .A4(n87), .Y(
        n211) );
  AO22X1_LVT U215 ( .A1(PEout[35]), .A2(n89), .A3(PEout[43]), .A4(n93), .Y(
        n205) );
  AO222X1_LVT U216 ( .A1(PEout[3]), .A2(n70), .A3(PEout[11]), .A4(n38), .A5(
        PEout[51]), .A6(n119), .Y(n204) );
  OR3X1_LVT U217 ( .A1(n206), .A2(n205), .A3(n204), .Y(n207) );
  AO22X1_LVT U218 ( .A1(PEout[107]), .A2(n122), .A3(PEout[75]), .A4(n98), .Y(
        n208) );
  AO221X1_LVT U219 ( .A1(PEout[67]), .A2(n56), .A3(PEout[91]), .A4(n91), .A5(
        n208), .Y(n209) );
  AO222X1_LVT U220 ( .A1(PEout[115]), .A2(n85), .A3(n63), .A4(n212), .A5(
        PEout[123]), .A6(n139), .Y(n250) );
  AO22X1_LVT U221 ( .A1(PEout[58]), .A2(n107), .A3(PEout[98]), .A4(n86), .Y(
        n220) );
  AO22X1_LVT U222 ( .A1(PEout[34]), .A2(n88), .A3(PEout[42]), .A4(n92), .Y(
        n214) );
  AO222X1_LVT U223 ( .A1(PEout[2]), .A2(n111), .A3(PEout[10]), .A4(n105), .A5(
        PEout[50]), .A6(n120), .Y(n213) );
  OR3X1_LVT U224 ( .A1(n215), .A2(n214), .A3(n213), .Y(n216) );
  AO221X1_LVT U225 ( .A1(n216), .A2(n69), .A3(PEout[82]), .A4(n94), .A5(n96), 
        .Y(n219) );
  AO22X1_LVT U226 ( .A1(PEout[106]), .A2(n122), .A3(PEout[74]), .A4(n99), .Y(
        n217) );
  AO221X1_LVT U227 ( .A1(PEout[66]), .A2(n106), .A3(PEout[90]), .A4(n90), .A5(
        n217), .Y(n218) );
  OR3X1_LVT U228 ( .A1(n220), .A2(n219), .A3(n218), .Y(n221) );
  AO222X1_LVT U229 ( .A1(PEout[114]), .A2(n84), .A3(n221), .A4(n79), .A5(
        PEout[122]), .A6(n140), .Y(n247) );
  AO22X1_LVT U230 ( .A1(PEout[17]), .A2(n103), .A3(PEout[25]), .A4(n100), .Y(
        n225) );
  AO22X1_LVT U231 ( .A1(PEout[33]), .A2(n88), .A3(PEout[41]), .A4(n92), .Y(
        n224) );
  OR3X1_LVT U232 ( .A1(n225), .A2(n224), .A3(n223), .Y(n226) );
  AO22X1_LVT U233 ( .A1(PEout[105]), .A2(n58), .A3(PEout[73]), .A4(n76), .Y(
        n228) );
  NAND2X0_LVT U234 ( .A1(n11), .A2(BestDist[1]), .Y(n232) );
  NAND3X0_LVT U235 ( .A1(n112), .A2(n230), .A3(BestDist[0]), .Y(n231) );
  AO22X1_LVT U236 ( .A1(n247), .A2(n248), .A3(n231), .A4(n232), .Y(n233) );
  OA221X1_LVT U237 ( .A1(n252), .A2(n36), .A3(n15), .A4(n248), .A5(n233), .Y(
        n234) );
  OA221X1_LVT U238 ( .A1(n258), .A2(n260), .A3(n37), .A4(n256), .A5(n235), .Y(
        n236) );
  AO22X1_LVT U239 ( .A1(n239), .A2(n240), .A3(n238), .A4(n10), .Y(n241) );
  MUX21X1_LVT U240 ( .A1(n243), .A2(n2), .S0(n43), .Y(n244) );
  NAND2X0_LVT U241 ( .A1(n141), .A2(n244), .Y(n138) );
  NAND2X0_LVT U242 ( .A1(n141), .A2(n246), .Y(n131) );
  MUX21X1_LVT U243 ( .A1(n248), .A2(n27), .S0(n115), .Y(n249) );
  NAND2X0_LVT U244 ( .A1(n141), .A2(n249), .Y(n132) );
  NAND2X0_LVT U245 ( .A1(n141), .A2(n253), .Y(n133) );
  NAND2X0_LVT U246 ( .A1(n141), .A2(n257), .Y(n134) );
  INVX1_LVT U247 ( .A(n258), .Y(n259) );
  MUX21X1_LVT U248 ( .A1(n260), .A2(n259), .S0(n117), .Y(n261) );
  NAND2X0_LVT U249 ( .A1(n141), .A2(n261), .Y(n135) );
  MUX21X1_LVT U250 ( .A1(n263), .A2(n262), .S0(n116), .Y(n264) );
  NAND2X0_LVT U251 ( .A1(n141), .A2(n264), .Y(n136) );
  MUX21X1_LVT U252 ( .A1(motionY[0]), .A2(vectorY[0]), .S0(n117), .Y(n127) );
  MUX21X1_LVT U253 ( .A1(motionY[1]), .A2(vectorY[1]), .S0(n48), .Y(n128) );
  MUX21X1_LVT U254 ( .A1(motionY[2]), .A2(vectorY[2]), .S0(n25), .Y(n129) );
  MUX21X1_LVT U255 ( .A1(motionY[3]), .A2(vectorY[3]), .S0(n47), .Y(n130) );
  MUX21X1_LVT U256 ( .A1(motionX[0]), .A2(vectorX[0]), .S0(n48), .Y(n123) );
  MUX21X1_LVT U257 ( .A1(motionX[1]), .A2(vectorX[1]), .S0(n25), .Y(n124) );
  MUX21X1_LVT U258 ( .A1(motionX[2]), .A2(vectorX[2]), .S0(n47), .Y(n125) );
endmodule


module MotionEstimator ( clock, start, R, S1, S2, BestDist, motionX, motionY, 
        AddressR, AddressS1, AddressS2 );
  input [7:0] R;
  input [7:0] S1;
  input [7:0] S2;
  output [7:0] BestDist;
  output [3:0] motionX;
  output [3:0] motionY;
  output [7:0] AddressR;
  output [9:0] AddressS1;
  output [9:0] AddressS2;
  input clock, start;
  wire   CompStart;
  wire   [15:0] S1S2mux;
  wire   [15:0] newDist;
  wire   [15:0] PEready;
  wire   [3:0] VectorX;
  wire   [3:0] VectorY;
  wire   [127:0] Accumulate;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2;
  assign AddressS1[4] = 1'b0;
  assign AddressS2[4] = 1'b1;

  control ctl_u ( .clock(clock), .start(start), .S1S2mux({S1S2mux[15:1], 
        SYNOPSYS_UNCONNECTED__0}), .newDist(newDist), .CompStart(CompStart), 
        .PEready(PEready), .VectorX(VectorX), .VectorY(VectorY), .AddressR(
        AddressR), .AddressS1({AddressS1[9:5], SYNOPSYS_UNCONNECTED__1, 
        AddressS1[3:0]}), .AddressS2({AddressS2[9:5], SYNOPSYS_UNCONNECTED__2, 
        AddressS2[3:0]}) );
  PEtotal pe_u ( .clock(clock), .R(R), .S1(S1), .S2(S2), .S1S2mux({
        S1S2mux[15:1], 1'b1}), .newDist(newDist), .Accumulate(Accumulate) );
  Comparator comp_u ( .clock(clock), .CompStart(CompStart), .PEout(Accumulate), 
        .PEready(PEready), .vectorX(VectorX), .vectorY(VectorY), .BestDist(
        BestDist), .motionX(motionX), .motionY(motionY) );
endmodule

