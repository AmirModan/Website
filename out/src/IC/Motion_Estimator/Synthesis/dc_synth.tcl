
###### Synthesis Script #######

## Give the path to the verilog files and define the WORK directory
lappend search_path ../src/Project
define_design_lib WORK -path "work"

## Define the library location
source ../../lib_gen/lib_container.tcl


## read the verilog files
analyze -library WORK -format verilog Project.v

elaborate   -architecture verilog -library WORK MotionEstimator


## Check if design is consistent
check_design  > reports/synth_check_design.rpt

## Create Constraints 
create_clock clock -name ideal_clock1 -period 3.846
set_input_delay 0 [ remove_from_collection [all_inputs] clock ] -clock ideal_clock1
set_output_delay 0 [all_outputs ] -clock ideal_clock1

set_max_area 0 

## You can use set flatten command also
## set_flatten 

## You can ungroup or flatten your design to get better area
## ungroup -all

## Compilation 

uniquify

## you can change medium to either low or high 


compile -area_effort medium -map_effort high 

## Below commands report area , cell, qor, resources, and timing information needed to analyze the design. 

  report_area > reports/synth_area.rpt
  report_design > reports/synth_design.rpt
  report_cell > reports/synth_cells.rpt
  report_qor  > reports/synth_qor.rpt
  report_resources > reports/synth_resources.rpt
  report_timing -max_paths 10 > reports/synth_timing.rpt
  report_power -analysis_effort medium > reports/synth_power.rpt

## Dump out the constraints in an SDC file
  write_sdc const/Project.sdc -version 2.0

## Dump out the synthesized database and gate-level-netlist
  write -f ddc -hierarchy -output output/gc.ddc

  write -hierarchy -format verilog -output  output/gc_HDL.v

##exit
