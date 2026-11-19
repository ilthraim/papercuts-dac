# lm_shell -f lm.tcl, from this directory, with ASAP7_REPO set to a clone of
# github.com/The-OpenROAD-Project/asap7: build the NDM from the .db, the 4x LEF
# and the (edited) Synopsys technology file.
create_workspace -technology asap07_icc.tf asap7sc7p5t_rvt_tt
read_db asap7sc7p5t_RVT_TT_nldm.db
read_lef $env(ASAP7_REPO)/asap7sc7p5t_28/LEF/scaled/asap7sc7p5t_28_R_4x_220121a.lef
check_workspace
commit_workspace -output asap7sc7p5t_rvt_tt.ndm
exit
