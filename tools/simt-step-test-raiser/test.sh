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
    targetflag=$(
        case $lang in
            "glsl")
                echo "--mlir-to-glsl-amber" ;;
            "cuda")
                echo "--mlir-to-cuda" ;;
        esac
    )
    yamlflag=$( [ ! -f $noext.yaml ] || echo "--buffer-init-yaml $noext.yaml" || echo )
    ./build/tools/simt-step-test-raiser/simt-step-test-raiser $testfile -o $outfile $targetflag $yamlflag
    if [ $? -ne 0 ]; then
        continue
    fi

    if [ $lang == "glsl" ]; then
        scp $outfile skagle@waterthrush.be.ucsc.edu:~/testout.amber
        ssh skagle@waterthrush.be.ucsc.edu -tt sudo /home/skagle/amber/out/Debug/amber -D 0 testout.amber
    else
        nvcc -w $outfile && ./a.out
    fi
    if [ $? -ne 0 ]; then
        echo "Output in: $outfile"
        exit
    fi
done
