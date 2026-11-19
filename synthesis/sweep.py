"""Synthesize one benchmark design, original and papercuts RTL, at the paper's nine delay targets.

    python synthesis/sweep.py --tool abc|fc --design NAME --out DIR [--papercuts-outputs RUN] [--jobs N]

NAME is a design in benchmarks/designs.json with cuts kept ("reported": true).
The papercuts RTL is the paper's final RTL for the design (its `final_rtl` in
designs.json), or, with --papercuts-outputs, the
`consolidated_sources/joint/<top>_consolidated.sv` of a papercuts run's
`outputs/` directory RUN (run with the design's `papercuts_args`).

As a useful delay target differs by design, the original is first run at a
1 ps target (ABC: `abc -D 1`; FC: a 1 ps clock) and its achieved delay is L.
Both RTL versions are then synthesized at 0.7L, 0.8L, 0.9L, L, 1.2L, 1.5L, 2L,
3L and 5L. Each run's directory is <out>/<variant>/<label>; every finished run
appends one line to <out>/results.jsonl (status, area in um2, delay in ns).
compare.py turns those lines into the paper's comparison metric.

Tools and environment:
  abc  yosys_abc.py: YOSYS (a yosys with the slang plugin), ASAP7_LIB.
  fc   Fusion Compiler (`fc_shell` on PATH), FC_ASAP7_LIB (fc/lib/README.md),
       FC_CORES (cores per run, default 4). The Tcl is chosen by the design's
       `fc_flow`: single (fc/fc_asap7.tcl), clocks (fc/fc_asap7_clocks.tcl,
       several clocks) or nofa (fc/fc_asap7_nofa.tcl, FAx1 dont_use, for the
       designs where FC crashed near FAx1; both RTL versions use it).
       FC delay is the clock period minus the worst slack.
"""
import argparse
import json
import os
import subprocess
import sys
import threading
from concurrent.futures import ThreadPoolExecutor

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
BENCH = os.path.join(ROOT, "benchmarks")
PROBE_NS = 0.001
SCALES = {"0.7L": 0.7, "0.8L": 0.8, "0.9L": 0.9, "1.0L": 1.0, "1.2L": 1.2, "1.5L": 1.5, "2L": 2.0, "3L": 3.0, "5L": 5.0}
FC_TCL = {"single": "fc_asap7.tcl", "clocks": "fc_asap7_clocks.tcl", "nofa": "fc_asap7_nofa.tcl"}
_lock = threading.Lock()


def metrics(path):
    out = {}
    if os.path.exists(path):
        for line in open(path):
            k, _, v = line.strip().partition(" ")
            out[k] = v
    return out


def run_abc(syn, sources, period, cwd):
    os.makedirs(cwd, exist_ok=True)
    cmd = [sys.executable, os.path.join(HERE, "yosys_abc.py"), *sources, "--top", syn["top"],
           "--period-ns", f"{period:.6f}", "--out", cwd]
    for i in syn["incdirs"]:
        cmd += ["-I", os.path.join(BENCH, i)]
    p = subprocess.run(cmd, capture_output=True, text=True)
    m = metrics(os.path.join(cwd, "metrics.txt"))
    if p.returncode or "area" not in m:
        return {"status": "failed", "why": (p.stdout + p.stderr).strip()[-400:]}
    return {"status": "ok", "area": float(m["area"]), "delay": float(m["delay"])}


def run_fc(syn, sources, period, cwd):
    os.makedirs(cwd, exist_ok=True)
    with open(os.path.join(cwd, "sources.txt"), "w") as f:
        f.write("\n".join(sources) + "\n")
    env = dict(os.environ, FCS_SOURCES="sources.txt", FCS_TOP=syn["top"], FCS_PERIOD=f"{period:.5f}",
               FCS_INCDIRS=" ".join(os.path.join(BENCH, i) for i in syn["incdirs"]),
               FCS_CORES=os.environ.get("FC_CORES", "4"))
    if syn["fc_flow"] == "clocks":
        env["FCS_CLOCKS"] = " ".join(syn["fc_clocks"])
    else:
        env["FCS_CLOCK"] = syn["fc_clocks"][0] if syn["fc_clocks"] else ""
    tcl = os.path.join(HERE, "fc", FC_TCL[syn["fc_flow"]])
    with open(os.path.join(cwd, "fc.log"), "w") as log:
        p = subprocess.run(["fc_shell", "-f", tcl], cwd=cwd, env=env, stdin=subprocess.DEVNULL, stdout=log,
                           stderr=subprocess.STDOUT)
    m = metrics(os.path.join(cwd, "metrics.txt"))
    if p.returncode or "area" not in m:
        return {"status": "failed", "why": f"fc_shell exited {p.returncode}; see {cwd}/fc.log"}
    if m.get("slack", "unconstrained") == "unconstrained":
        return {"status": "failed", "why": "no constrained path"}
    return {"status": "ok", "area": float(m["area"]), "delay": round(period - float(m["slack"]), 5)}


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--tool", choices=("abc", "fc"), required=True)
    ap.add_argument("--design", required=True)
    ap.add_argument("--papercuts-outputs", help="a papercuts run's outputs/ (default: the paper's final RTL)")
    ap.add_argument("--out", required=True)
    ap.add_argument("--jobs", type=int, default=4)
    a = ap.parse_args()

    entry = {e["design"]: e for e in json.load(open(os.path.join(BENCH, "designs.json")))}.get(a.design)
    if entry is None or not entry["reported"]:
        sys.exit(f"{a.design}: not a reported design in benchmarks/designs.json")
    syn = entry["synthesis"]
    if a.papercuts_outputs:
        pc = [os.path.join(os.path.abspath(a.papercuts_outputs), "consolidated_sources", "joint",
                           f"{syn['top']}_consolidated.sv")]
    else:
        pc = [os.path.join(BENCH, f) for f in entry["final_rtl"]]
    for f in pc:
        if not os.path.exists(f):
            sys.exit(f"{f}: no papercuts RTL")
    variants = {"orig": [os.path.join(BENCH, s) for s in syn["sources"]], "papercuts": pc}
    run = run_abc if a.tool == "abc" else run_fc
    out = os.path.abspath(a.out)
    os.makedirs(out, exist_ok=True)

    def one(variant, label, period):
        r = run(syn, variants[variant], period, os.path.join(out, variant, label))
        rec = {"design": a.design, "tool": a.tool, "variant": variant, "label": label, "period": period, **r}
        with _lock, open(os.path.join(out, "results.jsonl"), "a") as f:
            f.write(json.dumps(rec) + "\n")
        print(f"{variant:9} {label:5} period={period:.5f} {r['status']} "
              + (f"area={r['area']:.2f} delay={r['delay']}" if r["status"] == "ok" else r["why"]), flush=True)
        return rec

    probe = one("orig", "probe", PROBE_NS)
    if probe["status"] != "ok" or not probe["delay"] > 0:
        sys.exit("the probe gave no delay L; nothing to sweep")
    L = probe["delay"]
    with ThreadPoolExecutor(a.jobs) as pool:
        list(pool.map(lambda job: one(*job), [(v, lab, s * L) for v in variants for lab, s in SCALES.items()]))


if __name__ == "__main__":
    main()
