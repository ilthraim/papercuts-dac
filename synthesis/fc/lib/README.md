# ASAP7 library for Fusion Compiler

Fusion Compiler needs an NDM reference library, a technology file and TLU+
parasitics. They are built once, into one directory that `FC_ASAP7_LIB` then
points at. Sources:

- [ASAP7](https://github.com/The-OpenROAD-Project/asap7) at `d24f8b8`: the five
  RVT TT NLDM `.lib` files (`asap7sc7p5t_28/LIB/NLDM`, `AO 211120`, `INVBUF 220122`,
  `OA 211120`, `SEQ 220123`, `SIMPLE 211120`; the Yosys/ABC flow reads the same
  five) and the 4x LEF.
- [asap7_snps](https://github.com/snishizawa/asap7_snps) at `ec386fe`: the
  Synopsys technology file `icc/asap07_icc.tf`, and `starrc/asap07.itf.x4` and
  `starrc/asap07.layermap`.

Steps:

1. `python3 merge_lib.py <the five .lib files> > asap7sc7p5t_RVT_TT_nldm.lib`.
   lm_shell treats several `.db` files in one workspace as corners of the same
   cells (LM-015), so FC gets one merged library.
2. `lc_shell -f lc.tcl` writes `asap7sc7p5t_RVT_TT_nldm.db`.
3. Copy `asap07_icc.tf` here and change `lengthPrecision` 4000 -> 10000 and
   `gridResolution` 16 -> 40 (the same 0.004 um grid), which the LEF requires
   (LIB-055).
4. `ASAP7_REPO=<asap7 clone> lm_shell -f lm.tcl` writes `asap7sc7p5t_rvt_tt.ndm`.
5. Build `asap7_x4.tluplus` from `asap07.itf.x4` with
   `grdgenxo -itf2TLUPlus`, and copy `asap07.layermap` here.

The only Synopsys technology file for ASAP7 is 4x-scaled, so the flow uses the
4x LEF and a TLU+ built from the 4x ITF. `metrics.txt` reports leaf area / 16,
in real ASAP7 um2; FC's own reports stay at 16x. Placement and wire lengths are
in the 4x layout, so wire delay is only approximate: compare percentage changes
between RTL versions, not absolute delay against other flows.
