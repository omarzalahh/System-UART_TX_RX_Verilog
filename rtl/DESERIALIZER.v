  /*
Module: DeSerializer.v
Owner : Omar  Salah
-------------------------
Description :
-------------

-------------------------
Mapping     :
-------------
DeSerializer deserializer 
(
  .deser_en     ()     ,
  .sampled_bit  ()     ,
  .CLK          ()     ,
  .RST          ()     ,
  .edge_cnt     ()     ,
  .P_DATA       ()         
);
*/
  
  
 module  DeSerializer  # ( parameter  DATA_WIDTH  = 8 )  
(
  input   wire                     deser_en      ,
  input   wire                     sampled_bit   ,
  input   wire                     CLK           ,
  input   wire                     RST           ,
  input   wire    [2:0]            edge_cnt      ,
  output  reg     [DATA_WIDTH-1:0] P_DATA          
);
  wire edg_counter_done ;

//edg_counter_done
assign  edg_counter_done = (edge_cnt  ==  'b111)  ? 1'b1  : 1'b0  ;

always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    P_DATA <= 'b0 ;
   end
  else if(deser_en && edg_counter_done )
   begin
    P_DATA <= {sampled_bit,P_DATA[7:1]}	;
   end	
 end
 

endmodule