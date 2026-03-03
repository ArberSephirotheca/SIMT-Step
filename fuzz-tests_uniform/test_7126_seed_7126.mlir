module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %5 = arith.remsi %arg3, %c3_i32 : i32
      %6 = "simt_step.switch"(%5, %arg0) ({
      ^bb0(%arg5: i32):
        %c3_i32_3 = arith.constant 3 : i32
        %11 = arith.addi %arg0, %c3_i32_3 : i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %13 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32_4 = arith.constant 1 : i32
        %14 = arith.addi %arg0, %c1_i32_4 : i32
        %15 = "simt_step.switch"(%13, %14) ({
        ^bb0(%arg6: i32):
          %c1_i32_7 = arith.constant 1 : i32
          %22 = arith.addi %arg0, %c1_i32_7 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %c1_i32_5 = arith.constant 1 : i32
        %16 = arith.addi %arg0, %c1_i32_5 : i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb2(%17: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb3(%18: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32 : i32
        %20 = "simt_step.switch"(%19, %arg0) ({
        ^bb0(%arg6: i32):
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %25 = arith.addi %arg0, %c0_i32_8 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c4_i32_6 = arith.constant 4 : i32
        %21 = arith.addi %arg0, %c4_i32_6 : i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c3_i32_0 = arith.constant 3 : i32
      %7 = arith.addi %arg0, %c3_i32_0 : i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c3_i32_1 = arith.constant 3 : i32
      %9 = arith.remsi %arg3, %c3_i32_1 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = "simt_step.switch"(%9, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_11 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.yield"(%c1_i32_10, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_5 = arith.constant 0 : i32
        %12 = arith.addi %arg0, %c0_i32_5 : i32
        "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16 = "simt_step.switch"(%15, %c0_i32_6) ({
        ^bb0(%arg6: i32):
          %c3_i32_10 = arith.constant 3 : i32
          %23 = arith.addi %arg0, %c3_i32_10 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c2_i32_7 = arith.constant 2 : i32
        %17 = arith.addi %arg0, %c2_i32_7 : i32
        "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
      ^bb3(%18: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %20 = arith.addi %arg0, %c0_i32_8 : i32
        %21 = "simt_step.switch"(%19, %20) ({
        ^bb0(%arg6: i32):
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%25: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %22 = arith.addi %arg0, %c0_i32_9 : i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32_2 = arith.constant 1 : i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c4_i32_8 = arith.constant 4 : i32
      %20 = arith.addi %0, %c4_i32_8 : i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c12_i32 = arith.constant 12 : i32
    %11 = arith.addi %c12_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.addi %0, %c0_i32_1 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %c16_i32_8 = arith.constant 16 : i32
      %20 = arith.addi %c16_i32_8, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %22 = "simt_step.switch"(%21, %c2_i32) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_17 : i32
          %33 = arith.addi %32, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %34 = arith.addi %c20_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_18 : i32
          "simt_step.condition"(%36, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %32 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %24 = arith.addi %c40_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_10 : i32
      %27 = "simt_step.if"(%26) ({
        %c3_i32 = arith.constant 3 : i32
        %30 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c44_i32 = arith.constant 44 : i32
        %30 = arith.addi %c44_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_15 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_14 : i32
        %31 = arith.addi %30, %0 : i32
        %c48_i32_15 = arith.constant 48 : i32
        %32 = arith.addi %c48_i32_15, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_16 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %30 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %17:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_8 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_8 : i32
      %21 = arith.addi %20, %0 : i32
      %c68_i32 = arith.constant 68 : i32
      %22 = arith.addi %c68_i32, %21 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_9 : i32
      "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %20 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_6 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %18 = arith.addi %c48_i32, %0 : i32
    %true_7 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

