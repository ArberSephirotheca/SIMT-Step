#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

RUN_BATCH="${RUN_BATCH:-$ROOT_DIR/tools/simt-step-test-raiser/run_msl_batch.sh}"
OUT_ROOT="${OUT_ROOT:-$ROOT_DIR/msl-suite-runs}"

if [[ -z "${RAISER_BIN:-}" ]]; then
  if [[ -x "$ROOT_DIR/build/tools/simt-step-test-raiser/simt-step-test-raiser" ]]; then
    RAISER_BIN="$ROOT_DIR/build/tools/simt-step-test-raiser/simt-step-test-raiser"
  elif [[ -x "$ROOT_DIR/build-mac/tools/simt-step-test-raiser/simt-step-test-raiser" ]]; then
    RAISER_BIN="$ROOT_DIR/build-mac/tools/simt-step-test-raiser/simt-step-test-raiser"
  fi
fi
if [[ -n "${RAISER_BIN:-}" ]]; then
  export RAISER_BIN
fi

usage() {
  cat <<'EOF'
Usage:
  run_msl_multi_suite.sh [suite_dir ...]

Runs run_msl_batch.sh for each suite and writes:
  - <out-root>/report.csv         (combined per-test report)
  - <out-root>/summary.csv        (per-suite + overall counts)

Environment:
  OUT_ROOT        Root output directory (default: <repo>/msl-suite-runs)
  RUN_BATCH       Path to run_msl_batch.sh
  SUBGROUP_WIDTH  Passed through to run_msl_batch.sh
  RAISER_BIN      Passed through to run_msl_batch.sh (auto-detected from build/ or build-mac/)
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ ! -x "$RUN_BATCH" ]]; then
  echo "error: batch runner not found or not executable: $RUN_BATCH" >&2
  exit 1
fi

SUITES=()
if [[ "$#" -gt 0 ]]; then
  SUITES=("$@")
else
  SUITES=(
    "$ROOT_DIR/fuzz-tests_uniform"
    "$ROOT_DIR/fuzz-tests-switch-no-subgroup"
    "$ROOT_DIR/fuzz-tests-switch-subgroup"
  )
fi

mkdir -p "$OUT_ROOT"
MASTER_REPORT="$OUT_ROOT/report.csv"
SUMMARY_REPORT="$OUT_ROOT/summary.csv"

printf "suite,test,status,stage,log,mm,bin\n" > "$MASTER_REPORT"
printf "suite,total,pass,fail\n" > "$SUMMARY_REPORT"

overall_total=0
overall_pass=0
overall_fail=0

for suite_dir in "${SUITES[@]}"; do
  if [[ ! -d "$suite_dir" ]]; then
    echo "error: suite directory not found: $suite_dir" >&2
    exit 1
  fi

  suite_name="$(basename "$suite_dir")"
  suite_root="$OUT_ROOT/$suite_name"
  suite_tests="$suite_root/tests"
  suite_bin="$suite_root/bin"
  suite_logs="$suite_root/logs"

  mkdir -p "$suite_tests" "$suite_bin" "$suite_logs"

  echo "=== Running suite: $suite_name ==="
  OUT_TESTS="$suite_tests" \
  OUT_BIN="$suite_bin" \
  OUT_LOGS="$suite_logs" \
    "$RUN_BATCH" "$suite_dir/*.mlir"

  suite_report="$suite_logs/report.csv"
  if [[ ! -f "$suite_report" ]]; then
    echo "error: suite report missing: $suite_report" >&2
    exit 1
  fi

  total=$(( $(wc -l < "$suite_report") - 1 ))
  pass=$(awk -F, 'NR > 1 && $2 == "PASS" { c++ } END { print c + 0 }' "$suite_report")
  fail=$(awk -F, 'NR > 1 && $2 == "FAIL" { c++ } END { print c + 0 }' "$suite_report")

  tail -n +2 "$suite_report" \
    | awk -F, -v suite="$suite_name" 'BEGIN { OFS="," } { print suite, $1, $2, $3, $4, $5, $6 }' \
    >> "$MASTER_REPORT"

  printf "%s,%d,%d,%d\n" "$suite_name" "$total" "$pass" "$fail" >> "$SUMMARY_REPORT"

  overall_total=$((overall_total + total))
  overall_pass=$((overall_pass + pass))
  overall_fail=$((overall_fail + fail))
done

printf "ALL,%d,%d,%d\n" "$overall_total" "$overall_pass" "$overall_fail" >> "$SUMMARY_REPORT"

echo
echo "Combined report: $MASTER_REPORT"
echo "Summary report:  $SUMMARY_REPORT"
echo "OVERALL TOTAL=$overall_total PASS=$overall_pass FAIL=$overall_fail"

if [[ "$overall_fail" -gt 0 ]]; then
  exit 1
fi
