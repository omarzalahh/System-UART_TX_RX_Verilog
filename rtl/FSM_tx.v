/*
File Name:FSM.v
Module: FSM
Description:FSM take a 
---------------------- 
Module mapping:
 
FSM fsm_tx (
.Data_Valid ()     ,
.ser_done   ()     ,
.PAR_EN     ()     ,
.CLK        ()     ,
.RST        ()     ,
.mux_sel    ()     ,
.ser_en     ()     ,
.Busy       ()
                  );
*/

module  FSM (
input   wire               Data_Valid   ,
input   wire               ser_done     ,
input   wire               PAR_EN       ,
input   wire               CLK          ,
input   wire               RST          ,
output  reg      [1:0]     mux_sel      ,
output  reg                ser_en       ,
output  reg                Busy
                                       );
//Internal signals
reg busy_reg;//to get output from flipflop

//Local parameters used (IDLE,START,DATA,PARITY,STOP)
localparam  IDLE    = 3'b000            ,
            START   = 3'b001            ,
            DATA    = 3'b010            ,
            PARITY  = 3'b011            ,
            STOP    = 3'b100            ;
            
//Finite State Machine Current State and Next State
reg [2:0] Current_State                 ;
reg [2:0] Next_State                    ;

//Always sequntial for FSM Current_State
always  @ (posedge  CLK or  negedge RST)
begin
  if  (!RST)
    begin
      Current_State   <=    IDLE         ;
    end
  else
    begin
      Current_State   <=    Next_State   ;  
    end
end
//Always  Combinationl  For FSM Next_State
always  @ (*)
begin
  case(Current_State)
    IDLE  : 
      begin
        if(Data_Valid)
          begin
            Next_State  =   START         ;
          end
        else
          begin
            Next_State  =   IDLE          ;
          end
        end
    START :
      begin
         Next_State     =   DATA          ;
      end
    DATA  :
      begin
         if(ser_done &&  PAR_EN)
           begin
             Next_State  =  PARITY        ;
           end
        else  if(ser_done &&  !PAR_EN)
          begin
            Next_State    = STOP          ;
          end
        else
          begin
             Next_State   = DATA          ;
          end
      end
    PARITY :
     begin
       Next_State         = STOP          ;
     end
    STOP   :
      begin
            Next_State  =   IDLE          ;
      end
    default:
      begin
        Next_State        = IDLE          ;
      end
  endcase      
end

/*Always  combinational OUT PUT FROM THE FSM block logic (mux_sel,busy_reg,ser_en)
---------
for mux_sel....(MUX   4x1:
2'b00:out=1'b0;//start
2'b01:out=1'b1;//stop or IDLE
2'b10:out=ser_data;//DATA
2'b11:out=par_bit;//PARITY
*/
always @  (*)
begin
        busy_reg    =   1'b0    ;
        ser_en      =   1'b0    ;
        mux_sel     =   2'b01   ;
  
  case(Current_State)
    IDLE    :
      begin
        busy_reg    =   1'b0    ;
        ser_en      =   1'b0    ;
        mux_sel     =   2'b01   ;
      end
    START   :
      begin
        busy_reg    =   1'b1    ;
        ser_en      =   1'b0    ;
        mux_sel     =   2'b00   ;  
      end
    DATA    :
      begin
        busy_reg    =   1'b1    ;
        ser_en      =   1'b1    ;
        mux_sel     =   2'b10   ;  
      end
    PARITY  :
      begin
        busy_reg    =   1'b1    ;
        ser_en      =   1'b1    ;
        mux_sel     =   2'b11   ;   
      end
    STOP    :
      begin
            busy_reg    =   1'b1    ;
            ser_en      =   1'b0    ;
            mux_sel     =   2'b01   ;   
       end
    default:
      begin
        busy_reg    =   1'b0    ;
        ser_en      =   1'b0    ;
        mux_sel     =   2'b01   ; 
      end
    endcase
end
//always sequntial for busy out 
always  @ (posedge  CLK or  negedge RST)
begin
  if(!RST)
    begin
      Busy          <=    1'b0  ;
    end
  else
    begin
      Busy          <=    busy_reg;
    end
end
endmodule