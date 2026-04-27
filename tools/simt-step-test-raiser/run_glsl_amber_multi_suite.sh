#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

OUT_ROOT="${OUT_ROOT:-$ROOT_DIR/amber-suite-runs}"
SUBGROUP_WIDTH="${SUBGROUP_WIDTH:-32}"

if [[ -z "${RAISER_BIN:-}" ]]; then
  if [[ -x "$ROOT_DIR/build/tools/simt-step-test-raiser/simt-step-test-raiser" ]]; then
    RAISER_BIN="$ROOT_DIR/build/tools/simt-step-test-raiser/simt-step-test-raiser"
  elif [[ -x "$ROOT_DIR/build-mac/tools/simt-step-test-raiser/simt-step-test-raiser" ]]; then
    RAISER_BIN="$ROOT_DIR/build-mac/tools/simt-step-test-raiser/simt-step-test-raiser"
  fi
fi

usage() {
  cat <<'EOF'
Usage:
  run_glsl_amber_multi_suite.sh [suite_dir ...]

Generates GLSL Amber files from MLIR suites and writes:
  - <out-root>/report.csv         (combined per-test report)
  - <out-root>/summary.csv        (per-suite + overall counts)

Environment:
  OUT_ROOT        Root output directory (default: <repo>/amber-suite-runs)
  RAISER_BIN      Path to simt-step-test-raiser (auto-detected from build/ or build-mac/)
  SUBGROUP_WIDTH  Subgroup width passed to the raiser (default: 32)
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ -z "${RAISER_BIN:-}" || ! -x "$RAISER_BIN" ]]; then
  echo "error: raiser binary not found. Set RAISER_BIN or build simt-step-test-raiser." >&2
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
printf "suite,test,status,stage,log,amber\n" > "$MASTER_REPORT"
printf "suite,total,pass,fail\n" > "$SUMMARY_REPORT"

overall_total=0
overall_pass=0
overall_fail=0

run_and_log() {
  local log_file="$1"
  shift
  echo "$ $*" | tee -a "$log_file"
  "$@" 2>&1 | tee -a "$log_file"
  return ${PIPESTATUS[0]}
}

for suite_dir in "${SUITES[@]}"; do
  if [[ ! -d "$suite_dir" ]]; then
    echo "error: suite directory not found: $suite_dir" >&2
    exit 1
  fi

  suite_name="$(basename "$suite_dir")"
  suite_root="$OUT_ROOT/$suite_name"
  suite_amber="$suite_root/amber"
  suite_logs="$suite_root/logs"
  suite_report="$suite_root/report.csv"

  mkdir -p "$suite_amber" "$suite_logs"
  printf "test,status,stage,log,amber\n" > "$suite_report"

  mlir_files=()
  while IFS= read -r _f; do
    mlir_files+=("$_f")
  done < <(compgen -G "$suite_dir/*.mlir" | sort)

  if [[ ${#mlir_files[@]} -eq 0 ]]; then
    echo "error: no .mlir files found in suite: $suite_dir" >&2
    exit 1
  fi

  echo "=== Generating Amber for suite: $suite_name (${#mlir_files[@]} files) ==="

  suite_total=0
  suite_pass=0
  suite_fail=0

  for mlir in "${mlir_files[@]}"; do
    suite_total=$((suite_total + 1))
    name="$(basename "$mlir" .mlir)"
    yaml="${mlir%.mlir}.yaml"
    amber="$suite_amber/${name}.amber"
    log="$suite_logs/${name}.log"
    : > "$log"

    cmd=(
      "$RAISER_BIN"
      "$mlir"
      --mlir-to-glsl-amber
      --no-f64
      "--subgroup-width=$SUBGROUP_WIDTH"
      -o "$amber"
    )
    if [[ -f "$yaml" ]]; then
      cmd+=(--buffer-init-yaml "$yaml")
    fi

    if run_and_log "$log" "${cmd[@]}"; then
      printf "%s,PASS,raise,%s,%s\n" "$name" "$log" "$amber" >> "$suite_report"
      suite_pass=$((suite_pass + 1))
    else
      printf "%s,FAIL,raise,%s,%s\n" "$name" "$log" "$amber" >> "$suite_report"
      suite_fail=$((suite_fail + 1))
    fi
  done

  tail -n +2 "$suite_report" \
    | awk -F, -v suite="$suite_name" 'BEGIN { OFS="," } { print suite, $1, $2, $3, $4, $5 }' \
    >> "$MASTER_REPORT"

  printf "%s,%d,%d,%d\n" "$suite_name" "$suite_total" "$suite_pass" "$suite_fail" >> "$SUMMARY_REPORT"
  overall_total=$((overall_total + suite_total))
  overall_pass=$((overall_pass + suite_pass))
  overall_fail=$((overall_fail + suite_fail))
done

printf "ALL,%d,%d,%d\n" "$overall_total" "$overall_pass" "$overall_fail" >> "$SUMMARY_REPORT"

echo
echo "Combined report: $MASTER_REPORT"
echo "Summary report:  $SUMMARY_REPORT"
echo "OVERALL TOTAL=$overall_total PASS=$overall_pass FAIL=$overall_fail"

if [[ "$overall_fail" -gt 0 ]]; then
  exit 1
fi

