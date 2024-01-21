/*
Module: edge_counter.v
Owner : Omar  Salah
-------------------------
Description :
-------------

-------------------------
Mapping     :
-------------
edge_counter counter 
(
  .CLK          ()     ,
  .RST          ()     ,
  .enable       ()     ,
  .bit_cnt      ()     ,
  .edge_cnt     ()        
);
*/

module  edge_counter 
(
  input   wire                          CLK     ,
  input   wire                          RST     ,  
  input   wire                          enable  ,
  output  reg   [3:0]                   bit_cnt ,
  output  reg   [2:0]                   edge_cnt
);

wire edg_counter_done ;

//edg_counter_done
assign  edg_counter_done = (edge_cnt  ==  'b111)  ? 1'b1  : 1'b0  ;

//Edge counter for each clk  cycle

always  @ (posedge  CLK or  negedge RST)
  begin
    if(!RST)
      begin
        edge_cnt <=  'b0                    ;        
      end
    else
      begin
        if(enable)
          begin
            if(edg_counter_done)
              begin
                edge_cnt <=  'b0             ;
              end
            else 
              begin
                edge_cnt <=  edge_cnt + 1 ;
              end
          end
        else
          begin
            edge_cnt <=  'b0                 ;
          end
      end
  end
  //Bit Counter for each sampled bit
  
always  @ (posedge  CLK  or negedge RST)
  begin
    if(!RST)
      begin
       bit_cnt  <=  'b0; 
      end
    else  if  (enable)
      begin
        if(edg_counter_done)
          begin
            bit_cnt <=  bit_cnt + 1 ;
          end
      end
    else
      begin
        bit_cnt <=  'b0;
      end
  end
  
endmodule