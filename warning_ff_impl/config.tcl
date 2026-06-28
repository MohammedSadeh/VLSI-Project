# config.tcl -- paths resolved for the synopsys.stbzu.edu server (st102).
# DC reads Liberty .db; ICC2 reads NDM reference libraries.
# Both roots below were confirmed present on the server.

# Liberty .db live in the full SAED32 EDK (has tt/ss/ff):
set STD_CELL_HOME "/home/VCSadmin/32-28nm_EDK_01312018/SAED32_EDK"
# ICC2 reference libs + tech + TLU+ live in the shared ICC2 lab kit:
set REF           "/home/ICC2_LABS/ref"
set RTL_DIR       "[pwd]/rtl"

# --- Liberty/.db, one per corner (for Design Compiler) ---
set LIB(tt) "$STD_CELL_HOME/lib/stdcell_rvt/db_nldm/saed32rvt_tt0p85v25c.db"
set LIB(ss) "$STD_CELL_HOME/lib/stdcell_rvt/db_nldm/saed32rvt_ss0p75v125c.db"
set LIB(ff) "$STD_CELL_HOME/lib/stdcell_rvt/db_nldm/saed32rvt_ff0p95vn40c.db"

# --- SDC helpers (cells that exist in the library above) ---
set ::env(DRV_CELL) "INVX1_RVT"     ;# driving cell for inputs
set ::env(OUT_LOAD) "0.005"          ;# output load (pF)

# --- ICC2 (IC Compiler II) reference libraries (.ndm) ---
# The kit ships a tech-NDM; pass it together with the RVT cell NDM
# as reference libs (no separate .tf needed -- avoids tech mismatch).
set NDM_REF_LIBS [list \
  "$REF/CLIBs/saed32_1p9m_tech.ndm" \
  "$REF/CLIBs/saed32_rvt.ndm" ]

# --- Parasitics -- ICC2 uses TLU+ files (StarRC) ---
set TLU_MAX   "$REF/tech/saed32nm_1p9m_Cmax.tluplus"
set TLU_MIN   "$REF/tech/saed32nm_1p9m_Cmin.tluplus"
# Layer map: ITF/StarRC layer names -> tech layer names. Verify the
# exact filename on the server (see note in chat) before P&R.
set TLU_MAP   "$REF/tech/saed32nm_tf_itf_tluplus.map"
set MAX_LAYER "M7"
