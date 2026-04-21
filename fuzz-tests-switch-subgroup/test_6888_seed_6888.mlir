module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32_4 = arith.constant 1 : i32
      %10 = arith.addi %9, %c1_i32_4 : i32
      %11 = arith.cmpi slt, %arg5, %10 : i32
      "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_4 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.muli %arg5, %c4_i32 : i32
      %11 = arith.addi %c16_i32, %10 : i32
      %12 = arith.addi %11, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32_5 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32_5 : i32
      "simt_step.break"(%9, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %c3_i32 = arith.constant 3 : i32
    %5 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %6 = "simt_step.switch"(%5, %c1_i32) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %10 = "simt_step.switch"(%9, %c0_i32_4) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %25 = "simt_step.if"(%24) ({
          %true_13 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %37 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %true_13 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %37 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c3_i32_10 = arith.constant 3 : i32
        %27 = arith.remsi %arg3, %c3_i32_10 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %28 = arith.addi %arg0, %c0_i32_11 : i32
        %29 = "simt_step.switch"(%27, %28) ({
        ^bb0(%arg6: i32):
          %true_13 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %37 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_14 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %40 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %true_15 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %43 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %31 = arith.remsi %arg3, %c2_i32 : i32
        %32 = "simt_step.switch"(%31, %arg0) ({
        ^bb0(%arg6: i32):
          %true_13 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %37 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_14 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %40 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %true_15 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %43 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb3(%33: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %35 = "simt_step.if"(%34) ({
          %true_13 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %37 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %true_13 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %37 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c3_i32_5 = arith.constant 3 : i32
      %12 = arith.remsi %arg3, %c3_i32_5 : i32
      %13 = simt_step.subgroup_id
      %14 = arith.index_cast %13 : index to i32
      %15 = "simt_step.switch"(%12, %14) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %25 = "simt_step.if"(%24) ({
          %true_14 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %31 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %true_14 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %31 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32_15 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_14 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %31 = arith.muli %arg7, %c4_i32_15 : i32
          %32 = arith.addi %c224_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_16 = arith.constant 1 : i32
          %34 = arith.addi %arg7, %c1_i32_16 : i32
          "simt_step.yield"(%30, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32_15 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_14 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %31 = arith.muli %arg7, %c4_i32_15 : i32
          %32 = arith.addi %c240_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_16 = arith.constant 1 : i32
          %34 = arith.addi %arg7, %c1_i32_16 : i32
          "simt_step.yield"(%30, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %17 = arith.addi %c256_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_12 : i32
          %27 = arith.cmpi slt, %arg6, %26 : i32
          "simt_step.condition"(%27, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_12 : i32
          %27 = arith.addi %c272_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_13 = arith.constant 1 : i32
          %29 = arith.addi %arg6, %c1_i32_13 : i32
          "simt_step.continue"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) : (i32) -> ()
      }, {
        %c3_i32_9 = arith.constant 3 : i32
        %24 = arith.remsi %arg3, %c3_i32_9 : i32
        %c2_i32 = arith.constant 2 : i32
        %25 = "simt_step.switch"(%24, %c2_i32) ({
        ^bb0(%arg5: i32):
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %27 = arith.addi %c288_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_11 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c304_i32 = arith.constant 304 : i32
          %30 = arith.addi %c304_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_12 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c320_i32 = arith.constant 320 : i32
          %33 = arith.addi %c320_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %true_8 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %23 = arith.addi %c336_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %8 = arith.select %7, %4, %6 : i32
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg3: i32):
        %42 = simt_step.subgroup_id
        %43 = arith.index_cast %42 : index to i32
        "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_18 : i32
          %54 = arith.addi %53, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %55 = arith.addi %c16_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_19 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_19 : i32
          %56 = arith.addi %c352_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_20 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %47:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_18 : i32
          %54 = arith.addi %53, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %55 = arith.addi %c36_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_19 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_19 : i32
          %56 = arith.addi %c368_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_20 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%47#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%48: i32):  // no predecessors
        %49 = simt_step.lane_id
        %50 = arith.index_cast %49 : index to i32
        %true_16 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %51 = arith.addi %c384_i32, %0 : i32
        %true_17 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %20 = arith.addi %c400_i32, %0 : i32
      %true_4 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %23 = arith.addi %c56_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %25 = arith.addi %0, %c4_i32_5 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_22 : i32
          %58 = arith.addi %57, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %59 = arith.addi %c60_i32, %58 : i32
          %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %61 = arith.cmpi ne, %60, %c0_i32_23 : i32
          "simt_step.condition"(%61, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %57 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %58 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_23 : i32
          %60 = arith.addi %c416_i32, %59 : i32
          %61 = arith.addi %60, %0 : i32
          %true_24 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%57, %58) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %43 = arith.addi %c432_i32, %0 : i32
        %true_15 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %46:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_22 : i32
          %58 = arith.addi %57, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %59 = arith.addi %c80_i32, %58 : i32
          %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %61 = arith.cmpi ne, %60, %c0_i32_23 : i32
          "simt_step.condition"(%61, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %57 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %58 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_23 : i32
          %60 = arith.addi %c448_i32, %59 : i32
          %61 = arith.addi %60, %0 : i32
          %true_24 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57, %58) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %47 = arith.addi %c464_i32, %0 : i32
        %true_19 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %50 = arith.addi %c100_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %52 = simt_step.subgroup_id
        %53 = arith.index_cast %52 : index to i32
        %54 = "simt_step.switch"(%51, %53) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          %true_22 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %59 = arith.addi %c480_i32, %0 : i32
          %true_23 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
        ^bb1(%61: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%63: i32):  // no predecessors
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          %true_24 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %66 = arith.addi %c496_i32, %0 : i32
          %true_25 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_20 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %55 = arith.addi %c512_i32, %0 : i32
        %true_21 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c528_i32 = arith.constant 528 : i32
      %27 = arith.addi %c528_i32, %0 : i32
      %true_7 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %30 = simt_step.lane_id
      %31 = arith.index_cast %30 : index to i32
      %true_8 = arith.constant true
      %c544_i32 = arith.constant 544 : i32
      %32 = arith.addi %c544_i32, %0 : i32
      %true_9 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %35 = arith.addi %c104_i32, %0 : i32
      %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
      %37 = simt_step.lane_id
      %38 = arith.index_cast %37 : index to i32
      %39 = "simt_step.switch"(%36, %38) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_18 : i32
          %48 = arith.addi %47, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %49 = arith.addi %c108_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_19 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c560_i32 = arith.constant 560 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_19 : i32
          %50 = arith.addi %c560_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_20 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_18 : i32
          %48 = arith.addi %47, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %49 = arith.addi %c128_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_19 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c576_i32 = arith.constant 576 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_19 : i32
          %50 = arith.addi %c576_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_20 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        %c592_i32 = arith.constant 592 : i32
        %45 = arith.addi %c592_i32, %0 : i32
        %true_17 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c608_i32 = arith.constant 608 : i32
      %40 = arith.addi %c608_i32, %0 : i32
      %true_11 = arith.constant true
      %41 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %c148_i32 = arith.constant 148 : i32
    %8 = arith.addi %c148_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_0 : i32
    %11 = "simt_step.if"(%10) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_5 : i32
        %17 = arith.addi %16, %0 : i32
        %c152_i32 = arith.constant 152 : i32
        %18 = arith.addi %c152_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c172_i32 = arith.constant 172 : i32
        %16 = arith.addi %c172_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %18 = "simt_step.switch"(%17, %c0_i32_5) ({
        ^bb0(%arg4: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %true_10 = arith.constant true
          %c624_i32 = arith.constant 624 : i32
          %25 = arith.addi %c624_i32, %0 : i32
          %true_11 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %19 = arith.addi %arg2, %18 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c640_i32 = arith.constant 640 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_7 : i32
        %22 = arith.addi %c640_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_5 : i32
        %17 = arith.addi %16, %0 : i32
        %c176_i32 = arith.constant 176 : i32
        %18 = arith.addi %c176_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_10 : i32
          %24 = arith.addi %23, %0 : i32
          %c196_i32 = arith.constant 196 : i32
          %25 = arith.addi %c196_i32, %24 : i32
          %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %27 = arith.cmpi ne, %26, %c0_i32_11 : i32
          "simt_step.condition"(%27, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %23 = arith.addi %arg4, %arg5 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %24 = arith.addi %arg5, %c1_i32_10 : i32
          %true_11 = arith.constant true
          %c656_i32 = arith.constant 656 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %25 = arith.muli %arg5, %c4_i32_12 : i32
          %26 = arith.addi %c656_i32, %25 : i32
          %27 = arith.addi %26, %0 : i32
          %true_13 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %17 = arith.addi %arg2, %16#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c672_i32 = arith.constant 672 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_8 : i32
        %20 = arith.addi %c672_i32, %19 : i32
        %21 = arith.addi %20, %0 : i32
        %true_9 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) : (i32) -> ()
    }) : (i1) -> i32
    %c688_i32 = arith.constant 688 : i32
    %12 = arith.addi %c688_i32, %0 : i32
    %true = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_3 : i32
      %16 = arith.addi %15, %0 : i32
      %c216_i32 = arith.constant 216 : i32
      %17 = arith.addi %c216_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %15 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c704_i32 = arith.constant 704 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_4 : i32
      %18 = arith.addi %c704_i32, %17 : i32
      %19 = arith.addi %18, %0 : i32
      %true_5 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

