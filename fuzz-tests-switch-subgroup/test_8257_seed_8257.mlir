module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %8 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = "simt_step.switch"(%8, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %19 = "simt_step.if"(%18) ({
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %27 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %27 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_11 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg7, %c4_i32_11 : i32
          %28 = arith.addi %c48_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.break"(%26, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_11 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg7, %c4_i32_11 : i32
          %28 = arith.addi %c64_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.continue"(%26, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_11 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg7, %c4_i32_11 : i32
          %28 = arith.addi %c80_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%26, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = true} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c2_i32_1 = arith.constant 2 : i32
      %11 = arith.remsi %arg3, %c2_i32_1 : i32
      %c4_i32 = arith.constant 4 : i32
      %12 = "simt_step.switch"(%11, %c4_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_8 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_7 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %28 = arith.muli %arg7, %c4_i32_8 : i32
          %29 = arith.addi %c96_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %31 = arith.addi %arg7, %c1_i32_9 : i32
          "simt_step.break"(%27, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %21 = "simt_step.if"(%20) ({
          %true_7 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %28 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %28 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c3_i32_6 = arith.constant 3 : i32
        %23 = arith.remsi %arg3, %c3_i32_6 : i32
        %24 = simt_step.lane_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%23, %25) ({
        ^bb0(%arg6: i32):
          %true_7 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %28 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %true_8 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %31 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %true_9 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %34 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %37 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c2_i32_2 = arith.constant 2 : i32
      %14 = arith.remsi %arg3, %c2_i32_2 : i32
      %15 = simt_step.lane_id
      %16 = arith.index_cast %15 : index to i32
      %17 = "simt_step.switch"(%14, %16) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %19 = "simt_step.if"(%18) ({
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %24 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %24 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c3_i32_4 = arith.constant 3 : i32
        %21 = arith.remsi %arg3, %c3_i32_4 : i32
        %c3_i32_5 = arith.constant 3 : i32
        %22 = "simt_step.switch"(%21, %c3_i32_5) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %24 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_7 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %27 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_8 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %30 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %0, %5 : i32
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
      %10 = arith.addi %c12_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %39 = arith.addi %c16_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %41 = arith.addi %0, %c3_i32 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg4: i32):
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          %true_19 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %58 = arith.addi %c288_i32, %0 : i32
          %true_20 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = true} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %43 = arith.addi %c304_i32, %0 : i32
        %true_12 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %46:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %56 = arith.muli %arg5, %c4_i32_19 : i32
          %57 = arith.addi %56, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %58 = arith.addi %c20_i32, %57 : i32
          %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %60 = arith.cmpi ne, %59, %c0_i32_20 : i32
          "simt_step.condition"(%60, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %56 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %57 = arith.addi %arg5, %c1_i32 : i32
          %true_19 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %58 = arith.muli %arg5, %c4_i32_20 : i32
          %59 = arith.addi %c320_i32, %58 : i32
          %60 = arith.addi %59, %0 : i32
          %true_21 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%56, %57) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %47 = arith.addi %c336_i32, %0 : i32
        %true_16 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %50 = arith.addi %c40_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %52 = arith.cmpi ne, %51, %c0_i32_17 : i32
        %53 = "simt_step.if"(%52) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) : (i32) -> ()
        }) : (i1) -> i32
        %c352_i32 = arith.constant 352 : i32
        %54 = arith.addi %c352_i32, %0 : i32
        %true_18 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %15 = arith.addi %c368_i32, %0 : i32
      %true_2 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %18 = arith.addi %c44_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
      %21 = "simt_step.if"(%20) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c384_i32 = arith.constant 384 : i32
      %22 = arith.addi %c384_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %24 = arith.addi %c400_i32, %0 : i32
      %true_6 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %27 = arith.addi %c48_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = "simt_step.switch"(%28, %0) ({
      ^bb0(%arg3: i32):
        %c52_i32 = arith.constant 52 : i32
        %39 = arith.addi %c52_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = simt_step.subgroup_id
        %42 = arith.index_cast %41 : index to i32
        %43 = "simt_step.switch"(%40, %42) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %71 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        ^bb1(%72: i32):  // no predecessors
          %73 = simt_step.subgroup_id
          %74 = arith.index_cast %73 : index to i32
          %true_23 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %75 = arith.addi %c416_i32, %0 : i32
          %true_24 = arith.constant true
          %76 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %75, %76) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%74) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %44 = arith.addi %c432_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %47 = arith.addi %c56_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_13 : i32
        %50 = "simt_step.if"(%49) ({
          %c4_i32_23 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_23) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %71 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%71) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %51 = arith.addi %c448_i32, %0 : i32
        %true_14 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      ^bb2(%53: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %54 = arith.addi %c60_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %56 = arith.cmpi ne, %55, %c0_i32_15 : i32
        %57 = "simt_step.if"(%56) ({
          %c4_i32_23 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_23) : (i32) -> ()
        }, {
          %71 = simt_step.subgroup_id
          %72 = arith.index_cast %71 : index to i32
          "simt_step.yield"(%72) : (i32) -> ()
        }) : (i1) -> i32
        %c464_i32 = arith.constant 464 : i32
        %58 = arith.addi %c464_i32, %0 : i32
        %true_16 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %60 = arith.addi %c480_i32, %0 : i32
        %true_18 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      ^bb3(%62: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %63 = arith.addi %c64_i32, %0 : i32
        %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %65 = arith.cmpi ne, %64, %c0_i32_19 : i32
        %66 = "simt_step.if"(%65) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c496_i32 = arith.constant 496 : i32
        %67 = arith.addi %c496_i32, %0 : i32
        %true_20 = arith.constant true
        %68 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_21 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %69 = arith.addi %c512_i32, %0 : i32
        %true_22 = arith.constant true
        %70 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %31 = arith.addi %c68_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_7 : i32
      %34 = "simt_step.if"(%33) ({
        %c72_i32 = arith.constant 72 : i32
        %39 = arith.addi %c72_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_11 : i32
        %42 = "simt_step.if"(%41) ({
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c528_i32 = arith.constant 528 : i32
        %43 = arith.addi %c528_i32, %0 : i32
        %true_12 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) : (i32) -> ()
      }, {
        %c76_i32 = arith.constant 76 : i32
        %39 = arith.addi %c76_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = simt_step.subgroup_id
        %42 = arith.index_cast %41 : index to i32
        %43 = "simt_step.switch"(%40, %42) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32 : i32
          %true_13 = arith.constant true
          %c544_i32 = arith.constant 544 : i32
          %48 = arith.addi %c544_i32, %0 : i32
          %true_14 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c560_i32 = arith.constant 560 : i32
        %44 = arith.addi %c560_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      %c576_i32 = arith.constant 576 : i32
      %35 = arith.addi %c576_i32, %0 : i32
      %true_8 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c592_i32 = arith.constant 592 : i32
      %37 = arith.addi %c592_i32, %0 : i32
      %true_10 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c608_i32 = arith.constant 608 : i32
    %8 = arith.addi %c608_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

