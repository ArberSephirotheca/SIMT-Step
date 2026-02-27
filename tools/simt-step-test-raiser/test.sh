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
    ./build/tools/simt-step-test-raiser/simt-step-test-raiser $testfile --mlir-to-$lang $yamlflag --no-f64 -o $outfile
    # ./build/tools/simt-step-raise/simt-step-raise $testfile --target $lang > $outfile
    if [ $? -ne 0 ]; then
        continue
    fi

    if [ "$3" != "none" ]; then
        if [ $lang == "glsl-amber" ]; then
            if [ "$3" == "waterthrush" ]; then
                scp $outfile skagle@waterthrush.be.ucsc.edu:~/testout.amber
                cat ../pass | ssh skagle@waterthrush.be.ucsc.edu sudo -S /home/skagle/amber/out/Debug/amber -D 0 testout.amber
            else
                sudo -S /home/simonk/amber/out/Debug/amber -D $3 $outfile
            fi
        elif [ $lang == "cuda" ]; then
            nvcc -w $outfile && sudo ./a.out
        elif [ $lang == "hip" ]; then
            scp $outfile skagle@waterthrush.be.ucsc.edu:~/testout.hip
            ssh skagle@waterthrush.be.ucsc.edu hipcc -w testout.hip
            cat ../pass | ssh skagle@waterthrush.be.ucsc.edu sudo -S ./a.out
        elif [ $lang == "msl" ]; then
            if ! command -v xcrun >/dev/null 2>&1; then
                echo "xcrun not found; cannot build/run generated MSL harness"
                continue
            fi
            xcrun clang++ -std=c++17 -x objective-c++ $outfile -framework Metal -framework Foundation -o /tmp/simt_step_msl_test
            if [ $? -eq 0 ]; then
                /tmp/simt_step_msl_test
            fi
        fi
        if [ $? -ne 0 ]; then
            echo "Output in: $outfile"
            continue
        fi
    fi
done
