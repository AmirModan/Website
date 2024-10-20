###### Pre-Layout PrimeTime Script #######

## Define the library location
source ../../lib_gen/lib_container.tcl


## read the verilog files
read_verilog ../../dc_synth/synth_Project/output/gc_HDL.v
## Set top module name
current_design MotionEstimator

## Read in SDC from the synthesis
source ../../dc_synth/synth_Project/const/Project.sdc

##set_case_analysis 0 SI0
##set_case_analysis 0 SI1
##set_case_analysis 0 SI2
##set_case_analysis 0 SI3
##set_case_analysis 0 SI4

##set_case_analysis 1 scanEn

## Analysis reports


##report_timing -from [all_inputs] -max_paths 20 -to [all_registers -data_pins] > reports/set_case1/timing.rpt
##report_timing -from [all_register -clock_pins] -filter "is_clock_pin == true" -max_paths 20 -to [all_registers -data_pins] -delay_type min > reports/set_case1/hold.timing.rpt
##report_timing -from [all_register -clock_pins] -max_paths 20 -to [all_registers -data_pins]  > reports/set_case1/su.timing.rpt
##report_timing -from [all_registers -clock_pins] -max_paths 20 -to [all_outputs] >> reports/set_case1/timing.rpt
##report_timing -from [all_inputs] -to [all_outputs] -max_paths 20 >> reports/set_case1/timing.rpt
##report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type max  >> reports/set_case1/timing.rpt
##report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type min  >> reports/set_case1/timing.rpt


##set_case_analysis 0 scanEn

## Analysis reports


report_timing -from [all_inputs] -max_paths 20 -to [all_registers -data_pins]  > reports/set_case0/timing.rpt
report_timing -from [all_register -clock_pins] -max_paths 20 -to [all_registers -data_pins] > reports/set_case0/su.timing.rpt
report_timing -from [all_register -clock_pins] -max_paths 20 -to [all_registers -data_pins] -delay_type min > reports/set_case0/hold.timing.rpt
report_timing -from [all_registers -clock_pins] -max_paths 20 -to [all_outputs] >> reports/set_case0/timing.rpt
report_timing -from [all_inputs] -to [all_outputs] -max_paths 20 >> reports/set_case0/timing.rpt
report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type max  >> reports/set_case0/timing.rpt
report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins] -delay_type min  >> reports/set_case0/timing.rpt


report_timing -transition_time -capacitance -nets -input_pins -from [all_registers -clock_pins] -to [all_registers -data_pins]  > reports/timing.tran.cap.rpt


## Save outputs
save_session output/Project.session

