"""One Yosys/ABC synthesis run on ASAP7 (7.5-track RVT, TT corner).

    python yosys_abc.py --top TOP --period-ns P [-I DIR ...] --out DIR SOURCE...

The design is read with yosys-slang, flattened and mapped to generic logic with
`synth`, flops are mapped with `dfflibmap`, and the combinational logic with
`abc -D <P in ps>`. Writes synth.ys, yosys.log, stat.json, <top>_synth.v and
metrics.txt (area in um2, cells, registers, and delay in ns) into --out.

Delay is ABC's `stime` estimate of the combinational logic: no wires, clock-to-Q
or setup.

Environment:
  YOSYS      the yosys binary, with the slang plugin (default: yosys)
  ASAP7_LIB  directory holding the five ASAP7 RVT TT NLDM .lib files below
"""
import argparse
import json
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
LIB_FILES = [f"asap7sc7p5t_{n}_nldm_{d}.lib" for n, d in (
    ("AO_RVT_TT", "211120"), ("INVBUF_RVT_TT", "220122"), ("OA_RVT_TT", "211120"),
    ("SEQ_RVT_TT", "220123"), ("SIMPLE_RVT_TT", "211120"))]
# as in OpenROAD-flow-scripts' asap7 platform: no fractional-drive cells, scan flops or clock gates
DONT_USE = ["*x1p*_ASAP7*", "*xp*_ASAP7*", "SDF*", "ICG*", "DFFH?Nx[23]*"]
LATCH_MAP = os.path.join(HERE, "cells_latch.v")
ABC_CONSTR = os.path.join(HERE, "abc.constr")


def fail(msg):
    print(f"FAILED: {msg}")
    sys.exit(1)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("sources", nargs="+")
    ap.add_argument("--top", required=True)
    ap.add_argument("--period-ns", type=float, required=True, help="ABC delay target, in ns")
    ap.add_argument("-I", dest="incdirs", action="append", default=[])
    ap.add_argument("--out", required=True)
    a = ap.parse_args()

    lib_dir = os.environ.get("ASAP7_LIB")
    if not lib_dir:
        fail("set ASAP7_LIB to the directory of the ASAP7 RVT TT NLDM .lib files")
    libs = [os.path.join(lib_dir, f) for f in LIB_FILES]
    for lib in libs:
        if not os.path.exists(lib):
            fail(f"missing {lib}")
    sources = [os.path.abspath(s) for s in a.sources]
    incs = " ".join(f"-I {os.path.abspath(i)}" for i in a.incdirs)
    lib_args = " ".join(f"-liberty {l}" for l in libs)
    dont = " ".join(f"-dont_use {d}" for d in DONT_USE)
    reads = "\n".join(f"read_liberty -lib {l}" for l in libs)  # cell ports, for check and stat
    top, period = a.top, a.period_ns
    script = f"""plugin -i slang
read_slang {' '.join(sources)} {incs} --top {top} --ignore-assertions
synth -top {top} -flatten -noabc
delete t:$print
techmap -map {LATCH_MAP}
dfflibmap {dont} {lib_args}
opt -purge
abc -D {period * 1000:.0f} -constr {ABC_CONSTR} {dont} {lib_args}
hilomap -singleton -hicell TIEHIx1_ASAP7_75t_R H -locell TIELOx1_ASAP7_75t_R L
opt_clean -purge
{reads}
check -assert -mapped
tee -q -o stat.json stat -json {lib_args} -top {top}
write_verilog -noattr -noexpr -nohex -nodec {top}_synth.v
"""
    os.makedirs(a.out, exist_ok=True)
    os.chdir(a.out)
    with open("synth.ys", "w") as f:
        f.write(script)
    with open("yosys.log", "w") as log:
        r = subprocess.run([os.environ.get("YOSYS", "yosys"), "-s", "synth.ys"], stdout=log, stderr=subprocess.STDOUT)
    text = open("yosys.log", errors="replace").read()
    if r.returncode:
        for line in text.splitlines():
            if line.startswith("ERROR:") or " error: " in line:
                fail(line)
        fail(f"yosys exited with {r.returncode}")
    delays = re.findall(r"Delay\s*=\s*([\d.]+) ps", text)
    if delays:
        delay_ps = float(delays[-1])
    elif "Don't call ABC as there is nothing to map" in text:
        delay_ps = 0.0
    else:
        fail("no ABC delay in the log")
    d = json.load(open("stat.json"))["design"]
    types = d["num_cells_by_type"]
    unmapped = [t for t in types if not t.endswith("_ASAP7_75t_R")]
    if unmapped:
        fail(f"unmapped cells {unmapped[:8]}")
    regs = sum(n for t, n in types.items() if re.match(r"(DFF|DHL|DLL)", t))
    with open("metrics.txt", "w") as f:
        f.write(f"area {d['area'] if d['num_cells'] else 0}\ncells {d['num_cells']}\nregisters {regs}\n"
                f"period {period:g}\ndelay {round(delay_ps / 1000, 6)}\n")


if __name__ == "__main__":
    main()
