/*
File Name:MUX.v
Module: MUX4x1
Description:MUX4x1 That sends the actual bus to the reciver

INPUT:
1-Data from serilizer
2-parity bit
3-start bit
4-stop bit
5-selection line from FSM
6-Clk
7-RST

OUTPUT:
1-TX_OUT the send bus
---------------------- 
Module mapping:
 
MUX4x1 MUX_tx (
.ser_data()     ,
.par_bit()      ,
.mux_sel()      ,
.CLK()          ,
.RST()          ,
.TX_OUT()
                );
*/

module  MUX4x1(
input   wire          ser_data,
input   wire          par_bit,
input   wire  [1:0]   mux_sel,
input   wire          CLK,
input   wire          RST,
output  reg           TX_OUT
);

reg out;//internal signal for the output to save it in flipflop
//always combinational MUX 4x1 
always  @ (*)
begin
  case(mux_sel)
    2'b00:out=1'b0;//start
    2'b01:out=1'b1;//stop or IDLE
    2'b10:out=ser_data;//DATA
    2'b11:out=par_bit;//PARITY
  endcase
end
//Flipflop out from MUX to reciver
always  @ (posedge  CLK or negedge  RST)
begin
  if  (!RST)
    begin
      TX_OUT<='b1;
    end
  else
    begin
      TX_OUT<=out;
    end
end
endmodule