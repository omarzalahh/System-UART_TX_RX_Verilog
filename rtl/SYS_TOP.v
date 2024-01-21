module SYS_TOP # ( parameter DATA_WIDTH = 8 ,  RF_ADDR = 4 , NUM_OF_CHAINS = 3 )
(
 input   wire                          scan_clk ,
 input   wire                          scan_rst ,
 input   wire                          test_mode ,
 input   wire                          SE ,
 input   wire   [NUM_OF_CHAINS-1:0]    SI ,
 output  wire   [NUM_OF_CHAINS-2:0]    SO ,
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error
);
//internal signals
wire        SYNC_REF_RST;
wire        SYNC_UART_RST;
//OUT put from CLOCK DIVIDER(input to UART tx )
wire					               UART_TX_CLK;
//OUT PUT INTERNAL SINGALS FROM sys ctrl(INPUT FOR REGFILE)
wire                    RF_WrEn     ;
wire                    RF_RdEn     ;
wire  [RF_ADDR-1:0]     RF_Address  ;
wire  [DATA_WIDTH-1:0]  RF_WrData   ;
//OUTPUT FROM REG FILE (INPUT TO CTRL SYS)
wire  [DATA_WIDTH-1:0]  RF_RdData    ;
wire                    RF_RdData_VLD;
//OUTPUT FROM REG FILE (INPUT TO ALU)
wire  [DATA_WIDTH-1:0]  Operand_A    ;//REG0
wire  [DATA_WIDTH-1:0]  Operand_B    ;//REG1
wire  [DATA_WIDTH-1:0]  UART_Config  ;//REG2
wire  [DATA_WIDTH-1:0]  DIV_RATIO    ;//REG3
//OUTPUT FROM SYS CTRL (input CLOCK GATE)
wire                    CLKG_EN      ;
//OUTPUT FROM CLOCK GATE (input alu)
wire                     ALU_CLK     ;
//UART INTERNAL SIGNALS 
wire      [DATA_WIDTH-1:0]      UART_RX_OUT   ;//rx data input to data sync ref
wire         						             UART_RX_V_OUT ;//rx valid input to data sync ref
wire      [DATA_WIDTH-1:0]			   UART_RX_SYNC  ;
wire                            UART_RX_V_SYNC;
wire      [DATA_WIDTH-1:0]      UART_TX_IN    ;//input to data sync from sys ctr;
wire        						              UART_TX_VLD   ;//input to data sync
wire      [DATA_WIDTH-1:0]      UART_TX_SYNC  ;//out put from data sync
wire        						              UART_TX_V_SYNC;//output from data valid
wire                            UART_TX_Busy  ;
wire                            UART_TX_Busy_SYNC;	
wire                            ALU_EN        ;
wire      [3:0]                 ALU_FUN       ; 
wire      [DATA_WIDTH*2-1:0]    ALU_OUT       ;
wire                            ALU_OUT_VLD   ; 
wire                            CLKDIV_EN     ;



wire                                   REF_SCAN_CLK ;
wire                                   TX_SCAN_CLK  ;
wire                                   RX_SCAN_CLK  ;

wire                                   RST_SCAN_RST ;
wire                                   REF_SCAN_RST ;
wire                                   UART_SCAN_RST;




///********************************************************///
//////////////////// Muxes Clocks & Resets////////////////////
///********************************************************///


//////////////////////// Clocks  dft/////////////////////////////

mux2X1 U0_mux2X1 (
.IN_0(REF_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(REF_SCAN_CLK)
); 

mux2X1 U1_mux2X1 (
.IN_0(UART_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(RX_SCAN_CLK)
); 

mux2X1 U2_mux2X1 (
.IN_0(UART_TX_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(TX_SCAN_CLK)
); 



//////////////////////// Resets /////////////////////////////

mux2X1 U3_mux2X1 (
.IN_0(RST_N),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(RST_SCAN_RST)
); 

mux2X1 U4_mux2X1 (
.IN_0(SYNC_REF_RST),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(REF_SCAN_RST)
); 

mux2X1 U5_mux2X1 (
.IN_0(SYNC_UART_RST),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(UART_SCAN_RST)
); 
///********************************************************///
////////////////////// Data Synchronizer /////////////////////
///********************************************************///
/*------------------------------------------
---------------REF SYNC --------------------
--------------------------------------------*/
DATA_SYNC U0_ref_sync (
.dest_clk(REF_SCAN_CLK)                ,
.dest_rst(REF_SCAN_RST)           ,
.unsync_bus(UART_RX_OUT)          ,
.bus_enable(UART_RX_V_OUT)        ,
.sync_bus(UART_RX_SYNC)           ,
.enable_pulse_d(UART_RX_V_SYNC)
);
/*------------------------------------------
---------------UART SYNC --------------------
--------------------------------------------*/
DATA_SYNC U1_uart_sync (
.dest_clk(TX_SCAN_CLK)            ,
.dest_rst(UART_SCAN_RST)          ,
.unsync_bus(UART_TX_IN)           ,
.bus_enable(UART_TX_VLD)          ,
.sync_bus(UART_TX_SYNC)           ,
.enable_pulse_d(UART_TX_V_SYNC)
);

///********************************************************///
////////////////////// Bit Synchronizer /////////////////////
///********************************************************///

BIT_SYNC  U0_bit_sync (
.dest_clk(REF_SCAN_CLK)            ,
.dest_rst(REF_SCAN_RST)       ,
.unsync_bit(UART_TX_Busy)     ,
.sync_bit(UART_TX_Busy_SYNC)
);
///********************************************************///
//////////////////////// Clock Divider ///////////////////////
///********************************************************///
ClkDiv U0_ClkDiv (
.i_ref_clk(RX_SCAN_CLK)        ,             
.i_rst(UART_SCAN_RST)       ,                 
.i_clk_en(CLKDIV_EN)        ,               
.i_div_ratio(DIV_RATIO[3:0]),           
.o_div_clk(UART_TX_CLK)             
);
///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///

SYS_CTRL U0_SYS_CTRL (
.CLK(REF_SCAN_CLK)                    ,
.RST(REF_SCAN_RST)               ,
.RF_RdData(RF_RdData)            ,
.RF_RdData_VLD(RF_RdData_VLD)    ,
.RF_WrEn(RF_WrEn)                , 
.RF_RdEn(RF_RdEn)                ,
.RF_Address(RF_Address)          ,
.RF_WrData(RF_WrData)            ,
.ALU_EN(ALU_EN)                  ,
.ALU_FUN(ALU_FUN)                , 
.ALU_OUT(ALU_OUT)                ,
.ALU_OUT_VLD(ALU_OUT_VLD)        ,  
.CLKG_EN(CLKG_EN)                , 
.CLKDIV_EN(CLKDIV_EN)            ,
.UART_RX_DATA(UART_RX_SYNC)      , 
.UART_RX_VLD(UART_RX_V_SYNC)     ,
.UART_TX_Busy(UART_TX_Busy_SYNC) ,
.UART_TX_DATA(UART_TX_IN)        , 
.UART_TX_VLD(UART_TX_VLD)
);

/*------------------------------------------
---------------UART --------------------
--------------------------------------------*/
UART U0_UART
(
.RST(UART_SCAN_RST)           ,
.TX_CLK(TX_SCAN_CLK)          ,
.RX_CLK(RX_SCAN_CLK)             ,
.parity_enable(UART_Config[0]),
.parity_type(UART_Config[1])  ,
.Prescale(UART_Config[6:2])   ,
.RX_IN_S(UART_RX_IN)          ,//input from top system module
.RX_OUT_P(UART_RX_OUT)        ,//input to data ref sync(data)
.RX_OUT_V(UART_RX_V_OUT)      ,//input to data ref syn (valid) 
.TX_IN_P(UART_TX_SYNC)        , //out put from data syn uart (input to uart tx)
.TX_IN_V(UART_TX_V_SYNC)      , //output valid from data syn uart(input to uart tx)
.TX_OUT_S(UART_TX_O)          ,//out from uart tx data
.TX_OUT_V(UART_TX_Busy)       ,//out from uart tx busy
.parity_error(parity_error)   ,//out from uart rx error parity
.framing_error(framing_error)  //out from uart rx error framing
);

/*------------------------------------------
---------------REG FILE --------------------
--------------------------------------------*/
RegFile U0_REGFILE
(
.CLK(REF_SCAN_CLK)             ,
.RST(REF_SCAN_RST)        ,
.WrEn(RF_WrEn)            ,
.RdEn(RF_RdEn)            ,
.Address(RF_Address)      ,
.WrData(RF_WrData)        ,
.RdData(RF_RdData)        ,
.RdData_VLD(RF_RdData_VLD),
.REG0(Operand_A)          ,
.REG1(Operand_B)          ,
.REG2(UART_Config)        ,
.REG3(DIV_RATIO)
);
/*------------------------------------------
---------------CLK GATE --------------------
--------------------------------------------*/
CLK_GATE  U0_CLK_GATE (
.CLK_EN(CLKG_EN||test_mode)  ,
.CLK(REF_SCAN_CLK)     ,
.GATED_CLK(ALU_CLK)
);

/*------------------------------------------
---------------RESET REF SYNC --------------
--------------------------------------------*/
RST_SYNC  U0_RST_SYNC(
.RST(RST_SCAN_RST)       ,//RST
.CLK(REF_SCAN_CLK)   ,//REF CLK
.SYNC_RST(SYNC_REF_RST)//SYNC RST SIGNAL
);
/*------------------------------------------
---------------RESET UART SYNC -------------
--------------------------------------------*/
RST_SYNC  U1_RST_SYNC(
.RST(RST_SCAN_RST)       ,//RST
.CLK(RX_SCAN_CLK)   ,//REF CLK
.SYNC_RST(SYNC_UART_RST)//SYNC RST for uart SIGNAL
);

///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///
 
ALU U0_ALU (
.CLK(ALU_CLK)     ,
.RST(REF_SCAN_RST),  
.A(Operand_A)     , 
.B(Operand_B)     ,
.EN(ALU_EN)       ,
.ALU_FUN(ALU_FUN) ,
.ALU_OUT(ALU_OUT) ,
.OUT_VALID(ALU_OUT_VLD)
);
endmodule
