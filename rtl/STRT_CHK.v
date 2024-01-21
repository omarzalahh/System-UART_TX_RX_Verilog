/*
Module: STRT_CHECK.v
Owner : Omar  Salah
-------------------------
Description :
-------------

-------------------------
Mapping     :
-------------
STRT_CHECK start_check 
(
  .strt_chk_en   ()    ,
  .sampled_bit   ()    ,
  .CLK           ()    ,
  .RST           ()    ,
  .strt_glitch   ()       
);
*/


module  STRT_CHECK(
  input   wire    strt_chk_en   ,
  input   wire    sampled_bit   ,
  input   wire    CLK           ,
  input   wire    RST           ,
  output  reg     strt_glitch
);

always  @ (posedge  CLK or negedge  RST)
  begin
   if(!RST)
     begin
       strt_glitch  <=  1'b0;
     end
   else if(strt_chk_en )
    begin
      strt_glitch <=  sampled_bit;
    end
  end

endmodule
