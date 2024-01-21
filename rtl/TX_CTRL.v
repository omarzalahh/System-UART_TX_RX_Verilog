/*


Mapping:
.UART_TX_Busy ()           ,
.UART_RF_SENDER_DATA()     ,
.UART_RF_SENDER_VALID()   ,
.UART_ALU_SENDER_DATA()    ,
.UART_ALU_SENDER_VALID()   ,
.CLK()                     ,
.RST()                     ,
.UART_tx_VALID()           ,
.UART_TX_DATA() 

*/




module CTRL_TX  # ( parameter WIDTH = 8 ,
                              ADDR  = 4 )
 (
   input    wire                        UART_TX_Busy            ,
   input    wire   [WIDTH-1    :0]      UART_RF_SENDER_DATA     ,
   input    wire                        UART_RF_SENDER_VALID    ,
   input    wire   [(WIDTH*2)-1:0]      UART_ALU_SENDER_DATA    ,
   input    wire                        UART_ALU_SENDER_VALID   ,
   input    wire                        CLK                     ,
   input    wire                        RST                     ,
   output   reg                         UART_tx_VALID           ,
   output   reg    [WIDTH-1    :0]      UART_TX_DATA 
 );
 
 
 localparam [2:0] IDLE            = 3'b000,
                  UART_RF_S       = 3'b001,
                  UART_ALU1_S     = 3'b010,
                  UART_WAIT_BUSY  = 3'b011,
                  UART_ALU2_S     = 3'b100;
//internal states current and next state
  reg  [2:0]  CS;
  reg  [2:0]  NS;
//CS always block
  always  @ (posedge CLK or negedge RST)
    begin
      if(!RST)
        begin
          CS<=IDLE;
        end  
      else
        begin
          CS<=NS;
        end
    end

//NS logic
  always  @ (*)
    begin
      NS=IDLE;
      case(CS)
        IDLE    : begin
                   if(UART_RF_SENDER_VALID )
                      begin
                        NS  =  UART_RF_S  ;
                      end
                    else if (UART_ALU_SENDER_VALID)
                      begin
                        NS  = UART_ALU1_S ;
                      end
                    end
       //fram from register file
        UART_RF_S : begin
                      if(UART_TX_Busy)
                        begin
                          NS  = IDLE      ;
                        end
                      else
                        begin
                          NS  =  UART_RF_S  ;
                        end
                    end
      //first 8 bits from alu
        UART_ALU1_S : begin
                        if(UART_TX_Busy)
                          begin
                            NS  =  UART_WAIT_BUSY ;
                          end
                        else
                          begin
                            NS  =  UART_ALU1_S     ;
                          end
                      end
       //busy state betwen alu1 and alu2 to wait the next 8 bits 
        UART_WAIT_BUSY : begin
                          if(UART_TX_Busy)
                            begin
                              NS  =  UART_WAIT_BUSY ;   
                            end
                          else
                            begin
                              NS  = UART_ALU2_S     ; 
                            end    
                          end
      //second frame of alu 
       UART_ALU2_S      : begin
                            if(UART_TX_Busy)
                              begin
                                NS  = IDLE          ;  
                              end
                            else
                              begin
                                NS  = UART_ALU2_S   ;  
                              end
                            end
      //default                      
      default            : begin
                             NS  = IDLE  ;
                           end    
        endcase
    end
//output logic  
  always  @ (*)
  begin
    UART_tx_VALID = 1'b0 ;
    UART_TX_DATA  = 'b0 ;
    case(CS)
      IDLE           : begin
                        UART_tx_VALID = 1'b0 ;
                        UART_TX_DATA  = 'b0 ;
                       end
             
      UART_RF_S      : begin
                        UART_tx_VALID = 1'b1 ;
                        UART_TX_DATA  = UART_RF_SENDER_DATA ;
                       end
      
      UART_ALU1_S    : begin
                        UART_tx_VALID = 1'b1 ;
                        UART_TX_DATA  = UART_ALU_SENDER_DATA[WIDTH-1:0]  ;
                       end
      
      UART_WAIT_BUSY : begin
                        UART_tx_VALID = 1'b0 ;
                        UART_TX_DATA  = 'b1 ;
                       end
      
      UART_ALU2_S    : begin
                        UART_tx_VALID = 1'b1 ;
                        UART_TX_DATA  = UART_ALU_SENDER_DATA[(2*WIDTH)-1:WIDTH]  ;
                        end
      default        : begin
                        UART_tx_VALID = 1'b0 ;
                        UART_TX_DATA  = 'b0  ;
                       end
    endcase
  end  
  
endmodule