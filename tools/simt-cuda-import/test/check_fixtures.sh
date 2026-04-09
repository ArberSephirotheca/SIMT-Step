#!/usr/bin/env bash

set -euo pipefail

TEST_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
ROOT_DIR=$(cd "$TEST_DIR/../../.." && pwd)
BIN=${1:-"$ROOT_DIR/build/tools/simt-cuda-import/simt-cuda-import"}

if [ ! -x "$BIN" ]; then
  echo "check_fixtures.sh: missing executable importer at '$BIN'" >&2
  exit 1
fi

TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "[check] positive fixture matches checked MLIR golden"
"$BIN" "$TEST_DIR/real_source_cuda_wave_any.cu" | \
  diff -u "$TEST_DIR/real_source_cuda_wave_any.mlir" -

check_rejection() {
  local input=$1
  local expected_stderr=$2
  local stdout_file="$TMP_DIR/$(basename "$input").stdout"
  local stderr_file="$TMP_DIR/$(basename "$input").stderr"

  if "$BIN" "$input" >"$stdout_file" 2>"$stderr_file"; then
    echo "check_fixtures.sh: expected failure for '$input'" >&2
    return 1
  fi

  if [ -s "$stdout_file" ]; then
    echo "check_fixtures.sh: unexpected stdout for '$input'" >&2
    cat "$stdout_file" >&2
    return 1
  fi

  diff -u "$expected_stderr" "$stderr_file"
}

echo "[check] masked collective stays rejected"
check_rejection \
  "$TEST_DIR/unsupported_masked_wave_any.cu" \
  "$TEST_DIR/unsupported_masked_wave_any.stderr"

echo "[check] nested collective stays rejected"
check_rejection \
  "$TEST_DIR/unsupported_nested_wave_any.cu" \
  "$TEST_DIR/unsupported_nested_wave_any.stderr"

echo "[check] all CUDA importer fixtures passed"
