# Benchmarks

The 103 designs papercuts was run on for the paper. 86 of them kept at least
one cut and are the designs reported (`"reported": true` in `designs.json`):

| suite | run | reported |
|---|---|---|
| OpenCores | 73 | 59 |
| PolyBench, synthesized to RTL with Vitis HLS 2023.1.1 | 18 | 18 |
| VTR | 10 | 7 |
| Koios | 2 | 2 |

- `designs/<design>/`: the RTL as papercuts read it.
- `includes/`, `extra_includes/`: include directories the arguments name.
- `designs.json`: one entry per design:
  - `papercuts_args`: the exact arguments of its papercuts run, paths relative
    to this directory;
  - `cuts_kept`, `reported`: how many proven cuts the final design kept;
  - `synthesis` (reported designs only): top, sources and include directories,
    and the Fusion Compiler clocks and flow variant (`synthesis/README.md`).

A few files differ from their upstream versions so that every tool reads them.
In fpga-median, i2c, mesi_isc and oc54x, lines that Fusion Compiler's reader
rejects were edited, and each edited design was proven equivalent to its
upstream RTL with Jasper. In i2c and vga_lcd, `// synopsys enum_state` comments
that the reader also rejects were removed (comments only).

## Running papercuts on a design

From this directory, with papercuts built (top-level `README.md`):

```bash
python3 - <<'EOF' > args.txt
import json
e = {d["design"]: d for d in json.load(open("designs.json"))}["opencores__ss_pcm"]
print(" ".join(e["papercuts_args"]))
EOF
python -m papercuts $(cat args.txt)
```

The run writes `outputs/` here; copy it away before the next one. `-j` in the
arguments is how many checks ran at once for that design; raise or lower it to
fit your machine and Jasper licenses (each Jasper check runs about 28 proof
engines unless capped with `--jasper-engines`). The paper's runs used a
600-second limit per check (`--fv-time-limit 600`).

## Licenses

The designs come from their public sources and keep their own licenses and
copyright notices, which are left in the files. The PolyBench RTL was generated
from the PolyBench/C kernels by Vitis HLS, whose output carries the tool's
header.
