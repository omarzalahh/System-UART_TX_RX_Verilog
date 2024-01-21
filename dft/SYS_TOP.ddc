/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Oct 14 14:51:30 2022
/////////////////////////////////////////////////////////////


module mux2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  CLKMX2X4M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module mux2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module DATA_SYNC_test_0 ( dest_clk, dest_rst, unsync_bus, bus_enable, sync_bus, 
        enable_pulse_d, test_si, test_so, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input dest_clk, dest_rst, bus_enable, test_si, test_se;
  output enable_pulse_d, test_so;
  wire   sync_flop, meta_flop, enable_flop, n1, n4, n6, n8, n10, n12, n14, n16,
         n18, n23;
  assign test_so = sync_flop;

  SDFFRQX2M enable_flop_reg ( .D(sync_flop), .SI(test_si), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(enable_flop) );
  SDFFRQX2M \sync_bus_reg[7]  ( .D(n18), .SI(sync_bus[6]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[6]  ( .D(n16), .SI(sync_bus[5]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[6]) );
  SDFFRQX2M \sync_bus_reg[4]  ( .D(n12), .SI(sync_bus[3]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[4]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(n14), .SI(sync_bus[4]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n10), .SI(sync_bus[2]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(n8), .SI(sync_bus[1]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[2]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n4), .SI(meta_flop), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[0]) );
  SDFFRQX2M enable_pulse_d_reg ( .D(n23), .SI(enable_flop), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(enable_pulse_d) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(n6), .SI(sync_bus[0]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[1]) );
  SDFFRQX2M meta_flop_reg ( .D(bus_enable), .SI(enable_pulse_d), .SE(test_se), 
        .CK(dest_clk), .RN(dest_rst), .Q(meta_flop) );
  SDFFRQX1M sync_flop_reg ( .D(meta_flop), .SI(sync_bus[7]), .SE(test_se), 
        .CK(dest_clk), .RN(dest_rst), .Q(sync_flop) );
  INVX2M U4 ( .A(n1), .Y(n23) );
  NAND2BX2M U5 ( .AN(enable_flop), .B(sync_flop), .Y(n1) );
  AO22X1M U6 ( .A0(unsync_bus[0]), .A1(n23), .B0(sync_bus[0]), .B1(n1), .Y(n4)
         );
  AO22X1M U7 ( .A0(unsync_bus[1]), .A1(n23), .B0(sync_bus[1]), .B1(n1), .Y(n6)
         );
  AO22X1M U8 ( .A0(unsync_bus[2]), .A1(n23), .B0(sync_bus[2]), .B1(n1), .Y(n8)
         );
  AO22X1M U9 ( .A0(unsync_bus[3]), .A1(n23), .B0(sync_bus[3]), .B1(n1), .Y(n10) );
  AO22X1M U10 ( .A0(unsync_bus[4]), .A1(n23), .B0(sync_bus[4]), .B1(n1), .Y(
        n12) );
  AO22X1M U11 ( .A0(unsync_bus[5]), .A1(n23), .B0(sync_bus[5]), .B1(n1), .Y(
        n14) );
  AO22X1M U12 ( .A0(unsync_bus[6]), .A1(n23), .B0(sync_bus[6]), .B1(n1), .Y(
        n16) );
  AO22X1M U25 ( .A0(unsync_bus[7]), .A1(n23), .B0(sync_bus[7]), .B1(n1), .Y(
        n18) );
endmodule


module DATA_SYNC_test_1 ( dest_clk, dest_rst, unsync_bus, bus_enable, sync_bus, 
        enable_pulse_d, test_si, test_so, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input dest_clk, dest_rst, bus_enable, test_si, test_se;
  output enable_pulse_d, test_so;
  wire   sync_flop, meta_flop, enable_flop, n23, n27, n29, n31, n33, n35, n37,
         n39, n41, n44;
  assign test_so = sync_flop;

  SDFFRQX2M \sync_bus_reg[7]  ( .D(n27), .SI(sync_bus[6]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[6]  ( .D(n29), .SI(sync_bus[5]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[6]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(n31), .SI(sync_bus[4]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[4]  ( .D(n33), .SI(sync_bus[3]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[4]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(n35), .SI(sync_bus[2]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(n37), .SI(sync_bus[1]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[2]) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(n39), .SI(sync_bus[0]), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[1]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(n41), .SI(meta_flop), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bus[0]) );
  SDFFRQX2M enable_flop_reg ( .D(sync_flop), .SI(test_si), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(enable_flop) );
  SDFFRQX2M enable_pulse_d_reg ( .D(n23), .SI(enable_flop), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(enable_pulse_d) );
  SDFFRQX2M meta_flop_reg ( .D(bus_enable), .SI(enable_pulse_d), .SE(test_se), 
        .CK(dest_clk), .RN(dest_rst), .Q(meta_flop) );
  SDFFRQX1M sync_flop_reg ( .D(meta_flop), .SI(sync_bus[7]), .SE(test_se), 
        .CK(dest_clk), .RN(dest_rst), .Q(sync_flop) );
  INVX2M U4 ( .A(n44), .Y(n23) );
  NAND2BX2M U5 ( .AN(enable_flop), .B(sync_flop), .Y(n44) );
  AO22X1M U6 ( .A0(unsync_bus[0]), .A1(n23), .B0(sync_bus[0]), .B1(n44), .Y(
        n41) );
  AO22X1M U7 ( .A0(unsync_bus[1]), .A1(n23), .B0(sync_bus[1]), .B1(n44), .Y(
        n39) );
  AO22X1M U8 ( .A0(unsync_bus[2]), .A1(n23), .B0(sync_bus[2]), .B1(n44), .Y(
        n37) );
  AO22X1M U9 ( .A0(unsync_bus[3]), .A1(n23), .B0(sync_bus[3]), .B1(n44), .Y(
        n35) );
  AO22X1M U10 ( .A0(unsync_bus[4]), .A1(n23), .B0(sync_bus[4]), .B1(n44), .Y(
        n33) );
  AO22X1M U11 ( .A0(unsync_bus[5]), .A1(n23), .B0(sync_bus[5]), .B1(n44), .Y(
        n31) );
  AO22X1M U12 ( .A0(unsync_bus[6]), .A1(n23), .B0(sync_bus[6]), .B1(n44), .Y(
        n29) );
  AO22X1M U25 ( .A0(unsync_bus[7]), .A1(n23), .B0(sync_bus[7]), .B1(n44), .Y(
        n27) );
endmodule


module BIT_SYNC_test_1 ( dest_clk, dest_rst, unsync_bit, sync_bit, test_si, 
        test_se );
  input dest_clk, dest_rst, unsync_bit, test_si, test_se;
  output sync_bit;
  wire   meta_flop;

  SDFFRQX2M sync_flop_reg ( .D(meta_flop), .SI(meta_flop), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(sync_bit) );
  SDFFRQX2M meta_flop_reg ( .D(unsync_bit), .SI(test_si), .SE(test_se), .CK(
        dest_clk), .RN(dest_rst), .Q(meta_flop) );
endmodule


module ClkDiv_test_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk, 
        test_si, test_so, test_se );
  input [3:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   div_clk, odd_edge_tog, n19, n20, n21, n22, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n2, n3, n4, n5, n11, n12, n13, n14, n15;
  wire   [2:0] count;
  assign test_so = odd_edge_tog;

  SDFFSQX1M odd_edge_tog_reg ( .D(n40), .SI(div_clk), .SE(test_se), .CK(
        i_ref_clk), .SN(i_rst), .Q(odd_edge_tog) );
  OAI21X2M U9 ( .A0(i_div_ratio[3]), .A1(n36), .B0(i_clk_en), .Y(n22) );
  XNOR2X2M U10 ( .A(n35), .B(n14), .Y(n31) );
  OAI21X2M U11 ( .A0(n12), .A1(n5), .B0(n36), .Y(n35) );
  AOI21X2M U12 ( .A0(n13), .A1(n4), .B0(n22), .Y(n21) );
  INVX2M U13 ( .A(n32), .Y(n11) );
  INVX2M U14 ( .A(n26), .Y(n4) );
  INVX2M U15 ( .A(n22), .Y(n3) );
  NAND2X2M U16 ( .A(n5), .B(n12), .Y(n36) );
  XNOR2X2M U17 ( .A(n12), .B(count[0]), .Y(n32) );
  OAI32X1M U18 ( .A0(n19), .A1(count[2]), .A2(n14), .B0(n20), .B1(n15), .Y(n38) );
  AOI21BX2M U20 ( .A0(n4), .A1(n14), .B0N(n21), .Y(n20) );
  OAI21X2M U21 ( .A0(n28), .A1(n29), .B0(i_div_ratio[0]), .Y(n24) );
  NOR4X1M U22 ( .A(odd_edge_tog), .B(n32), .C(n33), .D(n34), .Y(n28) );
  NOR4BX1M U23 ( .AN(odd_edge_tog), .B(n11), .C(n30), .D(n31), .Y(n29) );
  CLKXOR2X2M U24 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n34) );
  OAI22X1M U25 ( .A0(n21), .A1(n14), .B0(count[1]), .B1(n19), .Y(n39) );
  NAND2X2M U26 ( .A(n27), .B(n24), .Y(n26) );
  OR4X1M U27 ( .A(n30), .B(n31), .C(n11), .D(i_div_ratio[0]), .Y(n27) );
  NAND3X2M U28 ( .A(n4), .B(count[0]), .C(n3), .Y(n19) );
  CLKXOR2X2M U29 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n33) );
  CLKXOR2X2M U31 ( .A(div_clk), .B(n25), .Y(n41) );
  NOR2X2M U32 ( .A(n4), .B(n22), .Y(n25) );
  OAI32X1M U33 ( .A0(n22), .A1(count[0]), .A2(n26), .B0(n3), .B1(n13), .Y(n42)
         );
  XNOR2X2M U34 ( .A(n37), .B(count[2]), .Y(n30) );
  NAND2X2M U35 ( .A(i_div_ratio[3]), .B(n36), .Y(n37) );
  CLKXOR2X2M U36 ( .A(odd_edge_tog), .B(n2), .Y(n40) );
  NOR2X2M U37 ( .A(n24), .B(n22), .Y(n2) );
  INVX2M U39 ( .A(i_div_ratio[2]), .Y(n5) );
  INVX2M U40 ( .A(i_div_ratio[1]), .Y(n12) );
  MX2X2M U41 ( .A(i_ref_clk), .B(div_clk), .S0(n3), .Y(o_div_clk) );
  SDFFRX1M \count_reg[0]  ( .D(n42), .SI(test_si), .SE(test_se), .CK(i_ref_clk), .RN(i_rst), .Q(count[0]), .QN(n13) );
  SDFFRX1M \count_reg[1]  ( .D(n39), .SI(n13), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst), .Q(count[1]), .QN(n14) );
  SDFFRX1M div_clk_reg ( .D(n41), .SI(n15), .SE(test_se), .CK(i_ref_clk), .RN(
        i_rst), .Q(div_clk) );
  SDFFRX1M \count_reg[2]  ( .D(n38), .SI(n14), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst), .Q(count[2]), .QN(n15) );
endmodule


module CTRL_RX_test_1 ( UART_RX_VLD, UART_RX_DATA, CLK, RST, RF_RdData, 
        RF_RdData_VLD, ALU_OUT, ALU_OUT_VLD, ALU_EN, ALU_FUN, CLKG_EN, 
        CLKDIV_EN, RF_WrEn, RF_RdEn, RF_Address, RF_WrData, UART_RF_SEND, 
        UART_ALU_SEND, UART_SEND_RF_DATA, UART_SEND_ALU_DATA, test_si2, 
        test_si1, test_se );
  input [7:0] UART_RX_DATA;
  input [7:0] RF_RdData;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] RF_Address;
  output [7:0] RF_WrData;
  output [7:0] UART_SEND_RF_DATA;
  output [15:0] UART_SEND_ALU_DATA;
  input UART_RX_VLD, CLK, RST, RF_RdData_VLD, ALU_OUT_VLD, test_si2, test_si1,
         test_se;
  output ALU_EN, CLKG_EN, CLKDIV_EN, RF_WrEn, RF_RdEn, UART_RF_SEND,
         UART_ALU_SEND;
  wire   n46, n47, n48, n49, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n51, n52, n53, n54, n55, n56, n57,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126;
  wire   [3:0] CS;
  wire   [3:0] NS;

  SDFFRQX2M \UART_SEND_RF_DATA_reg[7]  ( .D(n112), .SI(UART_SEND_RF_DATA[6]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(UART_SEND_RF_DATA[7]) );
  SDFFRQX2M \UART_SEND_RF_DATA_reg[6]  ( .D(n111), .SI(UART_SEND_RF_DATA[5]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(UART_SEND_RF_DATA[6]) );
  SDFFRQX2M \UART_SEND_RF_DATA_reg[5]  ( .D(n110), .SI(UART_SEND_RF_DATA[4]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(UART_SEND_RF_DATA[5]) );
  SDFFRQX2M \UART_SEND_RF_DATA_reg[4]  ( .D(n109), .SI(UART_SEND_RF_DATA[3]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(UART_SEND_RF_DATA[4]) );
  SDFFRQX2M \UART_SEND_RF_DATA_reg[3]  ( .D(n108), .SI(UART_SEND_RF_DATA[2]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(UART_SEND_RF_DATA[3]) );
  SDFFRQX2M \UART_SEND_RF_DATA_reg[2]  ( .D(n107), .SI(UART_SEND_RF_DATA[1]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(UART_SEND_RF_DATA[2]) );
  SDFFRQX2M \UART_SEND_RF_DATA_reg[1]  ( .D(n106), .SI(UART_SEND_RF_DATA[0]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(UART_SEND_RF_DATA[1]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[8]  ( .D(n97), .SI(UART_SEND_ALU_DATA[7]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[8]) );
  SDFFRQX2M \UART_SEND_RF_DATA_reg[0]  ( .D(n105), .SI(UART_SEND_ALU_DATA[15]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(UART_SEND_RF_DATA[0]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[7]  ( .D(n96), .SI(UART_SEND_ALU_DATA[6]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[7]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[6]  ( .D(n95), .SI(UART_SEND_ALU_DATA[5]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[6]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[5]  ( .D(n94), .SI(UART_SEND_ALU_DATA[4]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[5]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[4]  ( .D(n93), .SI(UART_SEND_ALU_DATA[3]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[4]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[3]  ( .D(n92), .SI(UART_SEND_ALU_DATA[2]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[3]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[2]  ( .D(n91), .SI(UART_SEND_ALU_DATA[1]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[2]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[1]  ( .D(n90), .SI(UART_SEND_ALU_DATA[0]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[1]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[15]  ( .D(n104), .SI(
        UART_SEND_ALU_DATA[14]), .SE(test_se), .CK(CLK), .RN(RST), .Q(
        UART_SEND_ALU_DATA[15]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[14]  ( .D(n103), .SI(test_si2), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(UART_SEND_ALU_DATA[14]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[13]  ( .D(n102), .SI(
        UART_SEND_ALU_DATA[12]), .SE(test_se), .CK(CLK), .RN(n38), .Q(
        UART_SEND_ALU_DATA[13]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[12]  ( .D(n101), .SI(
        UART_SEND_ALU_DATA[11]), .SE(test_se), .CK(CLK), .RN(n38), .Q(
        UART_SEND_ALU_DATA[12]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[11]  ( .D(n100), .SI(
        UART_SEND_ALU_DATA[10]), .SE(test_se), .CK(CLK), .RN(n38), .Q(
        UART_SEND_ALU_DATA[11]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[10]  ( .D(n99), .SI(UART_SEND_ALU_DATA[9]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[10]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[9]  ( .D(n98), .SI(UART_SEND_ALU_DATA[8]), 
        .SE(test_se), .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[9]) );
  SDFFRQX2M \UART_SEND_ALU_DATA_reg[0]  ( .D(n89), .SI(n123), .SE(test_se), 
        .CK(CLK), .RN(n38), .Q(UART_SEND_ALU_DATA[0]) );
  SDFFRX1M \RF_ADDR_REG_reg[2]  ( .D(n115), .SI(n125), .SE(test_se), .CK(CLK), 
        .RN(n38), .Q(n124), .QN(n47) );
  SDFFRX1M \RF_ADDR_REG_reg[0]  ( .D(n113), .SI(n54), .SE(test_se), .CK(CLK), 
        .RN(n38), .Q(n126), .QN(n49) );
  SDFFRX1M \RF_ADDR_REG_reg[1]  ( .D(n114), .SI(n126), .SE(test_se), .CK(CLK), 
        .RN(n38), .Q(n125), .QN(n48) );
  SDFFRQX2M \CS_reg[0]  ( .D(NS[0]), .SI(test_si1), .SE(test_se), .CK(CLK), 
        .RN(n38), .Q(CS[0]) );
  SDFFRQX2M \CS_reg[1]  ( .D(NS[1]), .SI(n44), .SE(test_se), .CK(CLK), .RN(RST), .Q(CS[1]) );
  SDFFRQX2M \CS_reg[2]  ( .D(NS[2]), .SI(CS[1]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(CS[2]) );
  SDFFRQX2M \CS_reg[3]  ( .D(NS[3]), .SI(CS[2]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(CS[3]) );
  SDFFRX1M \RF_ADDR_REG_reg[3]  ( .D(n116), .SI(n124), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n123), .QN(n46) );
  NOR2X2M U38 ( .A(n119), .B(n66), .Y(ALU_FUN[2]) );
  NOR2X2M U39 ( .A(n121), .B(n66), .Y(ALU_FUN[0]) );
  NOR4X1M U40 ( .A(n44), .B(n53), .C(CS[2]), .D(CS[3]), .Y(n62) );
  NOR4X1M U41 ( .A(n55), .B(n53), .C(CS[0]), .D(CS[3]), .Y(RF_RdEn) );
  NOR2X2M U42 ( .A(n63), .B(n47), .Y(RF_Address[2]) );
  INVX2M U43 ( .A(n39), .Y(n38) );
  BUFX2M U44 ( .A(n61), .Y(n37) );
  INVX2M U45 ( .A(n64), .Y(n40) );
  BUFX2M U46 ( .A(n61), .Y(n36) );
  INVX2M U47 ( .A(n70), .Y(n43) );
  INVX2M U48 ( .A(n72), .Y(n51) );
  INVX2M U49 ( .A(RST), .Y(n39) );
  NOR3X2M U50 ( .A(n41), .B(n62), .C(n40), .Y(n61) );
  NOR2X2M U51 ( .A(n62), .B(RF_RdEn), .Y(n63) );
  NOR2X2M U52 ( .A(n120), .B(n66), .Y(ALU_FUN[1]) );
  NAND2X2M U53 ( .A(n82), .B(n44), .Y(n64) );
  NOR2X2M U54 ( .A(n118), .B(n66), .Y(ALU_FUN[3]) );
  NOR2X2M U55 ( .A(n37), .B(n122), .Y(RF_WrEn) );
  NOR2X2M U56 ( .A(n37), .B(n117), .Y(RF_WrData[4]) );
  NOR2X2M U57 ( .A(n37), .B(n57), .Y(RF_WrData[7]) );
  NOR2X2M U58 ( .A(n37), .B(n118), .Y(RF_WrData[3]) );
  NOR2X2M U59 ( .A(n36), .B(n120), .Y(RF_WrData[1]) );
  NOR2X2M U60 ( .A(n37), .B(n119), .Y(RF_WrData[2]) );
  NOR2X2M U61 ( .A(n66), .B(n122), .Y(ALU_EN) );
  NOR2X2M U62 ( .A(n36), .B(n121), .Y(RF_WrData[0]) );
  INVX2M U63 ( .A(n60), .Y(n42) );
  NAND2X2M U64 ( .A(n84), .B(n53), .Y(n70) );
  INVX2M U65 ( .A(n69), .Y(n41) );
  AND4X2M U66 ( .A(n53), .B(n54), .C(n68), .D(n88), .Y(n80) );
  NOR3X2M U67 ( .A(n57), .B(n122), .C(n118), .Y(n88) );
  INVX2M U68 ( .A(n58), .Y(UART_ALU_SEND) );
  NAND2X2M U69 ( .A(n52), .B(n54), .Y(n72) );
  INVX2M U70 ( .A(n83), .Y(n52) );
  INVX2M U71 ( .A(n59), .Y(UART_RF_SEND) );
  NOR3X2M U72 ( .A(CS[1]), .B(CS[2]), .C(n54), .Y(n82) );
  NAND2X2M U73 ( .A(n82), .B(CS[0]), .Y(n66) );
  INVX2M U74 ( .A(CS[3]), .Y(n54) );
  INVX2M U75 ( .A(CS[1]), .Y(n53) );
  INVX2M U76 ( .A(CS[2]), .Y(n55) );
  OAI21X2M U77 ( .A0(n63), .A1(n49), .B0(n64), .Y(RF_Address[0]) );
  NOR2X4M U78 ( .A(n63), .B(n46), .Y(RF_Address[3]) );
  OAI21X2M U79 ( .A0(n51), .A1(n43), .B0(UART_RX_VLD), .Y(n60) );
  NOR3X2M U80 ( .A(n55), .B(CS[3]), .C(n44), .Y(n84) );
  OAI22X1M U81 ( .A0(n60), .A1(n121), .B0(n42), .B1(n49), .Y(n113) );
  OAI22X1M U82 ( .A0(n60), .A1(n120), .B0(n42), .B1(n48), .Y(n114) );
  OAI22X1M U83 ( .A0(n60), .A1(n119), .B0(n42), .B1(n47), .Y(n115) );
  OAI22X1M U84 ( .A0(n60), .A1(n118), .B0(n42), .B1(n46), .Y(n116) );
  NOR2BX2M U85 ( .AN(UART_RX_DATA[5]), .B(n36), .Y(RF_WrData[5]) );
  NOR2BX2M U86 ( .AN(UART_RX_DATA[6]), .B(n36), .Y(RF_WrData[6]) );
  NAND2X2M U87 ( .A(n84), .B(CS[1]), .Y(n69) );
  INVX2M U88 ( .A(CS[0]), .Y(n44) );
  INVX2M U89 ( .A(UART_RX_DATA[0]), .Y(n121) );
  INVX2M U90 ( .A(UART_RX_DATA[1]), .Y(n120) );
  INVX2M U91 ( .A(UART_RX_DATA[2]), .Y(n119) );
  INVX2M U92 ( .A(UART_RX_VLD), .Y(n122) );
  NOR2X2M U93 ( .A(n63), .B(n48), .Y(RF_Address[1]) );
  NAND4BX1M U94 ( .AN(ALU_EN), .B(n72), .C(n73), .D(n74), .Y(NS[1]) );
  AOI33X2M U95 ( .A0(n121), .A1(n117), .A2(n76), .B0(n77), .B1(n54), .B2(CS[1]), .Y(n73) );
  AOI221XLM U96 ( .A0(n52), .A1(n56), .B0(n43), .B1(UART_RX_VLD), .C0(n75), 
        .Y(n74) );
  OAI22X1M U97 ( .A0(UART_RX_VLD), .A1(CS[2]), .B0(RF_RdData_VLD), .B1(CS[0]), 
        .Y(n77) );
  INVX2M U98 ( .A(UART_RX_DATA[3]), .Y(n118) );
  AOI31X2M U99 ( .A0(n76), .A1(UART_RX_DATA[0]), .A2(UART_RX_DATA[4]), .B0(n75), .Y(n71) );
  NAND3X2M U100 ( .A(ALU_OUT_VLD), .B(n52), .C(CS[3]), .Y(n58) );
  NAND2X2M U101 ( .A(RF_RdData_VLD), .B(RF_RdEn), .Y(n59) );
  NOR2X2M U102 ( .A(CS[0]), .B(CS[2]), .Y(n68) );
  OAI2B11X2M U103 ( .A1N(RF_RdEn), .A0(RF_RdData_VLD), .B0(n70), .C0(n71), .Y(
        NS[2]) );
  OAI21X2M U104 ( .A0(UART_RX_VLD), .A1(n69), .B0(n85), .Y(n75) );
  NAND4X2M U105 ( .A(UART_RX_DATA[6]), .B(UART_RX_DATA[2]), .C(n80), .D(n86), 
        .Y(n85) );
  NOR4X1M U106 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[4]), .C(UART_RX_DATA[1]), 
        .D(UART_RX_DATA[0]), .Y(n86) );
  NAND4X2M U107 ( .A(UART_RX_DATA[4]), .B(UART_RX_DATA[6]), .C(n80), .D(n81), 
        .Y(n65) );
  NOR4X1M U108 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[1]), .C(n121), .D(n119), 
        .Y(n81) );
  NAND4X2M U109 ( .A(n71), .B(n78), .C(n79), .D(n65), .Y(NS[0]) );
  OAI21X2M U110 ( .A0(n51), .A1(n40), .B0(UART_RX_VLD), .Y(n79) );
  OAI31X1M U111 ( .A0(n45), .A1(n43), .A2(n62), .B0(n122), .Y(n78) );
  INVX2M U112 ( .A(n66), .Y(n45) );
  NAND2X2M U113 ( .A(CS[1]), .B(n68), .Y(n83) );
  NAND4X2M U114 ( .A(n64), .B(n65), .C(n66), .D(n67), .Y(NS[3]) );
  AOI32X1M U115 ( .A0(n68), .A1(n56), .A2(CS[3]), .B0(n41), .B1(UART_RX_VLD), 
        .Y(n67) );
  INVX2M U116 ( .A(UART_RX_DATA[4]), .Y(n117) );
  AND3X2M U117 ( .A(n80), .B(UART_RX_DATA[5]), .C(n87), .Y(n76) );
  NOR3X2M U118 ( .A(n120), .B(UART_RX_DATA[6]), .C(UART_RX_DATA[2]), .Y(n87)
         );
  INVX2M U119 ( .A(UART_RX_DATA[7]), .Y(n57) );
  AO22X1M U120 ( .A0(RF_RdData[0]), .A1(UART_RF_SEND), .B0(
        UART_SEND_RF_DATA[0]), .B1(n59), .Y(n105) );
  AO22X1M U121 ( .A0(RF_RdData[1]), .A1(UART_RF_SEND), .B0(
        UART_SEND_RF_DATA[1]), .B1(n59), .Y(n106) );
  AO22X1M U122 ( .A0(RF_RdData[2]), .A1(UART_RF_SEND), .B0(
        UART_SEND_RF_DATA[2]), .B1(n59), .Y(n107) );
  AO22X1M U123 ( .A0(RF_RdData[3]), .A1(UART_RF_SEND), .B0(
        UART_SEND_RF_DATA[3]), .B1(n59), .Y(n108) );
  AO22X1M U124 ( .A0(RF_RdData[4]), .A1(UART_RF_SEND), .B0(
        UART_SEND_RF_DATA[4]), .B1(n59), .Y(n109) );
  AO22X1M U125 ( .A0(RF_RdData[5]), .A1(UART_RF_SEND), .B0(
        UART_SEND_RF_DATA[5]), .B1(n59), .Y(n110) );
  AO22X1M U126 ( .A0(RF_RdData[6]), .A1(UART_RF_SEND), .B0(
        UART_SEND_RF_DATA[6]), .B1(n59), .Y(n111) );
  AO22X1M U127 ( .A0(RF_RdData[7]), .A1(UART_RF_SEND), .B0(
        UART_SEND_RF_DATA[7]), .B1(n59), .Y(n112) );
  AO22X1M U128 ( .A0(ALU_OUT[0]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[0]), .B1(n58), .Y(n89) );
  AO22X1M U129 ( .A0(ALU_OUT[1]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[1]), .B1(n58), .Y(n90) );
  AO22X1M U130 ( .A0(ALU_OUT[2]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[2]), .B1(n58), .Y(n91) );
  AO22X1M U131 ( .A0(ALU_OUT[3]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[3]), .B1(n58), .Y(n92) );
  AO22X1M U132 ( .A0(ALU_OUT[4]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[4]), .B1(n58), .Y(n93) );
  AO22X1M U133 ( .A0(ALU_OUT[5]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[5]), .B1(n58), .Y(n94) );
  AO22X1M U134 ( .A0(ALU_OUT[6]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[6]), .B1(n58), .Y(n95) );
  AO22X1M U135 ( .A0(ALU_OUT[7]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[7]), .B1(n58), .Y(n96) );
  AO22X1M U136 ( .A0(ALU_OUT[8]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[8]), .B1(n58), .Y(n97) );
  AO22X1M U137 ( .A0(ALU_OUT[9]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[9]), .B1(n58), .Y(n98) );
  AO22X1M U138 ( .A0(ALU_OUT[10]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[10]), .B1(n58), .Y(n99) );
  AO22X1M U139 ( .A0(ALU_OUT[11]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[11]), .B1(n58), .Y(n100) );
  AO22X1M U140 ( .A0(ALU_OUT[12]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[12]), .B1(n58), .Y(n101) );
  AO22X1M U141 ( .A0(ALU_OUT[13]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[13]), .B1(n58), .Y(n102) );
  AO22X1M U142 ( .A0(ALU_OUT[14]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[14]), .B1(n58), .Y(n103) );
  AO22X1M U143 ( .A0(ALU_OUT[15]), .A1(UART_ALU_SEND), .B0(
        UART_SEND_ALU_DATA[15]), .B1(n58), .Y(n104) );
  INVX2M U144 ( .A(ALU_OUT_VLD), .Y(n56) );
  OAI21X2M U145 ( .A0(n83), .A1(n54), .B0(n66), .Y(CLKG_EN) );
  INVX2M U3 ( .A(1'b0), .Y(CLKDIV_EN) );
endmodule


module CTRL_TX_test_1 ( UART_TX_Busy, UART_RF_SENDER_DATA, 
        UART_RF_SENDER_VALID, UART_ALU_SENDER_DATA, UART_ALU_SENDER_VALID, CLK, 
        RST, UART_tx_VALID, UART_TX_DATA, test_so, test_se );
  input [7:0] UART_RF_SENDER_DATA;
  input [15:0] UART_ALU_SENDER_DATA;
  output [7:0] UART_TX_DATA;
  input UART_TX_Busy, UART_RF_SENDER_VALID, UART_ALU_SENDER_VALID, CLK, RST,
         test_se;
  output UART_tx_VALID, test_so;
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n4, n5, n6, n7;
  wire   [2:0] CS;
  wire   [2:0] NS;
  assign test_so = n7;

  SDFFRQX2M \CS_reg[2]  ( .D(NS[2]), .SI(n6), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(CS[2]) );
  SDFFRQX2M \CS_reg[0]  ( .D(NS[0]), .SI(UART_RF_SENDER_DATA[7]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(CS[0]) );
  SDFFRQX2M \CS_reg[1]  ( .D(NS[1]), .SI(n4), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(CS[1]) );
  INVX2M U6 ( .A(n12), .Y(n5) );
  NAND3BX2M U7 ( .AN(n13), .B(n22), .C(n23), .Y(NS[1]) );
  NAND4BX1M U8 ( .AN(UART_RF_SENDER_VALID), .B(UART_ALU_SENDER_VALID), .C(n4), 
        .D(n7), .Y(n23) );
  NOR3X2M U9 ( .A(CS[0]), .B(CS[1]), .C(n7), .Y(n12) );
  NOR3X2M U10 ( .A(CS[0]), .B(CS[2]), .C(n6), .Y(n13) );
  NOR3X2M U11 ( .A(CS[1]), .B(CS[2]), .C(n4), .Y(n10) );
  OAI2B11X2M U12 ( .A1N(n10), .A0(UART_TX_Busy), .B0(n24), .C0(n22), .Y(NS[0])
         );
  NAND4X2M U13 ( .A(UART_RF_SENDER_VALID), .B(n4), .C(n6), .D(n7), .Y(n24) );
  INVX2M U14 ( .A(CS[2]), .Y(n7) );
  NAND3X2M U15 ( .A(CS[0]), .B(n7), .C(CS[1]), .Y(n20) );
  NAND3X2M U16 ( .A(CS[1]), .B(n7), .C(UART_TX_Busy), .Y(n22) );
  INVX2M U17 ( .A(CS[1]), .Y(n6) );
  INVX2M U18 ( .A(CS[0]), .Y(n4) );
  AOI21X2M U19 ( .A0(n5), .A1(n20), .B0(UART_TX_Busy), .Y(NS[2]) );
  OAI2B11X2M U20 ( .A1N(UART_ALU_SENDER_DATA[8]), .A0(n5), .B0(n20), .C0(n21), 
        .Y(UART_TX_DATA[0]) );
  AOI22X1M U21 ( .A0(UART_ALU_SENDER_DATA[0]), .A1(n13), .B0(
        UART_RF_SENDER_DATA[0]), .B1(n10), .Y(n21) );
  OAI2BB1X2M U22 ( .A0N(UART_RF_SENDER_DATA[1]), .A1N(n10), .B0(n19), .Y(
        UART_TX_DATA[1]) );
  AOI22X1M U23 ( .A0(UART_ALU_SENDER_DATA[9]), .A1(n12), .B0(
        UART_ALU_SENDER_DATA[1]), .B1(n13), .Y(n19) );
  OAI2BB1X2M U24 ( .A0N(UART_RF_SENDER_DATA[2]), .A1N(n10), .B0(n18), .Y(
        UART_TX_DATA[2]) );
  AOI22X1M U25 ( .A0(UART_ALU_SENDER_DATA[10]), .A1(n12), .B0(
        UART_ALU_SENDER_DATA[2]), .B1(n13), .Y(n18) );
  OAI2BB1X2M U26 ( .A0N(UART_RF_SENDER_DATA[3]), .A1N(n10), .B0(n17), .Y(
        UART_TX_DATA[3]) );
  AOI22X1M U27 ( .A0(UART_ALU_SENDER_DATA[11]), .A1(n12), .B0(
        UART_ALU_SENDER_DATA[3]), .B1(n13), .Y(n17) );
  OAI2BB1X2M U28 ( .A0N(UART_RF_SENDER_DATA[4]), .A1N(n10), .B0(n16), .Y(
        UART_TX_DATA[4]) );
  AOI22X1M U29 ( .A0(UART_ALU_SENDER_DATA[12]), .A1(n12), .B0(
        UART_ALU_SENDER_DATA[4]), .B1(n13), .Y(n16) );
  OAI2BB1X2M U30 ( .A0N(UART_RF_SENDER_DATA[5]), .A1N(n10), .B0(n15), .Y(
        UART_TX_DATA[5]) );
  AOI22X1M U31 ( .A0(UART_ALU_SENDER_DATA[13]), .A1(n12), .B0(
        UART_ALU_SENDER_DATA[5]), .B1(n13), .Y(n15) );
  OAI2BB1X2M U32 ( .A0N(UART_RF_SENDER_DATA[6]), .A1N(n10), .B0(n14), .Y(
        UART_TX_DATA[6]) );
  AOI22X1M U33 ( .A0(UART_ALU_SENDER_DATA[14]), .A1(n12), .B0(
        UART_ALU_SENDER_DATA[6]), .B1(n13), .Y(n14) );
  OAI2BB1X2M U34 ( .A0N(UART_RF_SENDER_DATA[7]), .A1N(n10), .B0(n11), .Y(
        UART_TX_DATA[7]) );
  AOI22X1M U35 ( .A0(UART_ALU_SENDER_DATA[15]), .A1(n12), .B0(
        UART_ALU_SENDER_DATA[7]), .B1(n13), .Y(n11) );
  AOI21X2M U36 ( .A0(CS[1]), .A1(CS[0]), .B0(n8), .Y(UART_tx_VALID) );
  XNOR2X2M U37 ( .A(n7), .B(n9), .Y(n8) );
  NOR2X2M U38 ( .A(CS[1]), .B(CS[0]), .Y(n9) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, RF_RdData, RF_RdData_VLD, RF_WrEn, RF_RdEn, 
        RF_Address, RF_WrData, ALU_OUT, ALU_OUT_VLD, ALU_EN, ALU_FUN, CLKG_EN, 
        CLKDIV_EN, UART_RX_DATA, UART_RX_VLD, UART_TX_Busy, UART_TX_DATA, 
        UART_TX_VLD, test_si2, test_si1, test_so2, test_so1, test_se );
  input [7:0] RF_RdData;
  output [3:0] RF_Address;
  output [7:0] RF_WrData;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  input [7:0] UART_RX_DATA;
  output [7:0] UART_TX_DATA;
  input CLK, RST, RF_RdData_VLD, ALU_OUT_VLD, UART_RX_VLD, UART_TX_Busy,
         test_si2, test_si1, test_se;
  output RF_WrEn, RF_RdEn, ALU_EN, CLKG_EN, CLKDIV_EN, UART_TX_VLD, test_so2,
         test_so1;
  wire   UART_RF_SEND, UART_ALU_SEND, n3, n4;
  wire   [7:0] UART_SEND_RF_DATA;
  wire   [15:0] UART_SEND_ALU_DATA;
  assign test_so1 = UART_SEND_ALU_DATA[13];

  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(RST), .Y(n4) );
  CTRL_RX_test_1 U0_CTRL_RX ( .UART_RX_VLD(UART_RX_VLD), .UART_RX_DATA(
        UART_RX_DATA), .CLK(CLK), .RST(n3), .RF_RdData(RF_RdData), 
        .RF_RdData_VLD(RF_RdData_VLD), .ALU_OUT(ALU_OUT), .ALU_OUT_VLD(
        ALU_OUT_VLD), .ALU_EN(ALU_EN), .ALU_FUN(ALU_FUN), .CLKG_EN(CLKG_EN), 
        .RF_WrEn(RF_WrEn), .RF_RdEn(RF_RdEn), .RF_Address(RF_Address), 
        .RF_WrData(RF_WrData), .UART_RF_SEND(UART_RF_SEND), .UART_ALU_SEND(
        UART_ALU_SEND), .UART_SEND_RF_DATA(UART_SEND_RF_DATA), 
        .UART_SEND_ALU_DATA(UART_SEND_ALU_DATA), .test_si2(test_si2), 
        .test_si1(test_si1), .test_se(test_se) );
  CTRL_TX_test_1 U0_CTRL_TX ( .UART_TX_Busy(UART_TX_Busy), 
        .UART_RF_SENDER_DATA(UART_SEND_RF_DATA), .UART_RF_SENDER_VALID(
        UART_RF_SEND), .UART_ALU_SENDER_DATA(UART_SEND_ALU_DATA), 
        .UART_ALU_SENDER_VALID(UART_ALU_SEND), .CLK(CLK), .RST(n3), 
        .UART_tx_VALID(UART_TX_VLD), .UART_TX_DATA(UART_TX_DATA), .test_so(
        test_so2), .test_se(test_se) );
  INVX2M U1 ( .A(1'b0), .Y(CLKDIV_EN) );
endmodule


module FSM_test_1 ( Data_Valid, ser_done, PAR_EN, CLK, RST, mux_sel, ser_en, 
        Busy, test_si, test_so, test_se );
  output [1:0] mux_sel;
  input Data_Valid, ser_done, PAR_EN, CLK, RST, test_si, test_se;
  output ser_en, Busy, test_so;
  wire   busy_reg, n10, n11, n12, n13, n14, n15, n6, n7, n8, n9, n16;
  wire   [2:0] Current_State;
  wire   [2:0] Next_State;
  assign test_so = n8;

  SDFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .SI(n7), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Current_State[1]) );
  SDFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .SI(n16), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Current_State[2]) );
  SDFFRQX2M Busy_reg ( .D(busy_reg), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Busy) );
  SDFFRQX2M \Current_State_reg[0]  ( .D(Next_State[0]), .SI(Busy), .SE(test_se), .CK(CLK), .RN(RST), .Q(Current_State[0]) );
  INVX2M U7 ( .A(ser_en), .Y(n9) );
  NAND2X2M U8 ( .A(n10), .B(n8), .Y(mux_sel[0]) );
  INVX2M U9 ( .A(ser_done), .Y(n6) );
  OAI32X1M U10 ( .A0(n7), .A1(Current_State[2]), .A2(Current_State[1]), .B0(n9), .B1(n13), .Y(Next_State[1]) );
  OAI21X2M U11 ( .A0(n14), .A1(n6), .B0(n7), .Y(n13) );
  INVX2M U12 ( .A(Current_State[0]), .Y(n7) );
  XNOR2X2M U13 ( .A(n16), .B(Current_State[0]), .Y(n10) );
  OAI31X1M U14 ( .A0(n8), .A1(Current_State[0]), .A2(n10), .B0(n11), .Y(
        busy_reg) );
  OAI21X2M U15 ( .A0(Current_State[0]), .A1(n10), .B0(n8), .Y(n11) );
  NOR2X2M U16 ( .A(Current_State[0]), .B(n15), .Y(Next_State[0]) );
  AOI32X1M U17 ( .A0(n16), .A1(n8), .A2(Data_Valid), .B0(n14), .B1(ser_en), 
        .Y(n15) );
  NOR2X2M U18 ( .A(n12), .B(n9), .Y(Next_State[2]) );
  AOI2BB1X2M U19 ( .A0N(PAR_EN), .A1N(n6), .B0(Current_State[0]), .Y(n12) );
  INVX2M U20 ( .A(Current_State[2]), .Y(n8) );
  AND2X2M U21 ( .A(PAR_EN), .B(ser_done), .Y(n14) );
  INVX2M U22 ( .A(Current_State[1]), .Y(n16) );
  BUFX2M U23 ( .A(ser_en), .Y(mux_sel[1]) );
  NOR2X2M U24 ( .A(n16), .B(Current_State[2]), .Y(ser_en) );
endmodule


module PARITY_CALC_test_1 ( P_Data, PAR_TYP, CLK, RST, Data_Valid, Busy, 
        par_bit, test_si, test_se );
  input [7:0] P_Data;
  input PAR_TYP, CLK, RST, Data_Valid, Busy, test_si, test_se;
  output par_bit;
  wire   N7, n1, n2, n3, n4, n5, n8, n10, n12, n14, n16, n18, n20, n22;
  wire   [7:0] Memory;

  SDFFRQX2M par_bit_reg ( .D(N7), .SI(Memory[7]), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(par_bit) );
  SDFFRQX2M \Memory_reg[5]  ( .D(n18), .SI(Memory[4]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Memory[5]) );
  SDFFRQX2M \Memory_reg[1]  ( .D(n10), .SI(Memory[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Memory[1]) );
  SDFFRQX2M \Memory_reg[4]  ( .D(n16), .SI(Memory[3]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Memory[4]) );
  SDFFRQX2M \Memory_reg[0]  ( .D(n8), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Memory[0]) );
  SDFFRQX2M \Memory_reg[6]  ( .D(n20), .SI(Memory[5]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Memory[6]) );
  SDFFRQX2M \Memory_reg[2]  ( .D(n12), .SI(Memory[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Memory[2]) );
  SDFFRQX2M \Memory_reg[7]  ( .D(n22), .SI(Memory[6]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Memory[7]) );
  SDFFRQX2M \Memory_reg[3]  ( .D(n14), .SI(Memory[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(Memory[3]) );
  NOR2BX2M U3 ( .AN(Data_Valid), .B(Busy), .Y(n1) );
  XOR3XLM U4 ( .A(n2), .B(n3), .C(PAR_TYP), .Y(N7) );
  XOR3XLM U5 ( .A(Memory[5]), .B(Memory[4]), .C(n5), .Y(n2) );
  XOR3XLM U6 ( .A(Memory[1]), .B(Memory[0]), .C(n4), .Y(n3) );
  CLKXOR2X2M U7 ( .A(Memory[7]), .B(Memory[6]), .Y(n5) );
  AO2B2X2M U8 ( .B0(P_Data[0]), .B1(n1), .A0(Memory[0]), .A1N(n1), .Y(n8) );
  AO2B2X2M U9 ( .B0(P_Data[1]), .B1(n1), .A0(Memory[1]), .A1N(n1), .Y(n10) );
  AO2B2X2M U10 ( .B0(P_Data[2]), .B1(n1), .A0(Memory[2]), .A1N(n1), .Y(n12) );
  AO2B2X2M U11 ( .B0(P_Data[3]), .B1(n1), .A0(Memory[3]), .A1N(n1), .Y(n14) );
  AO2B2X2M U12 ( .B0(P_Data[4]), .B1(n1), .A0(Memory[4]), .A1N(n1), .Y(n16) );
  AO2B2X2M U13 ( .B0(P_Data[5]), .B1(n1), .A0(Memory[5]), .A1N(n1), .Y(n18) );
  AO2B2X2M U14 ( .B0(P_Data[6]), .B1(n1), .A0(Memory[6]), .A1N(n1), .Y(n20) );
  AO2B2X2M U15 ( .B0(P_Data[7]), .B1(n1), .A0(Memory[7]), .A1N(n1), .Y(n22) );
  CLKXOR2X2M U16 ( .A(Memory[3]), .B(Memory[2]), .Y(n4) );
endmodule


module Serializer_test_1 ( P_DATA, ser_en, CLK, RST, Busy, Data_Valid, 
        ser_done, ser_data, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input ser_en, CLK, RST, Busy, Data_Valid, test_si, test_se;
  output ser_done, ser_data, test_so;
  wire   N23, N24, N25, N27, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n13, n14, n35, n36;
  wire   [7:1] regsiters;
  wire   [2:0] counter;
  assign test_so = regsiters[7];
  assign ser_done = N27;

  SDFFRQX2M \regsiters_reg[6]  ( .D(n29), .SI(regsiters[5]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(regsiters[6]) );
  SDFFRQX2M \regsiters_reg[5]  ( .D(n30), .SI(regsiters[4]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(regsiters[5]) );
  SDFFRQX2M \regsiters_reg[4]  ( .D(n31), .SI(regsiters[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(regsiters[4]) );
  SDFFRQX2M \regsiters_reg[3]  ( .D(n32), .SI(regsiters[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(regsiters[3]) );
  SDFFRQX2M \regsiters_reg[2]  ( .D(n33), .SI(regsiters[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(regsiters[2]) );
  SDFFRQX2M \regsiters_reg[1]  ( .D(n34), .SI(ser_data), .SE(test_se), .CK(CLK), .RN(RST), .Q(regsiters[1]) );
  SDFFRQX2M \regsiters_reg[7]  ( .D(n28), .SI(regsiters[6]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(regsiters[7]) );
  SDFFRQX2M \regsiters_reg[0]  ( .D(n27), .SI(n35), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(ser_data) );
  SDFFRQX2M \counter_reg[2]  ( .D(N25), .SI(n14), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(counter[2]) );
  SDFFRQX1M \counter_reg[0]  ( .D(N23), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(counter[0]) );
  NOR2X2M U15 ( .A(n36), .B(n13), .Y(n17) );
  INVX2M U16 ( .A(ser_en), .Y(n36) );
  NOR2X2M U17 ( .A(n13), .B(n17), .Y(n15) );
  OAI2BB2X1M U18 ( .B0(n25), .B1(n36), .A0N(counter[2]), .A1N(N23), .Y(N25) );
  AOI32X1M U19 ( .A0(counter[0]), .A1(n35), .A2(counter[1]), .B0(counter[2]), 
        .B1(n14), .Y(n25) );
  INVX2M U20 ( .A(counter[2]), .Y(n35) );
  AND3X2M U21 ( .A(counter[0]), .B(counter[2]), .C(counter[1]), .Y(N27) );
  NOR2X2M U22 ( .A(n36), .B(counter[0]), .Y(N23) );
  NOR2X2M U23 ( .A(n26), .B(n36), .Y(N24) );
  CLKXOR2X2M U24 ( .A(counter[0]), .B(n14), .Y(n26) );
  BUFX2M U25 ( .A(n18), .Y(n13) );
  NOR2BX2M U26 ( .AN(Data_Valid), .B(Busy), .Y(n18) );
  OAI2BB1X2M U27 ( .A0N(ser_data), .A1N(n15), .B0(n16), .Y(n27) );
  AOI22X1M U28 ( .A0(regsiters[1]), .A1(n17), .B0(P_DATA[0]), .B1(n13), .Y(n16) );
  OAI2BB1X2M U29 ( .A0N(regsiters[1]), .A1N(n15), .B0(n24), .Y(n34) );
  AOI22X1M U30 ( .A0(regsiters[2]), .A1(n17), .B0(P_DATA[1]), .B1(n13), .Y(n24) );
  OAI2BB1X2M U31 ( .A0N(n15), .A1N(regsiters[2]), .B0(n23), .Y(n33) );
  AOI22X1M U32 ( .A0(regsiters[3]), .A1(n17), .B0(P_DATA[2]), .B1(n13), .Y(n23) );
  OAI2BB1X2M U33 ( .A0N(n15), .A1N(regsiters[3]), .B0(n22), .Y(n32) );
  AOI22X1M U34 ( .A0(regsiters[4]), .A1(n17), .B0(P_DATA[3]), .B1(n13), .Y(n22) );
  OAI2BB1X2M U35 ( .A0N(n15), .A1N(regsiters[4]), .B0(n21), .Y(n31) );
  AOI22X1M U36 ( .A0(regsiters[5]), .A1(n17), .B0(P_DATA[4]), .B1(n13), .Y(n21) );
  OAI2BB1X2M U37 ( .A0N(n15), .A1N(regsiters[5]), .B0(n20), .Y(n30) );
  AOI22X1M U38 ( .A0(regsiters[6]), .A1(n17), .B0(P_DATA[5]), .B1(n13), .Y(n20) );
  OAI2BB1X2M U39 ( .A0N(n15), .A1N(regsiters[6]), .B0(n19), .Y(n29) );
  AOI22X1M U40 ( .A0(regsiters[7]), .A1(n17), .B0(P_DATA[6]), .B1(n13), .Y(n19) );
  AO22X1M U41 ( .A0(n15), .A1(regsiters[7]), .B0(P_DATA[7]), .B1(n13), .Y(n28)
         );
  SDFFRX1M \counter_reg[1]  ( .D(N24), .SI(counter[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(counter[1]), .QN(n14) );
endmodule


module MUX4x1_test_1 ( ser_data, par_bit, mux_sel, CLK, RST, TX_OUT, test_si, 
        test_se );
  input [1:0] mux_sel;
  input ser_data, par_bit, CLK, RST, test_si, test_se;
  output TX_OUT;
  wire   out, n3, n4, n2, n7;

  INVX8M U5 ( .A(n2), .Y(TX_OUT) );
  OAI21X2M U7 ( .A0(n3), .A1(n7), .B0(n4), .Y(out) );
  NAND3X2M U8 ( .A(mux_sel[1]), .B(n7), .C(ser_data), .Y(n4) );
  NOR2BX2M U9 ( .AN(mux_sel[1]), .B(par_bit), .Y(n3) );
  INVX2M U10 ( .A(mux_sel[0]), .Y(n7) );
  SDFFSX1M TX_OUT_reg ( .D(out), .SI(test_si), .SE(test_se), .CK(CLK), .SN(RST), .QN(n2) );
endmodule


module TOP_TX_test_1 ( P_DATA, Data_valid, CLK, RST, PAR_EN, PAR_TYP, TX_OUT, 
        Busy, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input Data_valid, CLK, RST, PAR_EN, PAR_TYP, test_si, test_se;
  output TX_OUT, Busy, test_so;
  wire   ser_done, ser_en, par_bit, ser_data, n1, n2, n3, n4;
  wire   [1:0] mux_sel;
  assign test_so = par_bit;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  FSM_test_1 fsm_tx ( .Data_Valid(Data_valid), .ser_done(ser_done), .PAR_EN(
        PAR_EN), .CLK(CLK), .RST(n1), .mux_sel(mux_sel), .ser_en(ser_en), 
        .Busy(Busy), .test_si(n4), .test_so(n3), .test_se(test_se) );
  PARITY_CALC_test_1 parity ( .P_Data(P_DATA), .PAR_TYP(PAR_TYP), .CLK(CLK), 
        .RST(n1), .Data_Valid(Data_valid), .Busy(Busy), .par_bit(par_bit), 
        .test_si(n3), .test_se(test_se) );
  Serializer_test_1 SER1 ( .P_DATA(P_DATA), .ser_en(ser_en), .CLK(CLK), .RST(
        n1), .Busy(Busy), .Data_Valid(Data_valid), .ser_done(ser_done), 
        .ser_data(ser_data), .test_si(TX_OUT), .test_so(n4), .test_se(test_se)
         );
  MUX4x1_test_1 MUX_tx ( .ser_data(ser_data), .par_bit(par_bit), .mux_sel(
        mux_sel), .CLK(CLK), .RST(n1), .TX_OUT(TX_OUT), .test_si(test_si), 
        .test_se(test_se) );
endmodule


module STRT_CHECK_test_1 ( strt_chk_en, sampled_bit, CLK, RST, strt_glitch, 
        test_si, test_se );
  input strt_chk_en, sampled_bit, CLK, RST, test_si, test_se;
  output strt_glitch;
  wire   n2;

  AO2B2X2M U2 ( .B0(strt_chk_en), .B1(sampled_bit), .A0(strt_glitch), .A1N(
        strt_chk_en), .Y(n2) );
  SDFFRX1M strt_glitch_reg ( .D(n2), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(strt_glitch) );
endmodule


module Parity_Check_test_1 ( PAR_TYP, par_chk_en, sampled_bit, P_DATA, CLK, 
        RST, par_err, test_si, test_se );
  input [7:0] P_DATA;
  input PAR_TYP, par_chk_en, sampled_bit, CLK, RST, test_si, test_se;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n9, n2;

  OAI2BB2X1M U2 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n9) );
  XOR3XLM U3 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  INVX2M U4 ( .A(par_chk_en), .Y(n2) );
  XNOR2X2M U5 ( .A(sampled_bit), .B(PAR_TYP), .Y(n5) );
  XOR3XLM U6 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U7 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U9 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  SDFFRX1M par_err_reg ( .D(n9), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(par_err) );
endmodule


module STOP_CHECK_test_1 ( stp_chk_en, sampled_bit, CLK, RST, stp_err, test_si, 
        test_se );
  input stp_chk_en, sampled_bit, CLK, RST, test_si, test_se;
  output stp_err;
  wire   n3, n1;

  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n3)
         );
  INVX2M U3 ( .A(stp_chk_en), .Y(n1) );
  SDFFRX1M stp_err_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(stp_err) );
endmodule


module DeSerializer_test_1 ( deser_en, sampled_bit, CLK, RST, edge_cnt, P_DATA, 
        test_so, test_se );
  input [2:0] edge_cnt;
  output [7:0] P_DATA;
  input deser_en, sampled_bit, CLK, RST, test_se;
  output test_so;
  wire   n1, n11, n13, n15, n17, n19, n21, n23, n25, n2, n3, n4, n5, n6, n7,
         n8, n9;
  assign test_so = n3;

  NAND4X2M U2 ( .A(edge_cnt[2]), .B(edge_cnt[1]), .C(edge_cnt[0]), .D(deser_en), .Y(n1) );
  OAI22X1M U3 ( .A0(n2), .A1(n9), .B0(n1), .B1(n8), .Y(n13) );
  OAI22X1M U4 ( .A0(n2), .A1(n8), .B0(n1), .B1(n7), .Y(n15) );
  OAI22X1M U5 ( .A0(n2), .A1(n7), .B0(n1), .B1(n6), .Y(n17) );
  OAI22X1M U6 ( .A0(n2), .A1(n6), .B0(n1), .B1(n5), .Y(n19) );
  OAI22X1M U7 ( .A0(n2), .A1(n5), .B0(n1), .B1(n4), .Y(n21) );
  OAI22X1M U8 ( .A0(n2), .A1(n4), .B0(n1), .B1(n3), .Y(n23) );
  INVX2M U9 ( .A(n1), .Y(n2) );
  OAI2BB2X1M U10 ( .B0(n1), .B1(n9), .A0N(P_DATA[0]), .A1N(n1), .Y(n11) );
  OAI2BB2X1M U11 ( .B0(n2), .B1(n3), .A0N(sampled_bit), .A1N(n2), .Y(n25) );
  SDFFRX1M \P_DATA_reg[0]  ( .D(n11), .SI(edge_cnt[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[0]) );
  SDFFRX1M \P_DATA_reg[6]  ( .D(n23), .SI(n5), .SE(test_se), .CK(CLK), .RN(RST), .Q(P_DATA[6]), .QN(n4) );
  SDFFRX1M \P_DATA_reg[5]  ( .D(n21), .SI(n6), .SE(test_se), .CK(CLK), .RN(RST), .Q(P_DATA[5]), .QN(n5) );
  SDFFRX1M \P_DATA_reg[4]  ( .D(n19), .SI(n7), .SE(test_se), .CK(CLK), .RN(RST), .Q(P_DATA[4]), .QN(n6) );
  SDFFRX1M \P_DATA_reg[3]  ( .D(n17), .SI(n8), .SE(test_se), .CK(CLK), .RN(RST), .Q(P_DATA[3]), .QN(n7) );
  SDFFRX1M \P_DATA_reg[2]  ( .D(n15), .SI(n9), .SE(test_se), .CK(CLK), .RN(RST), .Q(P_DATA[2]), .QN(n8) );
  SDFFRX1M \P_DATA_reg[1]  ( .D(n13), .SI(P_DATA[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[1]), .QN(n9) );
  SDFFRX1M \P_DATA_reg[7]  ( .D(n25), .SI(n4), .SE(test_se), .CK(CLK), .RN(RST), .Q(P_DATA[7]), .QN(n3) );
endmodule


module edge_counter_test_1 ( CLK, RST, enable, bit_cnt, edge_cnt, test_si, 
        test_se );
  output [3:0] bit_cnt;
  output [2:0] edge_cnt;
  input CLK, RST, enable, test_si, test_se;
  wire   N13, N14, n11, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n9, n10, n12, n13, n14, n15, n28;

  SDFFRX1M \bit_cnt_reg[3]  ( .D(n25), .SI(n28), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(bit_cnt[3]), .QN(n11) );
  NOR3X2M U11 ( .A(n13), .B(n22), .C(n14), .Y(n18) );
  INVX2M U12 ( .A(enable), .Y(n13) );
  AOI21X2M U13 ( .A0(n14), .A1(enable), .B0(n22), .Y(n21) );
  INVX2M U14 ( .A(n22), .Y(n10) );
  AOI31X2M U15 ( .A0(edge_cnt[2]), .A1(edge_cnt[0]), .A2(edge_cnt[1]), .B0(n13), .Y(n22) );
  OAI21X2M U16 ( .A0(n16), .A1(n11), .B0(n17), .Y(n25) );
  NAND4X2M U17 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .C(n18), .D(n11), .Y(n17) );
  AOI21X2M U18 ( .A0(enable), .A1(n28), .B0(n19), .Y(n16) );
  INVX2M U19 ( .A(n20), .Y(n9) );
  AOI32X1M U20 ( .A0(bit_cnt[1]), .A1(n28), .A2(n18), .B0(n19), .B1(bit_cnt[2]), .Y(n20) );
  INVX2M U21 ( .A(n23), .Y(n12) );
  AOI32X1M U22 ( .A0(n22), .A1(edge_cnt[0]), .A2(edge_cnt[1]), .B0(edge_cnt[2]), .B1(n22), .Y(n23) );
  OAI32X1M U23 ( .A0(n13), .A1(bit_cnt[0]), .A2(n22), .B0(n14), .B1(n10), .Y(
        n27) );
  OAI21X2M U24 ( .A0(bit_cnt[1]), .A1(n13), .B0(n21), .Y(n19) );
  OAI2BB2X1M U25 ( .B0(n21), .B1(n15), .A0N(n15), .A1N(n18), .Y(n26) );
  NOR2X2M U27 ( .A(edge_cnt[0]), .B(n10), .Y(N13) );
  NOR2X2M U28 ( .A(n24), .B(n10), .Y(N14) );
  XNOR2X2M U29 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .Y(n24) );
  SDFFRX1M \edge_cnt_reg[1]  ( .D(N14), .SI(edge_cnt[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(edge_cnt[1]) );
  SDFFRX1M \edge_cnt_reg[0]  ( .D(N13), .SI(n11), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(edge_cnt[0]) );
  SDFFRX1M \edge_cnt_reg[2]  ( .D(n12), .SI(edge_cnt[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(edge_cnt[2]) );
  SDFFRX1M \bit_cnt_reg[0]  ( .D(n27), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(bit_cnt[0]), .QN(n14) );
  SDFFRX1M \bit_cnt_reg[1]  ( .D(n26), .SI(n14), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(bit_cnt[1]), .QN(n15) );
  SDFFRX1M \bit_cnt_reg[2]  ( .D(n9), .SI(n15), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(bit_cnt[2]), .QN(n28) );
endmodule


module data_sampling_test_1 ( CLK, RST, RX_in, edge_cnt, Perscale, dat_samp_en, 
        sampled_bit, test_si, test_so, test_se );
  input [2:0] edge_cnt;
  input [4:0] Perscale;
  input CLK, RST, RX_in, dat_samp_en, test_si, test_se;
  output sampled_bit, test_so;
  wire   N58, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n2, n3, n4, n5, n6, n11;
  wire   [2:0] sampled_mem;
  assign test_so = sampled_mem[2];

  SDFFRQX1M sampled_bit_reg ( .D(N58), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sampled_bit) );
  INVX2M U8 ( .A(dat_samp_en), .Y(n2) );
  NAND2X2M U9 ( .A(RX_in), .B(dat_samp_en), .Y(n17) );
  NOR2X2M U10 ( .A(n11), .B(n35), .Y(n36) );
  CLKXOR2X2M U11 ( .A(n23), .B(n24), .Y(n20) );
  NOR2X2M U12 ( .A(n25), .B(n26), .Y(n24) );
  INVX2M U13 ( .A(n25), .Y(n11) );
  OAI32X1M U14 ( .A0(n4), .A1(n6), .A2(n2), .B0(n17), .B1(n18), .Y(n42) );
  INVX2M U16 ( .A(n18), .Y(n6) );
  NAND4X2M U17 ( .A(n19), .B(n20), .C(n21), .D(n22), .Y(n18) );
  OAI32X1M U18 ( .A0(n3), .A1(n5), .A2(n2), .B0(n17), .B1(n27), .Y(n43) );
  INVX2M U20 ( .A(n27), .Y(n5) );
  NAND4BX1M U21 ( .AN(n21), .B(n28), .C(n23), .D(n29), .Y(n27) );
  OAI2BB2X1M U22 ( .B0(n31), .B1(n17), .A0N(n31), .A1N(sampled_mem[2]), .Y(n44) );
  AND2X2M U23 ( .A(n32), .B(dat_samp_en), .Y(n31) );
  NAND4BX1M U24 ( .AN(n22), .B(n33), .C(n34), .D(n21), .Y(n32) );
  CLKXOR2X2M U25 ( .A(n23), .B(n36), .Y(n33) );
  XNOR2X2M U26 ( .A(Perscale[1]), .B(edge_cnt[0]), .Y(n21) );
  XNOR2X2M U27 ( .A(n39), .B(edge_cnt[1]), .Y(n22) );
  NAND2X2M U28 ( .A(n35), .B(n26), .Y(n39) );
  XOR3XLM U29 ( .A(n26), .B(edge_cnt[2]), .C(n25), .Y(n19) );
  XOR3XLM U30 ( .A(edge_cnt[2]), .B(n35), .C(n25), .Y(n34) );
  AOI21X2M U31 ( .A0(n40), .A1(n41), .B0(n2), .Y(N58) );
  NAND2X2M U32 ( .A(sampled_mem[1]), .B(sampled_mem[0]), .Y(n40) );
  OAI21X2M U33 ( .A0(sampled_mem[0]), .A1(sampled_mem[1]), .B0(sampled_mem[2]), 
        .Y(n41) );
  CLKXOR2X2M U34 ( .A(n11), .B(edge_cnt[2]), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_cnt[1]), .B(n30), .Y(n29) );
  AOI21X2M U36 ( .A0(Perscale[1]), .A1(Perscale[2]), .B0(n37), .Y(n30) );
  NOR2X2M U37 ( .A(Perscale[2]), .B(Perscale[1]), .Y(n37) );
  NAND2X2M U38 ( .A(n30), .B(Perscale[1]), .Y(n26) );
  CLKXOR2X2M U39 ( .A(n37), .B(Perscale[3]), .Y(n25) );
  OR2X2M U40 ( .A(Perscale[1]), .B(n30), .Y(n35) );
  CLKXOR2X2M U41 ( .A(n38), .B(Perscale[4]), .Y(n23) );
  NAND2BX2M U42 ( .AN(Perscale[3]), .B(n37), .Y(n38) );
  SDFFRX1M \sampled_mem_reg[1]  ( .D(n43), .SI(n4), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sampled_mem[1]), .QN(n3) );
  SDFFRX1M \sampled_mem_reg[0]  ( .D(n42), .SI(sampled_bit), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(sampled_mem[0]), .QN(n4) );
  SDFFRX1M \sampled_mem_reg[2]  ( .D(n44), .SI(n3), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sampled_mem[2]) );
endmodule


module uart_rx_fsm_test_1 ( CLK, RST, RX_in, PAR_EN, bit_cnt, edge_cnt, 
        par_err, stp_err, strt_glitch, strt_chk_en, edge_bit_en, deser_en, 
        par_chk_en, stp_chk_en, dat_samp_en, data_valid, test_si, test_so, 
        test_se );
  input [3:0] bit_cnt;
  input [2:0] edge_cnt;
  input CLK, RST, RX_in, PAR_EN, par_err, stp_err, strt_glitch, test_si,
         test_se;
  output strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
         dat_samp_en, data_valid, test_so;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n4, n5, n6, n7, n8, n9, n10;
  wire   [2:0] CS;
  wire   [2:0] NS;
  assign test_so = n6;

  NAND2X2M U6 ( .A(n7), .B(n16), .Y(dat_samp_en) );
  NAND2X2M U7 ( .A(n5), .B(n7), .Y(n12) );
  INVX2M U8 ( .A(n16), .Y(n5) );
  OAI211X2M U9 ( .A0(RX_in), .A1(CS[2]), .B0(n15), .C0(n16), .Y(edge_bit_en)
         );
  OAI211X2M U10 ( .A0(RX_in), .A1(n24), .B0(n25), .C0(n26), .Y(NS[0]) );
  AOI31X2M U11 ( .A0(n7), .A1(n6), .A2(n4), .B0(data_valid), .Y(n24) );
  AOI21X2M U12 ( .A0(deser_en), .A1(n19), .B0(n27), .Y(n26) );
  AOI33X2M U13 ( .A0(CS[2]), .A1(CS[1]), .A2(n29), .B0(n13), .B1(n8), .B2(
        edge_cnt[1]), .Y(n25) );
  NOR3BX2M U14 ( .AN(n13), .B(n8), .C(edge_cnt[1]), .Y(stp_chk_en) );
  NOR4BX1M U15 ( .AN(edge_cnt[2]), .B(n10), .C(n15), .D(bit_cnt[2]), .Y(n21)
         );
  NOR4BX1M U16 ( .AN(n21), .B(n9), .C(n6), .D(bit_cnt[0]), .Y(n13) );
  NOR3X2M U17 ( .A(n14), .B(edge_cnt[0]), .C(CS[2]), .Y(par_chk_en) );
  NAND4X2M U18 ( .A(edge_cnt[1]), .B(bit_cnt[0]), .C(n21), .D(n9), .Y(n14) );
  NAND2X2M U19 ( .A(CS[0]), .B(n6), .Y(n16) );
  NAND2X2M U20 ( .A(CS[1]), .B(n4), .Y(n15) );
  INVX2M U23 ( .A(bit_cnt[3]), .Y(n10) );
  INVX2M U24 ( .A(n18), .Y(deser_en) );
  AOI31X2M U25 ( .A0(n23), .A1(n10), .A2(strt_glitch), .B0(n12), .Y(n27) );
  NOR3X2M U26 ( .A(n4), .B(CS[1]), .C(n6), .Y(data_valid) );
  NOR3X2M U27 ( .A(n4), .B(stp_err), .C(par_err), .Y(n29) );
  OAI211X2M U28 ( .A0(CS[2]), .A1(n7), .B0(n22), .C0(n15), .Y(NS[1]) );
  NAND4BX1M U29 ( .AN(strt_glitch), .B(n23), .C(n5), .D(n10), .Y(n22) );
  NAND2X2M U30 ( .A(CS[1]), .B(n5), .Y(n18) );
  OAI21BX1M U31 ( .A0(n8), .A1(n14), .B0N(n17), .Y(NS[2]) );
  OAI33X2M U32 ( .A0(n18), .A1(PAR_EN), .A2(n19), .B0(n6), .B1(n20), .B2(n7), 
        .Y(n17) );
  AOI2BB1X2M U33 ( .A0N(par_err), .A1N(stp_err), .B0(n4), .Y(n20) );
  AND4X2M U34 ( .A(edge_cnt[0]), .B(edge_cnt[2]), .C(edge_cnt[1]), .D(n28), 
        .Y(n23) );
  NOR3X2M U35 ( .A(bit_cnt[0]), .B(bit_cnt[2]), .C(bit_cnt[1]), .Y(n28) );
  INVX2M U37 ( .A(edge_cnt[0]), .Y(n8) );
  INVX2M U38 ( .A(bit_cnt[1]), .Y(n9) );
  NAND2X2M U39 ( .A(n23), .B(bit_cnt[3]), .Y(n19) );
  INVX2M U40 ( .A(n12), .Y(strt_chk_en) );
  SDFFRX1M \CS_reg[1]  ( .D(NS[1]), .SI(n4), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(CS[1]), .QN(n7) );
  SDFFRX1M \CS_reg[2]  ( .D(NS[2]), .SI(n7), .SE(test_se), .CK(CLK), .RN(RST), 
        .Q(CS[2]), .QN(n6) );
  SDFFRX1M \CS_reg[0]  ( .D(NS[0]), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(CS[0]), .QN(n4) );
endmodule


module UART_RX_test_1 ( CLK, RST, RX_IN, Prescale, PAR_EN, PAR_TYP, P_DATA, 
        parity_error, framing_error, data_valid, test_si2, test_si1, test_so1, 
        test_se );
  input [4:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, PAR_EN, PAR_TYP, test_si2, test_si1, test_se;
  output parity_error, framing_error, data_valid, test_so1;
  wire   strt_chk_en, sampled_bit, strt_glitch, par_chk_en, stp_chk_en,
         deser_en, edge_bit_en, dat_samp_en, n1, n2, n3, n4, n5;
  wire   [2:0] edge_count;
  wire   [3:0] bit_count;
  assign test_so1 = strt_glitch;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  STRT_CHECK_test_1 start_check ( .strt_chk_en(strt_chk_en), .sampled_bit(
        sampled_bit), .CLK(CLK), .RST(n1), .strt_glitch(strt_glitch), 
        .test_si(n3), .test_se(test_se) );
  Parity_Check_test_1 U0_parity_check ( .PAR_TYP(PAR_TYP), .par_chk_en(
        par_chk_en), .sampled_bit(sampled_bit), .P_DATA(P_DATA), .CLK(CLK), 
        .RST(n1), .par_err(parity_error), .test_si(test_si1), .test_se(test_se) );
  STOP_CHECK_test_1 U0_stop_check ( .stp_chk_en(stp_chk_en), .sampled_bit(
        sampled_bit), .CLK(CLK), .RST(n1), .stp_err(framing_error), .test_si(
        test_si2), .test_se(test_se) );
  DeSerializer_test_1 deserializer ( .deser_en(deser_en), .sampled_bit(
        sampled_bit), .CLK(CLK), .RST(n1), .edge_cnt(edge_count), .P_DATA(
        P_DATA), .test_so(n5), .test_se(test_se) );
  edge_counter_test_1 counter ( .CLK(CLK), .RST(n1), .enable(edge_bit_en), 
        .bit_cnt(bit_count), .edge_cnt(edge_count), .test_si(parity_error), 
        .test_se(test_se) );
  data_sampling_test_1 oversampling ( .CLK(CLK), .RST(n1), .RX_in(RX_IN), 
        .edge_cnt(edge_count), .Perscale(Prescale), .dat_samp_en(dat_samp_en), 
        .sampled_bit(sampled_bit), .test_si(n5), .test_so(n4), .test_se(
        test_se) );
  uart_rx_fsm_test_1 rx_fsm ( .CLK(CLK), .RST(n1), .RX_in(RX_IN), .PAR_EN(
        PAR_EN), .bit_cnt(bit_count), .edge_cnt(edge_count), .par_err(
        parity_error), .stp_err(framing_error), .strt_glitch(strt_glitch), 
        .strt_chk_en(strt_chk_en), .edge_bit_en(edge_bit_en), .deser_en(
        deser_en), .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), 
        .dat_samp_en(dat_samp_en), .data_valid(data_valid), .test_si(n4), 
        .test_so(n3), .test_se(test_se) );
endmodule


module UART_test_1 ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error, test_si2, test_si1, test_so1, test_se );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [4:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type,
         test_si2, test_si1, test_se;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error, test_so1;
  wire   n1, n2, n4;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  TOP_TX_test_1 U0_uarttx ( .P_DATA(TX_IN_P), .Data_valid(TX_IN_V), .CLK(
        TX_CLK), .RST(n1), .PAR_EN(parity_enable), .PAR_TYP(parity_type), 
        .TX_OUT(TX_OUT_S), .Busy(TX_OUT_V), .test_si(n4), .test_so(test_so1), 
        .test_se(test_se) );
  UART_RX_test_1 U0_UART_RX ( .CLK(RX_CLK), .RST(n1), .RX_IN(RX_IN_S), 
        .Prescale(Prescale), .PAR_EN(parity_enable), .PAR_TYP(parity_type), 
        .P_DATA(RX_OUT_P), .parity_error(parity_error), .framing_error(
        framing_error), .data_valid(RX_OUT_V), .test_si2(test_si2), .test_si1(
        test_si1), .test_so1(n4), .test_se(test_se) );
endmodule


module RegFile_test_1 ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, 
        RdData_VLD, REG0, REG1, REG2, REG3, test_si2, test_si1, test_so2, 
        test_so1, test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn, test_si2, test_si1, test_se;
  output RdData_VLD, test_so2, test_so1;
  wire   N11, N12, N13, N14, \regArr[15][7] , \regArr[15][6] , \regArr[15][5] ,
         \regArr[15][4] , \regArr[15][3] , \regArr[15][2] , \regArr[15][1] ,
         \regArr[15][0] , \regArr[14][7] , \regArr[14][6] , \regArr[14][5] ,
         \regArr[14][4] , \regArr[14][3] , \regArr[14][2] , \regArr[14][1] ,
         \regArr[14][0] , \regArr[13][7] , \regArr[13][6] , \regArr[13][5] ,
         \regArr[13][4] , \regArr[13][3] , \regArr[13][2] , \regArr[13][1] ,
         \regArr[13][0] , \regArr[12][7] , \regArr[12][6] , \regArr[12][5] ,
         \regArr[12][4] , \regArr[12][3] , \regArr[12][2] , \regArr[12][1] ,
         \regArr[12][0] , \regArr[11][7] , \regArr[11][6] , \regArr[11][5] ,
         \regArr[11][4] , \regArr[11][3] , \regArr[11][2] , \regArr[11][1] ,
         \regArr[11][0] , \regArr[10][7] , \regArr[10][6] , \regArr[10][5] ,
         \regArr[10][4] , \regArr[10][3] , \regArr[10][2] , \regArr[10][1] ,
         \regArr[10][0] , \regArr[9][7] , \regArr[9][6] , \regArr[9][5] ,
         \regArr[9][4] , \regArr[9][3] , \regArr[9][2] , \regArr[9][1] ,
         \regArr[9][0] , \regArr[8][7] , \regArr[8][6] , \regArr[8][5] ,
         \regArr[8][4] , \regArr[8][3] , \regArr[8][2] , \regArr[8][1] ,
         \regArr[8][0] , \regArr[7][7] , \regArr[7][6] , \regArr[7][5] ,
         \regArr[7][4] , \regArr[7][3] , \regArr[7][2] , \regArr[7][1] ,
         \regArr[7][0] , \regArr[6][7] , \regArr[6][6] , \regArr[6][5] ,
         \regArr[6][4] , \regArr[6][3] , \regArr[6][2] , \regArr[6][1] ,
         \regArr[6][0] , \regArr[5][7] , \regArr[5][6] , \regArr[5][5] ,
         \regArr[5][4] , \regArr[5][3] , \regArr[5][2] , \regArr[5][1] ,
         \regArr[5][0] , \regArr[4][7] , \regArr[4][6] , \regArr[4][5] ,
         \regArr[4][4] , \regArr[4][3] , \regArr[4][2] , \regArr[4][1] ,
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n367, n368;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so2 = \regArr[15][7] ;
  assign test_so1 = \regArr[7][4] ;

  SDFFRQX2M \RdData_reg[7]  ( .D(n186), .SI(RdData[6]), .SE(test_se), .CK(CLK), 
        .RN(n343), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n185), .SI(RdData[5]), .SE(test_se), .CK(CLK), 
        .RN(n343), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n184), .SI(RdData[4]), .SE(test_se), .CK(CLK), 
        .RN(n343), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n183), .SI(RdData[3]), .SE(test_se), .CK(CLK), 
        .RN(n343), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n182), .SI(RdData[2]), .SE(test_se), .CK(CLK), 
        .RN(n343), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n181), .SI(RdData[1]), .SE(test_se), .CK(CLK), 
        .RN(n343), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n180), .SI(RdData[0]), .SE(test_se), .CK(CLK), 
        .RN(n343), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n179), .SI(RdData_VLD), .SE(test_se), .CK(CLK), .RN(n347), .Q(RdData[0]) );
  SDFFRQX2M \regArr_reg[13][7]  ( .D(n299), .SI(\regArr[13][6] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[13][7] ) );
  SDFFRQX2M \regArr_reg[13][6]  ( .D(n298), .SI(\regArr[13][5] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[13][6] ) );
  SDFFRQX2M \regArr_reg[13][5]  ( .D(n297), .SI(\regArr[13][4] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[13][5] ) );
  SDFFRQX2M \regArr_reg[13][4]  ( .D(n296), .SI(\regArr[13][3] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[13][4] ) );
  SDFFRQX2M \regArr_reg[13][3]  ( .D(n295), .SI(\regArr[13][2] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[13][3] ) );
  SDFFRQX2M \regArr_reg[13][2]  ( .D(n294), .SI(\regArr[13][1] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[13][2] ) );
  SDFFRQX2M \regArr_reg[13][1]  ( .D(n293), .SI(\regArr[13][0] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[13][1] ) );
  SDFFRQX2M \regArr_reg[13][0]  ( .D(n292), .SI(\regArr[12][7] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[13][0] ) );
  SDFFRQX2M \regArr_reg[9][7]  ( .D(n267), .SI(\regArr[9][6] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[9][7] ) );
  SDFFRQX2M \regArr_reg[9][6]  ( .D(n266), .SI(\regArr[9][5] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[9][6] ) );
  SDFFRQX2M \regArr_reg[9][5]  ( .D(n265), .SI(\regArr[9][4] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[9][5] ) );
  SDFFRQX2M \regArr_reg[9][4]  ( .D(n264), .SI(\regArr[9][3] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[9][4] ) );
  SDFFRQX2M \regArr_reg[9][3]  ( .D(n263), .SI(\regArr[9][2] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[9][3] ) );
  SDFFRQX2M \regArr_reg[9][2]  ( .D(n262), .SI(\regArr[9][1] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[9][2] ) );
  SDFFRQX2M \regArr_reg[9][1]  ( .D(n261), .SI(\regArr[9][0] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[9][1] ) );
  SDFFRQX2M \regArr_reg[9][0]  ( .D(n260), .SI(\regArr[8][7] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[9][0] ) );
  SDFFRQX2M \regArr_reg[5][7]  ( .D(n235), .SI(\regArr[5][6] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[5][7] ) );
  SDFFRQX2M \regArr_reg[5][6]  ( .D(n234), .SI(\regArr[5][5] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[5][6] ) );
  SDFFRQX2M \regArr_reg[5][5]  ( .D(n233), .SI(\regArr[5][4] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][5] ) );
  SDFFRQX2M \regArr_reg[5][4]  ( .D(n232), .SI(\regArr[5][3] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][4] ) );
  SDFFRQX2M \regArr_reg[5][3]  ( .D(n231), .SI(\regArr[5][2] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][3] ) );
  SDFFRQX2M \regArr_reg[5][2]  ( .D(n230), .SI(\regArr[5][1] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][2] ) );
  SDFFRQX2M \regArr_reg[5][1]  ( .D(n229), .SI(\regArr[5][0] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][1] ) );
  SDFFRQX2M \regArr_reg[5][0]  ( .D(n228), .SI(\regArr[4][7] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[5][0] ) );
  SDFFRQX2M \regArr_reg[15][7]  ( .D(n315), .SI(\regArr[15][6] ), .SE(test_se), 
        .CK(CLK), .RN(n343), .Q(\regArr[15][7] ) );
  SDFFRQX2M \regArr_reg[15][6]  ( .D(n314), .SI(\regArr[15][5] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[15][6] ) );
  SDFFRQX2M \regArr_reg[15][5]  ( .D(n313), .SI(\regArr[15][4] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[15][5] ) );
  SDFFRQX2M \regArr_reg[15][4]  ( .D(n312), .SI(\regArr[15][3] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[15][4] ) );
  SDFFRQX2M \regArr_reg[15][3]  ( .D(n311), .SI(\regArr[15][2] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[15][3] ) );
  SDFFRQX2M \regArr_reg[15][2]  ( .D(n310), .SI(\regArr[15][1] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[15][2] ) );
  SDFFRQX2M \regArr_reg[15][1]  ( .D(n309), .SI(\regArr[15][0] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[15][1] ) );
  SDFFRQX2M \regArr_reg[15][0]  ( .D(n308), .SI(\regArr[14][7] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[15][0] ) );
  SDFFRQX2M \regArr_reg[11][7]  ( .D(n283), .SI(\regArr[11][6] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[11][7] ) );
  SDFFRQX2M \regArr_reg[11][6]  ( .D(n282), .SI(\regArr[11][5] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[11][6] ) );
  SDFFRQX2M \regArr_reg[11][5]  ( .D(n281), .SI(\regArr[11][4] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[11][5] ) );
  SDFFRQX2M \regArr_reg[11][4]  ( .D(n280), .SI(\regArr[11][3] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[11][4] ) );
  SDFFRQX2M \regArr_reg[11][3]  ( .D(n279), .SI(\regArr[11][2] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[11][3] ) );
  SDFFRQX2M \regArr_reg[11][2]  ( .D(n278), .SI(\regArr[11][1] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[11][2] ) );
  SDFFRQX2M \regArr_reg[11][1]  ( .D(n277), .SI(\regArr[11][0] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[11][1] ) );
  SDFFRQX2M \regArr_reg[11][0]  ( .D(n276), .SI(\regArr[10][7] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[11][0] ) );
  SDFFRQX2M \regArr_reg[7][7]  ( .D(n251), .SI(\regArr[7][6] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[7][7] ) );
  SDFFRQX2M \regArr_reg[7][6]  ( .D(n250), .SI(\regArr[7][5] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[7][6] ) );
  SDFFRQX2M \regArr_reg[7][5]  ( .D(n249), .SI(test_si2), .SE(test_se), .CK(
        CLK), .RN(n348), .Q(\regArr[7][5] ) );
  SDFFRQX2M \regArr_reg[7][4]  ( .D(n248), .SI(\regArr[7][3] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[7][4] ) );
  SDFFRQX2M \regArr_reg[7][3]  ( .D(n247), .SI(\regArr[7][2] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[7][3] ) );
  SDFFRQX2M \regArr_reg[7][2]  ( .D(n246), .SI(\regArr[7][1] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][2] ) );
  SDFFRQX2M \regArr_reg[7][1]  ( .D(n245), .SI(\regArr[7][0] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][1] ) );
  SDFFRQX2M \regArr_reg[7][0]  ( .D(n244), .SI(\regArr[6][7] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[7][0] ) );
  SDFFRQX2M \regArr_reg[3][7]  ( .D(n219), .SI(REG3[6]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG3[7]) );
  SDFFRQX2M \regArr_reg[3][6]  ( .D(n218), .SI(REG3[5]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG3[6]) );
  SDFFRQX2M \regArr_reg[3][5]  ( .D(n217), .SI(REG3[4]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG3[5]) );
  SDFFRQX2M \regArr_reg[3][4]  ( .D(n216), .SI(REG3[3]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG3[4]) );
  SDFFRQX2M \regArr_reg[14][7]  ( .D(n307), .SI(\regArr[14][6] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[14][7] ) );
  SDFFRQX2M \regArr_reg[14][6]  ( .D(n306), .SI(\regArr[14][5] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[14][6] ) );
  SDFFRQX2M \regArr_reg[14][5]  ( .D(n305), .SI(\regArr[14][4] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[14][5] ) );
  SDFFRQX2M \regArr_reg[14][4]  ( .D(n304), .SI(\regArr[14][3] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[14][4] ) );
  SDFFRQX2M \regArr_reg[14][3]  ( .D(n303), .SI(\regArr[14][2] ), .SE(test_se), 
        .CK(CLK), .RN(n352), .Q(\regArr[14][3] ) );
  SDFFRQX2M \regArr_reg[14][2]  ( .D(n302), .SI(\regArr[14][1] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][2] ) );
  SDFFRQX2M \regArr_reg[14][1]  ( .D(n301), .SI(\regArr[14][0] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][1] ) );
  SDFFRQX2M \regArr_reg[14][0]  ( .D(n300), .SI(\regArr[13][7] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[14][0] ) );
  SDFFRQX2M \regArr_reg[10][7]  ( .D(n275), .SI(\regArr[10][6] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[10][7] ) );
  SDFFRQX2M \regArr_reg[10][6]  ( .D(n274), .SI(\regArr[10][5] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[10][6] ) );
  SDFFRQX2M \regArr_reg[10][5]  ( .D(n273), .SI(\regArr[10][4] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[10][5] ) );
  SDFFRQX2M \regArr_reg[10][4]  ( .D(n272), .SI(\regArr[10][3] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[10][4] ) );
  SDFFRQX2M \regArr_reg[10][3]  ( .D(n271), .SI(\regArr[10][2] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[10][3] ) );
  SDFFRQX2M \regArr_reg[10][2]  ( .D(n270), .SI(\regArr[10][1] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[10][2] ) );
  SDFFRQX2M \regArr_reg[10][1]  ( .D(n269), .SI(\regArr[10][0] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[10][1] ) );
  SDFFRQX2M \regArr_reg[10][0]  ( .D(n268), .SI(\regArr[9][7] ), .SE(test_se), 
        .CK(CLK), .RN(n349), .Q(\regArr[10][0] ) );
  SDFFRQX2M \regArr_reg[6][7]  ( .D(n243), .SI(\regArr[6][6] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[6][7] ) );
  SDFFRQX2M \regArr_reg[6][6]  ( .D(n242), .SI(\regArr[6][5] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[6][6] ) );
  SDFFRQX2M \regArr_reg[6][5]  ( .D(n241), .SI(\regArr[6][4] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[6][5] ) );
  SDFFRQX2M \regArr_reg[6][4]  ( .D(n240), .SI(\regArr[6][3] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[6][4] ) );
  SDFFRQX2M \regArr_reg[6][3]  ( .D(n239), .SI(\regArr[6][2] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[6][3] ) );
  SDFFRQX2M \regArr_reg[6][2]  ( .D(n238), .SI(\regArr[6][1] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[6][2] ) );
  SDFFRQX2M \regArr_reg[6][1]  ( .D(n237), .SI(\regArr[6][0] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[6][1] ) );
  SDFFRQX2M \regArr_reg[6][0]  ( .D(n236), .SI(\regArr[5][7] ), .SE(test_se), 
        .CK(CLK), .RN(n347), .Q(\regArr[6][0] ) );
  SDFFRQX2M \regArr_reg[2][7]  ( .D(n211), .SI(REG2[6]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG2[7]) );
  SDFFRQX2M \regArr_reg[2][2]  ( .D(n206), .SI(REG2[1]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG2[2]) );
  SDFFRQX2M \regArr_reg[12][7]  ( .D(n291), .SI(\regArr[12][6] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[12][7] ) );
  SDFFRQX2M \regArr_reg[12][6]  ( .D(n290), .SI(\regArr[12][5] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[12][6] ) );
  SDFFRQX2M \regArr_reg[12][5]  ( .D(n289), .SI(\regArr[12][4] ), .SE(test_se), 
        .CK(CLK), .RN(n351), .Q(\regArr[12][5] ) );
  SDFFRQX2M \regArr_reg[12][4]  ( .D(n288), .SI(\regArr[12][3] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][4] ) );
  SDFFRQX2M \regArr_reg[12][3]  ( .D(n287), .SI(\regArr[12][2] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][3] ) );
  SDFFRQX2M \regArr_reg[12][2]  ( .D(n286), .SI(\regArr[12][1] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][2] ) );
  SDFFRQX2M \regArr_reg[12][1]  ( .D(n285), .SI(\regArr[12][0] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][1] ) );
  SDFFRQX2M \regArr_reg[12][0]  ( .D(n284), .SI(\regArr[11][7] ), .SE(test_se), 
        .CK(CLK), .RN(n350), .Q(\regArr[12][0] ) );
  SDFFRQX2M \regArr_reg[8][7]  ( .D(n259), .SI(\regArr[8][6] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[8][7] ) );
  SDFFRQX2M \regArr_reg[8][6]  ( .D(n258), .SI(\regArr[8][5] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[8][6] ) );
  SDFFRQX2M \regArr_reg[8][5]  ( .D(n257), .SI(\regArr[8][4] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[8][5] ) );
  SDFFRQX2M \regArr_reg[8][4]  ( .D(n256), .SI(\regArr[8][3] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[8][4] ) );
  SDFFRQX2M \regArr_reg[8][3]  ( .D(n255), .SI(\regArr[8][2] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[8][3] ) );
  SDFFRQX2M \regArr_reg[8][2]  ( .D(n254), .SI(\regArr[8][1] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[8][2] ) );
  SDFFRQX2M \regArr_reg[8][1]  ( .D(n253), .SI(\regArr[8][0] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[8][1] ) );
  SDFFRQX2M \regArr_reg[8][0]  ( .D(n252), .SI(\regArr[7][7] ), .SE(test_se), 
        .CK(CLK), .RN(n348), .Q(\regArr[8][0] ) );
  SDFFRQX2M \regArr_reg[4][7]  ( .D(n227), .SI(\regArr[4][6] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[4][7] ) );
  SDFFRQX2M \regArr_reg[4][6]  ( .D(n226), .SI(\regArr[4][5] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[4][6] ) );
  SDFFRQX2M \regArr_reg[4][5]  ( .D(n225), .SI(\regArr[4][4] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[4][5] ) );
  SDFFRQX2M \regArr_reg[4][4]  ( .D(n224), .SI(\regArr[4][3] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[4][4] ) );
  SDFFRQX2M \regArr_reg[4][3]  ( .D(n223), .SI(\regArr[4][2] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[4][3] ) );
  SDFFRQX2M \regArr_reg[4][2]  ( .D(n222), .SI(\regArr[4][1] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[4][2] ) );
  SDFFRQX2M \regArr_reg[4][1]  ( .D(n221), .SI(\regArr[4][0] ), .SE(test_se), 
        .CK(CLK), .RN(n346), .Q(\regArr[4][1] ) );
  SDFFRQX2M \regArr_reg[4][0]  ( .D(n220), .SI(REG3[7]), .SE(test_se), .CK(CLK), .RN(n346), .Q(\regArr[4][0] ) );
  SDFFSQX2M \regArr_reg[2][0]  ( .D(n204), .SI(REG1[7]), .SE(test_se), .CK(CLK), .SN(n343), .Q(REG2[0]) );
  SDFFRQX2M \regArr_reg[2][6]  ( .D(n210), .SI(REG2[5]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG2[6]) );
  SDFFRQX2M \regArr_reg[2][1]  ( .D(n205), .SI(REG2[0]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG2[1]) );
  SDFFRQX2M \regArr_reg[3][1]  ( .D(n213), .SI(REG3[0]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG3[1]) );
  SDFFRQX2M \regArr_reg[3][0]  ( .D(n212), .SI(REG2[7]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG3[0]) );
  SDFFRQX2M \regArr_reg[2][4]  ( .D(n208), .SI(REG2[3]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG2[4]) );
  SDFFRQX2M \regArr_reg[3][2]  ( .D(n214), .SI(REG3[1]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG3[2]) );
  SDFFSQX2M \regArr_reg[3][3]  ( .D(n215), .SI(REG3[2]), .SE(test_se), .CK(CLK), .SN(n343), .Q(REG3[3]) );
  SDFFRQX2M RdData_VLD_reg ( .D(n187), .SI(test_si1), .SE(test_se), .CK(CLK), 
        .RN(n343), .Q(RdData_VLD) );
  SDFFRQX2M \regArr_reg[2][3]  ( .D(n207), .SI(REG2[2]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG2[3]) );
  SDFFRQX2M \regArr_reg[0][1]  ( .D(n189), .SI(REG0[0]), .SE(test_se), .CK(CLK), .RN(n343), .Q(REG0[1]) );
  SDFFRQX2M \regArr_reg[0][0]  ( .D(n188), .SI(RdData[7]), .SE(test_se), .CK(
        CLK), .RN(n344), .Q(REG0[0]) );
  SDFFRQX2M \regArr_reg[0][2]  ( .D(n190), .SI(REG0[1]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG0[2]) );
  SDFFRQX2M \regArr_reg[0][3]  ( .D(n191), .SI(REG0[2]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG0[3]) );
  SDFFRQX2M \regArr_reg[0][4]  ( .D(n192), .SI(REG0[3]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG0[4]) );
  SDFFRQX2M \regArr_reg[0][5]  ( .D(n193), .SI(REG0[4]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG0[5]) );
  SDFFRQX2M \regArr_reg[0][7]  ( .D(n195), .SI(REG0[6]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG0[7]) );
  SDFFRQX2M \regArr_reg[0][6]  ( .D(n194), .SI(REG0[5]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG0[6]) );
  SDFFRQX2M \regArr_reg[1][1]  ( .D(n197), .SI(REG1[0]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG1[1]) );
  SDFFRQX2M \regArr_reg[1][6]  ( .D(n202), .SI(REG1[5]), .SE(test_se), .CK(CLK), .RN(n345), .Q(REG1[6]) );
  SDFFRQX2M \regArr_reg[1][5]  ( .D(n201), .SI(REG1[4]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG1[5]) );
  SDFFRQX2M \regArr_reg[1][4]  ( .D(n200), .SI(REG1[3]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG1[4]) );
  SDFFRQX2M \regArr_reg[1][7]  ( .D(n203), .SI(REG1[6]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG1[7]) );
  SDFFRQX2M \regArr_reg[1][3]  ( .D(n199), .SI(REG1[2]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG1[3]) );
  SDFFRQX2M \regArr_reg[1][2]  ( .D(n198), .SI(REG1[1]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG1[2]) );
  SDFFRQX2M \regArr_reg[1][0]  ( .D(n196), .SI(REG0[7]), .SE(test_se), .CK(CLK), .RN(n344), .Q(REG1[0]) );
  SDFFSQX1M \regArr_reg[2][5]  ( .D(n209), .SI(REG2[4]), .SE(test_se), .CK(CLK), .SN(RST), .Q(REG2[5]) );
  NOR2X2M U141 ( .A(n342), .B(N13), .Y(n166) );
  NOR2X2M U142 ( .A(n337), .B(N13), .Y(n161) );
  NOR2X2M U143 ( .A(n342), .B(n368), .Y(n155) );
  INVX2M U144 ( .A(n338), .Y(n339) );
  INVX2M U145 ( .A(n336), .Y(n337) );
  INVX2M U146 ( .A(n338), .Y(n340) );
  BUFX2M U147 ( .A(n341), .Y(n338) );
  NAND2X2M U148 ( .A(n164), .B(n152), .Y(n169) );
  NAND2X2M U149 ( .A(n152), .B(n153), .Y(n151) );
  BUFX2M U150 ( .A(n342), .Y(n336) );
  NAND2X2M U151 ( .A(n166), .B(n162), .Y(n165) );
  NAND2X2M U152 ( .A(n166), .B(n164), .Y(n167) );
  AND2X2M U153 ( .A(n171), .B(N11), .Y(n164) );
  NOR2X2M U154 ( .A(n368), .B(n337), .Y(n152) );
  NAND2X2M U155 ( .A(n161), .B(n162), .Y(n160) );
  NAND2X2M U156 ( .A(n161), .B(n156), .Y(n173) );
  NAND2X2M U157 ( .A(n161), .B(n153), .Y(n174) );
  NAND2X2M U158 ( .A(n166), .B(n156), .Y(n175) );
  NAND2X2M U159 ( .A(n166), .B(n153), .Y(n176) );
  NAND2X2M U160 ( .A(n155), .B(n156), .Y(n154) );
  NAND2X2M U161 ( .A(n155), .B(n153), .Y(n157) );
  NAND2X2M U162 ( .A(n164), .B(n161), .Y(n163) );
  NAND2X2M U163 ( .A(n162), .B(n152), .Y(n168) );
  NAND2X2M U164 ( .A(n162), .B(n155), .Y(n170) );
  NAND2X2M U165 ( .A(n164), .B(n155), .Y(n172) );
  NAND2X2M U166 ( .A(n156), .B(n152), .Y(n178) );
  AND2X2M U167 ( .A(n177), .B(N11), .Y(n153) );
  INVX2M U168 ( .A(n158), .Y(n366) );
  BUFX2M U169 ( .A(n357), .Y(n344) );
  BUFX2M U170 ( .A(n356), .Y(n345) );
  BUFX2M U171 ( .A(n356), .Y(n346) );
  BUFX2M U172 ( .A(n355), .Y(n347) );
  BUFX2M U173 ( .A(n355), .Y(n348) );
  BUFX2M U174 ( .A(n354), .Y(n349) );
  BUFX2M U175 ( .A(n354), .Y(n350) );
  BUFX2M U176 ( .A(n353), .Y(n351) );
  BUFX2M U177 ( .A(n357), .Y(n343) );
  BUFX2M U178 ( .A(n353), .Y(n352) );
  NOR2X2M U179 ( .A(n367), .B(RdEn), .Y(n159) );
  AND2X2M U180 ( .A(n171), .B(n341), .Y(n162) );
  NOR2BX2M U181 ( .AN(n159), .B(N14), .Y(n171) );
  INVX2M U182 ( .A(WrEn), .Y(n367) );
  INVX2M U183 ( .A(WrData[4]), .Y(n362) );
  INVX2M U184 ( .A(WrData[7]), .Y(n365) );
  INVX2M U185 ( .A(WrData[3]), .Y(n361) );
  INVX2M U186 ( .A(WrData[1]), .Y(n359) );
  INVX2M U187 ( .A(WrData[2]), .Y(n360) );
  NAND2X2M U188 ( .A(RdEn), .B(n367), .Y(n158) );
  INVX2M U189 ( .A(WrData[0]), .Y(n358) );
  AND2X2M U190 ( .A(n177), .B(n341), .Y(n156) );
  INVX2M U191 ( .A(N13), .Y(n368) );
  AND2X2M U192 ( .A(N14), .B(n159), .Y(n177) );
  BUFX2M U193 ( .A(RST), .Y(n356) );
  BUFX2M U194 ( .A(RST), .Y(n355) );
  BUFX2M U195 ( .A(RST), .Y(n354) );
  BUFX2M U196 ( .A(RST), .Y(n353) );
  BUFX2M U197 ( .A(RST), .Y(n357) );
  OAI2BB2X1M U198 ( .B0(n358), .B1(n165), .A0N(REG2[0]), .A1N(n165), .Y(n204)
         );
  OAI2BB2X1M U199 ( .B0(n363), .B1(n165), .A0N(REG2[5]), .A1N(n165), .Y(n209)
         );
  OAI2BB2X1M U200 ( .B0(n361), .B1(n167), .A0N(REG3[3]), .A1N(n167), .Y(n215)
         );
  AO22X1M U201 ( .A0(N43), .A1(n366), .B0(RdData[0]), .B1(n158), .Y(n179) );
  MX4X1M U202 ( .A(n142), .B(n140), .C(n141), .D(n139), .S0(N14), .S1(N13), 
        .Y(N43) );
  MX4X1M U203 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n337), .Y(n142) );
  MX4X1M U204 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(n337), .Y(n140) );
  AO22X1M U205 ( .A0(N42), .A1(n366), .B0(RdData[1]), .B1(n158), .Y(n180) );
  MX4X1M U206 ( .A(n146), .B(n144), .C(n145), .D(n143), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U207 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(n337), .Y(n144) );
  MX4X1M U208 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n339), .S1(n337), .Y(n143) );
  AO22X1M U209 ( .A0(N41), .A1(n366), .B0(RdData[2]), .B1(n158), .Y(n181) );
  MX4X1M U210 ( .A(n150), .B(n148), .C(n149), .D(n147), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U211 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n339), 
        .S1(N12), .Y(n150) );
  MX4X1M U212 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n339), .S1(N12), .Y(n148) );
  AO22X1M U213 ( .A0(N40), .A1(n366), .B0(RdData[3]), .B1(n158), .Y(n182) );
  MX4X1M U214 ( .A(n319), .B(n317), .C(n318), .D(n316), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U215 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n339), 
        .S1(N12), .Y(n319) );
  MX4X1M U216 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n339), .S1(N12), .Y(n317) );
  AO22X1M U217 ( .A0(N39), .A1(n366), .B0(RdData[4]), .B1(n158), .Y(n183) );
  MX4X1M U218 ( .A(n323), .B(n321), .C(n322), .D(n320), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U219 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n340), 
        .S1(N12), .Y(n323) );
  MX4X1M U220 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n339), .S1(N12), .Y(n321) );
  AO22X1M U221 ( .A0(N38), .A1(n366), .B0(RdData[5]), .B1(n158), .Y(n184) );
  MX4X1M U222 ( .A(n327), .B(n325), .C(n326), .D(n324), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U223 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n340), 
        .S1(N12), .Y(n327) );
  MX4X1M U224 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n340), .S1(N12), .Y(n325) );
  AO22X1M U225 ( .A0(N37), .A1(n366), .B0(RdData[6]), .B1(n158), .Y(n185) );
  MX4X1M U226 ( .A(n331), .B(n329), .C(n330), .D(n328), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U227 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n340), 
        .S1(N12), .Y(n331) );
  MX4X1M U228 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n340), .S1(N12), .Y(n329) );
  AO22X1M U229 ( .A0(N36), .A1(n366), .B0(RdData[7]), .B1(n158), .Y(n186) );
  MX4X1M U230 ( .A(n335), .B(n333), .C(n334), .D(n332), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U231 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n340), 
        .S1(N12), .Y(n335) );
  MX4X1M U232 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n340), .S1(N12), .Y(n333) );
  MX4X1M U233 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n339), 
        .S1(n337), .Y(n146) );
  MX4X1M U234 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(N11), .S1(n337), .Y(n141) );
  MX4X1M U235 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n339), .S1(n337), .Y(n145) );
  MX4X1M U236 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n339), .S1(N12), .Y(n149) );
  MX4X1M U237 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n339), .S1(N12), .Y(n318) );
  MX4X1M U238 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n339), .S1(N12), .Y(n322) );
  MX4X1M U239 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n340), .S1(N12), .Y(n326) );
  MX4X1M U240 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n340), .S1(N12), .Y(n330) );
  MX4X1M U241 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n340), .S1(N12), .Y(n334) );
  MX4X1M U242 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n340), .S1(n337), .Y(n139) );
  MX4X1M U243 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n339), .S1(n337), .Y(n147) );
  MX4X1M U244 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n339), .S1(n337), .Y(n316) );
  MX4X1M U245 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n339), .S1(N12), .Y(n320) );
  MX4X1M U246 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n340), .S1(n337), .Y(n324) );
  MX4X1M U247 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n340), .S1(n337), .Y(n328) );
  MX4X1M U248 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n340), .S1(n337), .Y(n332) );
  INVX2M U249 ( .A(N11), .Y(n341) );
  INVX2M U250 ( .A(WrData[5]), .Y(n363) );
  INVX2M U251 ( .A(WrData[6]), .Y(n364) );
  OAI2BB2X1M U252 ( .B0(n151), .B1(n358), .A0N(\regArr[13][0] ), .A1N(n151), 
        .Y(n292) );
  OAI2BB2X1M U253 ( .B0(n151), .B1(n359), .A0N(\regArr[13][1] ), .A1N(n151), 
        .Y(n293) );
  OAI2BB2X1M U254 ( .B0(n151), .B1(n360), .A0N(\regArr[13][2] ), .A1N(n151), 
        .Y(n294) );
  OAI2BB2X1M U255 ( .B0(n151), .B1(n361), .A0N(\regArr[13][3] ), .A1N(n151), 
        .Y(n295) );
  OAI2BB2X1M U256 ( .B0(n151), .B1(n362), .A0N(\regArr[13][4] ), .A1N(n151), 
        .Y(n296) );
  OAI2BB2X1M U257 ( .B0(n151), .B1(n363), .A0N(\regArr[13][5] ), .A1N(n151), 
        .Y(n297) );
  OAI2BB2X1M U258 ( .B0(n151), .B1(n364), .A0N(\regArr[13][6] ), .A1N(n151), 
        .Y(n298) );
  OAI2BB2X1M U259 ( .B0(n151), .B1(n365), .A0N(\regArr[13][7] ), .A1N(n151), 
        .Y(n299) );
  OAI2BB2X1M U260 ( .B0(n358), .B1(n154), .A0N(\regArr[14][0] ), .A1N(n154), 
        .Y(n300) );
  OAI2BB2X1M U261 ( .B0(n359), .B1(n154), .A0N(\regArr[14][1] ), .A1N(n154), 
        .Y(n301) );
  OAI2BB2X1M U262 ( .B0(n360), .B1(n154), .A0N(\regArr[14][2] ), .A1N(n154), 
        .Y(n302) );
  OAI2BB2X1M U263 ( .B0(n361), .B1(n154), .A0N(\regArr[14][3] ), .A1N(n154), 
        .Y(n303) );
  OAI2BB2X1M U264 ( .B0(n362), .B1(n154), .A0N(\regArr[14][4] ), .A1N(n154), 
        .Y(n304) );
  OAI2BB2X1M U265 ( .B0(n363), .B1(n154), .A0N(\regArr[14][5] ), .A1N(n154), 
        .Y(n305) );
  OAI2BB2X1M U266 ( .B0(n364), .B1(n154), .A0N(\regArr[14][6] ), .A1N(n154), 
        .Y(n306) );
  OAI2BB2X1M U267 ( .B0(n365), .B1(n154), .A0N(\regArr[14][7] ), .A1N(n154), 
        .Y(n307) );
  OAI2BB2X1M U268 ( .B0(n358), .B1(n157), .A0N(\regArr[15][0] ), .A1N(n157), 
        .Y(n308) );
  OAI2BB2X1M U269 ( .B0(n359), .B1(n157), .A0N(\regArr[15][1] ), .A1N(n157), 
        .Y(n309) );
  OAI2BB2X1M U270 ( .B0(n360), .B1(n157), .A0N(\regArr[15][2] ), .A1N(n157), 
        .Y(n310) );
  OAI2BB2X1M U271 ( .B0(n361), .B1(n157), .A0N(\regArr[15][3] ), .A1N(n157), 
        .Y(n311) );
  OAI2BB2X1M U272 ( .B0(n362), .B1(n157), .A0N(\regArr[15][4] ), .A1N(n157), 
        .Y(n312) );
  OAI2BB2X1M U273 ( .B0(n363), .B1(n157), .A0N(\regArr[15][5] ), .A1N(n157), 
        .Y(n313) );
  OAI2BB2X1M U274 ( .B0(n364), .B1(n157), .A0N(\regArr[15][6] ), .A1N(n157), 
        .Y(n314) );
  OAI2BB2X1M U275 ( .B0(n365), .B1(n157), .A0N(\regArr[15][7] ), .A1N(n157), 
        .Y(n315) );
  OAI2BB2X1M U276 ( .B0(n358), .B1(n160), .A0N(REG0[0]), .A1N(n160), .Y(n188)
         );
  OAI2BB2X1M U277 ( .B0(n359), .B1(n160), .A0N(REG0[1]), .A1N(n160), .Y(n189)
         );
  OAI2BB2X1M U278 ( .B0(n360), .B1(n160), .A0N(REG0[2]), .A1N(n160), .Y(n190)
         );
  OAI2BB2X1M U279 ( .B0(n361), .B1(n160), .A0N(REG0[3]), .A1N(n160), .Y(n191)
         );
  OAI2BB2X1M U280 ( .B0(n362), .B1(n160), .A0N(REG0[4]), .A1N(n160), .Y(n192)
         );
  OAI2BB2X1M U281 ( .B0(n363), .B1(n160), .A0N(REG0[5]), .A1N(n160), .Y(n193)
         );
  OAI2BB2X1M U282 ( .B0(n364), .B1(n160), .A0N(REG0[6]), .A1N(n160), .Y(n194)
         );
  OAI2BB2X1M U283 ( .B0(n365), .B1(n160), .A0N(REG0[7]), .A1N(n160), .Y(n195)
         );
  OAI2BB2X1M U284 ( .B0(n358), .B1(n173), .A0N(\regArr[8][0] ), .A1N(n173), 
        .Y(n252) );
  OAI2BB2X1M U285 ( .B0(n359), .B1(n173), .A0N(\regArr[8][1] ), .A1N(n173), 
        .Y(n253) );
  OAI2BB2X1M U286 ( .B0(n360), .B1(n173), .A0N(\regArr[8][2] ), .A1N(n173), 
        .Y(n254) );
  OAI2BB2X1M U287 ( .B0(n361), .B1(n173), .A0N(\regArr[8][3] ), .A1N(n173), 
        .Y(n255) );
  OAI2BB2X1M U288 ( .B0(n362), .B1(n173), .A0N(\regArr[8][4] ), .A1N(n173), 
        .Y(n256) );
  OAI2BB2X1M U289 ( .B0(n363), .B1(n173), .A0N(\regArr[8][5] ), .A1N(n173), 
        .Y(n257) );
  OAI2BB2X1M U290 ( .B0(n364), .B1(n173), .A0N(\regArr[8][6] ), .A1N(n173), 
        .Y(n258) );
  OAI2BB2X1M U291 ( .B0(n365), .B1(n173), .A0N(\regArr[8][7] ), .A1N(n173), 
        .Y(n259) );
  OAI2BB2X1M U292 ( .B0(n358), .B1(n174), .A0N(\regArr[9][0] ), .A1N(n174), 
        .Y(n260) );
  OAI2BB2X1M U293 ( .B0(n359), .B1(n174), .A0N(\regArr[9][1] ), .A1N(n174), 
        .Y(n261) );
  OAI2BB2X1M U294 ( .B0(n360), .B1(n174), .A0N(\regArr[9][2] ), .A1N(n174), 
        .Y(n262) );
  OAI2BB2X1M U295 ( .B0(n361), .B1(n174), .A0N(\regArr[9][3] ), .A1N(n174), 
        .Y(n263) );
  OAI2BB2X1M U296 ( .B0(n362), .B1(n174), .A0N(\regArr[9][4] ), .A1N(n174), 
        .Y(n264) );
  OAI2BB2X1M U297 ( .B0(n363), .B1(n174), .A0N(\regArr[9][5] ), .A1N(n174), 
        .Y(n265) );
  OAI2BB2X1M U298 ( .B0(n364), .B1(n174), .A0N(\regArr[9][6] ), .A1N(n174), 
        .Y(n266) );
  OAI2BB2X1M U299 ( .B0(n365), .B1(n174), .A0N(\regArr[9][7] ), .A1N(n174), 
        .Y(n267) );
  OAI2BB2X1M U300 ( .B0(n359), .B1(n165), .A0N(REG2[1]), .A1N(n165), .Y(n205)
         );
  OAI2BB2X1M U301 ( .B0(n360), .B1(n165), .A0N(REG2[2]), .A1N(n165), .Y(n206)
         );
  OAI2BB2X1M U302 ( .B0(n361), .B1(n165), .A0N(REG2[3]), .A1N(n165), .Y(n207)
         );
  OAI2BB2X1M U303 ( .B0(n362), .B1(n165), .A0N(REG2[4]), .A1N(n165), .Y(n208)
         );
  OAI2BB2X1M U304 ( .B0(n364), .B1(n165), .A0N(REG2[6]), .A1N(n165), .Y(n210)
         );
  OAI2BB2X1M U305 ( .B0(n365), .B1(n165), .A0N(REG2[7]), .A1N(n165), .Y(n211)
         );
  OAI2BB2X1M U306 ( .B0(n358), .B1(n167), .A0N(REG3[0]), .A1N(n167), .Y(n212)
         );
  OAI2BB2X1M U307 ( .B0(n359), .B1(n167), .A0N(REG3[1]), .A1N(n167), .Y(n213)
         );
  OAI2BB2X1M U308 ( .B0(n360), .B1(n167), .A0N(REG3[2]), .A1N(n167), .Y(n214)
         );
  OAI2BB2X1M U309 ( .B0(n362), .B1(n167), .A0N(REG3[4]), .A1N(n167), .Y(n216)
         );
  OAI2BB2X1M U310 ( .B0(n363), .B1(n167), .A0N(REG3[5]), .A1N(n167), .Y(n217)
         );
  OAI2BB2X1M U311 ( .B0(n364), .B1(n167), .A0N(REG3[6]), .A1N(n167), .Y(n218)
         );
  OAI2BB2X1M U312 ( .B0(n365), .B1(n167), .A0N(REG3[7]), .A1N(n167), .Y(n219)
         );
  OAI2BB2X1M U313 ( .B0(n358), .B1(n175), .A0N(\regArr[10][0] ), .A1N(n175), 
        .Y(n268) );
  OAI2BB2X1M U314 ( .B0(n359), .B1(n175), .A0N(\regArr[10][1] ), .A1N(n175), 
        .Y(n269) );
  OAI2BB2X1M U315 ( .B0(n360), .B1(n175), .A0N(\regArr[10][2] ), .A1N(n175), 
        .Y(n270) );
  OAI2BB2X1M U316 ( .B0(n361), .B1(n175), .A0N(\regArr[10][3] ), .A1N(n175), 
        .Y(n271) );
  OAI2BB2X1M U317 ( .B0(n362), .B1(n175), .A0N(\regArr[10][4] ), .A1N(n175), 
        .Y(n272) );
  OAI2BB2X1M U318 ( .B0(n363), .B1(n175), .A0N(\regArr[10][5] ), .A1N(n175), 
        .Y(n273) );
  OAI2BB2X1M U319 ( .B0(n364), .B1(n175), .A0N(\regArr[10][6] ), .A1N(n175), 
        .Y(n274) );
  OAI2BB2X1M U320 ( .B0(n365), .B1(n175), .A0N(\regArr[10][7] ), .A1N(n175), 
        .Y(n275) );
  OAI2BB2X1M U321 ( .B0(n358), .B1(n176), .A0N(\regArr[11][0] ), .A1N(n176), 
        .Y(n276) );
  OAI2BB2X1M U322 ( .B0(n359), .B1(n176), .A0N(\regArr[11][1] ), .A1N(n176), 
        .Y(n277) );
  OAI2BB2X1M U323 ( .B0(n360), .B1(n176), .A0N(\regArr[11][2] ), .A1N(n176), 
        .Y(n278) );
  OAI2BB2X1M U324 ( .B0(n361), .B1(n176), .A0N(\regArr[11][3] ), .A1N(n176), 
        .Y(n279) );
  OAI2BB2X1M U325 ( .B0(n362), .B1(n176), .A0N(\regArr[11][4] ), .A1N(n176), 
        .Y(n280) );
  OAI2BB2X1M U326 ( .B0(n363), .B1(n176), .A0N(\regArr[11][5] ), .A1N(n176), 
        .Y(n281) );
  OAI2BB2X1M U327 ( .B0(n364), .B1(n176), .A0N(\regArr[11][6] ), .A1N(n176), 
        .Y(n282) );
  OAI2BB2X1M U328 ( .B0(n365), .B1(n176), .A0N(\regArr[11][7] ), .A1N(n176), 
        .Y(n283) );
  OAI2BB2X1M U329 ( .B0(n358), .B1(n168), .A0N(\regArr[4][0] ), .A1N(n168), 
        .Y(n220) );
  OAI2BB2X1M U330 ( .B0(n359), .B1(n168), .A0N(\regArr[4][1] ), .A1N(n168), 
        .Y(n221) );
  OAI2BB2X1M U331 ( .B0(n360), .B1(n168), .A0N(\regArr[4][2] ), .A1N(n168), 
        .Y(n222) );
  OAI2BB2X1M U332 ( .B0(n361), .B1(n168), .A0N(\regArr[4][3] ), .A1N(n168), 
        .Y(n223) );
  OAI2BB2X1M U333 ( .B0(n362), .B1(n168), .A0N(\regArr[4][4] ), .A1N(n168), 
        .Y(n224) );
  OAI2BB2X1M U334 ( .B0(n363), .B1(n168), .A0N(\regArr[4][5] ), .A1N(n168), 
        .Y(n225) );
  OAI2BB2X1M U335 ( .B0(n364), .B1(n168), .A0N(\regArr[4][6] ), .A1N(n168), 
        .Y(n226) );
  OAI2BB2X1M U336 ( .B0(n365), .B1(n168), .A0N(\regArr[4][7] ), .A1N(n168), 
        .Y(n227) );
  OAI2BB2X1M U337 ( .B0(n358), .B1(n169), .A0N(\regArr[5][0] ), .A1N(n169), 
        .Y(n228) );
  OAI2BB2X1M U338 ( .B0(n359), .B1(n169), .A0N(\regArr[5][1] ), .A1N(n169), 
        .Y(n229) );
  OAI2BB2X1M U339 ( .B0(n360), .B1(n169), .A0N(\regArr[5][2] ), .A1N(n169), 
        .Y(n230) );
  OAI2BB2X1M U340 ( .B0(n361), .B1(n169), .A0N(\regArr[5][3] ), .A1N(n169), 
        .Y(n231) );
  OAI2BB2X1M U341 ( .B0(n362), .B1(n169), .A0N(\regArr[5][4] ), .A1N(n169), 
        .Y(n232) );
  OAI2BB2X1M U342 ( .B0(n363), .B1(n169), .A0N(\regArr[5][5] ), .A1N(n169), 
        .Y(n233) );
  OAI2BB2X1M U343 ( .B0(n364), .B1(n169), .A0N(\regArr[5][6] ), .A1N(n169), 
        .Y(n234) );
  OAI2BB2X1M U344 ( .B0(n365), .B1(n169), .A0N(\regArr[5][7] ), .A1N(n169), 
        .Y(n235) );
  OAI2BB2X1M U345 ( .B0(n358), .B1(n178), .A0N(\regArr[12][0] ), .A1N(n178), 
        .Y(n284) );
  OAI2BB2X1M U346 ( .B0(n359), .B1(n178), .A0N(\regArr[12][1] ), .A1N(n178), 
        .Y(n285) );
  OAI2BB2X1M U347 ( .B0(n360), .B1(n178), .A0N(\regArr[12][2] ), .A1N(n178), 
        .Y(n286) );
  OAI2BB2X1M U348 ( .B0(n361), .B1(n178), .A0N(\regArr[12][3] ), .A1N(n178), 
        .Y(n287) );
  OAI2BB2X1M U349 ( .B0(n362), .B1(n178), .A0N(\regArr[12][4] ), .A1N(n178), 
        .Y(n288) );
  OAI2BB2X1M U350 ( .B0(n363), .B1(n178), .A0N(\regArr[12][5] ), .A1N(n178), 
        .Y(n289) );
  OAI2BB2X1M U351 ( .B0(n364), .B1(n178), .A0N(\regArr[12][6] ), .A1N(n178), 
        .Y(n290) );
  OAI2BB2X1M U352 ( .B0(n365), .B1(n178), .A0N(\regArr[12][7] ), .A1N(n178), 
        .Y(n291) );
  OAI2BB2X1M U353 ( .B0(n358), .B1(n170), .A0N(\regArr[6][0] ), .A1N(n170), 
        .Y(n236) );
  OAI2BB2X1M U354 ( .B0(n359), .B1(n170), .A0N(\regArr[6][1] ), .A1N(n170), 
        .Y(n237) );
  OAI2BB2X1M U355 ( .B0(n360), .B1(n170), .A0N(\regArr[6][2] ), .A1N(n170), 
        .Y(n238) );
  OAI2BB2X1M U356 ( .B0(n361), .B1(n170), .A0N(\regArr[6][3] ), .A1N(n170), 
        .Y(n239) );
  OAI2BB2X1M U357 ( .B0(n362), .B1(n170), .A0N(\regArr[6][4] ), .A1N(n170), 
        .Y(n240) );
  OAI2BB2X1M U358 ( .B0(n363), .B1(n170), .A0N(\regArr[6][5] ), .A1N(n170), 
        .Y(n241) );
  OAI2BB2X1M U359 ( .B0(n364), .B1(n170), .A0N(\regArr[6][6] ), .A1N(n170), 
        .Y(n242) );
  OAI2BB2X1M U360 ( .B0(n365), .B1(n170), .A0N(\regArr[6][7] ), .A1N(n170), 
        .Y(n243) );
  OAI2BB2X1M U361 ( .B0(n358), .B1(n172), .A0N(\regArr[7][0] ), .A1N(n172), 
        .Y(n244) );
  OAI2BB2X1M U362 ( .B0(n359), .B1(n172), .A0N(\regArr[7][1] ), .A1N(n172), 
        .Y(n245) );
  OAI2BB2X1M U363 ( .B0(n360), .B1(n172), .A0N(\regArr[7][2] ), .A1N(n172), 
        .Y(n246) );
  OAI2BB2X1M U364 ( .B0(n361), .B1(n172), .A0N(\regArr[7][3] ), .A1N(n172), 
        .Y(n247) );
  OAI2BB2X1M U365 ( .B0(n362), .B1(n172), .A0N(\regArr[7][4] ), .A1N(n172), 
        .Y(n248) );
  OAI2BB2X1M U366 ( .B0(n363), .B1(n172), .A0N(\regArr[7][5] ), .A1N(n172), 
        .Y(n249) );
  OAI2BB2X1M U367 ( .B0(n364), .B1(n172), .A0N(\regArr[7][6] ), .A1N(n172), 
        .Y(n250) );
  OAI2BB2X1M U368 ( .B0(n365), .B1(n172), .A0N(\regArr[7][7] ), .A1N(n172), 
        .Y(n251) );
  OAI2BB2X1M U369 ( .B0(n358), .B1(n163), .A0N(REG1[0]), .A1N(n163), .Y(n196)
         );
  OAI2BB2X1M U370 ( .B0(n359), .B1(n163), .A0N(REG1[1]), .A1N(n163), .Y(n197)
         );
  OAI2BB2X1M U371 ( .B0(n360), .B1(n163), .A0N(REG1[2]), .A1N(n163), .Y(n198)
         );
  OAI2BB2X1M U372 ( .B0(n361), .B1(n163), .A0N(REG1[3]), .A1N(n163), .Y(n199)
         );
  OAI2BB2X1M U373 ( .B0(n362), .B1(n163), .A0N(REG1[4]), .A1N(n163), .Y(n200)
         );
  OAI2BB2X1M U374 ( .B0(n363), .B1(n163), .A0N(REG1[5]), .A1N(n163), .Y(n201)
         );
  OAI2BB2X1M U375 ( .B0(n364), .B1(n163), .A0N(REG1[6]), .A1N(n163), .Y(n202)
         );
  OAI2BB2X1M U376 ( .B0(n365), .B1(n163), .A0N(REG1[7]), .A1N(n163), .Y(n203)
         );
  INVX2M U377 ( .A(N12), .Y(n342) );
  AO21XLM U378 ( .A0(RdData_VLD), .A1(n159), .B0(n366), .Y(n187) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module RST_SYNC_test_0 ( RST, CLK, SYNC_RST, test_si, test_se );
  input RST, CLK, test_si, test_se;
  output SYNC_RST;
  wire   meta_flop;

  SDFFRQX2M sync_flop_reg ( .D(meta_flop), .SI(meta_flop), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_RST) );
  SDFFRQX2M meta_flop_reg ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(meta_flop) );
endmodule


module RST_SYNC_test_1 ( RST, CLK, SYNC_RST, test_si, test_se );
  input RST, CLK, test_si, test_se;
  output SYNC_RST;
  wire   meta_flop;

  SDFFRQX2M meta_flop_reg ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(meta_flop) );
  SDFFRQX1M sync_flop_reg ( .D(meta_flop), .SI(meta_flop), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  INVX2M U26 ( .A(b[6]), .Y(n12) );
  XNOR2X2M U27 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U28 ( .A(b[2]), .Y(n16) );
  INVX2M U29 ( .A(b[3]), .Y(n15) );
  INVX2M U30 ( .A(b[4]), .Y(n14) );
  INVX2M U31 ( .A(b[5]), .Y(n13) );
  INVX2M U32 ( .A(b[1]), .Y(n17) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n6), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n5), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U12 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U13 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U14 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U15 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U16 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U18 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U20 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U21 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n12) );
  AND2X2M U22 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n13) );
  CLKXOR2X2M U23 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U24 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n14) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U32 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U33 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U34 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U35 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  INVX2M U36 ( .A(A[0]), .Y(n39) );
  INVX2M U37 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U38 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U39 ( .A(A[1]), .Y(n38) );
  INVX2M U40 ( .A(A[3]), .Y(n36) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[4]), .Y(n35) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n13, n12, n15, n14, n11, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module ALU_test_1 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID, test_si, 
        test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST, test_si, test_se;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n4, n5, n6, n7,
         n8, n9, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158;
  wire   [15:0] ALU_OUT_Comb;

  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[8]) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(ALU_OUT[6]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  SDFFRQX1M OUT_VALID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  BUFX2M U23 ( .A(A[6]), .Y(n29) );
  OAI2BB1X2M U24 ( .A0N(N124), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U25 ( .A0N(N123), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U26 ( .A0N(N121), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U27 ( .A0N(N122), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U28 ( .A0N(N118), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U29 ( .A0N(N119), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U30 ( .A0N(N120), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U31 ( .A0N(n147), .A1N(n122), .B0(n118), .Y(n64) );
  OAI2BB1X2M U32 ( .A0N(n117), .A1N(n116), .B0(n118), .Y(n65) );
  AND2X2M U33 ( .A(n116), .B(n122), .Y(n59) );
  BUFX2M U34 ( .A(n58), .Y(n31) );
  NOR2X2M U35 ( .A(n124), .B(n144), .Y(n58) );
  INVX2M U36 ( .A(n117), .Y(n144) );
  INVX2M U37 ( .A(n124), .Y(n147) );
  NOR2BX2M U38 ( .AN(n123), .B(n144), .Y(n54) );
  NOR2BX2M U39 ( .AN(n52), .B(n142), .Y(n48) );
  AND2X2M U40 ( .A(n123), .B(n122), .Y(n67) );
  INVX2M U41 ( .A(n108), .Y(n145) );
  NOR3BX2M U42 ( .AN(n122), .B(n146), .C(ALU_FUN[2]), .Y(n66) );
  NOR2X2M U43 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n123) );
  AND3X2M U44 ( .A(n123), .B(n143), .C(n4), .Y(n63) );
  NAND2X2M U45 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n124) );
  INVX2M U46 ( .A(ALU_FUN[0]), .Y(n143) );
  NOR2X2M U47 ( .A(n143), .B(n4), .Y(n122) );
  NOR2X2M U48 ( .A(n4), .B(ALU_FUN[0]), .Y(n117) );
  INVX2M U49 ( .A(ALU_FUN[1]), .Y(n146) );
  NAND2X2M U50 ( .A(EN), .B(n141), .Y(n49) );
  NAND3X2M U51 ( .A(n123), .B(ALU_FUN[0]), .C(n4), .Y(n118) );
  AND2X2M U52 ( .A(ALU_FUN[2]), .B(n146), .Y(n116) );
  AND4X2M U53 ( .A(N159), .B(n116), .C(n4), .D(n143), .Y(n107) );
  NOR3X2M U54 ( .A(n144), .B(ALU_FUN[2]), .C(n146), .Y(n52) );
  NAND3X2M U55 ( .A(n147), .B(n143), .C(n4), .Y(n53) );
  NAND3X2M U56 ( .A(n4), .B(ALU_FUN[0]), .C(n116), .Y(n108) );
  INVX2M U57 ( .A(EN), .Y(n142) );
  AOI31X2M U58 ( .A0(n110), .A1(n111), .A2(n112), .B0(n142), .Y(
        ALU_OUT_Comb[0]) );
  AOI22X1M U59 ( .A0(N100), .A1(n67), .B0(N91), .B1(n54), .Y(n110) );
  AOI211X2M U60 ( .A0(n31), .A1(n158), .B0(n113), .C0(n114), .Y(n112) );
  AOI222X1M U61 ( .A0(N109), .A1(n52), .B0(n6), .B1(n59), .C0(N125), .C1(n66), 
        .Y(n111) );
  AOI31X2M U62 ( .A0(n98), .A1(n99), .A2(n100), .B0(n142), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U63 ( .A0(N92), .A1(n54), .B0(N110), .B1(n52), .C0(N101), .C1(n67), 
        .Y(n98) );
  AOI211X2M U64 ( .A0(n8), .A1(n145), .B0(n101), .C0(n102), .Y(n100) );
  AOI222X1M U65 ( .A0(N126), .A1(n66), .B0(n31), .B1(n157), .C0(n7), .C1(n59), 
        .Y(n99) );
  AOI31X2M U66 ( .A0(n92), .A1(n93), .A2(n94), .B0(n142), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U67 ( .A0(N102), .A1(n67), .B0(N93), .B1(n54), .Y(n92) );
  AOI221XLM U68 ( .A0(n9), .A1(n145), .B0(n31), .B1(n156), .C0(n95), .Y(n94)
         );
  AOI222X1M U69 ( .A0(N111), .A1(n52), .B0(n8), .B1(n59), .C0(N127), .C1(n66), 
        .Y(n93) );
  AOI31X2M U70 ( .A0(n86), .A1(n87), .A2(n88), .B0(n142), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U71 ( .A0(N103), .A1(n67), .B0(N94), .B1(n54), .Y(n86) );
  AOI221XLM U72 ( .A0(n27), .A1(n145), .B0(n31), .B1(n155), .C0(n89), .Y(n88)
         );
  AOI222X1M U73 ( .A0(N112), .A1(n52), .B0(n9), .B1(n59), .C0(N128), .C1(n66), 
        .Y(n87) );
  AOI31X2M U74 ( .A0(n80), .A1(n81), .A2(n82), .B0(n142), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U75 ( .A0(N104), .A1(n67), .B0(N95), .B1(n54), .Y(n80) );
  AOI221XLM U76 ( .A0(n145), .A1(n28), .B0(n31), .B1(n154), .C0(n83), .Y(n82)
         );
  AOI222X1M U77 ( .A0(N113), .A1(n52), .B0(n27), .B1(n59), .C0(N129), .C1(n66), 
        .Y(n81) );
  AOI31X2M U78 ( .A0(n74), .A1(n75), .A2(n76), .B0(n142), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U79 ( .A0(N105), .A1(n67), .B0(N96), .B1(n54), .Y(n74) );
  AOI221XLM U80 ( .A0(n145), .A1(n29), .B0(n31), .B1(n153), .C0(n77), .Y(n76)
         );
  AOI222X1M U81 ( .A0(N114), .A1(n52), .B0(n28), .B1(n59), .C0(N130), .C1(n66), 
        .Y(n75) );
  AOI31X2M U82 ( .A0(n68), .A1(n69), .A2(n70), .B0(n142), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U83 ( .A0(N106), .A1(n67), .B0(N97), .B1(n54), .Y(n68) );
  AOI221XLM U84 ( .A0(n145), .A1(n30), .B0(n31), .B1(n152), .C0(n71), .Y(n70)
         );
  AOI222X1M U85 ( .A0(N115), .A1(n52), .B0(n59), .B1(n29), .C0(N131), .C1(n66), 
        .Y(n69) );
  AOI31X2M U86 ( .A0(n55), .A1(n56), .A2(n57), .B0(n142), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U87 ( .A0(N107), .A1(n67), .B0(N98), .B1(n54), .Y(n55) );
  AOI221XLM U88 ( .A0(n31), .A1(n151), .B0(n59), .B1(n30), .C0(n60), .Y(n57)
         );
  AOI22X1M U89 ( .A0(N132), .A1(n66), .B0(N116), .B1(n52), .Y(n56) );
  AOI21X2M U90 ( .A0(n50), .A1(n51), .B0(n142), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U91 ( .A0(N99), .A1(n54), .B0(n141), .Y(n50) );
  AOI2BB2XLM U92 ( .B0(N117), .B1(n52), .A0N(n151), .A1N(n53), .Y(n51) );
  OAI222X1M U93 ( .A0(n72), .A1(n140), .B0(n5), .B1(n73), .C0(n53), .C1(n153), 
        .Y(n71) );
  AOI221XLM U94 ( .A0(n29), .A1(n63), .B0(n64), .B1(n152), .C0(n31), .Y(n73)
         );
  AOI221XLM U95 ( .A0(n63), .A1(n152), .B0(n29), .B1(n65), .C0(n59), .Y(n72)
         );
  INVX2M U96 ( .A(n5), .Y(n140) );
  BUFX2M U97 ( .A(ALU_FUN[3]), .Y(n4) );
  INVX2M U98 ( .A(n109), .Y(n141) );
  AOI211X2M U99 ( .A0(N108), .A1(n67), .B0(n31), .C0(n64), .Y(n109) );
  INVX2M U100 ( .A(n7), .Y(n157) );
  INVX2M U101 ( .A(n6), .Y(n158) );
  INVX2M U102 ( .A(n29), .Y(n152) );
  INVX2M U103 ( .A(n30), .Y(n151) );
  INVX2M U104 ( .A(n9), .Y(n155) );
  INVX2M U105 ( .A(n8), .Y(n156) );
  INVX2M U106 ( .A(n28), .Y(n153) );
  INVX2M U107 ( .A(n27), .Y(n154) );
  BUFX2M U108 ( .A(B[6]), .Y(n5) );
  BUFX2M U109 ( .A(A[7]), .Y(n30) );
  BUFX2M U110 ( .A(A[5]), .Y(n28) );
  BUFX2M U111 ( .A(A[4]), .Y(n27) );
  BUFX2M U112 ( .A(A[3]), .Y(n9) );
  BUFX2M U113 ( .A(A[2]), .Y(n8) );
  BUFX2M U114 ( .A(A[0]), .Y(n6) );
  BUFX2M U115 ( .A(A[1]), .Y(n7) );
  INVX2M U116 ( .A(n43), .Y(n138) );
  OAI2B2X1M U117 ( .A1N(B[0]), .A0(n115), .B0(n108), .B1(n157), .Y(n114) );
  AOI221XLM U118 ( .A0(n63), .A1(n158), .B0(n6), .B1(n65), .C0(n59), .Y(n115)
         );
  OAI222X1M U119 ( .A0(n96), .A1(n137), .B0(B[2]), .B1(n97), .C0(n53), .C1(
        n157), .Y(n95) );
  AOI221XLM U120 ( .A0(n8), .A1(n63), .B0(n64), .B1(n156), .C0(n31), .Y(n97)
         );
  AOI221XLM U121 ( .A0(n63), .A1(n156), .B0(n8), .B1(n65), .C0(n59), .Y(n96)
         );
  OAI222X1M U122 ( .A0(n90), .A1(n139), .B0(B[3]), .B1(n91), .C0(n53), .C1(
        n156), .Y(n89) );
  AOI221XLM U123 ( .A0(n9), .A1(n63), .B0(n64), .B1(n155), .C0(n31), .Y(n91)
         );
  AOI221XLM U124 ( .A0(n63), .A1(n155), .B0(n9), .B1(n65), .C0(n59), .Y(n90)
         );
  OAI222X1M U125 ( .A0(n84), .A1(n150), .B0(B[4]), .B1(n85), .C0(n53), .C1(
        n155), .Y(n83) );
  INVX2M U126 ( .A(B[4]), .Y(n150) );
  AOI221XLM U127 ( .A0(n27), .A1(n63), .B0(n64), .B1(n154), .C0(n31), .Y(n85)
         );
  AOI221XLM U128 ( .A0(n63), .A1(n154), .B0(n27), .B1(n65), .C0(n59), .Y(n84)
         );
  OAI222X1M U129 ( .A0(n78), .A1(n149), .B0(B[5]), .B1(n79), .C0(n53), .C1(
        n154), .Y(n77) );
  INVX2M U130 ( .A(B[5]), .Y(n149) );
  AOI221XLM U131 ( .A0(n28), .A1(n63), .B0(n64), .B1(n153), .C0(n31), .Y(n79)
         );
  AOI221XLM U132 ( .A0(n63), .A1(n153), .B0(n28), .B1(n65), .C0(n59), .Y(n78)
         );
  OAI222X1M U133 ( .A0(n61), .A1(n148), .B0(B[7]), .B1(n62), .C0(n53), .C1(
        n152), .Y(n60) );
  INVX2M U134 ( .A(B[7]), .Y(n148) );
  AOI221XLM U135 ( .A0(n63), .A1(n30), .B0(n64), .B1(n151), .C0(n31), .Y(n62)
         );
  AOI221XLM U136 ( .A0(n63), .A1(n151), .B0(n30), .B1(n65), .C0(n59), .Y(n61)
         );
  INVX2M U137 ( .A(n32), .Y(n136) );
  OAI21X2M U138 ( .A0(B[0]), .A1(n119), .B0(n120), .Y(n113) );
  AOI221XLM U139 ( .A0(n6), .A1(n63), .B0(n64), .B1(n158), .C0(n31), .Y(n119)
         );
  AOI31X2M U140 ( .A0(N157), .A1(n4), .A2(n121), .B0(n107), .Y(n120) );
  NOR3X2M U141 ( .A(n146), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n121) );
  OAI21X2M U142 ( .A0(B[1]), .A1(n104), .B0(n105), .Y(n101) );
  AOI221XLM U143 ( .A0(n7), .A1(n63), .B0(n64), .B1(n157), .C0(n31), .Y(n104)
         );
  AOI31X2M U144 ( .A0(N158), .A1(n4), .A2(n106), .B0(n107), .Y(n105) );
  NOR3X2M U145 ( .A(n143), .B(ALU_FUN[2]), .C(n146), .Y(n106) );
  OAI2B2X1M U146 ( .A1N(B[1]), .A0(n103), .B0(n53), .B1(n158), .Y(n102) );
  AOI221XLM U147 ( .A0(n63), .A1(n157), .B0(n7), .B1(n65), .C0(n59), .Y(n103)
         );
  INVX2M U148 ( .A(B[0]), .Y(n135) );
  INVX2M U149 ( .A(B[2]), .Y(n137) );
  INVX2M U150 ( .A(B[3]), .Y(n139) );
  NOR2X1M U151 ( .A(n151), .B(B[7]), .Y(n131) );
  NAND2BX1M U152 ( .AN(B[4]), .B(n27), .Y(n47) );
  NAND2BX1M U153 ( .AN(n27), .B(B[4]), .Y(n36) );
  CLKNAND2X2M U154 ( .A(n47), .B(n36), .Y(n126) );
  NOR2X1M U155 ( .A(n139), .B(n9), .Y(n44) );
  NOR2X1M U156 ( .A(n137), .B(n8), .Y(n35) );
  NOR2X1M U157 ( .A(n135), .B(n6), .Y(n32) );
  CLKNAND2X2M U158 ( .A(n8), .B(n137), .Y(n46) );
  NAND2BX1M U159 ( .AN(n35), .B(n46), .Y(n41) );
  AOI21X1M U160 ( .A0(n32), .A1(n157), .B0(B[1]), .Y(n33) );
  AOI211X1M U161 ( .A0(n7), .A1(n136), .B0(n41), .C0(n33), .Y(n34) );
  CLKNAND2X2M U162 ( .A(n9), .B(n139), .Y(n45) );
  OAI31X1M U163 ( .A0(n44), .A1(n35), .A2(n34), .B0(n45), .Y(n37) );
  NAND2BX1M U164 ( .AN(n28), .B(B[5]), .Y(n129) );
  OAI211X1M U165 ( .A0(n126), .A1(n37), .B0(n36), .C0(n129), .Y(n38) );
  NAND2BX1M U166 ( .AN(B[5]), .B(n28), .Y(n125) );
  XNOR2X1M U167 ( .A(n29), .B(n5), .Y(n128) );
  AOI32X1M U168 ( .A0(n38), .A1(n125), .A2(n128), .B0(n5), .B1(n152), .Y(n39)
         );
  CLKNAND2X2M U169 ( .A(B[7]), .B(n151), .Y(n132) );
  OAI21X1M U170 ( .A0(n131), .A1(n39), .B0(n132), .Y(N159) );
  CLKNAND2X2M U171 ( .A(n6), .B(n135), .Y(n42) );
  OA21X1M U172 ( .A0(n42), .A1(n157), .B0(B[1]), .Y(n40) );
  AOI211X1M U173 ( .A0(n42), .A1(n157), .B0(n41), .C0(n40), .Y(n43) );
  AOI31X1M U174 ( .A0(n138), .A1(n46), .A2(n45), .B0(n44), .Y(n127) );
  OAI2B11X1M U175 ( .A1N(n127), .A0(n126), .B0(n125), .C0(n47), .Y(n130) );
  AOI32X1M U176 ( .A0(n130), .A1(n129), .A2(n128), .B0(n29), .B1(n140), .Y(
        n133) );
  AOI2B1X1M U177 ( .A1N(n133), .A0(n132), .B0(n131), .Y(n134) );
  CLKINVX1M U178 ( .A(n134), .Y(N158) );
  NOR2X1M U179 ( .A(N159), .B(N158), .Y(N157) );
  ALU_DW_div_uns_0 div_52 ( .a({n30, n29, n28, n27, n9, n8, n7, n6}), .b({B[7], 
        n5, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n30, n29, n28, n27, n9, n8, n7, n6}), .B({
        1'b0, B[7], n5, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_43 ( .A({1'b0, n30, n29, n28, n27, n9, n8, n7, n6}), .B({
        1'b0, B[7], n5, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_49 ( .A({n30, n29, n28, n27, n9, n8, n7, n6}), .B({B[7], 
        n5, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
endmodule


module SYS_TOP ( scan_clk, scan_rst, test_mode, SE, SI, SO, RST_N, UART_CLK, 
        REF_CLK, UART_RX_IN, UART_TX_O, parity_error, framing_error );
  input [2:0] SI;
  output [1:0] SO;
  input scan_clk, scan_rst, test_mode, SE, RST_N, UART_CLK, REF_CLK,
         UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   REF_SCAN_CLK, RX_SCAN_CLK, UART_TX_CLK, TX_SCAN_CLK, RST_SCAN_RST,
         SYNC_REF_RST, REF_SCAN_RST, SYNC_UART_RST, UART_SCAN_RST,
         UART_RX_V_OUT, UART_RX_V_SYNC, UART_TX_VLD, UART_TX_V_SYNC,
         UART_TX_Busy, UART_TX_Busy_SYNC, RF_RdData_VLD, RF_WrEn, RF_RdEn,
         ALU_EN, ALU_OUT_VLD, CLKG_EN, _0_net_, ALU_CLK, n2, n3, n4, n5, n6,
         n7, n8, n10, n11, n12, n13, n16, n19;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] RF_RdData;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] UART_Config;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4;

  BUFX2M U2 ( .A(RF_Address[0]), .Y(n3) );
  BUFX2M U3 ( .A(RF_Address[1]), .Y(n4) );
  OR2X2M U4 ( .A(CLKG_EN), .B(test_mode), .Y(_0_net_) );
  BUFX2M U5 ( .A(UART_RX_IN), .Y(n2) );
  INVX4M U6 ( .A(n8), .Y(n7) );
  INVX2M U7 ( .A(REF_SCAN_RST), .Y(n8) );
  INVX2M U8 ( .A(n6), .Y(n5) );
  INVX2M U9 ( .A(UART_SCAN_RST), .Y(n6) );
  mux2X1_0 U0_mux2X1 ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(
        REF_SCAN_CLK) );
  mux2X1_5 U1_mux2X1 ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(RX_SCAN_CLK) );
  mux2X1_4 U2_mux2X1 ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(TX_SCAN_CLK) );
  mux2X1_3 U3_mux2X1 ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(test_mode), .OUT(
        RST_SCAN_RST) );
  mux2X1_2 U4_mux2X1 ( .IN_0(SYNC_REF_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(REF_SCAN_RST) );
  mux2X1_1 U5_mux2X1 ( .IN_0(SYNC_UART_RST), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(UART_SCAN_RST) );
  DATA_SYNC_test_0 U0_ref_sync ( .dest_clk(REF_SCAN_CLK), .dest_rst(n7), 
        .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_V_OUT), .sync_bus(
        UART_RX_SYNC), .enable_pulse_d(UART_RX_V_SYNC), .test_si(
        UART_TX_Busy_SYNC), .test_so(n11), .test_se(SE) );
  DATA_SYNC_test_1 U1_uart_sync ( .dest_clk(TX_SCAN_CLK), .dest_rst(n5), 
        .unsync_bus(UART_TX_IN), .bus_enable(UART_TX_VLD), .sync_bus(
        UART_TX_SYNC), .enable_pulse_d(UART_TX_V_SYNC), .test_si(SYNC_UART_RST), .test_so(n10), .test_se(SE) );
  BIT_SYNC_test_1 U0_bit_sync ( .dest_clk(REF_SCAN_CLK), .dest_rst(n7), 
        .unsync_bit(UART_TX_Busy), .sync_bit(UART_TX_Busy_SYNC), .test_si(n12), 
        .test_se(SE) );
  ClkDiv_test_1 U0_ClkDiv ( .i_ref_clk(RX_SCAN_CLK), .i_rst(n5), .i_clk_en(
        1'b1), .i_div_ratio(DIV_RATIO[3:0]), .o_div_clk(UART_TX_CLK), 
        .test_si(ALU_OUT_VLD), .test_so(n19), .test_se(SE) );
  SYS_CTRL_test_1 U0_SYS_CTRL ( .CLK(REF_SCAN_CLK), .RST(n7), .RF_RdData(
        RF_RdData), .RF_RdData_VLD(RF_RdData_VLD), .RF_WrEn(RF_WrEn), 
        .RF_RdEn(RF_RdEn), .RF_Address(RF_Address), .RF_WrData(RF_WrData), 
        .ALU_OUT(ALU_OUT), .ALU_OUT_VLD(ALU_OUT_VLD), .ALU_EN(ALU_EN), 
        .ALU_FUN(ALU_FUN), .CLKG_EN(CLKG_EN), .UART_RX_DATA(UART_RX_SYNC), 
        .UART_RX_VLD(UART_RX_V_SYNC), .UART_TX_Busy(UART_TX_Busy_SYNC), 
        .UART_TX_DATA(UART_TX_IN), .UART_TX_VLD(UART_TX_VLD), .test_si2(SI[0]), 
        .test_si1(SYNC_REF_RST), .test_so2(n13), .test_so1(SO[0]), .test_se(SE) );
  UART_test_1 U0_UART ( .RST(n5), .TX_CLK(TX_SCAN_CLK), .RX_CLK(RX_SCAN_CLK), 
        .RX_IN_S(n2), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(UART_TX_V_SYNC), .TX_OUT_S(UART_TX_O), 
        .TX_OUT_V(UART_TX_Busy), .Prescale(UART_Config[6:2]), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error), .test_si2(n10), 
        .test_si1(n13), .test_so1(n12), .test_se(SE) );
  RegFile_test_1 U0_REGFILE ( .CLK(REF_SCAN_CLK), .RST(n7), .WrEn(RF_WrEn), 
        .RdEn(RF_RdEn), .Address({RF_Address[3:2], n4, n3}), .WrData(RF_WrData), .RdData(RF_RdData), .RdData_VLD(RF_RdData_VLD), .REG0(Operand_A), .REG1(
        Operand_B), .REG2({SYNOPSYS_UNCONNECTED__0, UART_Config[6:0]}), .REG3(
        {SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, DIV_RATIO[3:0]}), 
        .test_si2(SI[1]), .test_si1(n19), .test_so2(n16), .test_so1(SO[1]), 
        .test_se(SE) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(_0_net_), .CLK(REF_SCAN_CLK), .GATED_CLK(
        ALU_CLK) );
  RST_SYNC_test_0 U0_RST_SYNC ( .RST(RST_SCAN_RST), .CLK(REF_SCAN_CLK), 
        .SYNC_RST(SYNC_REF_RST), .test_si(n16), .test_se(SE) );
  RST_SYNC_test_1 U1_RST_SYNC ( .RST(RST_SCAN_RST), .CLK(RX_SCAN_CLK), 
        .SYNC_RST(SYNC_UART_RST), .test_si(n11), .test_se(SE) );
  ALU_test_1 U0_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .CLK(ALU_CLK), .RST(n7), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VLD), .test_si(SI[2]), .test_se(SE) );
endmodule

