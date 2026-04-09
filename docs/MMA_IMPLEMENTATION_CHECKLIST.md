# SIMT-Step MMA Implementation Checklist

This document is a handoff plan for adding subgroup matrix multiply-accumulate
(MMA) support to the SIMT-Step dialect and interpreter.

The goal is not to land every backend in one patch. The recommended order is:

1. Add a minimal first-class MMA op that the dialect and interpreter can parse,
   verify, and execute.
2. Add fragment-typed MMA if the first op shape is too weak for the intended
   semantics or backend mapping.
3. Add importer, fuzzer, and raiser support after the dialect + interpreter
   semantics are stable.

## Current Constraints

The checklist below is shaped by the current implementation:

- `include/simt-step/Dialect/SimtStep/SimtStep.td` is the main source of truth
  for SIMT-Step ops, attrs, traits, and types.
- `lib/Dialect/SimtStep/SimtStepOps.cpp` contains the custom verifier, builder,
  and parse/print logic for nontrivial ops.
- `lib/Dialect/SimtStep/SimtStepDialect.cpp` only matters when adding new
  dialect types.
- `include/simt-step/semantics/SimpleSemantics.h` and
  `lib/semantics/SimpleSemantics.cpp` are the direct semantic dispatch path for
  the interpreter.
- `include/simt-step/semantics/CPSInterpreter.h` currently recognizes wave
  collectives through the `SimtWave` trait and has an explicit completion path
  for them.
- `include/simt-step/semantics/CPSInterpreter.h` currently only computes wave
  collective results for `simt_step.wave_count_bits`.
- `include/simt-step/semantics/ExecutionState.h` stores one `ValueT` operand and
  one `ValueT` result per lane for wave collectives. That is enough for
  `wave_count_bits`, but not obviously enough for a multi-operand MMA op.
- `include/simt-step/semantics/SemValue.h` only represents scalar values and
  resources:
  `None`, `Bool`, `Int32`, `Int64`, `Float32`, `Resource`.

Because of that, the real implementation boundary is:

- A one-off dialect-only MMA op is easy.
- A first-class interpreted MMA op is not just a `SimtStep.td` change. It
  almost certainly requires collective-path work in the interpreter.
- A fragment-typed MMA op requires a new runtime value representation.

## Recommended Rollout

### Phase 0: Freeze the Minimal Semantics

Do this before editing code.

- Pick one concrete subgroup MMA form to support first.
- Keep the first form narrow. Do not start with a generic family of shapes and
  layouts.
- A good initial target is one shape such as `m16n16k16` with one accumulator
  element type.
- Decide whether the first op is:
  - scalar/aggregate-operand MMA without new fragment types, or
  - fragment-typed MMA from day one.
- Decide whether the interpreter should treat MMA as:
  - a true subgroup collective, or
  - a temporary scalar placeholder used only to unblock IR plumbing.

Recommended choice:

- Make MMA a true subgroup collective.
- Start without new fragment types if possible.
- Keep the first op shape fixed by attributes or by verifier rules rather than
  trying to model all vendor matrix forms at once.

The main design question to resolve up front is how operands are represented in
the interpreter:

- If the op has multiple SSA operands such as `a`, `b`, and `acc`, then the
  current wave-collective path in `CPSInterpreter.h` is too narrow and must be
  extended.
- If the op uses one aggregate operand, then the collective path can stay
  simpler, but `SemValue.h` may need to grow earlier.

### Phase 1: Minimal First-Class MMA Op

Goal:

- Add a real `simt_step` MMA op that the parser, verifier, and interpreter
  understand.
- Do not add importer or backend lowering yet.
- Do not add fragment types yet unless the op shape becomes impossible to
  express otherwise.

Recommended IR target:

- Add a subgroup-level op such as `simt_step.wave_mma`.
- Mark it as a wave collective with the same trait family used by existing wave
  ops.
- Keep the first result shape simple. One result is much easier than multiple
  returned values.

Files to update in this phase:

- `include/simt-step/Dialect/SimtStep/SimtStep.td`
  - Define the new op.
  - Add attrs needed for the fixed shape/layout if those are encoded in the IR.
  - Reuse existing traits where possible.
- `lib/Dialect/SimtStep/SimtStepOps.cpp`
  - Add verifier logic for operand/result type compatibility.
  - Add custom builders or assembly syntax only if ODS is not enough.
- `docs/SimtStepDialect.md`
  - Document the new op after it lands.
- `include/simt-step/semantics/SimpleSemantics.h`
  - Add the semantic entry point for MMA.
- `lib/semantics/SimpleSemantics.cpp`
  - Dispatch the new op from `evalOperation`.
  - Evaluate its operands.
  - Produce the correct suspend/resume behavior for collective execution.
- `include/simt-step/semantics/CPSInterpreter.h`
  - Teach the collective path how to recognize and complete the MMA op.

Files that are likely needed in this phase, even for the minimal op:

- `include/simt-step/semantics/ExecutionState.h`
  - Needed if the op has more than one logical operand per lane or if the
    result payload is richer than one scalar.
- `include/simt-step/semantics/Effects.h`
  - Needed if the existing `CollectiveEffect` fields are too weak to identify
    the MMA instance or its mode cleanly.

Why these "likely" files matter:

- The current wave-collective path in `CPSInterpreter.h` assumes exactly one
  operand for a wave op.
- The current `CollectiveSyncPoint` stores a single `operands[lane]` value and
  a single `results[lane]` value.
- `computeWaveCollectiveResults(...)` currently hard-codes
  `simt_step.wave_count_bits`.

That means a true interpreted MMA op will usually require one of these changes:

- extend `CollectiveSyncPoint` to store multiple operands per lane,
- add a dedicated MMA sync payload path,
- or encode the MMA operand bundle as one runtime value kind.

Acceptance criteria for Phase 1:

- A hand-written `.mlir` test can parse and verify the new MMA op.
- The interpreter can run at least one small uniform MMA example.
- The interpreter rejects or clearly reports unsupported type/layout forms.
- The implementation does not depend on importer, fuzzer, or raiser changes.

What not to do in Phase 1:

- Do not add all vendor matrix shapes.
- Do not try to solve async load in the same patch.
- Do not wire every backend before the interpreter semantics are stable.

### Phase 2: Fragment-Typed MMA

Enter this phase only if Phase 1 shows that scalar or aggregate operands are too
weak, or if backend lowering clearly wants first-class fragment objects.

Goal:

- Represent matrix fragments explicitly in the dialect and runtime value model.

Typical motivation:

- the op needs fragment roles such as `matrix_a`, `matrix_b`, `accumulator`,
- the verifier needs structural checks that ordinary scalar types cannot express,
- or backend lowering needs explicit fragment/layout information in the IR.

Files to update in this phase:

- `include/simt-step/Dialect/SimtStep/SimtStep.td`
  - Add the fragment type or descriptor type.
  - Update the MMA op to use it.
- `lib/Dialect/SimtStep/SimtStepDialect.cpp`
  - Add type verification rules.
- `include/simt-step/semantics/SemValue.h`
  - Add a runtime representation for fragment values.
- `include/simt-step/semantics/ExecutionState.h`
  - Update collective state if fragment payloads require richer storage.
- `include/simt-step/semantics/SimpleSemantics.h`
  - Update any helper declarations for fragment-aware execution.
- `lib/semantics/SimpleSemantics.cpp`
  - Add evaluation logic for fragment values.
- `include/simt-step/semantics/CPSInterpreter.h`
  - Update collective completion to move fragment values through suspend/resume.

Acceptance criteria for Phase 2:

- The dialect can represent fragment-typed MMA explicitly.
- The verifier catches role/layout/type mismatches.
- The interpreter can carry fragment values through at least one test.
- Existing scalar ops remain unaffected.

### Phase 3: End-to-End Toolchain Support

Do this only after the dialect and interpreter semantics stop moving.

Goal:

- Import MMA into SIMT-Step, generate it in tests, and lower it back out to
  supported targets.

Files to update in this phase:

- `tools/simt-hlsl-import/lib/Lowering.cpp`
  - Only if HLSL import should emit MMA.
- `tools/simt-cuda-import/lib/Lowering.cpp`
  - Only if CUDA import should emit MMA.
- `tools/simt-step-fuzz/SimtProgramGenerator.cpp`
  - Generate the new op deliberately rather than relying on ad hoc custom ops.
- `tools/simt-step-raise/CudaEmitter.cpp`
  - Lower the op to CUDA-side MMA intrinsics.
- `tools/simt-step-raise/MslEmitter.cpp`
  - Lower the op only if the target feature exists and the semantics are clear.
- `tools/simt-step-raise/HlslEmitter.cpp`
  - Lower the op only if the target feature exists and the semantics are clear.
- `tools/simt-step-test-raiser/src/RaiseCUDA_HIP.cpp`
  - Update the CUDA/HIP test raiser path if MMA should be exercised there.
- `tools/simt-step-test-raiser/src/RaiseGLSL.cpp`
  - Only if there is a meaningful GLSL/Vulkan subgroup matrix mapping.
- `tools/simt-step-test-raiser/src/RaiseMSL.cpp`
  - Only if there is a meaningful MSL simdgroup matrix mapping.

Acceptance criteria for Phase 3:

- Imported source can produce the MMA op.
- Fuzz or directed tests can generate the MMA op intentionally.
- At least one backend raiser can lower the op successfully.
- Unsupported raisers fail explicitly instead of silently dropping the op.

## File Responsibilities

This is the quick lookup table for the agent implementing the work.

- `include/simt-step/Dialect/SimtStep/SimtStep.td`
  - Source of truth for the op, attrs, traits, and any new dialect types.
- `lib/Dialect/SimtStep/SimtStepOps.cpp`
  - Verifier, builder, and custom parse/print logic.
- `lib/Dialect/SimtStep/SimtStepDialect.cpp`
  - Type registration and type verification for new fragment-like types.
- `docs/SimtStepDialect.md`
  - User-facing dialect reference once the op exists.
- `include/simt-step/semantics/SimpleSemantics.h`
  - Semantic API surface for the new op.
- `lib/semantics/SimpleSemantics.cpp`
  - Main dispatch and per-op execution logic.
- `include/simt-step/semantics/CPSInterpreter.h`
  - Collective rendezvous, operand capture, result completion, and resume.
- `include/simt-step/semantics/Effects.h`
  - Effect payload shape for collectives if the current identifier-only form is
    too weak.
- `include/simt-step/semantics/ExecutionState.h`
  - Stored collective operands, results, and continuations.
- `include/simt-step/semantics/SemValue.h`
  - Runtime value-domain expansion for fragments, tuples, or descriptors.

## Recommended First Patch

The first patch should be intentionally small.

- Add one `simt_step.wave_mma` op.
- Keep one fixed shape.
- Keep one fixed accumulator/result type.
- Make the verifier strict.
- Make the interpreter support only that one form.
- Add one or two hand-written interpreter tests.

Do not start with:

- multiple shapes,
- multiple fragment roles encoded as separate new ops,
- importer support,
- fuzzer support,
- or backend lowering.

## Practical Decision Rule

Use this rule when deciding whether a file is actually required.

- If the new op is just an IR placeholder:
  - `SimtStep.td`, `SimtStepOps.cpp`, and docs are enough.
- If the interpreter must execute the op as a real collective:
  - `SimpleSemantics.h`, `SimpleSemantics.cpp`, and `CPSInterpreter.h` are
    mandatory.
- If the op needs more than one scalar operand/result in the collective state:
  - `ExecutionState.h` is mandatory.
- If the op needs a non-scalar runtime object:
  - `SemValue.h` is mandatory.
- If the collective effect needs richer per-op protocol data:
  - `Effects.h` is mandatory.

## Suggested Deliverables

Deliver the work in three separate changes if possible:

1. Dialect + interpreter MVP for one MMA form.
2. Fragment/value-model expansion if Phase 1 proved it necessary.
3. Importer/fuzzer/raiser support after the semantics settle.

That split keeps the semantics discussion isolated from backend-specific
lowering work.
