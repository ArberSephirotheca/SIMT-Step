#!/bin/bash

cmake --build build
if [ $? -ne 0 ]; then
    exit
fi

files=${1:-*}

for testfile in tools/simt-step-test-raiser/tests/$files.mlir; do
    echo "----- $testfile -----"
    if [ -z $1 ]; then
        outfile=$(mktemp -t "XXXXXX.amber")
    else
        outfile=test.amber
    fi
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
