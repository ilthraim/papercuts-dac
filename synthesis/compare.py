"""The paper's comparison metric, from the results.jsonl files sweep.py writes.

    python synthesis/compare.py RESULTS.jsonl...

For each design and tool, the original and papercuts runs (d_i, a_i), probe
excluded, each form a staircase A(d) = min{a_i : d_i <= d}: the smallest area of
any run with a delay of d or better, nothing interpolated between runs. Over the
window [d_lo, d_hi], from the slower of the two fastest delays to the slower of
the two slowest, the ratio R is the geometric mean of A_pc(d) / A_orig(d) in log
delay, integrated exactly (both staircases are constant between breakpoints).
Delay at the same area is the same with the axes swapped. Each ratio is printed
as a change of (R - 1) x 100%, negative favouring papercuts, and the summary over
designs is the geometric mean, so each design counts equally.
"""
import json
import sys
from collections import defaultdict

import numpy as np


def stair(pts):
    """Non-dominated (x, y), x ascending, y strictly falling."""
    out = []
    for x, y in sorted(pts):
        if not out or y < out[-1][1]:
            out.append((x, y))
    return np.array(out)


def step(F, x):
    return F[np.searchsorted(F[:, 0], x, side="right") - 1, 1]


def exact(po, pv):
    """R = pv/po over the window, integrated exactly in log x."""
    Fo, Fv = stair(po), stair(pv)
    lo, hi = max(Fo[0, 0], Fv[0, 0]), max(Fo[-1, 0], Fv[-1, 0])
    if hi <= lo:
        return float(step(Fv, np.array([lo]))[0] / step(Fo, np.array([lo]))[0])
    b = np.unique(np.r_[lo, hi, Fo[:, 0], Fv[:, 0]])
    b = b[(b >= lo) & (b <= hi)]
    w, r = np.diff(np.log(b)), step(Fv, b[:-1]) / step(Fo, b[:-1])
    return float(np.exp((w * np.log(r)).sum() / w.sum()))


def main():
    pts = defaultdict(list)
    for path in sys.argv[1:]:
        for line in open(path):
            r = json.loads(line)
            if r["status"] == "ok" and r["label"] != "probe":
                pts[r["tool"], r["design"], r["variant"]].append((r["delay"], r["area"]))
    per = defaultdict(dict)
    for tool, design in sorted({(t, d) for t, d, _ in pts}):
        po, pv = pts[tool, design, "orig"], pts[tool, design, "papercuts"]
        if len(po) < 2 or len(pv) < 2:
            print(f"{tool} {design}: fewer than two points per version, skipped")
            continue
        area = exact(po, pv)
        delay = exact([(a, d) for d, a in po], [(a, d) for d, a in pv])
        per[tool][design] = (area, delay)
        print(f"{tool:3} {design:55} area {100 * (area - 1):+6.1f}%  delay {100 * (delay - 1):+6.1f}%")
    for tool, ds in per.items():
        v = np.array(list(ds.values()))
        g = np.exp(np.log(v).mean(axis=0))
        print(f"{tool}: {len(ds)} designs, geomean area at the same delay {100 * (g[0] - 1):+.1f}%, "
              f"delay at the same area {100 * (g[1] - 1):+.1f}%")


if __name__ == "__main__":
    main()
