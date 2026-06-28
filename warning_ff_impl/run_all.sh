#!/bin/bash
# run_all.sh -- sweep all designs x corners x operating points.
# Adjust the lists, then:  bash run_all.sh
# (uses csh-style setenv via env -- works with dc_shell/icc_shell)

set -e
DESIGNS="pipe_dff pipe_razor pipe_warning"

# two operating points: high-speed (tight) and low-power (relaxed).
# pair each with a corner if you want voltage/temp variation too.
#   point         corner   period(ns)
#   high-speed    ff       0.8
#   low-power     ss       1.5
POINTS="ff:0.8 ss:1.5"

for d in $DESIGNS; do
  for p in $POINTS; do
    CORNER="${p%%:*}"
    PERIOD="${p##*:}"
    echo "=== $d  corner=$CORNER  period=$PERIOD ns ==="
    DESIGN=$d CORNER=$CORNER CLK_PERIOD=$PERIOD dc_shell    -f dc/synth.tcl
    DESIGN=$d CORNER=$CORNER CLK_PERIOD=$PERIOD icc2_shell  -f icc/pnr_icc2.tcl
  done
done
echo "Done. Reports in ./reports/ , layouts in ./gds/"
