module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32 : i32
      %c2_i32 = arith.constant 2 : i32
      %7 = "simt_step.switch"(%6, %c2_i32) ({
      ^bb0(%arg4: i32):
        %c3_i32_3 = arith.constant 3 : i32
        %10 = arith.remsi %arg3, %c3_i32_3 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %11 = "simt_step.switch"(%10, %c0_i32_4) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c3_i32_6 = arith.constant 3 : i32
        %13 = arith.remsi %arg3, %c3_i32_6 : i32
        %c2_i32_7 = arith.constant 2 : i32
        %14 = "simt_step.switch"(%13, %c2_i32_7) ({
        ^bb0(%arg5: i32):
          %c0_i32_11 = arith.constant 0 : i32
          %23 = arith.addi %arg0, %c0_i32_11 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c3_i32_12 = arith.constant 3 : i32
          %25 = arith.addi %arg0, %c3_i32_12 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          %27 = arith.addi %arg0, %c2_i32_13 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %c2_i32_8 = arith.constant 2 : i32
        %16 = arith.remsi %arg3, %c2_i32_8 : i32
        %17 = "simt_step.switch"(%16, %arg0) ({
        ^bb0(%arg5: i32):
          %c2_i32_11 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32 = arith.constant 4 : i32
        %18 = arith.addi %arg0, %c4_i32 : i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb3(%19: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %21 = "simt_step.if"(%20) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32_11 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_10 = arith.constant 2 : i32
        %22 = arith.addi %arg0, %c2_i32_10 : i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %8 = simt_step.subgroup_id
      %9 = arith.index_cast %8 : index to i32
      "simt_step.yield"(%7) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %7 = simt_step.subgroup_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg4: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%arg0, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %14 = "simt_step.if"(%13) ({
          %c3_i32 = arith.constant 3 : i32
          %15 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%9) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %5 = arith.select %4, %c0_i32, %1 : i32
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_7 : i32
      %14 = arith.addi %13, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_8 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_7 : i32
      %14 = arith.addi %13, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %15 = arith.addi %c28_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_8 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c48_i32 = arith.constant 48 : i32
      %13 = arith.addi %c48_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_7 : i32
      %16 = "simt_step.if"(%15) ({
        %c52_i32 = arith.constant 52 : i32
        %19 = arith.addi %c52_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %21 = simt_step.lane_id
        %22 = arith.index_cast %21 : index to i32
        %23 = "simt_step.switch"(%20, %22) ({
        ^bb0(%arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %24 = arith.addi %0, %c4_i32_9 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%27: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %17 = arith.addi %arg2, %16 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

