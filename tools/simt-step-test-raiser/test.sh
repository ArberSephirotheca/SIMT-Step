#!/bin/bash

cmake --build build -t simt-step-test-raiser
if [ $? -ne 0 ]; then
    exit
fi

files=${1:-*}
lang=${2:-"glsl-amber"}

for testfile in tools/simt-step-test-raiser/tests/$files.mlir; do
    echo "----- $testfile -----"
    set -f
    outext=$(
        case $lang in
            "glsl-amber") echo "amber" ;;
            "cuda") echo "cu" ;;
            "hip") echo "hip" ;;
        esac
    )
    if [[ files =~ "*" ]]; then
        outfile=$(mktemp -t "XXXXXX.$outext")
    else
        outfile=testout.$outext
    fi
    set +f

    noext="${testfile%.*}"
    yamlflag=$( [ ! -f $noext.yaml ] || echo "--buffer-init-yaml $noext.yaml" && echo )
    ./build/tools/simt-step-test-raiser/simt-step-test-raiser $testfile -o $outfile --mlir-to-$lang $yamlflag --no-f64
    if [ $? -ne 0 ]; then
        continue
    fi

    if [ $lang == "glsl-amber" ]; then
        if [ "$3 " == "waterthrush" ]; then
            scp $outfile skagle@waterthrush.be.ucsc.edu:~/testout.amber
            cat ../pass | ssh skagle@waterthrush.be.ucsc.edu sudo -S /home/skagle/amber/out/Debug/amber -D 0 testout.amber
        else
            sudo -S /home/simonk/amber/out/Debug/amber -D 0 $outfile
        fi
    elif [ $lang == "cuda" ]; then
        nvcc -w $outfile && sudo ./a.out
    elif [ $lang == "hip" ]; then
        scp $outfile skagle@waterthrush.be.ucsc.edu:~/testout.hip
        ssh skagle@waterthrush.be.ucsc.edu hipcc -w testout.hip
        cat ../pass | ssh skagle@waterthrush.be.ucsc.edu sudo -S ./a.out
    fi
    if [ $? -ne 0 ]; then
        echo "Output in: $outfile"
        continue
    fi
done
