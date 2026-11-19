"""Merge the five ASAP7 RVT TT .lib files into one library. lm_shell treats several .db files in
one workspace as corners of the same cells (LM-015), so FC gets a single library.
    python3 merge_lib.py <in.lib>... > asap7sc7p5t_RVT_TT_nldm.lib
Keeps the first file's library attributes; every other top-level group must be a cell, or a
template/group already present with the same text (a difference is an error)."""
import re
import sys

NAME = "asap7sc7p5t_RVT_TT_nldm"


def blocks(text):
    """Top-level children of library(...) { ... }: (head, full text); heads of attributes are None."""
    start = text.index("{", re.search(r"^\s*library\s*\(", text, re.M).start()) + 1
    i, n, depth, cur, out = start, len(text), 0, start, []
    in_str = False
    while i < n:
        c = text[i]
        if c == '"':
            in_str = not in_str
        elif in_str:
            pass
        elif text.startswith("/*", i):
            i = text.index("*/", i) + 2
            continue
        elif c == "{":
            depth += 1
        elif c == "}":
            if depth == 0:
                out.append((None, text[cur:i]))
                return out
            depth -= 1
            if depth == 0:
                b = text[cur:i + 1]
                head = re.search(r"(\w+\s*\([^)]*\))\s*\{", b)
                pre = b[:head.start()]
                if pre.strip():
                    out.append((None, pre))
                out.append((re.sub(r"\s", "", head.group(1)), b[head.start():]))
                cur = i + 1
        i += 1
    raise SystemExit("unbalanced library")


seen, body = {}, []
for k, path in enumerate(sys.argv[1:]):
    for head, b in blocks(open(path).read()):
        if head is not None and head.startswith("normalized_driver_waveform"):  # same head; the name is inside
            m = re.search(r'driver_waveform_name\s*:\s*"([^"]*)"', b)
            head += m.group(1) if m else ""  # one per file has no name: the default waveform
        if head is None:
            if k == 0:
                body.append(b)
        elif head in seen:
            if head.startswith("cell("):
                raise SystemExit(f"{path}: duplicate {head}")
            if re.sub(r"\s", "", seen[head]) != re.sub(r"\s", "", b):
                raise SystemExit(f"{path}: {head} differs between files")
        else:
            seen[head] = b
            body.append(b)
print(f"library ({NAME}) {{")
print("\n".join(body))
print("}")
print(sum(h.startswith("cell(") for h in seen), "cells", file=sys.stderr)
