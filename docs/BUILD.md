# Building SIMT-Step (C++)

The C++ tree assumes you have a recent out-of-tree LLVM/MLIR build (21.x or newer). Point CMake at the install prefix you produced when building LLVM. Throughout this guide the prefix is referenced via the shell variable `LLVM_PREFIX`; set it once to avoid hard-coded `/opt/llvm` paths:

```bash
export LLVM_PREFIX=/path/to/your/llvm-install   # e.g. $(pwd)/llvm-install or /opt/llvm
```

If you followed the quick-start scripts that install into `/opt/llvm`, setting `LLVM_PREFIX=/opt/llvm-hlsl` keeps the old behaviour.

## Configure

```bash
cmake -S . -B build \
  -DLLVM_DIR=$LLVM_PREFIX/lib/cmake/llvm \
  -DMLIR_DIR=$LLVM_PREFIX/lib/cmake/mlir \
  -DCMAKE_BUILD_TYPE=Release
```

The root `CMakeLists.txt` still auto-detects `/opt/llvm`; if you export `LLVM_PREFIX` to another location the commands above keep everything in sync.

## Build

```bash
cmake --build build
```

This produces the shared library `libsimt-step` and several command-line tools under `build/tools/`. `simt-hlsl-import` remains the broad reference driver for source translation to `simt_step` MLIR. `simt-cuda-import` now supports one intentionally narrow Phase 6 CUDA slice: a parameterless `__global__` kernel with a single top-level full-mask `__any_sync`. Treat that supported CUDA subset as a contract boundary, not a claim of broad CUDA frontend coverage. The other executables (`simt-convert`, `simt-run`, `simt-opt`, `simt-step-parse`) are still work in progress or utility stubs, and the `check-*` targets simply exercise their current smoke tests.

Validate the CUDA slice with the checked fixtures under `tools/simt-cuda-import/test/`:

```bash
cmake --build build --target simt-cuda-import -j4
bash tools/simt-cuda-import/test/check_fixtures.sh build/tools/simt-cuda-import/simt-cuda-import
cd /Users/zheyuan/GPU-DRF/faial-rs && cargo test -p faial_frontend_simt --test export_mlir
```

If your configure step uses `-DMLIR_FILE_CHECK=/usr/bin/true`, treat that as build sanity only. It does not provide meaningful lit/FileCheck coverage for the CUDA importer.

For Phase 6 CUDA-boundary work, the C++ fixture check and the Rust exporter test
form one honest validation chain: `SIMT-Step` owns raw normalization of the
supported CUDA subset, while `faial_frontend_simt` owns the checked import
contract that reaches `faial_drf`. Final DRF verdict authority still lives in
Rust.

- `simple-program-runner` lives under `build/test/` and runs the minimal CPS interpreter against a `simt_step` MLIR module. Example:
  ```bash
  ./build/test/simple-program-runner test/simple-interpreter/if_else.mlir
  ```
  The harness prints the resulting lane value (e.g. `1`). We also expose it as a CTest target:
  ```bash
  ctest --test-dir build -R simple_interpreter_if --output-on-failure
  ```
```

## Environment

Before configuring, ensure your shell uses the Clang toolchain that ships with the same LLVM install:

```bash
export PATH=$LLVM_PREFIX/bin:$PATH
export CC=$LLVM_PREFIX/bin/clang
export CXX=$LLVM_PREFIX/bin/clang++
export LD_LIBRARY_PATH=$LLVM_PREFIX/lib:$LD_LIBRARY_PATH
```


### HLSL builtin headers

`simt-hlsl-import` relies on Clang’s bundled HLSL headers (`hlsl.h`, `hlsl_intrinsics.h`, …). When the tool cannot find an installed resource directory (for example on minimal developer machines), it automatically falls back to the checked-in headers under `llvm-project/clang/lib/Headers`. No manual configuration is required unless you want to override the search path—set `SIMT_CLANG_HEADERS_DIR` at build time or export `SIMT_IMPORT_DEBUG_RESOURCE=1` to print the resolved directory.
