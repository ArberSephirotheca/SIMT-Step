module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg0, %c1_i32 : i32
      %4 = "simt_step.switch"(%2, %3) ({
      ^bb0(%arg4: i32):
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.addi %arg0, %c4_i32 : i32
        "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
      ^bb1(%6: i32):  // no predecessors
        %c3_i32_0 = arith.constant 3 : i32
        %7 = arith.remsi %arg3, %c3_i32_0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %8 = arith.addi %arg0, %c0_i32_1 : i32
        %9 = "simt_step.switch"(%7, %8) ({
        ^bb0(%arg5: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %c3_i32_4 = arith.constant 3 : i32
          %13 = arith.addi %arg0, %c3_i32_4 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb2(%14: i32):  // no predecessors
          %c2_i32_5 = arith.constant 2 : i32
          %15 = arith.addi %arg0, %c2_i32_5 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb3(%16: i32):  // no predecessors
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_4 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32_4 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32_5 : i32
          %14 = arith.cmpi slt, %arg6, %13 : i32
          "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c3_i32_4 = arith.constant 3 : i32
          %12 = arith.addi %arg0, %c3_i32_4 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32_5 : i32
          "simt_step.continue"(%12, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%4) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = "simt_step.switch"(%2, %arg0) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%6: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %8 = "simt_step.if"(%7) ({
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }, {
          %c2_i32_3 = arith.constant 2 : i32
          %14 = arith.addi %arg0, %c2_i32_3 : i32
          "simt_step.yield"(%14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb2(%9: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %10 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg0, %c1_i32 : i32
        %12 = "simt_step.switch"(%10, %11) ({
        ^bb0(%arg5: i32):
          %c3_i32_3 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_3) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb3(%13: i32):  // no predecessors
        %c3_i32_2 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_2) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%3) : (i32) -> ()
    }) : (i1) -> i32
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
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_7 : i32
      %16 = arith.addi %c16_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_8 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %15 = arith.addi %c28_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c32_i32 = arith.constant 32 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_7 : i32
      %16 = arith.addi %c32_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_8 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c48_i32 = arith.constant 48 : i32
    %7 = arith.addi %c48_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %9 = arith.addi %0, %c2_i32 : i32
    %10 = "simt_step.switch"(%8, %9) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %13 = arith.addi %c52_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %15 = arith.addi %0, %c3_i32 : i32
      %16 = "simt_step.switch"(%14, %15) ({
      ^bb0(%arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_7) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_13 : i32
          %28 = arith.addi %27, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %29 = arith.addi %c56_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_14 : i32
          "simt_step.condition"(%31, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %27 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %21 = arith.addi %c76_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_10 : i32
        %24 = "simt_step.if"(%23) ({
          %c0_i32_13 = arith.constant 0 : i32
          %27 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb3(%25: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_13 : i32
          %28 = arith.addi %27, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %29 = arith.addi %c80_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_14 : i32
          "simt_step.condition"(%31, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %27 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          "simt_step.continue"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c48_i32_4 = arith.constant 48 : i32
    %11 = arith.addi %c48_i32_4, %0 : i32
    %true_5 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

