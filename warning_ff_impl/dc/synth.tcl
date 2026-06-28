# dc/synth.tcl -- Design Compiler synthesis (RTL -> netlist).
# Run from the package root:
#   cd warning_ff_impl
#   setenv DESIGN pipe_warning   (pipe_dff | pipe_razor | pipe_warning)
#   setenv CORNER tt             (tt | ss | ff)
#   setenv CLK_PERIOD 1.0        (ns -- sweep for two operating points)
#   dc_shell -f dc/synth.tcl

source ./config.tcl

set design $env(DESIGN)
set corner $env(CORNER)

set_app_var target_library $LIB($corner)
set_app_var link_library   "* $LIB($corner)"
set_app_var search_path    [concat $search_path $RTL_DIR]

define_design_lib WORK -path ./work
analyze -format verilog [glob $RTL_DIR/*.v]
elaborate $design
current_design $design
link

# --- Preserve Warning-FF structures the optimizer would destroy ---
if {$design eq "pipe_warning"} {
  # keep the delay-chain buffers (otherwise back-to-back bufs collapse)
  set_dont_touch [get_cells -hier -filter "ref_name =~ *buf*"] true
  # keep + break the SR-latch combinational loop for static timing
  set_dont_touch     [get_cells -hier "u_mon/u_sr*"] true
  set_disable_timing [get_cells -hier "u_mon/u_sr*"]
}

source ./constraints.sdc

compile_ultra -no_autoungroup
# If compile_ultra is not licensed, use:  compile -map_effort high

# --- reports ---
file mkdir ./reports
set tag ./reports/${design}_${corner}_p$env(CLK_PERIOD)
report_area                              > ${tag}.dc.area.rpt
report_power                             > ${tag}.dc.power.rpt
report_timing -delay max -max_paths 5    > ${tag}.dc.timing.rpt
report_qor                               > ${tag}.dc.qor.rpt

# --- handoff to ICC ---
file mkdir ./netlist
write     -format verilog -hierarchy -output ./netlist/${design}_${corner}.v
write     -format ddc     -hierarchy -output ./netlist/${design}_${corner}.ddc
write_sdc ./netlist/${design}_${corner}.sdc
exit
