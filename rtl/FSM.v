/*
Module: FSM.v
Owner : Omar  Salah
-------------------------
Description :
-------------

-------------------------
Mapping     :
-------------
uart_rx_fsm rx_fsm
(
 .CLK          ()    ,
 .RST          ()    ,
 .RX_in        ()    ,
 .PAR_EN       ()    , 
 .bit_cnt      ()    ,
 .edge_cnt     ()    ,
 .par_err      ()    ,
 .stp_err      ()    , 
 .strt_glitch  ()    ,
 .strt_chk_en  ()    ,   
 .edge_bit_en  ()    , 
 .deser_en     ()    , 
 .par_chk_en   ()    , 
 .stp_chk_en   ()    ,
 .dat_samp_en  ()    ,
 .data_valid   ()
);
*/
module uart_rx_fsm  # ( parameter DATA_WIDTH = 8 )
(
 input   wire                  CLK            ,
 input   wire                  RST            ,
 input   wire                  RX_in          ,
 input   wire                  PAR_EN         , 
 input   wire   [3:0]          bit_cnt        ,
 input   wire   [2:0]          edge_cnt       ,
 input   wire                  par_err        ,
 input   wire                  stp_err        , 
 input   wire                  strt_glitch    ,
 output  reg                   strt_chk_en    ,   
 output  reg                   edge_bit_en    , 
 output  reg                   deser_en       , 
 output  reg                   par_chk_en     , 
 output  reg                   stp_chk_en     ,
 output  reg                   dat_samp_en    ,
 output  reg                   data_valid
);


// gray state encoding
localparam  [2:0]      IDLE     = 3'b000 ,
                       START    = 3'b001 ,
					             DATA     = 3'b011 ,
					             PARITY   = 3'b010 ,
					             STOP     = 3'b110 ,
					             err_chk  = 3'b111 ,
					             data_vld = 3'b101 ;
//current state and next state
reg         [2:0]      CS                ;
reg         [2:0]      NS                ;
//
wire                  Counter_edge_done  ;	
wire                  Counter_valid       ;
assign Counter_edge_done  =  (edge_cnt == 'b111)  ? 1'b1  : 1'b0  ;	
assign Counter_valid      =   (edge_cnt ==  'd6)  ? 1'b1  : 1'b0  ;
//state transiton 
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    CS <= IDLE ;
   end
  else
   begin
    CS <= NS ;
   end
 end
 

// next state logic
always @ (*)
 begin
  case(CS)
  IDLE   : begin
             if(!RX_in)
			         NS = START ;
			       else
			         NS = IDLE ; 			
           end
           
  START  : begin
             if(bit_cnt == 4'd0 && Counter_edge_done)
			        begin
			         if(!strt_glitch)                    // check that start bit not a glitch
				        begin
			           NS = DATA ;
                end
               else 
                 begin
 			            NS = IDLE ;       
                 end		
              end
			       else
			         begin
			           NS = START ; 			
               end			  
           end
           
  DATA   : begin
            if(bit_cnt == 4'd8 && Counter_edge_done)
			       begin
			         if(PAR_EN)
				        begin
			           NS = PARITY ;
				        end 
               else
				        begin
			           NS = STOP ;
                end					
             end
			      else
			       begin
			        NS = DATA ; 			
              end			  
           end
            
  PARITY : begin
             if(bit_cnt == 4'd9 && Counter_edge_done)
			         begin
			           NS = STOP ; 
               end
			       else
			         begin
			           NS = PARITY ; 			
               end			  
           end
           
  STOP   : begin
            if(bit_cnt == 4'd10 && Counter_valid)
			       begin
			         NS = err_chk ; 
             end
			      else
			       begin
			         NS = STOP ; 			
              end			  
            end
            
  err_chk   : begin
               if(par_err | stp_err)
			           begin
			             NS = IDLE ; 
                  end
			         else
			           begin
			             NS = data_vld ; 	    				
                 end			  
             end	
             
  data_vld : begin
              if(!RX_in)
                begin
			           NS = START ;
			          end
			        else
			          begin
			           NS= IDLE ;
			          end 						
             end
             			  		   
  default: begin
			       NS = IDLE ; 
           end	
  endcase 
                  	   
 end 

// output logic
always @ (*)
 begin
  edge_bit_en = 1'b0 ;
  dat_samp_en = 1'b0 ;  
  deser_en    = 1'b0 ; 
  par_chk_en  = 1'b0 ; 
  stp_chk_en  = 1'b0 ;
  data_valid  = 1'b0 ;
  strt_chk_en = 1'b0 ;
  case(CS)
  IDLE   : begin
             if(!RX_in)
			  begin
               edge_bit_en = 1'b1 ; 
  			         strt_chk_en = 1'b0 ;         
               deser_en    = 1'b0 ; 
               par_chk_en  = 1'b0 ; 
               stp_chk_en  = 1'b0 ;	
               dat_samp_en = 1'b0 ; 	
               data_valid  = 1'b0 ;		   
			  end 
			else
			  begin
			         strt_chk_en = 1'b0 ;
               edge_bit_en = 1'b0 ; 
               deser_en    = 1'b0 ; 
               par_chk_en  = 1'b0 ; 
               stp_chk_en  = 1'b0 ;
               data_valid  = 1'b0 ; 
               dat_samp_en = 1'b0 ; 			   
			  end  			
           end
           
  START  : begin
			       strt_chk_en = 1'b1 ;  
             edge_bit_en = 1'b1 ; 
             deser_en    = 1'b0 ; 
             par_chk_en  = 1'b0 ; 
             stp_chk_en  = 1'b0 ;
             data_valid  = 1'b0 ; 
             dat_samp_en = 1'b1 ;			 
           end
           
  DATA   : begin
             edge_bit_en = 1'b1 ; 
             deser_en    = 1'b1 ; 
             par_chk_en  = 1'b0 ; 
             stp_chk_en  = 1'b0 ;
             strt_chk_en = 1'b0 ;  
             data_valid  = 1'b0 ;
             dat_samp_en = 1'b1 ;			 
           end
  PARITY : begin
             edge_bit_en = 1'b1 ; 
             deser_en    = 1'b0 ; 
             par_chk_en  = 1'b0 ; 
             stp_chk_en  = 1'b0 ;
             strt_chk_en = 1'b0 ;  
             data_valid  = 1'b0 ;
             dat_samp_en = 1'b1 ;			
    if(bit_cnt == 4'd9 && Counter_valid)
      begin
             edge_bit_en = 1'b1 ; 
             deser_en    = 1'b0 ; 
             par_chk_en  = 1'b1 ; 
             stp_chk_en  = 1'b0 ;
             strt_chk_en = 1'b0 ;  
             data_valid  = 1'b0 ;
             dat_samp_en = 1'b1 ;				 
           end
           end
  STOP   : begin
             edge_bit_en = 1'b1 ; 
             deser_en    = 1'b0 ; 
             strt_chk_en = 1'b0 ;  
             par_chk_en  = 1'b0 ; 
             stp_chk_en  = 1'b0  ;
             data_valid  = 1'b0 ;
             dat_samp_en = 1'b1 ;		
      if(bit_cnt == 4'd10 && edge_cnt=='d5)
      begin
             edge_bit_en = 1'b1 ; 
             deser_en    = 1'b0 ; 
             par_chk_en  = 1'b0 ; 
             stp_chk_en  = 1'b1 ;
             strt_chk_en = 1'b0 ;  
             data_valid  = 1'b0 ;
             dat_samp_en = 1'b1 ;				 
           end		 
           end
           	
  err_chk: begin
             edge_bit_en = 1'b0 ; 
             deser_en    = 1'b0 ; 
             par_chk_en  = 1'b0 ; 
             strt_chk_en = 1'b0 ;  
             stp_chk_en  = 1'b0 ;
             data_valid  = 1'b0 ;
             dat_samp_en = 1'b1 ;				 
           end	
           
  data_vld:begin
             edge_bit_en = 1'b0 ; 
             deser_en    = 1'b0 ; 
             strt_chk_en = 1'b0 ;  
             par_chk_en  = 1'b0 ; 
             stp_chk_en  = 1'b0 ;
             data_valid  = 1'b1 ;
             dat_samp_en = 1'b0 ;				 
           end
           			   
  default: begin
             edge_bit_en = 1'b0 ; 
             strt_chk_en = 1'b0 ;  
             deser_en    = 1'b0 ; 
             par_chk_en  = 1'b0 ; 
             stp_chk_en  = 1'b0 ;	
			       data_valid  = 1'b0 ;
             dat_samp_en = 1'b0 ;				 
		        end 
  endcase                 	   
 end 

endmodule