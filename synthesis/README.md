# Synthesis and comparison

How the original and papercuts RTL of each reported design were synthesized and
compared in the paper.

- `yosys_abc.py`, `abc.constr`, `cells_latch.v`: Yosys 0.61 with the
  [yosys-slang](https://github.com/povik/yosys-slang) front end and ABC, on the
  ASAP7 7.5-track RVT library at the TT corner. Each design is flattened and
  mapped to generic logic with `synth`, flops are mapped with `dfflibmap`, and
  the combinational logic with `abc -D <target ps>`. Area is reported by Yosys;
  delay is ABC's `stime` estimate of the combinational logic, without wires,
  clock-to-Q or setup. Fractional-drive cells, scan flops and clock gates are
  not used, as in OpenROAD-flow-scripts' ASAP7 platform.
- `fc/`: Fusion Compiler X-2025.06-SP3, same library and cell exclusions. Each
  design is mapped, given a square floorplan at 70% utilization, and run through
  `compile_fusion` up to `initial_opto`, after coarse placement. Delay is the
  clock period minus the worst slack; area is the summed area of the leaf cells.
  Three variants of one script, chosen per design by `fc_flow` in
  `benchmarks/designs.json`:
  - `fc_asap7.tcl` (single): one clock, or a virtual clock for a combinational design;
  - `fc_asap7_clocks.tcl` (clocks): several clocks, same period, asynchronous to each other;
  - `fc_asap7_nofa.tcl` (nofa): FAx1 marked dont_use, for the 16 designs where FC
    crashed near FAx1; both RTL versions of those designs use it.

  `fc/lib/README.md` builds the FC library from the public ASAP7 sources.
- `sweep.py`: runs one design in one tool. The original is first synthesized at
  a 1 ps target; its achieved delay is L. Both RTL versions are then synthesized
  at 0.7L, 0.8L, 0.9L, L, 1.2L, 1.5L, 2L, 3L and 5L.
- `compare.py`: the comparison metric. Each version's runs form a staircase
  A(d), the smallest area of any run with a delay of d or better; the ratio for
  a design is the geometric mean of A_papercuts(d) / A_orig(d) over the window
  from the slower of the two fastest delays to the slower of the two slowest,
  in log delay. Delay at the same area swaps the axes. The summary over designs
  is the geometric mean.

## Example

```bash
export ASAP7_LIB=<dir with the five asap7sc7p5t_*_RVT_TT_nldm_*.lib files>
export YOSYS=<yosys with the slang plugin>
python synthesis/sweep.py --tool abc --design opencores__ss_pcm --out sweeps/ss_pcm_abc
python synthesis/compare.py sweeps/*/results.jsonl
```

The papercuts side is the paper's final RTL (`benchmarks/final_rtl/`). To
synthesize the output of your own papercuts run instead, add
`--papercuts-outputs <its outputs/ directory>`.

For Fusion Compiler, `--tool fc` with `fc_shell` on `PATH` and `FC_ASAP7_LIB`
set to the library directory.
