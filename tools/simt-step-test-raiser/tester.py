#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path
import subprocess as sp
from collections import namedtuple
import os
import tqdm
from tqdm.contrib.concurrent import process_map
import multiprocessing as mp


RAISER_PATH = "build/tools/simt-step-test-raiser/simt-step-test-raiser"
TProps = namedtuple("TargetProps", ["ext", "runner_name", "extra_cmd", "final"])
FailInfo = namedtuple("FailInfo", ["file", "passed_raiser", "stdout", "stderr"])

TARGETS = {
    "glsl-amber": TProps("amber", "amber", [], []),
    "hlsl-amber": TProps("amber", "amber", [], []),
    "hlsl-directx": TProps("cpp", "cl", ['/EHsc', '/O2'], ['{0}.exe']),
    "cuda": TProps("cu", "nvcc", ["-o", "/tmp/{0}.out"], ["/tmp/{0}.out"]),
    "hip": TProps("hip", "hipcc", ["-o", "/tmp/{0}.out"], ["/tmp/{0}.out"]),
    "msl": TProps("py", "python3", [], []),
    "python": TProps("py", "python3", [], [])
}

def run_raiser(file: Path, args: argparse.Namespace, failures: mp.Queue[FailInfo]) -> bool:
    no_ext = str(file).rsplit(".", 1)[0]

    raiser_cmd: list[str] = [RAISER_PATH, str(file.absolute())] + args.raiser_options.split()
    raiser_cmd.append("--mlir-to-" + args.target)
    if args.no_wrapper and "--no-wrapper" not in raiser_cmd:
        raiser_cmd.append("--no-wrapper")
    
    buffer_yaml = Path(no_ext + ".yaml")
    if not args.no_yaml and buffer_yaml.exists():
        raiser_cmd += ["--buffer-init-yaml", str(buffer_yaml)]
    
    raiser_out_dir = args.output_dir if not args.ssh_dest else "/tmp/glsl-fuzz"
    raiser_cmd += ["-o", raiser_out_dir + "/" + Path(no_ext).name + "." + TARGETS[args.target if args.no_wrapper else "python"].ext]
    
    raiser_process = sp.run(raiser_cmd, capture_output=True, env=os.environ.copy())
    if raiser_process.returncode != 0:
        failures.put(FailInfo(file, False, raiser_process.stdout, raiser_process.stderr))
        return False
    
    return True

def run_runner(file: Path, args: argparse.Namespace, failures: mp.Queue[FailInfo]) -> bool:
    no_ext = Path(str(file).rsplit(".", 1)[0])
    true_target = args.target if args.no_wrapper else "python"
    raiser_out_dir = args.output_dir if not args.ssh_dest else "/tmp"
    to_run = Path(raiser_out_dir) / Path(no_ext.name + "." + TARGETS[true_target].ext)
    assert to_run.exists()

    runner_cmd = [TARGETS[true_target].runner_name, str(to_run)] + args.runner_options.split() 
    runner_cmd += [s.format(no_ext.name) for s in TARGETS[true_target].extra_cmd]

    if args.ssh_dest:
        runner_cmd = ["ssh", args.ssh_dest] + runner_cmd

    runner_process = sp.run(runner_cmd, capture_output=True, env=os.environ.copy())
    if runner_process.returncode != 0:
        failures.put(FailInfo(file, True, runner_process.stdout, runner_process.stderr))
        return False
    
    if TARGETS[true_target].final:
        new_final = [s.format(no_ext.name) for s in TARGETS[true_target].final]
        final_process = sp.run((["ssh", args.ssh_dest, "sudo", "-S"] if args.ssh_dest else []) 
                               + new_final, capture_output=True, env=os.environ.copy(), 
                               input=bytes(os.environ["REMOTEPASS"] if args.ssh_dest else "", "utf8"))
        if final_process.returncode != 0:
            failures.put(FailInfo(file, True, 
                                     final_process.stdout, 
                                     final_process.stderr))
            return False

    return True

def raiser_worker(args: tuple[Path, argparse.Namespace, mp.Queue[FailInfo]]):
    return run_raiser(*args)


def runner_worker(args: tuple[Path, argparse.Namespace, mp.Queue[FailInfo]]):
    return run_runner(*args)

def both_worker(args: tuple[Path, argparse.Namespace, mp.Queue[FailInfo]]):
    if not run_raiser(*args): return
    if not run_runner(*args): return

if __name__ == "__main__":
    parser = argparse.ArgumentParser("tester.py")
    parser.add_argument("path",
                        type=str,
                        help="Path to file or glob of files to raise and execute, "
                             "relative to the directory this script is being run in")
    parser.add_argument("target",
                        choices=set(TARGETS.keys()) - {"python"},
                        help="Language target")
    parser.add_argument("-Xraiser", "--raiser-options",
                        default="",
                        help="Arguments to pass to raiser")
    parser.add_argument("-Xrunner", "--runner-options",
                        default="",
                        help="Arguments to pass to runner")
    parser.add_argument("--no-yaml",
                        action="store_true",
                        help="Do not search for a .yaml file to initalize the buffer")
    parser.add_argument("--no-wrapper",
                        action="store_true",
                        help="Do not generate Python wrapper output from raiser")
    parser.add_argument("-F", "--stop-if-fails",
                        choices=["raiser", "runner"],
                        default=[],
                        nargs="*",
                        help="Stop running if a one type of command fails. Default: none")
    parser.add_argument("-O", "--output-dir",
                        default=".",
                        help="Directory to store output files into")
    parser.add_argument("-R", "--ssh-dest",
                        help="SSH to this location to run runner. If not specified, runs locally. "
                            "If -O is specified, it is in the remote machine, and the file is put "
                            "in /tmp locally to be scp'd.")
    parser.add_argument("-j", "--jobs",
                        help="Number of jobs to split the work",
                        default=1,
                        type=int)
    parser.add_argument("-L", "--log-location",
                        help="File to output failure log to. Default is stdout",
                        default=None)
    parser.add_argument("--raise-only",
                        help="Only run the raiser on the files",
                        action="store_true")
    
    args = parser.parse_args()

    os.system("cmake --build build -t simt-step-test-raiser")

    to_process = list(Path(".").glob(args.path + ("" if args.path.endswith(".mlir") else ".mlir")))
    manager = mp.Manager()
    failures: mp.Queue[FailInfo] = manager.Queue(maxsize=len(to_process))

    try:
        if args.jobs == 1:
            for file in tqdm.tqdm(to_process):
                if not run_raiser(file, args, failures):
                    if "raiser" in args.stop_if_fails: break
                    else: continue
                if not args.raise_only:
                    if not run_runner(file, args, failures):
                        if "runner" in args.stop_if_fails: break
                        else: continue
        else:
            if args.raise_only:
                process_map(raiser_worker, [(file, args, failures) for file in to_process], max_workers=args.jobs)
            elif args.ssh_dest:
                raiser_outs = process_map(raiser_worker, [(file, args, failures) for file in to_process], max_workers=args.jobs)
                true_target = args.target if args.no_wrapper else "python"
                raiser_out_dir = args.output_dir if not args.ssh_dest else "/tmp"
                sp.run(["scp", "-C"]
                    + [Path(raiser_out_dir) / Path(Path(str(file).rsplit(".", 1)[0]).name + "." + TARGETS[true_target].ext) 
                        for i, file in enumerate(to_process) if raiser_outs[i]]
                        + [f"{args.ssh_dest}:{args.output_dir}"], check=True, capture_output=True, env=os.environ.copy())

                runner_outs = process_map(runner_worker, [(file, args, failures) for i, file in enumerate(to_process) if raiser_outs[i]], max_workers=args.jobs)
            else:
                process_map(both_worker, [(file, args, failures) for file in to_process], max_workers=args.jobs)
    except KeyboardInterrupt:
        pass
    
    with open(args.log_location or "/dev/stdout", "w") as logout:
        print(f"\n\nFailures: {failures.qsize()}/{len(to_process)}\n---------------------------------------", file=logout)
        for i in range(failures.qsize()):
            f = failures.get_nowait()
            print(f"\n{f.file}:\nPassed Raiser: {f.passed_raiser}\n------ stdout ------\n{f.stdout.decode()}\n------ stderr ------\n{f.stderr.decode()}", file=logout)
        
