#!/bin/bash

cmake --build build -t simt-step-test-raiser
if [ $? -ne 0 ]; then
    exit
fi

files=${1:-*}

for testfile in tools/simt-step-test-raiser/tests/$files.mlir; do
    echo "----- $testfile -----"
    set -f
    if [[ files =~ "*" ]]; then
        outfile=$(mktemp -t "XXXXXX.amber")
    else
        outfile=testout.amber
    fi
    set +f
    ./build/tools/simt-step-test-raiser/simt-step-test-raiser --mlir-to-glsl-amber $testfile -o $outfile
    if [ $? -ne 0 ]; then
        exit
    fi

    ~/amber/out/Debug/amber $outfile
    if [ $? -ne 0 ]; then
        echo "Output in: $outfile"
        exit
    fi
done
