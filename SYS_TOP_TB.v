/*
Name:Omar Salah ElDin
Date:6/10/2022
----------------------
Description:
-Test bench for system top 
-The system use uart protocol to receive and send and test them from test bench 
-Using commands to activate REG FILE ,ALU
-Different clock domain (The uart frequncy is 9.8khz ),( the alu,reg file & system cntrl are 10MHZ)
-Test bench have 6 tasks
-1st task is initialize that intialize value of (CLK REF,CLK UART,RST,INPUT TO UART)
-2nd task is to rest the system
-3rd task is to recive the input from uart rx and write it in reg file by write command 
-4th task is to read from reg file and send it to uart tx
-5tj task is to recive from uart alu command with operand that calculate by using alu func command and  send 16 bits in 2 frams to uart tx 
-6th task is to recive from uart alu comman with no operand that  calculate by using alu func command and send 8 bits to uart tx 
*/
`timescale 1ns/1ps

module SYS_TOP_TB ();

// -------------- parameters & integers -----------

parameter   Data_width_tb          = 8;
parameter   OPERAND_WIDTH_tb       = 8;
parameter   ALU_OUT_WIDTH_tb       = OPERAND_WIDTH_tb + OPERAND_WIDTH_tb;
parameter   NUM_OF_OPERATIONS_tb   = 16;
parameter   DEPTH_tb               = 16;
parameter   NUM_STAGES_tb          = 2;
parameter   BIT_SYNC_BUS_WIDTH_tb  = 1;
parameter   DATA_SYNC_BUS_WIDTH_tb = 8;
parameter   ratio_width_tb         = 4;
parameter   Prescale_width_tb      = 5;
integer     i;

// ------------------ DUT Signals ------------------

reg                                         RX_IN_tb;
reg                                         REF_CLK_tb;
reg                                         UART_CLK_tb;
reg                                         RST_tb;
wire                                        TX_OUT_tb;
wire                                        par_err_tb;
wire                                        stp_err_tb; 

// ------------------ Commands ------------------

reg         [ 32 : 0 ]      WR_Command;
reg         [ 21 : 0 ]      Rd_Command;
reg         [ 43 : 0 ]      ALU_Operand_command;
reg         [ 21 : 0 ]      ALU_NO_Operand_command;

// ------------------ Expected outputs ------------------

reg         [ 10 : 0 ]      Rd_TXOUT;
reg         [ 10 : 0 ]      ALUOP1_TXOUT;
reg         [ 10 : 0 ]      ALUOP2_TXOUT;
reg         [ 10 : 0 ]      ALUNOOP1_TXOUT;
reg         [ 10 : 0 ]      ALUNOOP2_TXOUT; 

// -------------- Initial block ------------------

initial

    begin

        initialize ();

        reset ();

       // ---------------------- Register File Write command --------------------------

        Write_command ();

        // ---------------------- Register File Read command --------------------------

        Read_command ();
            
        // ---------------------- ALU Operation command with operand --------------------------

        ALUOP_command ();
            
        // ---------------------- ALU Operation command with No operand --------------------------

        ALUNOOP_command ();

       #1000000

        $stop;
        
    end

// -------------- Intialize operation ------------

task initialize ();
    begin
        RX_IN_tb      = 'b1;
        REF_CLK_tb    = 'b0;
        UART_CLK_tb   = 'b0;
        RST_tb        = 'b0;
    end
endtask

// ---------------- Reset operation --------------

task reset ();
    begin
        #5
        RST_tb        = 'b1;
    end
endtask

// --------- Register File Write command -------------

task Write_command ();
    begin

        WR_Command = 'b10010110100_11000000010_10101010100;//data_address_command
        
        for ( i = 0 ; i < 33 ; i = i + 1 )
            begin
                repeat (8) @(posedge UART_CLK_tb);
                RX_IN_tb = WR_Command [i];
            end
    end
endtask

// -------- Register File Read command -----------------

task Read_command ();

    begin

        Rd_Command = 'b11000000010_10101110110;
        Rd_TXOUT   = 'b10010110100;

        for ( i = 0 ; i < 22 ; i = i + 1 )
            begin
                repeat (8) @(posedge UART_CLK_tb);
                RX_IN_tb = Rd_Command [i];
            end

        $display ( " ----------------------------------------  " );
        $display ( "------Register File Write command -------  " );
        $display ( " ----------------------------------------  " );

       
        @( negedge TX_OUT_tb );

        for ( i = 0 ; i < 11 ; i = i + 1 )
            begin
                repeat (8) @ ( posedge UART_CLK_tb );

                if ( TX_OUT_tb == Rd_TXOUT [i] )
                    begin
                        $display ( " DATA [%d] IS PASSED  ",i);
                    end
                else
                    begin
                        $display ( " DATA [%d] IS FAILED  ",i);
                    end                
            end   
    end
    
endtask

// -------- ALU Operation command with operand -----------------

task ALUOP_command ();

    begin
 
        ALU_Operand_command = 'b11000000010_11010101110_10010110100_10110011000 ;
        ALUOP1_TXOUT        = 'b10000000110;
        ALUOP2_TXOUT        = 'b10000000000;

        for ( i = 0 ; i < 44 ; i = i + 1 )
            begin
                repeat (8) @(posedge UART_CLK_tb);
                RX_IN_tb = ALU_Operand_command [i];
            end

        $display ( " ----------------------------------------  " );
        $display ( "--- ALU Operation command with operand ---  " );
        $display ( " ----------------------------------------  " );

        $display ( "--- Least 8 bitS of ALU OUT  ---  " );

        @( negedge TX_OUT_tb );

        for ( i = 0 ; i < 11 ; i = i + 1 )
            begin
                repeat (8) @ ( posedge UART_CLK_tb );

                if ( TX_OUT_tb == ALUOP1_TXOUT [i] )
                    begin
                        $display ( " DATA [%d] IS PASSED  ",i);
                    end
                else
                    begin
                        $display ( " DATA [%d] IS FAILED  ",i);
                    end                
            end

        $display ( "--- Most 8 bits of ALU OUT ---  " );  

        @( negedge TX_OUT_tb );

        for ( i = 0 ; i < 11 ; i = i + 1 )
            begin
                repeat (8) @ ( posedge UART_CLK_tb );

                if ( TX_OUT_tb == ALUOP2_TXOUT [i] )
                    begin
                        $display ( " DATA [%d]  IS PASSED  ",i);
                    end
                else
                    begin
                        $display ( " DATA [%d] IS FAILED  ",i);
                    end                
            end
    end
    
endtask

// -------- ALU Operation command with No operand -----------------

task ALUNOOP_command ();

    begin

        
        ALUNOOP1_TXOUT        = 'b10100101100;
        ALUNOOP2_TXOUT        = 'b10000111100;
        ALU_NO_Operand_command = 'b11000000100_10110111010;

        for ( i = 0 ; i < 22 ; i = i + 1 )
            begin
                repeat (8) @(posedge UART_CLK_tb);
                RX_IN_tb = ALU_NO_Operand_command [i];
            end

        $display ( " ----------------------------------------  " );
        $display ( "--- ALU Operation command with No operand ---  " );
        $display ( " ----------------------------------------  " );

        $display ( "--- Least 8 bitS of ALU OUT  ---  " );

        @( negedge TX_OUT_tb );

        for ( i = 0 ; i < 11 ; i = i + 1 )
            begin
                repeat (8) @ ( posedge UART_CLK_tb );

                if ( TX_OUT_tb == ALUNOOP1_TXOUT [i] )
                    begin
                        $display ( " DATA [%d] IS PASSED  ",i);
                    end
                else
                    begin
                        $display ( " DATA [%d] IS FAILED  ",i);
                    end                
            end

        $display ( "--- Most 8 bits of ALU OUT ---  " );  

        @( negedge TX_OUT_tb );

        for ( i = 0 ; i < 11 ; i = i + 1 )
            begin
                repeat (8) @ ( posedge UART_CLK_tb );

                if ( TX_OUT_tb == ALUNOOP2_TXOUT [i] )
                    begin
                        $display ( " DATA [%d]  IS PASSED  ",i);
                    end
                else
                    begin
                        $display ( " DATA [%d] IS FAILED  ",i);
                    end                
            end
    end
    
endtask

// ---------------- Clock generator ---------------

initial 
    begin
        forever #10 REF_CLK_tb = ~ REF_CLK_tb;
    end

initial 
    begin
        forever #52083 UART_CLK_tb = ~ UART_CLK_tb;//52083
    end

// ---------------- Instantation ---------------

SYS_TOP DUT
        (
            .UART_RX_IN ( RX_IN_tb ),
            .REF_CLK ( REF_CLK_tb ),
            .UART_CLK ( UART_CLK_tb ),
            .RST_N ( RST_tb ),
            .UART_TX_O (TX_OUT_tb ),
            .parity_error ( par_err_tb),
            .framing_error ( stp_err_tb )
        );
        
endmodule


