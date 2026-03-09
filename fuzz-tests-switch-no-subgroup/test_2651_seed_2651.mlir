module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.remsi %arg3, %c4_i32 : i32
    %c4_i32_0 = arith.constant 4 : i32
    %3 = "simt_step.switch"(%2, %c4_i32_0) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %8 = arith.remsi %arg3, %c3_i32 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %9 = "simt_step.switch"(%8, %c4_i32_3) ({
      ^bb0(%arg5: i32):
        %c2_i32_9 = arith.constant 2 : i32
        %20 = arith.remsi %arg3, %c2_i32_9 : i32
        %21 = "simt_step.switch"(%20, %arg0) ({
        ^bb0(%arg6: i32):
          %c1_i32_12 = arith.constant 1 : i32
          %28 = arith.addi %arg0, %c1_i32_12 : i32
          "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %24 = arith.addi %arg0, %c0_i32_10 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb3(%25: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %27 = "simt_step.if"(%26) ({
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.addi %arg0, %c4_i32_12 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32_4 = arith.constant 3 : i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c3_i32_5 = arith.constant 3 : i32
      %11 = arith.remsi %arg3, %c3_i32_5 : i32
      %12 = "simt_step.switch"(%11, %arg0) ({
      ^bb0(%arg5: i32):
        %c4_i32_9 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %22 = "simt_step.if"(%21) ({
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) : (i32) -> ()
        }, {
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c4_i32_11 = arith.constant 4 : i32
        %24 = arith.addi %arg0, %c4_i32_11 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb3(%25: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_15 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c0_i32_14 = arith.constant 0 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.yield"(%c0_i32_14, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %14 = arith.remsi %arg3, %c2_i32 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = "simt_step.switch"(%14, %c4_i32_6) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %20 = arith.addi %arg0, %c0_i32_9 : i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c3_i32_10 = arith.constant 3 : i32
        %22 = arith.remsi %arg3, %c3_i32_10 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %23 = arith.addi %arg0, %c0_i32_11 : i32
        %24 = "simt_step.switch"(%22, %23) ({
        ^bb0(%arg6: i32):
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          %26 = arith.addi %arg0, %c2_i32_13 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          %28 = arith.addi %arg0, %c2_i32_14 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb3(%16: i32):  // no predecessors
      %c3_i32_7 = arith.constant 3 : i32
      %17 = arith.remsi %arg3, %c3_i32_7 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = "simt_step.switch"(%17, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_15 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_14 = arith.constant 3 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.yield"(%c3_i32_14, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %23 = "simt_step.if"(%22) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c2_i32_12 = arith.constant 2 : i32
        %25 = arith.remsi %arg3, %c2_i32_12 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %26 = "simt_step.switch"(%25, %c4_i32_13) ({
        ^bb0(%arg6: i32):
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32_8 = arith.constant 1 : i32
      %19 = arith.addi %arg0, %c1_i32_8 : i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %5 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %7 = arith.select %6, %0, %3 : i32
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
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
      %14 = "simt_step.if"(%13) ({
        %c16_i32 = arith.constant 16 : i32
        %17 = arith.addi %c16_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
        %20 = "simt_step.if"(%19) ({
          %23 = simt_step.lane_id
          %24 = arith.index_cast %23 : index to i32
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %21 = arith.addi %c32_i32, %0 : i32
        %true_4 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %18 = arith.muli %arg3, %c4_i32_5 : i32
          %19 = arith.addi %18, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %20 = arith.addi %c20_i32, %19 : i32
          %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
          "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %18 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %arg3, %c1_i32 : i32
          %true_5 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %20 = arith.muli %arg3, %c4_i32_6 : i32
          %21 = arith.addi %c48_i32, %20 : i32
          %22 = arith.addi %21, %0 : i32
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) : (i32) -> ()
      }) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %15 = arith.addi %c64_i32, %0 : i32
      %true_2 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %c40_i32 = arith.constant 40 : i32
      %11 = arith.addi %c40_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
      %14 = "simt_step.if"(%13) ({
        %c44_i32 = arith.constant 44 : i32
        %17 = arith.addi %c44_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
        %20 = "simt_step.if"(%19) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c0_i32_5 = arith.constant 0 : i32
          %23 = arith.addi %0, %c0_i32_5 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %21 = arith.addi %c80_i32, %0 : i32
        %true_4 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %15 = arith.addi %c96_i32, %0 : i32
      %true_2 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) : (i32) -> ()
    }) : (i1) -> i32
    %c112_i32 = arith.constant 112 : i32
    %9 = arith.addi %c112_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

