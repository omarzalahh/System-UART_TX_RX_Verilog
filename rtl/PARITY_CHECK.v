/*
Module: Parity_check
Owner : Omar  Salah
-------------------------
Description :
-------------

-------------------------
Mapping     :
-------------
Parity_Check  parity_check
(
  .PAR_TYP      ()     ,
  .par_chk_en   ()     ,
  .sampled_bit  ()     ,
  .P_DATA       ()     ,
  .CLK          ()     ,
  .RST          ()     ,
  .par_err      ()
);
*/
module  Parity_Check  # ( parameter DATA_WIDTH  = 8 )

(
  input   wire                          PAR_TYP     ,
  input   wire                          par_chk_en  ,
  input   wire                          sampled_bit ,
  input   wire  [DATA_WIDTH-1:0]        P_DATA      ,
  input   wire                          CLK         ,
  input   wire                          RST         ,
  output  reg                           par_err
);

//internal signal
reg                   CHECK       ;
//SAVE the value of parity in flipflop
always  @ (*)
  begin
    case(PAR_TYP)
      1'b0  : begin  
        CHECK =    ^P_DATA    ;  
        end
      1'b1  : begin
        CHECK = ~(^P_DATA)   ;
        end
      endcase
  end
  
                         
// error check

always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    par_err <= 1'b0 ;
   end
  else if(par_chk_en)
   begin
    par_err <= CHECK ^	sampled_bit ;
   end	
 end
 
 
endmodule


