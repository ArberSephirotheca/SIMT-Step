#!/usr/bin/env python3
import argparse
import json
import subprocess
import sys
from pathlib import Path


def run(cmd):
    return subprocess.run(cmd, capture_output=True, text=True)


def main():
    parser = argparse.ArgumentParser(
        description="Generate deterministic SIMT-Step fuzz tests."
    )
    parser.add_argument(
        "--fuzzer",
        default="build/tools/simt-step-fuzz/simt-step-fuzz",
        help="Path to simt-step-fuzz binary",
    )
    parser.add_argument(
        "--out-dir",
        default="fuzz-tests",
        help="Output directory for generated MLIR tests",
    )
    parser.add_argument("--count", type=int, default=100, help="Number of tests")
    parser.add_argument("--lanes", type=int, default=4, help="Lane count")
    parser.add_argument(
        "--subgroup-width", type=int, default=8, help="Subgroup width"
    )
    parser.add_argument(
        "--trials",
        type=int,
        default=3,
        help="Determinism trials per program (>=2)",
    )
    parser.add_argument(
        "--schedule-seed",
        type=int,
        default=1,
        help="Base schedule seed for randomized scheduling",
    )
    parser.add_argument(
        "--break-continue-rate",
        type=float,
        default=None,
        help="Probability in [0,1] to emit break/continue in loops",
    )
    parser.add_argument(
        "--complex-helper",
        action="store_true",
        help="Generate a complex helper function with control flow and wave ops",
    )
    parser.add_argument(
        "--helper-subgroup-ids",
        action="store_true",
        help="Allow lane_id/subgroup_id ops inside helper function",
    )
    parser.add_argument(
        "--helper-max-depth",
        type=int,
        default=None,
        help="Max recursion depth for helper pattern generation",
    )
    parser.add_argument(
        "--helper-min-control-ops",
        type=int,
        default=None,
        help="Minimum number of control-flow ops in helper function",
    )
    parser.add_argument(
        "--no-subgroup-in-switch",
        action="store_true",
        help="Do not emit subgroup ops (wave/lane_id/subgroup_id) inside switch cases",
    )
    parser.add_argument(
        "--post-switch-wave-op-rate",
        type=float,
        default=None,
        help="Probability in [0,1] to emit a wave op immediately after a switch",
    )
    parser.add_argument(
        "--non-uniform-helper-call-rate",
        type=float,
        default=None,
        help="Probability in [0,1] to call helper under non-uniform control flow",
    )
    parser.add_argument(
        "--predicate-buffer",
        action="store_true",
        help="Emit predicate buffer and YAML per test",
    )
    parser.add_argument(
        "--seed-start", type=int, default=0, help="First program seed"
    )
    parser.add_argument(
        "--seed-step", type=int, default=1, help="Seed increment per attempt"
    )
    parser.add_argument(
        "--max-attempts",
        type=int,
        default=10000,
        help="Max attempts before giving up",
    )
    args = parser.parse_args()

    if args.trials < 2:
        parser.error("--trials must be >= 2 to enforce determinism")

    fuzzer = Path(args.fuzzer)
    if not fuzzer.exists():
        sys.stderr.write(f"error: fuzzer not found at {fuzzer}\n")
        return 2

    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    manifest_path = out_dir / "manifest.jsonl"

    count = 0
    attempts = 0
    seed = args.seed_start
    with manifest_path.open("a", encoding="utf-8") as manifest:
        while count < args.count and attempts < args.max_attempts:
            attempts += 1
            validate_cmd = [
                str(fuzzer),
                f"--seed={seed}",
                f"--lanes={args.lanes}",
                f"--subgroup-width={args.subgroup_width}",
                "--run",
                f"--trials={args.trials}",
                f"--schedule-seed={args.schedule_seed}",
                "--random-schedule",
            ]
            if args.break_continue_rate is not None:
                validate_cmd.append(
                    f"--break-continue-rate={args.break_continue_rate}"
                )
            if args.complex_helper:
                validate_cmd.append("--complex-helper")
            if args.helper_subgroup_ids:
                validate_cmd.append("--helper-subgroup-ids")
            if args.helper_max_depth is not None:
                validate_cmd.append(f"--helper-max-depth={args.helper_max_depth}")
            if args.helper_min_control_ops is not None:
                validate_cmd.append(
                    f"--helper-min-control-ops={args.helper_min_control_ops}"
                )
            if args.no_subgroup_in_switch:
                validate_cmd.append("--no-subgroup-in-switch")
            if args.post_switch_wave_op_rate is not None:
                validate_cmd.append(
                    f"--post-switch-wave-op-rate={args.post_switch_wave_op_rate}"
                )
            if args.non_uniform_helper_call_rate is not None:
                validate_cmd.append(
                    f"--non-uniform-helper-call-rate={args.non_uniform_helper_call_rate}"
                )
            if args.predicate_buffer:
                validate_cmd.append("--predicate-buffer")
            validate = run(validate_cmd)
            if validate.returncode != 0:
                seed += args.seed_step
                continue

            gen_cmd = [
                str(fuzzer),
                f"--seed={seed}",
                f"--lanes={args.lanes}",
                f"--subgroup-width={args.subgroup_width}",
                "--print-ir",
            ]
            if args.break_continue_rate is not None:
                gen_cmd.append(f"--break-continue-rate={args.break_continue_rate}")
            if args.complex_helper:
                gen_cmd.append("--complex-helper")
            if args.helper_subgroup_ids:
                gen_cmd.append("--helper-subgroup-ids")
            if args.helper_max_depth is not None:
                gen_cmd.append(f"--helper-max-depth={args.helper_max_depth}")
            if args.helper_min_control_ops is not None:
                gen_cmd.append(
                    f"--helper-min-control-ops={args.helper_min_control_ops}"
                )
            if args.no_subgroup_in_switch:
                gen_cmd.append("--no-subgroup-in-switch")
            if args.post_switch_wave_op_rate is not None:
                gen_cmd.append(
                    f"--post-switch-wave-op-rate={args.post_switch_wave_op_rate}"
                )
            if args.non_uniform_helper_call_rate is not None:
                gen_cmd.append(
                    f"--non-uniform-helper-call-rate={args.non_uniform_helper_call_rate}"
                )
            predicate_yaml = ""
            if args.predicate_buffer:
                predicate_yaml = f"{out_dir}/test_{count:03d}_seed_{seed}.yaml"
                gen_cmd.append("--predicate-buffer")
                gen_cmd.append(f"--predicate-yaml={predicate_yaml}")
            generated = run(gen_cmd)
            if generated.returncode != 0 or not generated.stdout.strip():
                seed += args.seed_step
                continue

            filename = f"test_{count:03d}_seed_{seed}.mlir"
            out_path = out_dir / filename
            out_path.write_text(generated.stdout, encoding="utf-8")
            record = {
                "file": filename,
                "seed": seed,
                "lanes": args.lanes,
                "subgroup_width": args.subgroup_width,
                "trials": args.trials,
                "schedule_seed": args.schedule_seed,
            }
            if args.break_continue_rate is not None:
                record["break_continue_rate"] = args.break_continue_rate
            if args.complex_helper:
                record["complex_helper"] = True
            if args.helper_subgroup_ids:
                record["helper_subgroup_ids"] = True
            if args.helper_max_depth is not None:
                record["helper_max_depth"] = args.helper_max_depth
            if args.helper_min_control_ops is not None:
                record["helper_min_control_ops"] = args.helper_min_control_ops
            if args.no_subgroup_in_switch:
                record["no_subgroup_in_switch"] = True
            if args.post_switch_wave_op_rate is not None:
                record["post_switch_wave_op_rate"] = args.post_switch_wave_op_rate
            if args.non_uniform_helper_call_rate is not None:
                record["non_uniform_helper_call_rate"] = args.non_uniform_helper_call_rate
            if predicate_yaml:
                record["predicate_yaml"] = Path(predicate_yaml).name
            manifest.write(json.dumps(record) + "\n")
            manifest.flush()
            count += 1
            seed += args.seed_step

    if count < args.count:
        sys.stderr.write(
            f"error: generated {count}/{args.count} tests after "
            f"{attempts} attempts\n"
        )
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
