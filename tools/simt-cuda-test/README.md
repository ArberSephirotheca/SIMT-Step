# simt-cuda-test

A small AmberScript-like CUDA test runner. It parses a single-kernel script,
compiles the inline CUDA C with NVRTC, launches the kernel, and validates buffer
results with optional float tolerances.

## Build

This target requires the CUDA toolkit (NVRTC + driver API). If you want to skip
building it, configure with `-DSIMT_STEP_BUILD_CUDA_TEST=OFF`.

## Usage

```
simt-cuda-test <script.cuda> [--device N] [--arch sm_80] [--dump-ptx] [--init-yaml <file>]
simt-cuda-test --batch <dir> [--recursive] [--report <file>]
               [--device N] [--arch sm_80] [--init-yaml <file>] [--init-yaml-auto]
```

- `--device N`: CUDA device index (default: 0)
- `--arch sm_80`: passed to NVRTC as `--gpu-architecture=sm_80`
- `--dump-ptx`: print the generated PTX to stdout
- `--init-yaml <file>`: apply buffer initialization from YAML before launch
- `--cuda-include <dir>`: add CUDA include path for NVRTC (auto-detected if not set)
- `--batch <dir>`: run all `.cuda` scripts in a directory
- `--recursive`: recurse into subdirectories with `--batch`
- `--report <file>`: write a CSV report (`status,file,error`)
- `--init-yaml-auto`: for each script, load `<script>.yaml` if it exists

## Script format (v0)

Comments use `#` at line start. Commands are line-based. One kernel per file.
Buffers must be declared before they are referenced by FILL/INIT/BIND/EXPECT.

Supported commands:
- `BUFFER <name> TYPE <type> SIZE <n>`
- `FILL <name> <value>`
- `INIT <name> <index> <value>`
- `KERNEL [<name>]` ... `ENDKERNEL`
- `BIND <name> ARG <n>`
- `BIND CONST <value> TYPE <type> ARG <n>`
- `LAUNCH GRID <x> <y> <z> BLOCK <x> <y> <z>`
- `EXPECT <name> <index> <value> [ABS_TOL <a>] [REL_TOL <r>]`
- `EXPECT_RANGE <name> <start> <end> <value> [ABS_TOL <a>] [REL_TOL <r>]`
- `EXPECT_BUFFER <actual> <expected> [ABS_TOL <a>] [REL_TOL <r>]`

Types:
- `i32`, `u32`, `f32`

Ranges are inclusive (start/end are both checked).

`EXPECT_BUFFER` compares all indices of two buffers (sizes/types must match).

### Kernel rules
- The code inside `KERNEL` is passed to NVRTC verbatim (raw code only).
- If `KERNEL` has no name, the kernel name is `simt_kernel`.
- The kernel signature must match the `BIND` list, ordered by `ARG` index.
  - `BUFFER` binds become pointer arguments of the declared element type.
  - `CONST` binds become scalar arguments of the declared type.

### Example

```

### YAML init format
```
buffers:
  - buffer: buf0
    size: 16
    fill: 0
    entries:
      - { index: 3, value: 42 }
```
`buffer` must match a `BUFFER` name in the script.

## Generating CUDA scripts from MLIR

`tools/simt-cuda-test/generate_cuda_tests.py` will:
- raise each MLIR file to CUDA with `simt-step-raise`,
- run `simt-step-runner` to collect expected buffer values,
- write a `.cuda` script plus a manifest in the output directory.

The generator treats buffers mentioned in the YAML init file as inputs and
creates `exp_argN` buffers for the remaining outputs, then emits
`EXPECT_BUFFER argN exp_argN`.
If the raised CUDA kernel is named `main`, the generator renames it to
`simt_kernel` to avoid NVRTC's special handling of `main`.

Example:
```
python3 tools/simt-cuda-test/generate_cuda_tests.py \
  --mlir-dir fuzz-tests \
  --out-dir cuda-tests
```

Then batch run:
```
build/tools/simt-cuda-test/simt-cuda-test \
  --batch cuda-tests \
  --report cuda-tests/report.csv \
  --init-yaml-auto \
  --arch sm_80 --device 0
```
BUFFER buf0 TYPE i32 SIZE 16
FILL buf0 0
INIT buf0 3 42

KERNEL
extern "C" __global__ void main(int* buf0, int n) {
  int tid = (int)(blockIdx.x * blockDim.x + threadIdx.x);
  if (tid < n) buf0[tid] += 1;
}
ENDKERNEL

BIND buf0 ARG 0
BIND CONST 16 TYPE i32 ARG 1

LAUNCH GRID 1 1 1 BLOCK 16 1 1

EXPECT buf0 3 43
EXPECT_RANGE buf0 0 15 1
```
