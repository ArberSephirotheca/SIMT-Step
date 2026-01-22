#!/bin/bash
set -u

cmake --build build -t simt-step-test-raiser
if [ $? -ne 0 ]; then
    exit
fi

files=$1

for testfile in $1; do
    echo "----- $testfile -----"
    set -f
    if [[ $1 =~ "*" ]]; then
        outfile=$(mktemp -t "XXXXXX.amber")
    else
        outfile=testout.amber
    fi
    set +f
    noext="${testfile%.*}"
    echo $noext
    if [ ! -f $noext.yaml ]; then
        ./build/tools/simt-step-test-raiser/simt-step-test-raiser --mlir-to-glsl-amber $testfile -o $outfile
    else
        ./build/tools/simt-step-test-raiser/simt-step-test-raiser --mlir-to-glsl-amber $testfile -o $outfile --buffer-init-yaml $noext.yaml
    fi 
    errcode=$?
    if [ $errcode -ne 0 ]; then
        echo "There was an error: " $errcode
        exit $errcode
    fi

    ~/amber/out/Debug/amber $outfile
    errcode=$?
    if [ $errcode -ne 0 ]; then
        echo "Output in: $outfile"
        exit $errcode
    fi
done

echo "All tests done"