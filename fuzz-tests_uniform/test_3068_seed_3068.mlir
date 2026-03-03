module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %arg0, %c0_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %6 = "simt_step.if"(%5) ({
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %17 = "simt_step.if"(%16) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32_6 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c3_i32_5 = arith.constant 3 : i32
        %16 = arith.remsi %arg3, %c3_i32_5 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %17 = arith.addi %arg0, %c0_i32_6 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg5: i32):
          %c2_i32_8 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_8) {fallthrough = true} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_7 = arith.constant 3 : i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %9 = "simt_step.switch"(%8, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %17 = "simt_step.if"(%16) ({
          %c0_i32_13 = arith.constant 0 : i32
          %27 = arith.addi %arg0, %c0_i32_13 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %c0_i32_13 = arith.constant 0 : i32
          %27 = arith.addi %arg0, %c0_i32_13 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32_6 : i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c4_i32_7 = arith.constant 4 : i32
        %20 = arith.addi %arg0, %c4_i32_7 : i32
        "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_14 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_13 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%arg0, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_10 = arith.constant 2 : i32
        %23 = arith.addi %arg0, %c2_i32_10 : i32
        "simt_step.yield"(%22#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c2_i32_11 = arith.constant 2 : i32
        %25 = arith.remsi %arg3, %c2_i32_11 : i32
        %26 = "simt_step.switch"(%25, %arg0) ({
        ^bb0(%arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %27 = arith.addi %arg0, %c4_i32_13 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %c1_i32_15 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%9) {fallthrough = true} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %12 = arith.remsi %arg3, %c2_i32 : i32
      %13 = "simt_step.switch"(%12, %arg0) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c1_i32_5 = arith.constant 1 : i32
        %17 = arith.addi %arg0, %c1_i32_5 : i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %21 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32_10 : i32
          %23 = arith.cmpi slt, %arg7, %22 : i32
          "simt_step.condition"(%23, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32_9 : i32
          "simt_step.yield"(%arg0, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_8 = arith.constant 3 : i32
        %20 = arith.addi %arg0, %c3_i32_8 : i32
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c2_i32_2 = arith.constant 2 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb3(%14: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32_6 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_5 = arith.constant 2 : i32
        %16 = arith.remsi %arg3, %c2_i32_5 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %17 = "simt_step.switch"(%16, %c0_i32_6) ({
        ^bb0(%arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_7 = arith.constant 3 : i32
        %18 = arith.addi %arg0, %c3_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.yield"(%17, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32_0, %arg0 : i32
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
    %c1_i32 = arith.constant 1 : i32
    %7 = arith.addi %0, %c1_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = "simt_step.switch"(%12, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %19 = arith.muli %arg5, %c4_i32_9 : i32
          %20 = arith.addi %19, %0 : i32
          %c16_i32_10 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32_10, %20 : i32
          %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %23 = arith.cmpi ne, %22, %c0_i32_11 : i32
          "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %19 = arith.addi %arg4, %arg5 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %20 = arith.addi %arg5, %c1_i32_9 : i32
          "simt_step.yield"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c1_i32_8 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.muli %arg4, %c4_i32_5 : i32
        %17 = arith.addi %16, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %18 = arith.addi %c36_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
        "simt_step.condition"(%20, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %16 = arith.addi %arg3, %arg4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %17 = arith.addi %arg4, %c1_i32_5 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_4 = arith.constant true
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

