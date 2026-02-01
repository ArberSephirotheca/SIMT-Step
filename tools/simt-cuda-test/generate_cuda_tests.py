#!/usr/bin/env python3
import argparse
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path


def run_cmd(cmd):
    return subprocess.run(cmd, capture_output=True, text=True)


def load_manifest(path):
    if not path or not Path(path).exists():
        return {}
    manifest = {}
    with open(path, "r", encoding="utf-8") as fh:
        for line in fh:
            line = line.strip()
            if not line:
                continue
            try:
                rec = json.loads(line)
            except json.JSONDecodeError:
                continue
            file = rec.get("file")
            if file:
                manifest[file] = rec
    return manifest


def parse_yaml_info(path):
    buffers = {}
    current = None
    if not path or not Path(path).exists():
        return buffers
    with open(path, "r", encoding="utf-8") as fh:
        for raw in fh:
            line = raw.strip()
            if not line:
                continue
            if line.startswith("- buffer:") or line.startswith("buffer:"):
                name = line.split("buffer:", 1)[1].strip()
                current = buffers.setdefault(name, {"size": None, "max_index": -1})
                continue
            if current is None:
                continue
            if line.startswith("size:"):
                try:
                    current["size"] = int(line.split("size:", 1)[1].strip(), 0)
                except ValueError:
                    pass
                continue
            m = re.search(r"index:\s*([-]?\d+)", line)
            if m:
                try:
                    idx = int(m.group(1), 0)
                    if idx > current["max_index"]:
                        current["max_index"] = idx
                except ValueError:
                    pass
    return buffers


def parse_runner_memory(output):
    mem = {}
    in_mem = False
    for line in output.splitlines():
        if line.strip() == "Memory:":
            in_mem = True
            continue
        if not in_mem:
            continue
        m = re.match(r"\s*(buf\d+)\[(\d+)\]\s*=\s*([-]?\d+)", line)
        if not m:
            continue
        buf = m.group(1)
        idx = int(m.group(2), 10)
        val = int(m.group(3), 10)
        mem.setdefault(buf, {})[idx] = val
    return mem


def parse_kernel_signature(cuda_src):
    m = re.search(
        r'extern\s+"C"\s+__global__\s+void\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)',
        cuda_src,
    )
    if not m:
        return "", []
    name = m.group(1)
    args = m.group(2).strip()
    if not args:
        return name, []
    parts = [p.strip() for p in args.split(",") if p.strip()]
    return name, parts


def rename_kernel(cuda_src, old_name, new_name):
    pattern = (
        r'(extern\s+"C"\s+__global__\s+void\s+)' +
        re.escape(old_name) +
        r'(\s*\()'
    )
    return re.sub(pattern, r"\1" + new_name + r"\2", cuda_src, count=1)


def derive_buffer_sizes(mem, yaml_info, arg_count):
    sizes = {}
    for i in range(arg_count):
        name = f"arg{i}"
        info = yaml_info.get(name, {})
        size = info.get("size")
        if size is None:
            max_idx = info.get("max_index", -1)
            if max_idx >= 0:
                size = max_idx + 1
        if size is None:
            buf_name = f"buf{i}"
            if buf_name in mem:
                max_idx = max(mem[buf_name].keys())
                size = max_idx + 1
        if size is None or size <= 0:
            size = 1
        sizes[name] = size
    return sizes


def collect_mlir_files(mlir_dir, single_file):
    if single_file:
        path = Path(single_file)
        if not path.exists():
            raise RuntimeError(f"mlir file not found: {single_file}")
        return [path]
    root = Path(mlir_dir)
    if not root.exists() or not root.is_dir():
        raise RuntimeError(f"mlir dir not found: {mlir_dir}")
    files = sorted(root.glob("*.mlir"))
    if not files:
        raise RuntimeError(f"no .mlir files found in {mlir_dir}")
    return files


def write_script(out_path, kernel_name, cuda_src, buffers, init_lines,
                 binds, launch, expects):
    lines = []
    for buf in buffers:
        lines.append(f"BUFFER {buf['name']} TYPE i32 SIZE {buf['size']}")
    for buf in buffers:
        if buf.get("fill") is not None:
            lines.append(f"FILL {buf['name']} {buf['fill']}")
    if init_lines:
        lines.extend(init_lines)
    lines.append("")
    if kernel_name:
        lines.append(f"KERNEL {kernel_name}")
    else:
        lines.append("KERNEL")
    lines.append(cuda_src.rstrip("\n"))
    lines.append("ENDKERNEL")
    lines.append("")
    for bind in binds:
        lines.append(bind)
    lines.append("")
    lines.append(launch)
    if expects:
        lines.append("")
        lines.extend(expects)
    out_path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main():
    parser = argparse.ArgumentParser(
        description="Generate simt-cuda-test scripts from SIMT-Step MLIR."
    )
    parser.add_argument(
        "--mlir-dir",
        default="fuzz-tests",
        help="Directory containing .mlir files",
    )
    parser.add_argument(
        "--mlir",
        default="",
        help="Single MLIR file to process",
    )
    parser.add_argument(
        "--out-dir",
        default="cuda-tests",
        help="Output directory for .cuda scripts",
    )
    parser.add_argument(
        "--manifest",
        default="fuzz-tests/manifest.jsonl",
        help="Manifest JSONL from generate_tests.py",
    )
    parser.add_argument(
        "--raise-bin",
        default="build/tools/simt-step-raise/simt-step-raise",
        help="Path to simt-step-raise",
    )
    parser.add_argument(
        "--runner-bin",
        default="build/tools/simt-step-runner/simt-step-runner",
        help="Path to simt-step-runner",
    )
    parser.add_argument("--lanes", type=int, default=0, help="Override lane count")
    parser.add_argument(
        "--subgroup-width", type=int, default=0, help="Override subgroup width"
    )
    parser.add_argument(
        "--limit", type=int, default=0, help="Max number of tests to generate"
    )
    args = parser.parse_args()

    manifest = load_manifest(args.manifest)
    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    gen_manifest = out_dir / "manifest.jsonl"

    raise_bin = Path(args.raise_bin)
    if not raise_bin.exists():
        raise RuntimeError(f"simt-step-raise not found: {args.raise_bin}")
    runner_bin = Path(args.runner_bin)
    if not runner_bin.exists():
        raise RuntimeError(f"simt-step-runner not found: {args.runner_bin}")

    mlir_files = collect_mlir_files(args.mlir_dir, args.mlir)
    count = 0
    failures = 0

    with gen_manifest.open("w", encoding="utf-8") as mf:
        for mlir_path in mlir_files:
            if args.limit and count >= args.limit:
                break

            record = manifest.get(mlir_path.name, {})
            lanes = args.lanes or int(record.get("lanes", 1))
            lanes = max(1, lanes)
            subgroup = args.subgroup_width or int(record.get("subgroup_width", 1))
            subgroup = max(1, subgroup)
            predicate_yaml = ""
            if "predicate_yaml" in record:
                predicate_yaml = str(Path(mlir_path.parent) / record["predicate_yaml"])
            else:
                cand = mlir_path.with_suffix(".yaml")
                if cand.exists():
                    predicate_yaml = str(cand)

            raise_cmd = [str(raise_bin), "--target=cuda", str(mlir_path)]
            raised = run_cmd(raise_cmd)
            if raised.returncode != 0 or not raised.stdout.strip():
                sys.stderr.write(
                    f"error: raise failed for {mlir_path}: {raised.stderr}\n"
                )
                failures += 1
                continue

            cuda_src = raised.stdout
            kernel_name, params = parse_kernel_signature(cuda_src)
            arg_count = len(params)
            if not kernel_name:
                sys.stderr.write(f"error: could not find kernel signature for {mlir_path}\n")
                failures += 1
                continue
            if arg_count == 0:
                sys.stderr.write(f"error: could not parse kernel args for {mlir_path}\n")
                failures += 1
                continue

            if kernel_name == "main":
                kernel_name = "simt_kernel"
                cuda_src = rename_kernel(cuda_src, "main", kernel_name)

            unsupported_arg = False
            for p in params:
                if "*" not in p:
                    sys.stderr.write(
                        f"error: scalar arg not supported in {mlir_path}: '{p}'\n"
                    )
                    failures += 1
                    unsupported_arg = True
            if unsupported_arg:
                continue

            run_cmdline = [
                str(runner_bin),
                f"--lanes={lanes}",
                f"--subgroup-width={subgroup}",
            ]
            if predicate_yaml:
                run_cmdline.append(f"--init-file={predicate_yaml}")
            run_cmdline.append(str(mlir_path))
            ran = run_cmd(run_cmdline)
            if ran.returncode != 0:
                sys.stderr.write(
                    f"error: runner failed for {mlir_path}: {ran.stderr}\n"
                )
                failures += 1
                continue

            mem = parse_runner_memory(ran.stdout)
            yaml_info = parse_yaml_info(predicate_yaml)
            sizes = derive_buffer_sizes(mem, yaml_info, arg_count)

            buffers = []
            for i in range(arg_count):
                name = f"arg{i}"
                buf = {"name": name, "size": sizes[name]}
                if name not in yaml_info:
                    buf["fill"] = 0
                buffers.append(buf)

            output_args = [
                i for i in range(arg_count) if f"arg{i}" not in yaml_info
            ]

            init_lines = []
            for i in output_args:
                exp_name = f"exp_arg{i}"
                buffers.append({"name": exp_name, "size": sizes[f'arg{i}'], "fill": 0})
                entries = mem.get(f"buf{i}", {})
                for idx in sorted(entries.keys()):
                    init_lines.append(f"INIT {exp_name} {idx} {entries[idx]}")

            binds = []
            for i in range(arg_count):
                binds.append(f"BIND arg{i} ARG {i}")

            launch = f"LAUNCH GRID 1 1 1 BLOCK {lanes} 1 1"

            expects = []
            for i in output_args:
                expects.append(f"EXPECT_BUFFER arg{i} exp_arg{i}")

            out_path = out_dir / (mlir_path.stem + ".cuda")
            if predicate_yaml:
                out_yaml = out_dir / (mlir_path.stem + ".yaml")
                shutil.copyfile(predicate_yaml, out_yaml)
            write_script(
                out_path,
                kernel_name,
                cuda_src,
                buffers,
                init_lines,
                binds,
                launch,
                expects,
            )

            mf.write(
                json.dumps(
                    {
                        "mlir": str(mlir_path),
                        "cuda": str(out_path),
                        "lanes": lanes,
                        "subgroup_width": subgroup,
                        "predicate_yaml": predicate_yaml,
                    }
                )
                + "\n"
            )
            mf.flush()
            count += 1

    if failures:
        sys.stderr.write(
            f"warning: generated {count} scripts with {failures} failures\n"
        )
        return 1
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as ex:
        sys.stderr.write(f"error: {ex}\n")
        raise SystemExit(1)
