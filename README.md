# SIMT-Step

SIMT-Step is a semantics framework + MLIR dialect for exploring SIMT control-flow and subgroup semantics.

## Build

See `docs/BUILD.md` for the full instructions.

## Fuzzing + CUDA regression workflow

See `docs/fuzzing.md` for the full option guide. Typical loop:

```sh
# 1) Generate deterministic MLIR (+ optional YAML init buffers).
#    See docs/fuzzing.md for a full option guide (e.g. complex helpers, nested non-uniform helper calls).
python3 tools/simt-step-fuzz/generate_tests.py \
  --out-dir fuzz-tests \
  --count 100 \
  --lanes 64 \
  --subgroup-width 32 \
  --trials 3 \
  --schedule-seed 1 \
  --predicate-buffer

# 2) Turn the MLIR corpus into CUDA test scripts.
python3 tools/simt-cuda-test/generate_cuda_tests.py \
  --mlir-dir fuzz-tests \
  --out-dir cuda-tests

# 3) Run the CUDA scripts on GPU and emit a CSV report.
cmake --build build -j --target simt-cuda-test
build/tools/simt-cuda-test/simt-cuda-test \
  --batch cuda-tests \
  --arch sm_80 \
  --report cuda-report.csv
```
