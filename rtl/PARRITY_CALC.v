/*
File Name:PARRITY_CALC.v
Module: PARITY_CALC
Description:PARITY_CALC take a parallel bus data and Calculate the parity
1- ODD  parity is 1 :when the number of one's in data is odd so it's output is 0 else is 1.
2- EVEN parity is 0 :when the number of one's in data is even so it's output is 0 else is 1 .
---------------------- 
Module mapping:
 
PARITY_CALC parity (
.P_Data()       ,
.PAR_TYP()      ,
.CLK()          ,
.RST()          ,
.Data_Valid()   ,
.Busy()         ,
.par_bit()
);
*/

module  PARITY_CALC #(parameter INPUT_DATA=8)
(
input   wire    [INPUT_DATA-1:0]  P_Data      ,
input   wire                      PAR_TYP     ,
input   wire                      CLK         ,
input   wire                      RST         ,
input   wire                      Data_Valid  ,
input   wire                      Busy        ,
output  reg                       par_bit  
                                            );
reg [INPUT_DATA-1:0]  Memory;//internal memory flipflops for the BUS data when valid 1
//Sequntial always for memory 
always  @ (posedge  CLK or negedge  RST)
begin
  if  (!RST)
    begin
      Memory<='b0;
    end
  else  
    begin
      if(Data_Valid &&  (!Busy))
        begin
          Memory<=P_Data;
        end
    end
end                       
                                           
//Sequntial always for calculate the parity_bit                                            
always  @(posedge CLK or  negedge RST)
begin
  if  (!RST)
    begin
      par_bit   <=    1'b0;
    end
  else
    begin 
      if  (PAR_TYP)//ODD==1
         begin
           par_bit   <=    ~(^Memory);  
         end
      else  if  (!PAR_TYP)//even==0
          begin
            par_bit   <=    ^Memory;
          end
    end
end
endmodule