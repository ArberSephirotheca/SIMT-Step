# SIMT-Step fuzzing (how to use the generators)

This repo has two layers of fuzz tooling:

1) `build/tools/simt-step-fuzz/simt-step-fuzz`: generates **one** MLIR module (seeded) and can run the CPS interpreter determinism oracle.
2) `tools/simt-step-fuzz/generate_tests.py`: searches seeds and writes a **corpus** of deterministic tests (`.mlir`), optionally with predicate-buffer initializers (`.yaml`).

## Quickstart

Build the tools:

```sh
cmake --build build -j --target simt-step-fuzz simt-step-runner
```

Generate a corpus (MLIR + YAML):

```sh
python3 tools/simt-step-fuzz/generate_tests.py \
  --out-dir fuzz-tests \
  --count 100 \
  --lanes 64 \
  --subgroup-width 32 \
  --trials 3 \
  --schedule-seed 1 \
  --predicate-buffer
```

Outputs:
- `fuzz-tests/test_XXX_seed_YYY.mlir`
- `fuzz-tests/test_XXX_seed_YYY.yaml` (only with `--predicate-buffer`)
- `fuzz-tests/manifest.jsonl` (append-only log of what was generated)

## Reproducing a single test

With YAML (predicate buffer / prefill buffers):

```sh
build/tools/simt-step-runner/simt-step-runner \
  --lanes=64 --subgroup-width=32 \
  --init-file=fuzz-tests/test_000_seed_0.yaml \
  fuzz-tests/test_000_seed_0.mlir
```

Without YAML:

```sh
build/tools/simt-step-runner/simt-step-runner \
  --lanes=64 --subgroup-width=32 \
  fuzz-tests/test_000_seed_0.mlir
```

## What `--predicate-buffer` means

When enabled:
- The generated `@main` takes an extra resource argument (default `arg1`) used as a read-only “predicate buffer”.
- Control-flow decisions may load per-lane (and for loops: per-iteration) predicate values from this buffer.
- `generate_tests.py --predicate-buffer` emits a YAML file describing how to pre-fill that buffer.

This is useful for:
- deterministic *non-uniform* control flow without hardcoding everything as `tid % k`,
- stressing loop/switch reconvergence where some lanes exit earlier than others.

## `generate_tests.py` option guide

This script is a “corpus builder”: it keeps trying seeds until it finds programs that pass the determinism oracle.

### Core
- `--out-dir`: where `.mlir/.yaml/manifest.jsonl` are written.
- `--count`: number of programs to accept.
- `--lanes`, `--subgroup-width`: execution shape for generation + oracle.

### Determinism filtering (oracle)
- `--trials K`: run the interpreter `K` times with different schedule seeds and require identical final state.
- `--schedule-seed S`: base seed for the randomized scheduler (trial `i` uses `S + i`).

### Execution policy (oracle only)
These options are passed to `simt-step-fuzz --run` during seed filtering. They do not change the emitted `.mlir`, but they *do* change which programs are considered “deterministic”.

- `--collective-cf` / `--sync-cf`: treat `if/loop/switch` as collective/synchronous before split (helps model warp-style control flow).
- `--collective-mem` / `--sync-mem`: treat `buffer.load/store` as collective/synchronous (helps avoid schedule-dependent write conflicts).

### Seed search
- `--seed-start`, `--seed-step`: how to enumerate seeds.
- `--max-attempts`: how many candidate seeds to try before failing the run.

### Control-flow features
- `--break-continue-rate p`: probability in `[0,1]` to emit `break`/`continue` in loops.
- `--no-subgroup-in-switch`: do not emit subgroup ops inside switch cases (useful to isolate “switch reconvergence” from subgroup semantics).
- `--post-switch-wave-op-rate p`: probability in `[0,1]` to emit a `wave_count_bits(true)` *immediately after* a `switch` (stresses reconvergence-after-switch).
- `--non-uniform-helper-call-rate p`: probability in `[0,1]` to call `helper0` under a non-uniform `if` so wave ops inside the helper see the branch active mask.

### Predicate buffer / YAML
- `--predicate-buffer`: make `@main` take a predicate buffer and write `test_*.yaml`.

### Complex helper function (optional)
- `--complex-helper`: generate a helper function with nested control-flow and wave ops.
- `--helper-max-depth N`: recursion depth for helper pattern generation.
- `--helper-min-control-ops N`: minimum `if/loop/switch` ops in helper.
- `--helper-subgroup-ids`: allow `lane_id/subgroup_id` in helper (raiser support required).

## Recommended “recipes”

Switch reconvergence stress (without subgroup ops inside cases):

```sh
python3 tools/simt-step-fuzz/generate_tests.py \
  --count 200 --lanes 64 --subgroup-width 32 --trials 3 --schedule-seed 1 \
  --no-subgroup-in-switch \
  --post-switch-wave-op-rate 1.0
```

Loop break/continue stress:

```sh
python3 tools/simt-step-fuzz/generate_tests.py \
  --count 200 --lanes 64 --subgroup-width 32 --trials 3 --schedule-seed 1 \
  --break-continue-rate 0.2
```

Predicate-buffer + complex helper (max coverage, slower to find deterministic programs):

```sh
python3 tools/simt-step-fuzz/generate_tests.py \
  --count 100 --lanes 64 --subgroup-width 32 --trials 3 --schedule-seed 1 \
  --predicate-buffer \
  --complex-helper --helper-max-depth 3 --helper-min-control-ops 3
```

## `simt-step-fuzz` (single-module) useful commands

Print a single generated module:

```sh
build/tools/simt-step-fuzz/simt-step-fuzz \
  --seed=123 --lanes=64 --subgroup-width=32 --print-ir
```

Run determinism oracle on a single module (same seed controls program generation; scheduling is controlled by `--schedule-seed`):

```sh
build/tools/simt-step-fuzz/simt-step-fuzz \
  --seed=123 --lanes=64 --subgroup-width=32 \
  --run --trials=3 --schedule-seed=1 --random-schedule
```

## CUDA backend check (raise + run on GPU)

To compare the CPS interpreter result against CUDA execution, use the CUDA test scripts.

Generate `.cuda` scripts from an MLIR corpus:

```sh
python3 tools/simt-cuda-test/generate_cuda_tests.py \
  --mlir-dir fuzz-tests \
  --out-dir cuda-tests
```

This will:
- call `simt-step-raise --target=cuda` to get CUDA device code,
- call `simt-step-runner` to compute expected output buffers,
- write `cuda-tests/test_*.cuda`,
- copy `test_*.yaml` next to each script when present (predicate-buffer / prefill buffers).

Run the scripts on GPU:

```sh
cmake --build build -j --target simt-cuda-test
build/tools/simt-cuda-test/simt-cuda-test \
  --batch cuda-tests \
  --arch sm_80 \
  --report cuda-report.csv
```

Notes:
- In `--batch` mode, YAML init files are loaded automatically when a matching `test_*.yaml`
  exists next to `test_*.cuda`.
- If NVRTC cannot find `cuda_runtime.h`, pass `--cuda-include /path/to/cuda/include`
  (the tool tries to auto-detect common install paths).
