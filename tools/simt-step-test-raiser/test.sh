#!/bin/bash

cmake --build build -t simt-step-test-raiser
if [ $? -ne 0 ]; then
    exit
fi

files=${1:-*}
lang=${2:-"glsl"}

for testfile in tools/simt-step-test-raiser/tests/$files.mlir; do
    echo "----- $testfile -----"
    set -f
    if [ $lang == "glsl" ]; then
        if [[ files =~ "*" ]]; then
            outfile=$(mktemp -t "XXXXXX.amber")
        else
            outfile=testout.amber
        fi
    else
        if [[ files =~ "*" ]]; then
            outfile=$(mktemp -t "XXXXXX.cu")
        else
            outfile=testout.cu
        fi
    fi
    set +f

    noext="${testfile%.*}"
    if [ $lang == "glsl" ]; then
        if [ ! -f $noext.yaml ]; then
            ./build/tools/simt-step-test-raiser/simt-step-test-raiser --mlir-to-glsl-amber $testfile -o $outfile
        else
            ./build/tools/simt-step-test-raiser/simt-step-test-raiser --mlir-to-glsl-amber $testfile -o $outfile --buffer-init-yaml $noext.yaml
        fi 
    else
        if [ ! -f $noext.yaml ]; then
            ./build/tools/simt-step-test-raiser/simt-step-test-raiser --mlir-to-cuda $testfile -o $outfile
        else
            ./build/tools/simt-step-test-raiser/simt-step-test-raiser --mlir-to-cuda $testfile -o $outfile --buffer-init-yaml $noext.yaml
        fi 
    fi
    if [ $? -ne 0 ]; then
        continue
    fi

    if [ $lang == "glsl" ]; then
        ~/amber/out/Debug/amber $outfile
    else
        nvcc -w $outfile && ./a.out
    fi
    if [ $? -ne 0 ]; then
        echo "Output in: $outfile"
        continue
    fi
done
