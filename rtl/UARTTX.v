/*
Mapping :
---------
TOP_TX U0_uarttx
(
.P_DATA(),
.Data_valid(),
.CLK(),
.RST(),
.PAR_EN(),
.PAR_TYP(),
.TX_OUT(),
.Busy()    



);



*/
module  TOP_TX  #(parameter INPUTDATA=8)
(
input   wire    [INPUTDATA-1:0]   P_DATA,
input   wire                      Data_valid,
input   wire                      CLK,
input   wire                      RST,
input   wire                      PAR_EN,
input   wire                      PAR_TYP,
output  wire                      TX_OUT,
output  wire                      Busy    
);
//internal signals 
wire ser_data;
wire ser_done;
wire ser_en;
wire [1:0] mux_sel;
wire par_bit;

FSM fsm_tx (
.Data_Valid (Data_valid)     ,
.ser_done   (ser_done)       ,
.PAR_EN     (PAR_EN)         ,
.CLK        (CLK)            ,
.RST        (RST)            ,
.mux_sel    (mux_sel)        ,
.ser_en     (ser_en)         ,
.Busy       (Busy)
                            );
                  
PARITY_CALC parity (
.P_Data(P_DATA)              ,
.PAR_TYP(PAR_TYP)            ,
.CLK(CLK)                    ,
.RST(RST)                    ,
.Data_Valid(Data_valid)      ,
.Busy(Busy)                  ,
.par_bit(par_bit)
                            );
                            
Serializer SER1 (
.P_DATA(P_DATA)              ,
.ser_en(ser_en)              ,
.CLK(CLK)                    ,
.RST(RST)                    ,
.Busy(Busy)                  ,
.Data_Valid(Data_valid)      ,  
.ser_done(ser_done)          ,
.ser_data(ser_data)
                            );
MUX4x1 MUX_tx (
.ser_data(ser_data)         ,
.par_bit(par_bit)           ,
.mux_sel(mux_sel)           ,
.CLK(CLK)                   ,
.RST(RST)                   ,
.TX_OUT(TX_OUT)
                           );

endmodule