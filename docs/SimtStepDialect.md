# SIMT-Step Dialect Reference

## Attributes

- `simt_step.scope`: enum (`Thread`, `Subgroup`, `Workgroup`)
- `simt_step.memsem`: enum (`None`, `Acquire`, `Release`, `AcqRel`)
- `simt_step.memspace`: enum (`Generic`, `Global`, `Shared`, `Private`)
- `simt_step.wmma_role`: enum (`MatrixA`, `MatrixB`, `Accumulator`)
- `simt_step.wmma_layout`: enum (`None`, `RowMajor`, `ColMajor`)

## Types

- `!simt_step.mask<width?>` – bitmask type representing active lanes.
- `!simt_step.resource<space, elem>` – typed buffer/resource handle in a concrete memory space.
- `!simt_step.wmma_fragment<role, m x n x k, elem, layout>` – WMMA fragment type.
  The current verifier intentionally accepts only the exact pedagogical CUDA slice used by the interpreter:
  `m16n16k16`, `matrix_a` as `f16 col_major`, `matrix_b` as `f16 row_major`,
  and `accumulator` as `f32` with layout `None`.

## Operations

### Wave collectives
- `simt_step.wave_all` – returns an `i1` indicating whether all active lanes satisfy the predicate.
- `simt_step.wave_any` – returns an `i1` indicating whether any active lane satisfies the predicate.
- `simt_step.wave_ballot` – produces an integer mask (`i64`) identifying lanes with `true` predicate values. Future revisions will return `simt_step.mask`.
- `simt_step.wave_count_bits` – returns an `i32` count of lanes whose predicate evaluates to `true`.
- `simt_step.wave_mma` – fixed pedagogical subgroup MMA op. The current form takes three `f32` scalars per lane `(lhs, rhs, acc)` and executes a collective 2x2 matrix multiply-accumulate across exactly four participating lanes, returning one `f32` result per lane. This is the bootstrap form for interpreter semantics, not the final fragment-typed design.

### WMMA fragment ops
- `simt_step.wmma_fill` – collectively fills an accumulator fragment from a uniform `f32` value.
- `simt_step.wmma_load_matrix` – collectively loads a fragment from a typed resource with explicit `base` and `stride` operands.
- `simt_step.wmma_mma` – collectively computes `A * B + C` over three fragment operands and returns an accumulator fragment.
- `simt_step.wmma_store_matrix` – collectively stores an accumulator fragment to a typed resource with explicit `base`, `stride`, and layout.

Current interpreter restrictions for the WMMA ops:
- subgroup width must be exactly `32`
- all lanes in the warp must participate in the collective
- `wmma_load_matrix` and `wmma_store_matrix` currently require uniform resource/base/stride across the warp
- `wmma_mma` currently requires identical fragment operands across the warp

### Synchronization & state
- `simt_step.barrier` – synchronization barrier with optional `scope` / `memsem` enums.
- `simt_step.dispatch_thread_id` – yields the dispatch-space thread id; the result
  type matches the builtin usage (scalar or vector).
- `simt_step.group_thread_id` – yields the workgroup-local thread id in the form
  requested by the builtin (scalar or vector).
- `simt_step.group_id` – returns the workgroup identifier within the dispatch
  grid (typically a three-component vector).
- `simt_step.group_index` – returns the flattened workgroup index (scalar).
- `simt_step.lane_id` – yields the current lane identifier as `index`.
- `simt_step.active_mask` – exposes the current active mask as `i64` (will become `simt_step.mask`).

### Memory (placeholders)
- `simt_step.mem_load` – load from the supplied address operand, yielding a value of arbitrary type.
- `simt_step.mem_store` – store the given value to the supplied address.
- `simt_step.buffer.load` / `simt_step.buffer.store` – typed buffer resource access with explicit element indices.
- `simt_step.buffer.atomic_add` – atomic add returning the previous element value.
- `simt_step.buffer.atomic_exchange` – atomic exchange returning the previous element value.
- `simt_step.buffer.atomic_compare_exchange` – compare-and-exchange on a buffer element, returning the previous value.
- `simt_step.buffer.atomic_min` / `.max` – atomic min/max updates returning the previous element value.
- `simt_step.buffer.atomic_and` / `.or` / `.xor` – atomic bitwise operations returning the previous element value.

### Extension hook
- `simt_step.custom` – plugin-defined instruction. Requires an `instr` string attribute and optional `params` dictionary; operands/results are variadic and unconstrained.

### Structured control flow
- `simt_step.switch` – structured multi-way branch. Operands are the selector followed by the initial values for each carried result. The op yields the carried values plus three bookkeeping flags `(matchSeen, fallthroughActive, switchDone)` that track fallthrough and termination state. The `case_values` dense array attribute records the integral selector values associated with each case; the final entry corresponds to the default arm. The region now contains one block per case (plus optional default) and each block terminates with `simt_step.yield`, making the control-flow structure explicit.

---

This reference is a living document; update it when new ops/attributes/types land.
