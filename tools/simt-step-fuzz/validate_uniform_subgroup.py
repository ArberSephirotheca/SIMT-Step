#!/usr/bin/env python3
import argparse
import re
import sys
from pathlib import Path


CONTROL_RE = re.compile(r'"simt_step\.(if|loop|switch)"')
SUBGROUP_COLLECTIVE_RE = re.compile(
    r'"simt_step\.(wave_all|wave_any|wave_ballot|wave_count_bits)"'
)


def validate_uniform_subgroup_placement(text: str):
    violations = []
    control_depth = 0

    for lineno, line in enumerate(text.splitlines(), start=1):
        starts = 0
        for match in CONTROL_RE.finditer(line):
            if "({" in line[match.end() :]:
                starts += 1
        control_depth += starts

        op_match = SUBGROUP_COLLECTIVE_RE.search(line)
        if op_match and control_depth > 0:
            violations.append(
                (
                    lineno,
                    op_match.group(1),
                    control_depth,
                    line.strip(),
                )
            )

        ends = line.count("})")
        control_depth -= ends
        if control_depth < 0:
            control_depth = 0

    return violations


def main():
    parser = argparse.ArgumentParser(
        description=(
            "Validate that subgroup collectives are not emitted inside non-uniform "
            "control regions."
        )
    )
    parser.add_argument("input", nargs="?", help="Input MLIR file")
    parser.add_argument(
        "--stdin",
        action="store_true",
        help="Read MLIR from stdin",
    )
    args = parser.parse_args()

    if args.stdin:
        text = sys.stdin.read()
        source = "<stdin>"
    else:
        if not args.input:
            parser.error("provide an input file path or pass --stdin")
        path = Path(args.input)
        text = path.read_text(encoding="utf-8")
        source = str(path)

    violations = validate_uniform_subgroup_placement(text)
    if not violations:
        return 0

    print(
        f"uniform-subgroup validator failed for {source}:",
        file=sys.stderr,
    )
    for lineno, op_name, depth, snippet in violations:
        print(
            f"  line {lineno}: {op_name} appears inside control depth {depth}: {snippet}",
            file=sys.stderr,
        )
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
