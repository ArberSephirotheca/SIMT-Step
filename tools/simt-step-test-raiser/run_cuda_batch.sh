#!/usr/bin/env bash
set -uo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

INPUT_GLOB="${1:-fuzz-tests/*.mlir}"
SUBGROUP_WIDTH="${SUBGROUP_WIDTH:-32}"
RAISER_BIN="${RAISER_BIN:-build/tools/simt-step-test-raiser/simt-step-test-raiser}"

OUT_TESTS="${OUT_TESTS:-$ROOT_DIR/cuda-tests}"
OUT_BIN="${OUT_BIN:-$ROOT_DIR/cuda-bin}"
OUT_LOGS="${OUT_LOGS:-$ROOT_DIR/cuda-logs}"

mkdir -p "$OUT_TESTS" "$OUT_BIN" "$OUT_LOGS"

REPORT="$OUT_LOGS/report.csv"
printf "test,status,stage,log,cu,bin\n" > "$REPORT"

if [[ ! -x "$RAISER_BIN" ]]; then
  echo "error: raiser binary not found: $RAISER_BIN" >&2
  echo "build with: cmake --build build --target simt-step-test-raiser" >&2
  exit 1
fi

if ! command -v nvcc >/dev/null 2>&1; then
  echo "error: nvcc not found" >&2
  exit 1
fi

run_and_log() {
  local log_file="$1"
  shift
  echo "$ $*" | tee -a "$log_file"
  "$@" 2>&1 | tee -a "$log_file"
  return ${PIPESTATUS[0]}
}

MLIR_FILES=()
while IFS= read -r _f; do
  MLIR_FILES+=("$_f")
done < <(compgen -G "$INPUT_GLOB" | sort)
if [[ ${#MLIR_FILES[@]} -eq 0 ]]; then
  echo "error: no inputs matched glob: $INPUT_GLOB" >&2
  exit 1
fi

PASS=0
FAIL=0
TOTAL=0

echo "inputs: ${#MLIR_FILES[@]}"
echo "out tests: $OUT_TESTS"
echo "out bin:   $OUT_BIN"
echo "out logs:  $OUT_LOGS"
echo

for mlir in "${MLIR_FILES[@]}"; do
  TOTAL=$((TOTAL + 1))
  name="$(basename "$mlir" .mlir)"
  yaml="${mlir%.mlir}.yaml"
  cu="$OUT_TESTS/${name}.cu"
  bin="$OUT_BIN/${name}.out"
  log="$OUT_LOGS/${name}.log"

  : > "$log"
  echo "===== [$TOTAL/${#MLIR_FILES[@]}] $name ====="

  raise_cmd=(
    "$RAISER_BIN"
    "$mlir"
    --mlir-to-cuda
    --no-wrapper
    --no-f64
    "--subgroup-width=$SUBGROUP_WIDTH"
    -o "$cu"
  )
  if [[ -f "$yaml" ]]; then
    raise_cmd+=(--buffer-init-yaml "$yaml")
  fi

  if ! run_and_log "$log" "${raise_cmd[@]}"; then
    echo "result: FAIL (raise)"
    printf "%s,FAIL,raise,%s,%s,%s\n" "$name" "$log" "$cu" "$bin" >> "$REPORT"
    FAIL=$((FAIL + 1))
    echo
    continue
  fi

  compile_cmd=(
    nvcc
    -w
    "$cu"
    -o "$bin"
  )

  if ! run_and_log "$log" "${compile_cmd[@]}"; then
    echo "result: FAIL (compile)"
    printf "%s,FAIL,compile,%s,%s,%s\n" "$name" "$log" "$cu" "$bin" >> "$REPORT"
    FAIL=$((FAIL + 1))
    echo
    continue
  fi

  if ! run_and_log "$log" "$bin"; then
    echo "result: FAIL (run)"
    printf "%s,FAIL,run,%s,%s,%s\n" "$name" "$log" "$cu" "$bin" >> "$REPORT"
    FAIL=$((FAIL + 1))
    echo
    continue
  fi

  echo "result: PASS"
  printf "%s,PASS,run,%s,%s,%s\n" "$name" "$log" "$cu" "$bin" >> "$REPORT"
  PASS=$((PASS + 1))
  echo
done

echo "TOTAL=$TOTAL PASS=$PASS FAIL=$FAIL"
echo "report: $REPORT"
echo "logs:   $OUT_LOGS"
echo "tests:  $OUT_TESTS"
echo "bin:    $OUT_BIN"
