###########################################################################
### Inital design setup
###########################################################################

#gui_start


source ../../lib_gen/lib_container.tcl


##dont use from lvt
##set_dont_use {saed32lvt_ss0p85v125c/AO22X*_LVT \ 
##               saed32lvt_ss0p85v125c/INVX1_LVT \ 
##              saed32lvt_ss0p85v125c/IBUFF*_LVT \
##	      saed32lvt_ss0p85v125c/AOI22X1_LVT}

##dont use from hvt
##set_dont_use {saed32hvt_ss0p85v125c/NAND2X*_HVT \ 
##               saed32hvt_ss0p85v125c/AOI21X1_HVT \ 
##              saed32hvt_ss0p85v125c/IBUFF*_HVT \
##	      saed32hvt_ss0p85v125c/MUX*_HVT}


set mw_logic0_net VSS
set mw_logic1_net VDD

set_tlu_plus_files -max_tluplus /packages/process_kit/generic/generic_32nm/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmax.tluplus -min_tluplus /packages/process_kit/generic/generic_32nm/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmin.tluplus  -tech2itf_map /packages/process_kit/generic/generic_32nm/SAED32_EDK/tech/star_rcxt/saed32nm_tf_itf_tluplus.map

create_mw_lib -technology /packages/process_kit/generic/generic_32nm/SAED32_EDK/tech/milkyway/saed32nm_1p9m_mw.tf -mw_reference_library {/packages/process_kit/generic/generic_32nm/EDK_updated_april2012/SAED32_EDK/lib/stdcell_lvt/milkyway/saed32nm_lvt_1p9m /packages/process_kit/generic/generic_32nm/EDK_updated_april2012/SAED32_EDK/lib/stdcell_hvt/milkyway/saed32nm_hvt_1p9m} Project_design.mw 

open_mw_lib Project_design.mw

read_verilog ../../dc_synth/synth_Project/output/gc_HDL.v

current_design Project

uniquify_fp_mw_cel

link

read_sdc ../../dc_synth/synth_Project/const/Project.sdc

##read_def -verbose /Users/students/dennison/asic_flow_setup_orig/dc_synth/synth_Project/output/scan.def
##read_def -verbose /Users/students/dennison/asic_flow_setup_orig/dc_synth/synth_Project/output/scan.def

save_mw_cel -as Project_initial


create_floorplan -control_type aspect_ratio -core_aspect_ratio 1 -core_utilization .70  -row_core_ratio 1  -start_first_row -left_io2core 5.0 -bottom_io2core 5.0 -right_io2core 5.0 -top_io2core 5.0 


derive_pg_connection -power_net VDD -ground_net VSS
derive_pg_connection -power_net VDD -ground_net VSS -tie

##Create VSS ring

create_rectangular_rings  -nets  {VSS}  -left_offset 0.5  -left_segment_layer M6 -left_segment_width 1.0 -extend_ll -extend_lh -right_offset 0.5 -right_segment_layer M6 -right_segment_width 1.0 -extend_rl -extend_rh -bottom_offset 0.5  -bottom_segment_layer  M7 -bottom_segment_width 1.0 -extend_bl -extend_bh -top_offset 0.5 -top_segment_layer M7 -top_segment_width 1.0 -extend_tl -extend_th
 
## Create VDD Ring

create_rectangular_rings  -nets  {VDD}  -left_offset 1.8  -left_segment_layer M6 -left_segment_width 1.0 -extend_ll -extend_lh -right_offset 1.8 -right_segment_layer M6 -right_segment_width 1.0 -extend_rl -extend_rh -bottom_offset 1.8  -bottom_segment_layer M7 -bottom_segment_width 1.0 -extend_bl -extend_bh -top_offset 1.8 -top_segment_layer M7 -top_segment_width 1.0 -extend_tl -extend_th

## Creates Power Strap 

create_power_strap -nets { VDD } -layer M6 -direction vertical -width 3  
create_power_strap -nets { VSS } -layer M6 -direction vertical  -width 3

verify_drc
## Save the design


set_case_analysis 0 scanEn
write_def -output output/Project_fp.def
save_mw_cel -as Project_design

puts "floorplan done!!!!!"



###########################################################################
### Placement
###########################################################################

set_buffer_opt_strategy -effort high

set_tlu_plus_files -max_tluplus /packages/process_kit/generic/generic_32nm/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmax.tluplus -min_tluplus /packages/process_kit/generic/generic_32nm/SAED32_EDK/tech/star_rcxt/saed32nm_1p9m_Cmin.tluplus  -tech2itf_map /packages/process_kit/generic/generic_32nm/SAED32_EDK/tech/star_rcxt/saed32nm_tf_itf_tluplus.map


##Goto Layout Window , Placement ' Core Placement and Optimization .  A new window opens up as shown below . There are various options, you can click on what ever option you want and say ok. The tool will do the placement. Alternatively you can also run at the command at icc_shell . Below is example with congestion option.


place_opt -consider_scan
clock_opt -only_psyn

save_mw_cel -as Project_place

### Reports 

write_def -output output/Project_place.def
report_placement_utilization > output/Project_place_util.rpt
report_qor_snapshot > output/Project_place_qor_snapshot.rpt
report_qor > output/Project_place_qor.rpt

### Timing Report

report_timing -delay max -max_paths 20 > output/Project_place.setup.rpt
##set_case_analysis 1 scanEn
report_timing -delay min -max_paths 20 > output/Project_place.hold.rpt


###########################################################################
### Clock Tree Synthesis
###########################################################################

##In the Layout window, click on "Clock ", you will see various options, you can set any of the options to run CTS. If you click on Clock ' Core CTS and Optimization

##Save the Cell and report timing
##setup_time fix
clock_opt -only_cts


save_mw_cel -as Project_cts
report_placement_utilization > reports/Project_cts_util.rpt
report_qor_snapshot > reports/Project_cts_qor_snapshot.rpt
report_qor > reports/Project_cts_qor.rpt
##set_case_analysis 0 scanEn
report_timing -max_paths 20 -delay max > reports/Project_cts.setup.rpt
##set_case_analysis 1 scanEn
report_timing -max_paths 20 -delay min > reports/Project_cts.hold.rpt

## clock_opt -only_psyn ##
clock_opt -sizing
## hold_time fix
## clock_opt -only_hold_time
## Save cel again and report paths
save_mw_cel -as Project_cts_opt
### Timing Report
report_timing -delay max -max_paths 20 > reports/Project_cts_opt.setup.rpt report_timing
-delay min -max_paths 20 > reports/Project_cts_opt.hold.rpt

###########################################################################
### Routing
###########################################################################

##In the layout window, click on Route -> Core Routing and Optimization

route_opt 

##Save the cel and report timing

save_mw_cel -as mProject_route
write_def -output output/Project_route.def
report_placement_utilization > reports/Project_route_util.rpt
report_qor_snapshot > reports/Project_route_qor_snapshot.rpt
report_qor > reports/Project_route_qor.rpt
report_timing -max_paths 20 -delay max > reports/Project_route.setup.rpt
report_timing -max_paths 20 -delay min > reports/Project_route.hold.rpt

##POST ROUTE OPTIMIZATION STEPS

##Goto Layout Window, Route -> Verify Route


###########################################################################
### Extraction
###########################################################################

##Go to Layout Window, Route -> Extract RC, it opens up a new window as shown below, click ok. Alternatively, you can run this script on the ICC shell:

extract_rc  -coupling_cap  -routed_nets_only  -incremental

##write parasitic to a file for delay calculations tools (e.g PrimeTime).
write_parasitics -output ./output/Project_extracted.spef -format SPEF

##Write Standard Delay Format (SDF) back-annotation file
write_sdf ./output/Project_extracted.sdf

##Write out a script in Synopsys Design Constraints format
write_sdc ./const/Project_extracted.sdc -version 2.0

##Write out a hierarchical Verilog file for the current design, extracted from layout
write_verilog ./output/Project_extracted.v

##Save the cel and report timing
report_timing -max_paths 20 -delay max > reports/Project_extracted.setup.rpt
report_timing -max_paths 20 -delay min > reports/Project_extracted.hold.rpt

report_power > reports/Project_power.rpt

check_design > reports/Project_DRC.rpt

save_mw_cel -as Project_extracted

