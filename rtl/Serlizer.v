/*
File Name:Serlizer.v
Module: serlizer
Description:Serlizer take a parallel bus and change it to serial bus when valid bit is 1 only 
---------------------- 
Module mapping:
 
Serializer SER1 (
.P_DATA()      ,
.ser_en()      ,
.CLK()         ,
.RST()         ,
.Busy()        ,
.Data_Valid()  ,  
.ser_done()    ,
.ser_data()
              );
*/
module  Serializer  #(parameter INPUT_DATA=8)
(
  input   wire  [INPUT_DATA-1:0]  P_DATA,
  input   wire                    ser_en,
  input   wire                    CLK,
  input   wire                    RST,
  input   wire                    Busy,
  input   wire                    Data_Valid,  
  output  wire                    ser_done,
  output  wire                    ser_data
);
reg [INPUT_DATA-1:0]  regsiters;//internal memory in selerizer to save data when valid bit =1
reg [2:0]             counter;//counter from 0 to 7 
//Internal memory block
always  @ (posedge CLK or negedge RST )
begin
  if(!RST)
    begin
      regsiters   <=  'b0               ;
    end
  else  if  (Data_Valid &&  !Busy)
    begin
      regsiters   <=  P_DATA            ;
    end
  else  if  (ser_en)
    begin
      regsiters   <=  regsiters>>1      ;
    end
end
//Counter block
always  @ (posedge CLK or negedge RST)
begin
  if(!RST)
    begin
      counter    <=3'b0                  ;
    end
  else  if  (ser_en)
    begin
    counter       <= counter+3'b1       ;  
    end
  else
    begin
      counter     <= 3'b0               ;       
    end
end

assign  ser_data  = regsiters[0]        ;
assign  ser_done  = (counter  ==3'b111) ;
endmodule