#!/usr/bin/env python3
import argparse
import json
import shlex
import subprocess
import sys
from pathlib import Path


def run(cmd, stdin_text=None):
    return subprocess.run(cmd, input=stdin_text, capture_output=True, text=True)


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
        "--profile",
        choices=["safe", "aggressive"],
        default=None,
        help="Apply a preset profile of generation options",
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
        "--helper-call-post-switch-rate",
        type=float,
        default=None,
        help="Probability in [0,1] to emit a switch immediately before the helper call site",
    )
    parser.add_argument(
        "--helper-call-max-depth",
        type=int,
        default=None,
        help="Max nesting depth for the non-uniform helper call site (>=1)",
    )
    parser.add_argument(
        "--helper-call-nest-loop-rate",
        type=float,
        default=None,
        help="Probability in [0,1] to nest helper call in a loop (vs if) when depth > 1",
    )
    parser.add_argument(
        "--uniform-subgroup-only",
        action="store_true",
        help="Emit subgroup collectives only at uniform merge points and reject violating seeds",
    )
    parser.add_argument(
        "--predicate-buffer",
        action="store_true",
        help="Emit predicate buffer and YAML per test",
    )
    parser.add_argument(
        "--collective-cf",
        action="store_true",
        help="Run determinism oracle with collective control flow (warp-like splits)",
    )
    parser.add_argument(
        "--sync-cf",
        action="store_true",
        help="Run determinism oracle with synchronous control flow (barriered splits)",
    )
    parser.add_argument(
        "--collective-mem",
        action="store_true",
        help="Run determinism oracle with collective buffer load/store",
    )
    parser.add_argument(
        "--sync-mem",
        action="store_true",
        help="Run determinism oracle with synchronous buffer load/store",
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
    parser.add_argument(
        "--save-failures",
        action="store_true",
        help="Save failed attempts as MLIR/YAML/log artifacts",
    )
    parser.add_argument(
        "--failure-dir",
        default=None,
        help="Output directory for failed attempts (default: <out-dir>/failures)",
    )
    parser.add_argument(
        "--save-failure-limit",
        type=int,
        default=0,
        help="Max failed attempts to save (0 means unlimited)",
    )
    args = parser.parse_args()

    if args.profile is not None:
        if args.profile == "safe":
            rate_defaults = {
                "break_continue_rate": 0.2,
                "post_switch_wave_op_rate": 0.2,
                "non_uniform_helper_call_rate": 0.2,
                "helper_call_post_switch_rate": 0.2,
                "helper_call_nest_loop_rate": 0.2,
            }
            int_defaults = {
                "helper_max_depth": 2,
                "helper_min_control_ops": 2,
                "helper_call_max_depth": 1,
            }
            bool_defaults = {
                "collective_cf": True,
                "predicate_buffer": True,
                "no_subgroup_in_switch": True,
            }
        else:
            rate_defaults = {
                "break_continue_rate": 0.3,
                "post_switch_wave_op_rate": 0.3,
                "non_uniform_helper_call_rate": 0.3,
                "helper_call_post_switch_rate": 0.3,
                "helper_call_nest_loop_rate": 0.3,
            }
            int_defaults = {
                "helper_max_depth": 3,
                "helper_min_control_ops": 3,
                "helper_call_max_depth": 2,
            }
            bool_defaults = {
                "collective_cf": True,
                "predicate_buffer": True,
                "no_subgroup_in_switch": True,
                "complex_helper": True,
                "helper_subgroup_ids": True,
            }

        for key, value in rate_defaults.items():
            if getattr(args, key) is None:
                setattr(args, key, value)
        for key, value in int_defaults.items():
            if getattr(args, key) is None:
                setattr(args, key, value)
        for key, value in bool_defaults.items():
            if value:
                setattr(args, key, True)

    if args.trials < 2:
        parser.error("--trials must be >= 2 to enforce determinism")
    if args.collective_cf and args.sync_cf:
        parser.error("--collective-cf conflicts with --sync-cf")
    if args.collective_mem and args.sync_mem:
        parser.error("--collective-mem conflicts with --sync-mem")
    if (
        args.helper_call_nest_loop_rate is not None
        and args.helper_call_max_depth is None
    ):
        sys.stderr.write(
            "note: --helper-call-nest-loop-rate has no effect unless "
            "--helper-call-max-depth > 1 (simt-step-fuzz default is 1)\n"
        )
    wants_wave_under_cf = False
    if args.post_switch_wave_op_rate is not None and args.post_switch_wave_op_rate > 0.0:
        wants_wave_under_cf = True
    if args.non_uniform_helper_call_rate is not None and args.non_uniform_helper_call_rate > 0.0:
        wants_wave_under_cf = True
    if wants_wave_under_cf and not args.collective_cf and not args.sync_cf:
        sys.stderr.write(
            "note: this config can place wave ops under non-uniform control flow; "
            "under the default independent control-flow policy most seeds fail "
            "the determinism oracle. For CUDA-like semantics, pass --collective-cf.\n"
        )

    fuzzer = Path(args.fuzzer)
    if not fuzzer.exists():
        sys.stderr.write(f"error: fuzzer not found at {fuzzer}\n")
        return 2

    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    manifest_path = out_dir / "manifest.jsonl"
    failure_dir = out_dir / "failures"
    if args.failure_dir is not None:
        failure_dir = Path(args.failure_dir)
    if args.save_failures:
        failure_dir.mkdir(parents=True, exist_ok=True)

    if args.save_failure_limit < 0:
        parser.error("--save-failure-limit must be >= 0")

    validator_script = Path(__file__).with_name("validate_uniform_subgroup.py")
    if args.uniform_subgroup_only and not validator_script.exists():
        parser.error(f"uniform subgroup validator not found: {validator_script}")

    def append_generation_options(cmd, predicate_yaml=None):
        if args.break_continue_rate is not None:
            cmd.append(f"--break-continue-rate={args.break_continue_rate}")
        if args.complex_helper:
            cmd.append("--complex-helper")
        if args.helper_subgroup_ids:
            cmd.append("--helper-subgroup-ids")
        if args.helper_max_depth is not None:
            cmd.append(f"--helper-max-depth={args.helper_max_depth}")
        if args.helper_min_control_ops is not None:
            cmd.append(f"--helper-min-control-ops={args.helper_min_control_ops}")
        if args.no_subgroup_in_switch:
            cmd.append("--no-subgroup-in-switch")
        if args.post_switch_wave_op_rate is not None:
            cmd.append(f"--post-switch-wave-op-rate={args.post_switch_wave_op_rate}")
        if args.non_uniform_helper_call_rate is not None:
            cmd.append(
                f"--non-uniform-helper-call-rate={args.non_uniform_helper_call_rate}"
            )
        if args.helper_call_post_switch_rate is not None:
            cmd.append(
                f"--helper-call-post-switch-rate={args.helper_call_post_switch_rate}"
            )
        if args.helper_call_max_depth is not None:
            cmd.append(f"--helper-call-max-depth={args.helper_call_max_depth}")
        if args.helper_call_nest_loop_rate is not None:
            cmd.append(
                f"--helper-call-nest-loop-rate={args.helper_call_nest_loop_rate}"
            )
        if args.uniform_subgroup_only:
            cmd.append("--uniform-subgroup-only")
        if args.predicate_buffer:
            cmd.append("--predicate-buffer")
            if predicate_yaml:
                cmd.append(f"--predicate-yaml={predicate_yaml}")

    def write_process_log(path, cmd, result):
        log_text = [
            f"cmd: {' '.join(shlex.quote(piece) for piece in cmd)}",
            f"returncode: {result.returncode}",
            "stdout:",
            result.stdout,
            "stderr:",
            result.stderr,
        ]
        path.write_text("\n".join(log_text), encoding="utf-8")

    count = 0
    attempts = 0
    saved_failures = 0
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
            append_generation_options(validate_cmd)
            if args.collective_cf:
                validate_cmd.append("--collective-cf")
            if args.sync_cf:
                validate_cmd.append("--sync-cf")
            if args.collective_mem:
                validate_cmd.append("--collective-mem")
            if args.sync_mem:
                validate_cmd.append("--sync-mem")
            validate = run(validate_cmd)
            if validate.returncode != 0:
                should_save = args.save_failures and (
                    args.save_failure_limit == 0
                    or saved_failures < args.save_failure_limit
                )
                if should_save:
                    fail_stem = f"attempt_{attempts:06d}_seed_{seed}"
                    fail_mlir = failure_dir / f"{fail_stem}.mlir"
                    fail_validate_log = failure_dir / f"{fail_stem}.validate.log"
                    fail_dump_log = failure_dir / f"{fail_stem}.dump.log"
                    fail_yaml = ""
                    if args.predicate_buffer:
                        fail_yaml = str(failure_dir / f"{fail_stem}.yaml")
                    dump_cmd = [
                        str(fuzzer),
                        f"--seed={seed}",
                        f"--lanes={args.lanes}",
                        f"--subgroup-width={args.subgroup_width}",
                        "--print-ir",
                    ]
                    append_generation_options(
                        dump_cmd, predicate_yaml=(fail_yaml if fail_yaml else None)
                    )
                    dumped = run(dump_cmd)
                    write_process_log(fail_validate_log, validate_cmd, validate)
                    write_process_log(fail_dump_log, dump_cmd, dumped)
                    if dumped.returncode == 0 and dumped.stdout.strip():
                        fail_mlir.write_text(dumped.stdout, encoding="utf-8")
                    saved_failures += 1
                seed += args.seed_step
                continue

            gen_cmd = [
                str(fuzzer),
                f"--seed={seed}",
                f"--lanes={args.lanes}",
                f"--subgroup-width={args.subgroup_width}",
                "--print-ir",
            ]
            predicate_yaml = ""
            if args.predicate_buffer:
                predicate_yaml = f"{out_dir}/test_{count:03d}_seed_{seed}.yaml"
            append_generation_options(
                gen_cmd, predicate_yaml=(predicate_yaml if predicate_yaml else None)
            )
            generated = run(gen_cmd)
            if generated.returncode != 0 or not generated.stdout.strip():
                seed += args.seed_step
                continue

            if args.uniform_subgroup_only:
                validate_uniform_cmd = [sys.executable, str(validator_script), "--stdin"]
                invariant = run(validate_uniform_cmd, stdin_text=generated.stdout)
                if invariant.returncode != 0:
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
            if args.profile is not None:
                record["profile"] = args.profile
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
            if args.helper_call_post_switch_rate is not None:
                record["helper_call_post_switch_rate"] = args.helper_call_post_switch_rate
            if args.helper_call_max_depth is not None:
                record["helper_call_max_depth"] = args.helper_call_max_depth
            if args.helper_call_nest_loop_rate is not None:
                record["helper_call_nest_loop_rate"] = args.helper_call_nest_loop_rate
            if args.uniform_subgroup_only:
                record["uniform_subgroup_only"] = True
            if args.collective_cf:
                record["collective_cf"] = True
            if args.sync_cf:
                record["sync_cf"] = True
            if args.collective_mem:
                record["collective_mem"] = True
            if args.sync_mem:
                record["sync_mem"] = True
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
