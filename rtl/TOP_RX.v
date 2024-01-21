/*
Module: TOP_RX.v
Owner : Omar  Salah
-------------------------
Description :
-------------

-------------------------
Mapping     :
-------------
UART_RX DUT
(
  .CLK            ()   ,
  .RST            ()   ,
  .RX_in          ()   ,
  .Prescale       ()   ,
  .PAR_EN         ()   ,
  .PAR_TYP        ()   ,
  .P_DATA         ()   , 
  .data_valid     ()   ,
  .parity_error   ()   ,
  .framing_error  ()  
);
*/
module UART_RX # ( parameter DATA_WIDTH = 8 , PRESCALE_WIDTH = 5 )

(
 input   wire                          CLK            ,
 input   wire                          RST            ,
 input   wire                          RX_IN          ,
 input   wire   [PRESCALE_WIDTH-1:0]   Prescale       ,
 input   wire                          PAR_EN         ,
 input   wire                          PAR_TYP        ,
 output  wire   [DATA_WIDTH-1:0]       P_DATA         , 
 output  wire                          parity_error   ,
 output  wire                          framing_error  ,
 output  wire                          data_valid

);


wire   [3:0]                  bit_count ;
wire   [2:0]                  edge_count ;
wire                          edge_bit_en; 
wire                          deser_en; 
wire                          par_chk_en; 
wire                          stp_chk_en; 
wire                          strt_chk_en; 
wire                          strt_glitch;
wire                          sampled_bit;
wire                          dat_samp_en;
//----------------- Start  Block  -------------------------
STRT_CHECK start_check 
(
  .strt_chk_en   (strt_chk_en)    ,
  .sampled_bit   (sampled_bit)    ,
  .CLK           (CLK)            ,
  .RST           (RST)            ,
  .strt_glitch   (strt_glitch)       
);
//------------------      Parity  Block    -----------------
Parity_Check #(.DATA_WIDTH(DATA_WIDTH)) U0_parity_check
(
  .PAR_TYP      (PAR_TYP)         ,
  .par_chk_en   (par_chk_en)      ,
  .sampled_bit  (sampled_bit)     ,
  .P_DATA       (P_DATA)          ,
  .CLK          (CLK)             ,
  .RST          (RST)             ,
  .par_err      (parity_error)
);
//------------------      Stop  Block      -----------------
STOP_CHECK U0_stop_check 
(
  .stp_chk_en   (stp_chk_en)     ,
  .sampled_bit  (sampled_bit)    ,
  .CLK          (CLK)            ,
  .RST          (RST)            ,
  .stp_err      (framing_error)       
);
//------------------  Deserializer  Block -------------------
DeSerializer  #(.DATA_WIDTH(DATA_WIDTH)) deserializer 
(
  .deser_en     (deser_en)        ,
  .sampled_bit  (sampled_bit)     ,
  .CLK          (CLK)             ,
  .RST          (RST)             ,
  .edge_cnt     (edge_count)      ,
  .P_DATA       (P_DATA)         
);
//------------------ edge & bit counter Block ----------------
edge_counter counter 
(
  .CLK          (CLK)             ,
  .RST          (RST)             ,
  .enable       (edge_bit_en)     ,
  .bit_cnt      (bit_count)       ,
  .edge_cnt     (edge_count)        
);
//------------------  Data  Sampling  Block -------------------
data_sampling oversampling 
(
  .CLK          (CLK)           ,
  .RST          (RST)           ,
  .RX_in        (RX_IN)         ,
  .edge_cnt     (edge_count)    ,
  .Perscale     (Prescale)      ,  
  .dat_samp_en  (dat_samp_en)   ,
  .sampled_bit  (sampled_bit)    
);
//------------------    FSM   Reciver  Block -------------------
uart_rx_fsm #(.DATA_WIDTH(DATA_WIDTH))  rx_fsm
(
 .CLK          (CLK)             ,
 .RST          (RST)             ,
 .RX_in        (RX_IN)           ,
 .PAR_EN       (PAR_EN)          , 
 .bit_cnt      (bit_count)       ,
 .edge_cnt     (edge_count)      ,
 .par_err      (parity_error)    ,
 .stp_err      (framing_error)   , 
 .strt_glitch  (strt_glitch)     ,
 .strt_chk_en  (strt_chk_en)     ,   
 .edge_bit_en  (edge_bit_en)     , 
 .deser_en     (deser_en)        , 
 .par_chk_en   (par_chk_en)      , 
 .stp_chk_en   (stp_chk_en)      ,
 .dat_samp_en  (dat_samp_en)     ,
 .data_valid   (data_valid)
);
endmodule