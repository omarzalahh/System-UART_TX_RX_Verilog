/*
Module: data_sampling.v
Owner : Omar  Salah
-------------------------
Description :
-------------

-------------------------
Mapping     :
-------------
data_sampling oversampling 
(
  .CLK          ()   ,
  .RST          ()   ,
  .RX_in        ()   ,
  .edge_cnt     ()   ,
  .Perscale     ()   ,  
  .dat_samp_en  ()   ,
  .sampled_bit  ()    
);
*/


module  data_sampling 
(
  input   wire            CLK           ,
  input   wire            RST           ,
  input   wire            RX_in         ,
  input   wire    [2:0]   edge_cnt      ,
  input   wire    [4:0]   Perscale      ,  
  input   wire            dat_samp_en   ,
  output  reg             sampled_bit      
);
//internal signal 
  
  reg     [2:0]               sampled_mem   ;
  wire    [3:0]               Middle_clk    ;
  wire    [3:0]               Before_middle ;
  wire    [3:0]               After_middle  ;
  
//assign statment to calculate the perscale and take the sampled in it and its before edge and after edge
  
  assign  Middle_clk    = ( Perscale >>  1 )  - 1'b1  ;
  assign  Before_middle =  Middle_clk         - 1'b1  ;
  assign  After_middle  =  Middle_clk         + 1'b1  ;
  
//always block for sampled _mem to save the 3 values of sampling         
  always  @ (posedge  CLK or  negedge RST )
    begin
      if  ( !RST  )
        begin
          sampled_mem <=  3'b0;
        end   
      else
        begin
          if  ( dat_samp_en )
            begin
              if  ( edge_cnt == Before_middle )
                begin
                  sampled_mem [0] <=  RX_in ; 
                end
              else  if  ( edge_cnt == Middle_clk )
                begin
                  sampled_mem [1] <=  RX_in ; 
                end
              else  if  ( edge_cnt == After_middle )
                begin
                  sampled_mem [2] <=  RX_in ; 
                end
            end
          else
            begin
              sampled_mem <=  3'b0;
            end
        end
    end  

//always block for output sampled from oversampling
  always  @ (posedge  CLK or  negedge RST )
    begin
      if  ( !RST  )
        begin
          sampled_bit <=  1'b0;
        end
      else
        begin
          if  ( dat_samp_en )
            begin
              case(sampled_mem) 
                3'b000  : begin
                          sampled_bit <=  1'b0;
                          end
                3'b001  : begin
                          sampled_bit <=  1'b0;
                          end
                3'b010  : begin
                          sampled_bit <=  1'b0;
                          end
                3'b011  : begin
                          sampled_bit <=  1'b1;
                          end
                3'b100  : begin
                          sampled_bit <=  1'b0;
                          end
                3'b101  : begin
                          sampled_bit <=  1'b1;
                          end
                3'b110  : begin
                          sampled_bit <=  1'b1;
                          end
                3'b111  : begin
                          sampled_bit <=  1'b1;
                          end
              endcase
            end 
          else
            begin
              sampled_bit <=  1'b0  ;
            end         
        end
    end

endmodule
