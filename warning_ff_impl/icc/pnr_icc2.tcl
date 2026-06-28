# icc/pnr_icc2.tcl -- IC Compiler II place-and-route (netlist -> GDSII).
# Server tool: icc2_shell U-2022.12-SP5  (classic icc_shell is broken + legacy).
# Run AFTER dc/synth.tcl for the same DESIGN/CORNER:
#   setenv DESIGN pipe_warning ; setenv CORNER ff ; setenv CLK_PERIOD 0.8
#   icc2_shell -f icc/pnr_icc2.tcl
#
# A few option names drift between ICC2 releases. If a line errors,
# check `man <command>` in icc2_shell for U-2022.12.

source ./config.tcl
set design $env(DESIGN)
set corner $env(CORNER)
set tag    ${design}_${corner}_p$env(CLK_PERIOD)

# 1. design library (NDM) -- tech comes from the tech-NDM that is
#    listed first in NDM_REF_LIBS, so no separate -technology needed.
set dlib ./${design}_${corner}.dlib
file delete -force $dlib
create_lib $dlib -ref_libs $NDM_REF_LIBS

# 2. read netlist + link ----------------------------------------
read_verilog -top $design ./netlist/${design}_${corner}.v
link_block

# 3. constraints + parasitics -----------------------------------
read_sdc ./netlist/${design}_${corner}.sdc
if {$design eq "pipe_warning"} {
  set_disable_timing [get_cells -hier "u_mon/u_sr*"]
}
read_parasitic_tech -tlup $TLU_MAX -layermap $TLU_MAP -name maxTLU
read_parasitic_tech -tlup $TLU_MIN -layermap $TLU_MAP -name minTLU
set_parasitic_parameters -late_spec maxTLU -early_spec minTLU

# 4. floorplan --------------------------------------------------
#    70% utilization, 10um core offset on all sides
initialize_floorplan -core_utilization 0.70 -core_offset {10 10}
# simple PG connectivity (add a strap mesh for a fuller flow)
create_net -power  VDD
create_net -ground VSS
connect_pg_net -automatic

# 5. placement --------------------------------------------------
set_ignored_layers -max_routing_layer $MAX_LAYER
place_opt

# 6. clock tree synthesis ---------------------------------------
clock_opt

# 7. routing ----------------------------------------------------
route_auto
route_opt

# 8. reports (post-route -- these go in your comparison tables) --
file mkdir ./reports
set r ./reports/${tag}.icc2
report_qor                                  > ${r}.qor.rpt
report_utilization                          > ${r}.area.rpt
report_power                                > ${r}.power.rpt
report_timing -delay_type max -max_paths 5  > ${r}.timing.rpt
report_clock_qor                            > ${r}.cts.rpt
report_congestion                           > ${r}.congestion.rpt

# 9. write layout -----------------------------------------------
file mkdir ./gds
write_gds ./gds/${tag}.gds
save_block
exit
