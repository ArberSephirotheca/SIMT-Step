module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.remsi %arg3, %c4_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %3 = arith.addi %arg0, %c2_i32 : i32
    %4 = "simt_step.switch"(%2, %3) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %21 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %22 = arith.addi %21, %c1_i32_10 : i32
        %23 = arith.cmpi slt, %arg6, %22 : i32
        "simt_step.condition"(%23, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_13 : i32
          %25 = arith.cmpi slt, %arg8, %24 : i32
          "simt_step.condition"(%25, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_12 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %24 = arith.muli %arg8, %c4_i32_13 : i32
          %25 = arith.addi %c16_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_14 = arith.constant 1 : i32
          %27 = arith.addi %arg8, %c1_i32_14 : i32
          "simt_step.yield"(%23, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_11 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32_11 : i32
        "simt_step.yield"(%21#0, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c4_i32_4 = arith.constant 4 : i32
      %11 = arith.remsi %arg3, %c4_i32_4 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg0, %c1_i32 : i32
      %13 = "simt_step.switch"(%11, %12) ({
      ^bb0(%arg5: i32):
        %c3_i32 = arith.constant 3 : i32
        %21 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %22 = "simt_step.switch"(%21, %c1_i32_9) ({
        ^bb0(%arg6: i32):
          %true_15 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %36 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %true_16 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %39 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %true_17 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %42 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
        ^bb3(%43: i32):  // no predecessors
          %true_18 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %45 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %45, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c3_i32_10 = arith.constant 3 : i32
        %24 = arith.remsi %arg3, %c3_i32_10 : i32
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%24, %26) ({
        ^bb0(%arg6: i32):
          %true_15 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %36 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %true_16 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %39 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %true_17 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %42 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %29 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %true_12 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %32 = arith.addi %c160_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb3(%33: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %35 = arith.remsi %arg3, %c4_i32_15 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %36 = arith.addi %35, %c1_i32_16 : i32
          %37 = arith.cmpi slt, %arg7, %36 : i32
          "simt_step.condition"(%37, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_15 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %36 = arith.muli %arg7, %c4_i32_16 : i32
          %37 = arith.addi %c176_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_17 = arith.constant 1 : i32
          %39 = arith.addi %arg7, %c1_i32_17 : i32
          "simt_step.continue"(%35, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %15 = arith.addi %c192_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %21 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %22 = arith.addi %21, %c1_i32_10 : i32
        %23 = arith.cmpi slt, %arg6, %22 : i32
        "simt_step.condition"(%23, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_13 : i32
          %25 = arith.cmpi slt, %arg8, %24 : i32
          "simt_step.condition"(%25, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_12 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %24 = arith.muli %arg8, %c4_i32_13 : i32
          %25 = arith.addi %c208_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_14 = arith.constant 1 : i32
          %27 = arith.addi %arg8, %c1_i32_14 : i32
          "simt_step.yield"(%23, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_11 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32_11 : i32
        "simt_step.yield"(%21#0, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%18: i32):  // no predecessors
      %c4_i32_8 = arith.constant 4 : i32
      %19 = arith.remsi %arg3, %c4_i32_8 : i32
      %20 = "simt_step.switch"(%19, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %22 = "simt_step.if"(%21) ({
          %true_14 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %34 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %true_14 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %34 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %24 = arith.remsi %arg3, %c3_i32 : i32
        %c3_i32_10 = arith.constant 3 : i32
        %25 = "simt_step.switch"(%24, %c3_i32_10) ({
        ^bb0(%arg6: i32):
          %true_14 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %34 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %true_15 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %37 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %true_16 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %40 = arith.addi %c288_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %true_17 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c304_i32 = arith.constant 304 : i32
          %43 = arith.addi %c304_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %28 = "simt_step.if"(%27) ({
          %true_14 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c320_i32 = arith.constant 320 : i32
          %34 = arith.addi %c320_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %true_14 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c336_i32 = arith.constant 336 : i32
          %34 = arith.addi %c336_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb3(%29: i32):  // no predecessors
        %c4_i32_12 = arith.constant 4 : i32
        %30 = arith.remsi %arg3, %c4_i32_12 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %31 = arith.addi %arg0, %c0_i32_13 : i32
        %32 = "simt_step.switch"(%30, %31) ({
        ^bb0(%arg6: i32):
          %true_14 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c352_i32 = arith.constant 352 : i32
          %34 = arith.addi %c352_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %true_15 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c368_i32 = arith.constant 368 : i32
          %37 = arith.addi %c368_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %true_16 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          %c384_i32 = arith.constant 384 : i32
          %40 = arith.addi %c384_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %true_17 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c400_i32 = arith.constant 400 : i32
          %43 = arith.addi %c400_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_0 = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    %c416_i32 = arith.constant 416 : i32
    %6 = arith.addi %c416_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %8 = arith.select %7, %0, %4 : i32
    return
  }
  func.func @main(%arg0: !simt_step.resource<Global, i32>, %arg1: !simt_step.resource<Global, i32>) attributes {simt.num_threads = [4, 1, 1], simt.subgroup_width = 8 : i64} {
    %0 = "simt_step.dispatch_thread_id"() : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %0 : i32
    %2 = "simt_step.buffer.load"(%arg1, %1) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32 = arith.constant 4 : i32
    %3 = arith.addi %c4_i32, %0 : i32
    %4 = "simt_step.buffer.load"(%arg1, %3) : (!simt_step.resource<Global, i32>, i32) -> i32
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %20 = arith.addi %0, %c3_i32 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %41 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %26 = arith.addi %c432_i32, %0 : i32
        %true_6 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c3_i32_7 = arith.constant 3 : i32
        %true_8 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %29 = arith.addi %c448_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c3_i32_7) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_16 : i32
          %42 = arith.addi %41, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %43 = arith.addi %c20_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_17 : i32
          "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %41 = arith.addi %arg3, %arg4 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %42 = arith.addi %arg4, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_18 : i32
          %44 = arith.addi %c464_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_19 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %33 = arith.addi %c480_i32, %0 : i32
        %true_13 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%35: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %36 = arith.addi %c40_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %true_16 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %41 = arith.addi %c496_i32, %0 : i32
          %true_17 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_18 : i32
          %true_19 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %45 = arith.addi %c512_i32, %0 : i32
          %true_20 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          %c3_i32_21 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %39 = arith.addi %c528_i32, %0 : i32
        %true_15 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c544_i32 = arith.constant 544 : i32
    %9 = arith.addi %c544_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c44_i32 = arith.constant 44 : i32
    %11 = arith.addi %c44_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %13 = arith.addi %0, %c1_i32 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      %true_5 = arith.constant true
      %c560_i32 = arith.constant 560 : i32
      %20 = arith.addi %c560_i32, %0 : i32
      %true_6 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_13 : i32
        %29 = arith.addi %28, %0 : i32
        %c48_i32 = arith.constant 48 : i32
        %30 = arith.addi %c48_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_14 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c68_i32 = arith.constant 68 : i32
        %28 = arith.addi %c68_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_13 : i32
        %31 = "simt_step.if"(%30) ({
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) : (i32) -> ()
        }, {
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        %c576_i32 = arith.constant 576 : i32
        %32 = arith.addi %c576_i32, %0 : i32
        %true_14 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %34 = arith.addi %arg3, %31 : i32
        %c1_i32_15 = arith.constant 1 : i32
        %35 = arith.addi %arg4, %c1_i32_15 : i32
        %true_16 = arith.constant true
        %c592_i32 = arith.constant 592 : i32
        %c4_i32_17 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_17 : i32
        %37 = arith.addi %c592_i32, %36 : i32
        %38 = arith.addi %37, %0 : i32
        %true_18 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34, %35) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_13 : i32
        %29 = arith.addi %28, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %30 = arith.addi %c72_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_14 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %arg4 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32_13 : i32
        %true_14 = arith.constant true
        %c608_i32 = arith.constant 608 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_15 : i32
        %31 = arith.addi %c608_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_16 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      %c624_i32 = arith.constant 624 : i32
      %26 = arith.addi %c624_i32, %0 : i32
      %true_12 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c640_i32 = arith.constant 640 : i32
    %15 = arith.addi %c640_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_5 : i32
      %19 = arith.addi %18, %0 : i32
      %c92_i32 = arith.constant 92 : i32
      %20 = arith.addi %c92_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32_5 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32_5 : i32
      %true_6 = arith.constant true
      %c656_i32 = arith.constant 656 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_7 : i32
      %21 = arith.addi %c656_i32, %20 : i32
      %22 = arith.addi %21, %0 : i32
      %true_8 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

