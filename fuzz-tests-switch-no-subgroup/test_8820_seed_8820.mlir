module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = arith.addi %arg0, %c1_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %5 = arith.remsi %arg3, %c2_i32 : i32
      %c1_i32_0 = arith.constant 1 : i32
      %6 = "simt_step.switch"(%5, %c1_i32_0) ({
      ^bb0(%arg5: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c0_i32_11 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_11) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_9) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.remsi %arg3, %c4_i32_10 : i32
        %24 = "simt_step.switch"(%23, %arg0) ({
        ^bb0(%arg6: i32):
          %c1_i32_11 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%27: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c4_i32_1 = arith.constant 4 : i32
      %7 = arith.addi %arg0, %c4_i32_1 : i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %9 = arith.remsi %arg3, %c3_i32 : i32
      %c2_i32_2 = arith.constant 2 : i32
      %10 = arith.addi %arg0, %c2_i32_2 : i32
      %11 = "simt_step.switch"(%9, %10) ({
      ^bb0(%arg5: i32):
        %c1_i32_8 = arith.constant 1 : i32
        %19 = arith.addi %arg0, %c1_i32_8 : i32
        %20 = "simt_step.switch"(%arg3, %19) ({
        ^bb0(%arg6: i32):
          %c0_i32_13 = arith.constant 0 : i32
          %25 = arith.addi %arg0, %c0_i32_13 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_14 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_13 = arith.constant 1 : i32
          %25 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%arg0, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_14 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_13 = arith.constant 1 : i32
          %25 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%arg0, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c3_i32_3 = arith.constant 3 : i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c3_i32_4 = arith.constant 3 : i32
      %13 = arith.remsi %arg3, %c3_i32_4 : i32
      %14 = "simt_step.switch"(%13, %arg0) ({
      ^bb0(%arg5: i32):
        %c3_i32_8 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c4_i32_9 = arith.constant 4 : i32
        %20 = arith.remsi %arg3, %c4_i32_9 : i32
        %21 = "simt_step.switch"(%20, %arg0) ({
        ^bb0(%arg6: i32):
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c1_i32_12 = arith.constant 1 : i32
          %26 = arith.addi %arg0, %c1_i32_12 : i32
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %29 = arith.addi %arg0, %c4_i32_13 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %24 = "simt_step.if"(%23) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb3(%15: i32):  // no predecessors
      %c2_i32_6 = arith.constant 2 : i32
      %16 = arith.remsi %arg3, %c2_i32_6 : i32
      %17 = "simt_step.switch"(%16, %arg0) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c2_i32_8 = arith.constant 2 : i32
        %20 = arith.remsi %arg3, %c2_i32_8 : i32
        %21 = "simt_step.switch"(%20, %arg0) ({
        ^bb0(%arg6: i32):
          %c2_i32_10 = arith.constant 2 : i32
          %25 = arith.addi %arg0, %c2_i32_10 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %24 = "simt_step.if"(%23) ({
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) : (i32) -> ()
        }, {
          %c0_i32_10 = arith.constant 0 : i32
          %25 = arith.addi %arg0, %c0_i32_10 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c2_i32_7 = arith.constant 2 : i32
      %18 = arith.addi %arg0, %c2_i32_7 : i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %6 = arith.muli %arg3, %c4_i32_2 : i32
      %7 = arith.addi %6, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %8 = arith.addi %c8_i32, %7 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_3 : i32
      "simt_step.condition"(%10, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %6 = arith.addi %c28_i32, %0 : i32
      %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
      %9 = "simt_step.if"(%8) ({
        %c32_i32_6 = arith.constant 32 : i32
        %18 = arith.addi %c32_i32_6, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_7 : i32
        %21 = "simt_step.if"(%20) ({
          %24 = simt_step.lane_id
          %25 = arith.index_cast %24 : index to i32
          "simt_step.yield"(%25) : (i32) -> ()
        }, {
          %24 = simt_step.subgroup_id
          %25 = arith.index_cast %24 : index to i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %true_8 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %18 = arith.addi %c36_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_6 = arith.constant 4 : i32
        %20 = "simt_step.switch"(%19, %c4_i32_6) ({
        ^bb0(%arg4: i32):
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %10 = arith.addi %c32_i32, %0 : i32
      %true = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %12 = arith.addi %arg2, %9 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_4 : i32
      %15 = arith.addi %c48_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_5 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

