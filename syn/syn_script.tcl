
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

##################### Define Working Library Directory ######################
                                                   
define_design_lib work -path ./work

############################# Formality Setup File ##########################
                                                   
set_svf $top_module.svf

################## Design Compiler Library Files #setup ######################

puts "###########################################"
puts "#      #setting Design Libraries          #"
puts "###########################################"

#Add the path of the libraries and RTL files to the search_path variable
lappend search_path /home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries 
set target_library [list $SSLIB $TTLIB $FFLIB]

## Standard Cell & Hard Macros libraries 
set link_library [list * $SSLIB $TTLIB $FFLIB]  

######################## Reading RTL Files #################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"

set file_format verilog

read_file -format $file_format /home/IC/CRCO/System/rtl/ALU.v
read_file -format $file_format /home/IC/CRCO/System/rtl/ClkDiv.v
read_file -format $file_format /home/IC/CRCO/System/rtl/CLK_GATE.v
read_file -format $file_format /home/IC/CRCO/System/rtl/BIT_SYNC.v
read_file -format $file_format /home/IC/CRCO/System/rtl/DATA_SYNC.v
read_file -format $file_format /home/IC/CRCO/System/rtl/RegFile.v
read_file -format $file_format /home/IC/CRCO/System/rtl/RST_SYNC.v
read_file -format $file_format /home/IC/CRCO/System/rtl/RX_CTRL.v
read_file -format $file_format /home/IC/CRCO/System/rtl/TX_CTRL.v
read_file -format $file_format /home/IC/CRCO/System/rtl/SystemCtrl.v
read_file -format $file_format /home/IC/CRCO/System/rtl/data_sampling.v
read_file -format $file_format /home/IC/CRCO/System/rtl/DESERIALIZER.v
read_file -format $file_format /home/IC/CRCO/System/rtl/edge_counter.v
read_file -format $file_format /home/IC/CRCO/System/rtl/PARITY_CHECK.v
read_file -format $file_format /home/IC/CRCO/System/rtl/STOP_CHECK.v
read_file -format $file_format /home/IC/CRCO/System/rtl/STRT_CHK.v
read_file -format $file_format /home/IC/CRCO/System/rtl/TOP_RX.v
read_file -format $file_format /home/IC/CRCO/System/rtl/FSM.v
read_file -format $file_format /home/IC/CRCO/System/rtl/MUX.v
read_file -format $file_format /home/IC/CRCO/System/rtl/PARRITY_CALC.v
read_file -format $file_format /home/IC/CRCO/System/rtl/Serlizer.v
read_file -format $file_format /home/IC/CRCO/System/rtl/UARTTX.v
read_file -format $file_format /home/IC/CRCO/System/rtl/FSM_tx.v
read_file -format $file_format /home/IC/CRCO/System/rtl/UART.v
read_file -format $file_format /home/IC/CRCO/System/rtl/SYS_TOP.v

###################### Defining toplevel ###################################

current_design $top_module

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## Liniking All The Design Parts ########"
puts "###############################################"

link 

#################### Liniking All The Design Parts #########################
puts "###############################################"
puts "######## checking design consistency ##########"
puts "###############################################"

check_design

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source ./cons.tcl

###################### Mapping and optimization ########################
puts "###############################################"
puts "########## Mapping & Optimization #############"
puts "###############################################"

compile 

#############################################################################
# Write out files

# Verilog Gate Level Netlist
write_file -format verilog -hierarchy -output SYS_TOP.v
# DDC Gate Level Netlist
write_file -format ddc -hierarchy -output SYS_TOP.ddc
# SDC(Synopsys Design Constraints) File
write_sdc -nosplit SYS_TOP.sdc
# SDF(Standard Delay Format) File
write_sdf SYS_TOP.sdf


################# reporting #######################

report_area 		-hierarchy 			> area.rpt
report_power 		-hierarchy 			> power.rpt
report_timing 		-max_paths 10 	-delay_type min > hold.rpt
report_timing 		-max_paths 10	-delay_type max > setup.rpt
report_clock 		-attributes 			> clocks.rpt
report_constraint 	-all_violators			> constraints.rpt
report_port						> ports.rpt
############################################################################
# DFT Preparation Section
############################################################################

set flops_per_chain 100

set num_flops [sizeof_collection [all_registers -edge_triggered]]

set num_chains [expr $num_flops / $flops_per_chain + 1 ]

################# starting graphical user interface #######################

gui_start

#exit

