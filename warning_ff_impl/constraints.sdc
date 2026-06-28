# constraints.sdc -- shared timing constraints.
# CLK_PERIOD (ns) is passed from the DC/ICC script via the environment.

set clk_period $env(CLK_PERIOD)

create_clock -name clk -period $clk_period [get_ports clk]

# Razor's delayed clock: same period, shifted half a cycle.
# Only pipe_razor has this port; guard so the other tops don't error.
if {[sizeof_collection [get_ports clk_del -quiet]] > 0} {
  create_clock -name clk_del -period $clk_period \
    -waveform [list [expr {$clk_period/2.0}] [expr {$clk_period*1.5}]] \
    [get_ports clk_del]
}

set_clock_uncertainty [expr {0.05 * $clk_period}] [get_clocks clk]

set non_clk_in [remove_from_collection [all_inputs] [get_ports "clk clk_del"]]
set_input_delay  [expr {0.20 * $clk_period}] -clock clk $non_clk_in
set_output_delay [expr {0.20 * $clk_period}] -clock clk [all_outputs]
set_driving_cell -lib_cell $env(DRV_CELL) $non_clk_in
set_load $env(OUT_LOAD) [all_outputs]

