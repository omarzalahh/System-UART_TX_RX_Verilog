
############################  Search PATH ################################

lappend search_path /home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys
lappend search_path /home/IC/CRCO/System/rtl


########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "/home/IC/CRCO/System/dft/SYS_TOP.svf"

####################### Read Reference tech libs ########################
 

set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

###################  Read Reference Design Files ######################## 
read_verilog -container Ref "mux2X1.v"
read_verilog -container Ref "ALU.v"
read_verilog -container Ref "BIT_SYNC.v"
read_verilog -container Ref "ClkDiv.v"
read_verilog -container Ref "CLK_GATE.v"
read_verilog -container Ref "data_sampling.v"
read_verilog -container Ref "DATA_SYNC.v"
read_verilog -container Ref "DESERIALIZER.v"
read_verilog -container Ref "edge_counter.v"
read_verilog -container Ref "FSM.v"
read_verilog -container Ref "FSM_tx.v"
read_verilog -container Ref "MUX.v"
read_verilog -container Ref "PARITY_CHECK.v"
read_verilog -container Ref "PARRITY_CALC.v"
read_verilog -container Ref "RegFile.v"
read_verilog -container Ref "RST_SYNC.v"
read_verilog -container Ref "RX_CTRL.v"
read_verilog -container Ref "Serlizer.v"
read_verilog -container Ref "STOP_CHECK.v"
read_verilog -container Ref "TX_CTRL.v"
read_verilog -container Ref "SystemCtrl.v"
read_verilog -container Ref "STRT_CHK.v"
read_verilog -container Ref "TOP_RX.v"
read_verilog -container Ref "UARTTX.v"
read_verilog -container Ref "UART.v"
read_verilog -container Ref "SYS_TOP.v"

######################## set the top Reference Design ######################## 

set_reference_design SYS_TOP
set_top SYS_TOP

####################### Read Implementation tech libs ######################## 

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

#################### Read Implementation Design Files ######################## 

read_verilog -container Imp -netlist "/home/IC/CRCO/System/dft/SYS_TOP.v"

####################  set the top Implementation Design ######################

set_implementation_design SYS_TOP
set_top SYS_TOP
############################### Don't verify #################################

# do not verify scan in & scan out ports as a compare point as it is existed only after synthesis and not existed in the RTL

#scan in
set_dont_verify_points -type port Ref:/WORK/*/SI
set_dont_verify_points -type port Imp:/WORK/*/SI

#scan_out
set_dont_verify_points -type port Ref:/WORK/*/SO
set_dont_verify_points -type port Imp:/WORK/*/SO

############################### contants #####################################

# all atpg enable(test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant Ref:/WORK/*/test_mode 0
set_constant Imp:/WORK/*/test_mode 0

#scan_enable
set_constant Ref:/WORK/*/SE 0
set_constant Imp:/WORK/*/SE 0

########################### matching Compare points ##########################


## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "passing_points.rpt"
report_failing_points > "failing_points.rpt"
report_aborted_points > "aborted_points.rpt"
report_unverified_points > "unverified_points.rpt"


#start_gui
