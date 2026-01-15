#!/bin/bash -v


for i in tools/simt-step-test-raiser/tests/hlsl-sources/*.hlsl; do
    fname=/home/simonk/SIMT-Step/tools/simt-step-test-raiser/tests/$(basename $i).mlir
    build/tools/simt-hlsl-import/simt-hlsl-import /home/simonk/SIMT-Step/tools/simt-step-test-raiser/tests/hlsl-sources/$(basename $i) > $fname
    if [[ $? -ne 0 ]]; then
        rm $fname
    fi
done