# Papercuts

Papercuts finds and removes redundant logic in RTL designs. It enumerates small
deletions ("cuts") of a SystemVerilog design, proves each one with a sequential
equivalence checker, combines the proven cuts, and returns the design's RTL with
every kept cut applied, together with a proof that it is equivalent to the
original.

This repository accompanies a DAC submission and is anonymized for review.

- `cpp/`, `python/`: the tool (C++ core on [slang](https://github.com/MikePopoloski/slang), Python pipeline)
- `patches/slang.patch`: two changes to slang that the build applies
- `benchmarks/`: the designs of the paper's evaluation and the exact papercuts arguments for each
- `synthesis/`: the Yosys/ABC and Fusion Compiler flows and the comparison metric

## How it works

1. **Elaborate.** The design is elaborated with slang and re-emitted as
   SystemVerilog: parameters and macros resolved, generate blocks unrolled,
   constant expressions folded, and every module instance given its own source,
   so each instance can be cut for the context it is used in.
2. **Gate.** The elaborated design is proven equivalent to the original before
   anything else. Names that flattening changed are passed to the checker as
   renames, so registers still pair.
3. **Enumerate.** Every cut of each module, in six families:
   - *Bit-width Shrink*: remove the top bit of a net or variable, repeated while proven
   - *Force Constant*: replace a one-bit signal by `1'b0` or `1'b1`
   - *Operand Pruning*: replace `a & b`, `a | b`, `a ^ b`, `a && b`, `a || b` by one operand
   - *Ternary / If Branch Pruning*: keep one branch of a `?:` or `if`
   - *Case Item Pruning*: remove one `case` item
4. **Check each cut.** Each cut is checked on its own against the elaborated
   design, all in parallel (`-j`). Only a proof accepts a cut.
5. **Combine and check.** The proven cuts are applied together and the whole
   design is checked once.
6. **Repair.** If that check finds a counterexample, the cuts conflict. Each
   counterexample is reduced by delta debugging to a minimal conflict; the next
   candidate drops a smallest set of cuts meeting every conflict (z3's
   optimizer) and is checked again, until one is proven. Each dropped cut is
   then added back alone to check whether dropping it was needed.
7. **Chain.** If a final check reaches its time limit, the set is proven by a
   chain of small checks instead: the cuts are applied in groups, each group
   checked against the design the group before it ends with, all groups at
   once. Cuts whose own check was slow go first, one per group; a group that
   is not proven is halved; a single cut with no verdict is retried with a
   longer limit and then dropped; a single cut with a counterexample becomes a
   conflict for the repair.

The checks use JasperGold SEC (`check_sec`) through a small backend interface
(`python/papercuts/backends/`).

## Building

Requirements: Linux, Python >= 3.12, CMake >= 3.20, a C++20 compiler, git, and
JasperGold on `PATH` (launched through `csh`) for any equivalence check. The
results in the paper used Jasper 26.03.002.

```bash
cd papercuts-dac
python3 -m venv .venv                     # the CMake presets expect .venv here
.venv/bin/pip install nanobind nanobind-backend z3-solver
cmake --preset Release                     # fetches slang baf26c1 and applies patches/slang.patch
cmake --build build -j 8                   # the first build compiles slang: several minutes
export PYTHONPATH=$PWD/python              # papercuts and the pyslang the build wrote
.venv/bin/python python/papercuts/tests/run_tests.py   # expect PASSED: N/N
```

The build writes the compiled modules (`pypercuts`, and the `pyslang` package)
into `python/`. They must come from the same build: do not install pyslang from
PyPI, and do not `pip install -e .`, whose import hook shadows them.

## Running

```bash
mkdir run && cd run                        # results go to ./outputs, replacing any earlier run
python -m papercuts design.sv [more.sv ...] -e --clock clk --reset '!rst_n' -j 8 --fv-time-limit 600
```

Main options:

- `-e` check equivalence (without it, papercuts only enumerates and writes the cut sources)
- `--clock SIG` every clock of the design (repeat the option); an undeclared clock is
  an ordinary input that toggles at most every other cycle, so cuts on its logic can prove wrongly
- `--reset EXPR` the reset expression, e.g. `!rst_n`
- `--top NAME`, `-I DIR`, `-D MACRO` as in any SystemVerilog front end
- `-j N` checks run at once
- `--fv-time-limit S` the limit of each cut check, and of the final and repair checks;
  a final set with no verdict within it is proven by a chain
- `--chain-group-limit` (300), `--chain-single-limit` (900), `--chain-retry-limit` (3600),
  `--chain-group-size` (16), `--chain-slow-cut` (60): the chain's limits, in seconds
- `--only-families F,...`, `--exclude-module M` restrict what is cut
- `--jasper-bbox-array BITS` model arrays up to BITS instead of letting Jasper black-box them
- `--in-situ` cut the original parameterized source instead of the elaborated one

`python -m papercuts --help` lists the rest.

## Output

In `outputs/`:

- `consolidated_sources/` the final design, one file per module, and
  `consolidated_sources/joint/<top>_consolidated.sv`, the whole design in one file
- `final_check.json` the cuts kept and dropped (and why), the conflicts found,
  the add-back verdicts, and the proof (one check, or the chain's steps)
- `papercuts.log` every cut with its verdict, per-family totals, and the final check
- `papercuts.results.jsonl` one line per check, written as each one finishes
- `concrete_sources/` the elaborated design; `working_cuts/` each proven cut on its own

## Reproducing the paper

`benchmarks/README.md` lists the designs and how to run papercuts on each, and
`synthesis/README.md` how the RTL was synthesized and compared.

## License

MIT (`LICENSE`). The benchmark designs keep their own licenses (`benchmarks/README.md`).
