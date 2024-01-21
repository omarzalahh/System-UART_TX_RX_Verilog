/*
Module: STOP_CHECK.v
Owner : Omar  Salah
-------------------------
Description :
-------------

-------------------------
Mapping     :
-------------
STOP_CHECK stop_check 
(
  .stp_chk_en   ()    ,
  .sampled_bit  ()    ,
  .CLK          ()    ,
  .RST          ()    ,
  .stp_err      ()       
);
*/

module  STOP_CHECK  
(
  input   wire    stp_chk_en    ,
  input   wire    sampled_bit   ,
  input   wire    CLK           ,
  input   wire    RST           ,
  output  reg     stp_err       
);
  
always  @ (posedge  CLK or negedge  RST)
  begin
   if(!RST)
     begin
       stp_err  <=    1'b0        ;
     end
 else
   if(stp_chk_en)
     begin
       stp_err  <=  !sampled_bit  ;
     end
  end
  
endmodule