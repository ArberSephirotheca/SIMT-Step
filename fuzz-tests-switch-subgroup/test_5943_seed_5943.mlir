module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = arith.addi %arg0, %c1_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_6 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %16 = "simt_step.switch"(%15, %c0_i32_5) ({
        ^bb0(%arg7: i32):
          %true_7 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32_9 : i32
          %20 = arith.addi %c0_i32_8, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_10 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32_11 : i32
          %25 = arith.addi %c16_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %true_12 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_13 : i32
          %30 = arith.addi %c32_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_6 : i32
        "simt_step.break"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c3_i32_1 = arith.constant 3 : i32
      %7 = arith.remsi %arg3, %c3_i32_1 : i32
      %c3_i32_2 = arith.constant 3 : i32
      %8 = "simt_step.switch"(%7, %c3_i32_2) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_14 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_13 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %23 = arith.muli %arg7, %c4_i32_14 : i32
          %24 = arith.addi %c48_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_15 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_14 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_13 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %23 = arith.muli %arg7, %c4_i32_14 : i32
          %24 = arith.addi %c64_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_15 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_14 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_13 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %23 = arith.muli %arg7, %c4_i32_14 : i32
          %24 = arith.addi %c80_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_15 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_14 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_13 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %23 = arith.muli %arg7, %c4_i32_14 : i32
          %24 = arith.addi %c96_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_15 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %10 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %12 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32_4 = arith.constant 1 : i32
      %13 = arith.addi %arg0, %c1_i32_4 : i32
      %14 = "simt_step.switch"(%12, %13) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
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
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg7, %c4_i32_11 : i32
          %28 = arith.addi %c128_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.continue"(%26, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %18 = "simt_step.if"(%17) ({
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %27 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %27 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %20 = arith.remsi %arg3, %c2_i32 : i32
        %21 = simt_step.lane_id
        %22 = arith.index_cast %21 : index to i32
        %23 = "simt_step.switch"(%20, %22) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %27 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_11 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %30 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_12 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %33 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
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
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg7, %c4_i32_11 : i32
          %28 = arith.addi %c224_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%26, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %4 = arith.addi %c240_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %20 = arith.addi %c8_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_2 : i32
      "simt_step.if"(%22) ({
        %c3_i32 = arith.constant 3 : i32
        %23 = arith.remsi %0, %c3_i32 : i32
        %24 = simt_step.subgroup_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%23, %25) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg2, %c1_i32 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c3_i32_3 = arith.constant 3 : i32
          %29 = arith.addi %28, %c3_i32_3 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %c4_i32_4 = arith.constant 4 : i32
          %31 = arith.addi %30, %c4_i32_4 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb3(%32: i32):  // no predecessors
          %c0_i32_5 = arith.constant 0 : i32
          %33 = arith.addi %32, %c0_i32_5 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %20 = arith.addi %c16_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %22 = arith.addi %0, %c0_i32_2 : i32
      %23 = "simt_step.switch"(%21, %22) ({
      ^bb0(%arg3: i32):
        %c20_i32 = arith.constant 20 : i32
        %32 = arith.addi %c20_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_11 : i32
        %35 = "simt_step.if"(%34) ({
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }, {
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %36 = arith.addi %c256_i32, %0 : i32
        %true_12 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %39 = arith.addi %c24_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_13 : i32
        %42 = "simt_step.if"(%41) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %43 = arith.addi %c272_i32, %0 : i32
        %true_14 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %45 = arith.addi %c288_i32, %0 : i32
        %true_16 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %48 = arith.addi %c28_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_17 : i32
        %51 = "simt_step.if"(%50) ({
          %54 = simt_step.lane_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }, {
          %c4_i32_19 = arith.constant 4 : i32
          %54 = arith.addi %0, %c4_i32_19 : i32
          "simt_step.yield"(%54) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %52 = arith.addi %c304_i32, %0 : i32
        %true_18 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_11 : i32
        %33 = arith.addi %32, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %34 = arith.addi %c32_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_12 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %39 = arith.muli %arg6, %c4_i32_16 : i32
          %40 = arith.addi %39, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %41 = arith.addi %c52_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_17 : i32
          "simt_step.condition"(%43, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %39 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %40 = arith.addi %arg6, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %41 = arith.muli %arg6, %c4_i32_18 : i32
          %42 = arith.addi %c320_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_19 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %33 = arith.addi %arg3, %32#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32 : i32
        %true_13 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_14 : i32
        %36 = arith.addi %c336_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_15 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %26 = arith.addi %c352_i32, %0 : i32
      %true_6 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_11 : i32
        %33 = arith.addi %32, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %34 = arith.addi %c72_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_12 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %32 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        %true_11 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_12 : i32
        %35 = arith.addi %c368_i32, %34 : i32
        %36 = arith.addi %35, %0 : i32
        %true_13 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %31:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_11 : i32
        %33 = arith.addi %32, %0 : i32
        %c92_i32 = arith.constant 92 : i32
        %34 = arith.addi %c92_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_12 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %32 = simt_step.lane_id
        %33 = arith.index_cast %32 : index to i32
        %34 = arith.addi %arg3, %33 : i32
        %c1_i32 = arith.constant 1 : i32
        %35 = arith.addi %arg4, %c1_i32 : i32
        %true_11 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_12 : i32
        %37 = arith.addi %c384_i32, %36 : i32
        %38 = arith.addi %37, %0 : i32
        %true_13 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34, %35) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c112_i32 = arith.constant 112 : i32
    %9 = arith.addi %c112_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
    %12 = "simt_step.if"(%11) ({
      %c116_i32 = arith.constant 116 : i32
      %20 = arith.addi %c116_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.lane_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg2: i32):
        %c120_i32 = arith.constant 120 : i32
        %25 = arith.addi %c120_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_2 : i32
        %28 = "simt_step.if"(%27) ({
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) : (i32) -> ()
        }, {
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        %c400_i32 = arith.constant 400 : i32
        %29 = arith.addi %c400_i32, %0 : i32
        %true_3 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %32 = arith.addi %c124_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %34 = arith.addi %0, %c0_i32_4 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %true_10 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %41 = arith.addi %c416_i32, %0 : i32
          %true_11 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %36 = arith.addi %c432_i32, %0 : i32
        %true_6 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_7 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %38 = arith.addi %c448_i32, %0 : i32
        %true_8 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_4 : i32
        %22 = arith.addi %21, %0 : i32
        %c128_i32 = arith.constant 128 : i32
        %23 = arith.addi %c128_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %21 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        %true_4 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_5 : i32
        %24 = arith.addi %c464_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) : (i32) -> ()
    }) : (i1) -> i32
    %c480_i32 = arith.constant 480 : i32
    %13 = arith.addi %c480_i32, %0 : i32
    %true = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c148_i32 = arith.constant 148 : i32
    %15 = arith.addi %c148_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %17 = simt_step.lane_id
    %18 = arith.index_cast %17 : index to i32
    %19 = "simt_step.switch"(%16, %18) ({
    ^bb0(%arg2: i32):
      %c152_i32 = arith.constant 152 : i32
      %20 = arith.addi %c152_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_2 : i32
      %23 = "simt_step.if"(%22) ({
        %c156_i32 = arith.constant 156 : i32
        %48 = arith.addi %c156_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_10 : i32
        %51 = "simt_step.if"(%50) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c496_i32 = arith.constant 496 : i32
        %52 = arith.addi %c496_i32, %0 : i32
        %true_11 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) : (i32) -> ()
      }, {
        %c160_i32 = arith.constant 160 : i32
        %48 = arith.addi %c160_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %50 = arith.addi %0, %c1_i32 : i32
        %51 = "simt_step.switch"(%49, %50) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %c1_i32_12 = arith.constant 1 : i32
          %58 = arith.addi %0, %c1_i32_12 : i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb3(%59: i32):  // no predecessors
          %60 = simt_step.subgroup_id
          %61 = arith.index_cast %60 : index to i32
          %true_13 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %62 = arith.addi %c512_i32, %0 : i32
          %true_14 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %52 = arith.addi %c528_i32, %0 : i32
        %true_11 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) : (i32) -> ()
      }) : (i1) -> i32
      %c544_i32 = arith.constant 544 : i32
      %24 = arith.addi %c544_i32, %0 : i32
      %true_3 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c164_i32 = arith.constant 164 : i32
      %27 = arith.addi %c164_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = simt_step.subgroup_id
      %30 = arith.index_cast %29 : index to i32
      %31 = "simt_step.switch"(%28, %30) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %true_11 = arith.constant true
        %c560_i32 = arith.constant 560 : i32
        %48 = arith.addi %c560_i32, %0 : i32
        %true_12 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
      ^bb1(%50: i32):  // no predecessors
        %c168_i32 = arith.constant 168 : i32
        %51 = arith.addi %c168_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %53 = simt_step.subgroup_id
        %54 = arith.index_cast %53 : index to i32
        %55 = "simt_step.switch"(%52, %54) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %62 = arith.addi %0, %c3_i32 : i32
          %true_13 = arith.constant true
          %c576_i32 = arith.constant 576 : i32
          %63 = arith.addi %c576_i32, %0 : i32
          %true_14 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb1(%65: i32):  // no predecessors
          %66 = simt_step.lane_id
          %67 = arith.index_cast %66 : index to i32
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        ^bb2(%68: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_15 = arith.constant true
          %c592_i32 = arith.constant 592 : i32
          %69 = arith.addi %c592_i32, %0 : i32
          %true_16 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
      ^bb2(%56: i32):  // no predecessors
        %c172_i32 = arith.constant 172 : i32
        %57 = arith.addi %c172_i32, %0 : i32
        %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
        %59 = simt_step.subgroup_id
        %60 = arith.index_cast %59 : index to i32
        %61 = "simt_step.switch"(%58, %60) ({
        ^bb0(%arg4: i32):
          %true_13 = arith.constant true
          %c608_i32 = arith.constant 608 : i32
          %62 = arith.addi %c608_i32, %0 : i32
          %true_14 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %65 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb2(%66: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c624_i32 = arith.constant 624 : i32
      %32 = arith.addi %c624_i32, %0 : i32
      %true_5 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%34: i32):  // no predecessors
      %c176_i32 = arith.constant 176 : i32
      %35 = arith.addi %c176_i32, %0 : i32
      %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %37 = arith.cmpi ne, %36, %c0_i32_6 : i32
      %38 = "simt_step.if"(%37) ({
        %c180_i32 = arith.constant 180 : i32
        %48 = arith.addi %c180_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_10 : i32
        %51 = "simt_step.if"(%50) ({
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c640_i32 = arith.constant 640 : i32
        %52 = arith.addi %c640_i32, %0 : i32
        %true_11 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c656_i32 = arith.constant 656 : i32
      %39 = arith.addi %c656_i32, %0 : i32
      %true_7 = arith.constant true
      %40 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    ^bb3(%41: i32):  // no predecessors
      %c184_i32 = arith.constant 184 : i32
      %42 = arith.addi %c184_i32, %0 : i32
      %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %44 = arith.cmpi ne, %43, %c0_i32_8 : i32
      %45 = "simt_step.if"(%44) ({
        %c4_i32_10 = arith.constant 4 : i32
        %48 = arith.addi %0, %c4_i32_10 : i32
        "simt_step.yield"(%48) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %48:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %49 = arith.muli %arg4, %c4_i32_12 : i32
          %50 = arith.addi %49, %0 : i32
          %c188_i32 = arith.constant 188 : i32
          %51 = arith.addi %c188_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_13 : i32
          "simt_step.condition"(%53, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %49 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg4, %c1_i32 : i32
          %true_12 = arith.constant true
          %c672_i32 = arith.constant 672 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %51 = arith.muli %arg4, %c4_i32_13 : i32
          %52 = arith.addi %c672_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_14 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%48#0) : (i32) -> ()
      }) : (i1) -> i32
      %c688_i32 = arith.constant 688 : i32
      %46 = arith.addi %c688_i32, %0 : i32
      %true_9 = arith.constant true
      %47 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

