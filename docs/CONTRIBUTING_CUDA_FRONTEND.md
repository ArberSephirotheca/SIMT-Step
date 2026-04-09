# Contributing to the SIMT-Step CUDA Frontend

## 1. Project Overview

SIMT-Step provides an MLIR dialect (`simt_step`) that captures SIMT execution
explicitly, plus a lowering pipeline that turns structured control flow into the
mask-aware form our interpreter understands. We already have an HLSL importer
(`tools/simt-hlsl-import`) producing this dialect, and the CUDA frontend now
reuses the same architecture for one intentionally narrow slice. Treat HLSL as
the broad reference when you want to see how source lowering translates into
`simt_step` MLIR:

```bash
./build/tools/simt-hlsl-import/simt-hlsl-import tools/simt-hlsl-import/test/simple.hlsl
```

The CUDA frontend reuses the same lowering algebra:

1. Parse CUDA via Clang.
2. Translate the AST into our tagless-final lowering algebra (shared between all
   frontends).
3. Emit `simt_step` IR for kernels.

For the current Phase 6 slice, the emitted raw MLIR is expected to carry only
non-policy boundary facts:

- canonical line-start `loc(...)` provenance
- concrete `simt.num_threads` launch geometry for the supported one-warp slice
- stable subgroup `site_id` attributes on emitted subgroup ops, currently from
  an importer-local sequence seeded at `70` and assigned in source order

Do not extend that metadata into `participantMask(policy)` or final DRF
judgments. Those remain Rust-side responsibilities.

The shared frontend infrastructure lives under:

- `include/simt-step/Frontends/Common/` – headers for lowering algebra, loop/switch
  support, result helpers.
- `lib/frontends/common/` – implementations (e.g., loop scope support).

The CUDA-specific pieces live under `lib/frontends/` and
`tools/simt-cuda-import/`.

---

## 2. Environment & Build Checklist

1. **Clone the repo and LLVM toolchain dependency**
   ```bash
   git clone https://github.com/<your-account>/SIMT-Step.git
   ```

2. **Toolchain dependency** – install an LLVM/Clang/MLIR toolchain with DXIL
   enabled. Export the install location via `LLVM_PREFIX` (matching `docs/BUILD.md`):
   ```bash
   export LLVM_PREFIX=/path/to/llvm-install
   ```
   Adjust `LLVM_DIR` / `MLIR_DIR` if you choose a different prefix.

3. **Configure and build**
   ```bash
   cmake -S . -B build -DLLVM_DIR=$LLVM_PREFIX/lib/cmake/llvm \
         -DMLIR_DIR=$LLVM_PREFIX/lib/cmake/mlir -DCMAKE_BUILD_TYPE=RelWithDebInfo
   cmake --build build
   ```

4. **Run tests**
   ```bash
   cmake --build build --target simt-hlsl-import
   build/tools/simt-hlsl-import/simt-hlsl-import tools/simt-hlsl-import/test/simple.hlsl
   ```
   For the current CUDA slice, use the checked fixtures instead of pretending
   `MLIR_FILE_CHECK=/usr/bin/true` gives real lit coverage:
   ```bash
   cmake --build build --target simt-cuda-import -j4
   bash tools/simt-cuda-import/test/check_fixtures.sh build/tools/simt-cuda-import/simt-cuda-import
   cd /Users/zheyuan/GPU-DRF/faial-rs && cargo test -p faial_frontend_simt --test export_mlir
   ```
   That dual-toolchain chain is the minimum honest validation path for the
   supported CUDA subset. `SIMT-Step` alone does not own the checked Rust import
   boundary or final verdict semantics.

---

## 3. Codebase Tour for the CUDA Frontend

| Path | Purpose |
| ---- | ------- |
| `lib/frontends/CUDA.cpp` | Current narrow CUDA lowering slice: one parameterless `__global__` kernel with one top-level full-mask `__any_sync`, plus explicit rejection diagnostics, canonicalized source locations, fixed one-warp launch metadata, and stable subgroup `site_id` emission for the supported slice. |
| `include/simt-step/frontends/Common/*` | Tagless-final lowering algebra & loop/switch helpers shared across frontends. |
| `tools/simt-hlsl-import/` | Useful reference implementation (HLSL importer) showing how to wire interpretations, diagnostics, and tests. |
| `docs/LOWERING_ALGEBRA_DESIGN.md` | Design rationale behind the algebra you will reuse. |

---

## 4. Current Follow-Up Tasks

1. **Keep the supported CUDA subset honest**
   - Preserve the current contract: one parameterless `__global__` kernel, one
     top-level full-mask `__any_sync`, optional top-level `if`, and explicit
     rejection diagnostics for everything else.
   - Pair every accepted CUDA fixture with a checked raw `*.mlir` golden and
     every rejected fixture with a checked `*.stderr` golden.

2. **Reduce checked-fixture translation churn without moving semantics**
   - Prefer pushing non-policy facts such as `loc(...)`, workgroup shape, and
     stable `site_id` metadata into raw importer output when there is an honest,
     deterministic rule.
   - Do not move `participantMask(policy)`, `mem_drf`, `drf_full`, or
     `drf_partial(policy)` semantics into `SIMT-Step`.

3. **Validate across both toolchains**
   - Use `tools/simt-cuda-import/test/check_fixtures.sh` for raw importer
     regressions.
   - Pair it with `cargo test -p faial_frontend_simt --test export_mlir` so the
     checked Rust boundary stays aligned with the raw CUDA importer output.

4. **Keep masked/reconverged CUDA sites locked**
   - Do not broaden the frontend to masked or reconverged collectives until the
     checked boundary can carry honest `liveMask`, `activeMask`, and
     `expectedMask` evidence.
   - Do not advertise broader CUDA verdict support by collapsing
     `expectedMask` into `participantMask(policy)`.

---

## 5. Development Tips

- **Stay tagless-final** – don’t call `OpBuilder` directly from shared helpers.
  Always go through the algebra so analysis/emit modes stay aligned.
- **Keep metadata non-policy** – raw CUDA output may carry source provenance,
  workgroup shape, and stable site ids, but it must not invent
  `participantMask(policy)` or any verdict-owned mask witness.
