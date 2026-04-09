# `simt-cuda-import`

`simt-cuda-import` is the narrow CUDA real-source importer for Phase 6. It
currently normalizes one honest CUDA slice into `simt_step` MLIR and rejects
everything outside that boundary with explicit diagnostics.

## Supported slice

- exactly one parameterless `__global__` kernel per translation unit
- `void` return type
- scalar integer locals and scalar integer comparisons
- `threadIdx.x`
- one top-level full-mask `__any_sync(0xffffffffu, predicate)`
- an optional top-level `if` that branches on the vote result
- `return`

This importer only emits unmasked sites for now. It does not fabricate
`liveMask`, `activeMask`, or `expectedMask`, and it never derives
`participantMask(policy)`.

For the supported Phase 6 slice, the raw importer output now carries the
non-policy facts that the downstream checked Rust fixture used to hand-add:

- canonical line-start `loc(...)` provenance on the emitted ops
- a concrete one-warp entry-point launch shape via `simt.num_threads = [32, 1,
  1]`
- a stable subgroup `site_id` op attribute sequence seeded at `70` and assigned
  in source order for emitted subgroup sites

Those facts stay on the SIMT-Step side of the boundary. They do not introduce
mask witnesses and they do not move `participantMask(policy)` or final DRF
verdict authority out of `faial_drf`.

## Unsupported today

- masked collectives
- nested or reconverged collectives
- multiple vote intrinsics in one kernel
- kernel parameters
- `else` branches, loops, and switches
- CUDA intrinsics other than `__any_sync`

## Regression fixtures

- `test/real_source_cuda_wave_any.cu`
- `test/real_source_cuda_wave_any.mlir`
- `test/unsupported_masked_wave_any.cu`
- `test/unsupported_masked_wave_any.stderr`
- `test/unsupported_nested_wave_any.cu`
- `test/unsupported_nested_wave_any.stderr`

## Validation

```bash
cmake --build build --target simt-cuda-import -j4
bash tools/simt-cuda-import/test/check_fixtures.sh build/tools/simt-cuda-import/simt-cuda-import
```

The current tree may be configured with `MLIR_FILE_CHECK=/usr/bin/true`, so
there is no honest lit/FileCheck coverage for CUDA yet. Until a real
`FileCheck` binary is available, keep the shell-based golden diff as the
regression path.

For Phase 6 boundary changes, follow that shell check with the checked Rust
handoff:

```bash
cd /Users/zheyuan/GPU-DRF/faial-rs && cargo test -p faial_frontend_simt --test export_mlir
cd /Users/zheyuan/GPU-DRF/faial-rs && cargo test -p faial_drf --test simt_step_end_to_end
```

`simt-hlsl-import` remains the broader reference importer. `simt-cuda-import`
only owns normalization of the supported CUDA subset; it does not own
`participantMask(policy)`, `drf_full`, `drf_partial(policy)`, or final verdict
composition. Those stay in `faial_drf` after the checked Rust import boundary.

The checked Rust fixture still exists, but the remaining gap is now narrow and
explicit. `faial_frontend_simt` consumes the raw importer-emitted `loc(...)`
aliases, raw `site_id` op attributes, the bracket-form `simt.num_threads`
launch shape, and the structurally empty reject-region `simt_step.yield`
directly. For the first CUDA slice, the only reviewer-owned annotation left in
the checked fixture is the subgroup `label`, because there is not yet an
explicit semantics-preserving naming rule for CUDA-origin sites.
