module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_10 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32_10 : i32
          "simt_step.yield"(%c1_i32_9, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_8 = arith.constant 3 : i32
        "simt_step.yield"(%19#0) : (i32) -> ()
      }, {
        %c3_i32_6 = arith.constant 3 : i32
        %19 = arith.addi %arg0, %c3_i32_6 : i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %6 = arith.addi %arg0, %c0_i32_1 : i32
      "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %9 = "simt_step.if"(%8) ({
        %c0_i32_6 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c3_i32_8 = arith.constant 3 : i32
          %21 = arith.addi %arg0, %c3_i32_8 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_7 = arith.constant 2 : i32
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c3_i32_6 = arith.constant 3 : i32
        %19 = arith.remsi %arg3, %c3_i32_6 : i32
        %20 = "simt_step.switch"(%19, %arg0) ({
        ^bb0(%arg5: i32):
          %c1_i32_7 = arith.constant 1 : i32
          %21 = arith.addi %arg0, %c1_i32_7 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32 = arith.constant 2 : i32
      %10 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%9) {fallthrough = true} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      %12 = arith.remsi %arg3, %c3_i32_3 : i32
      %c3_i32_4 = arith.constant 3 : i32
      %13 = arith.addi %arg0, %c3_i32_4 : i32
      %14 = "simt_step.switch"(%12, %13) ({
      ^bb0(%arg5: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32_6 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %20 = "simt_step.switch"(%19, %c0_i32_7) ({
        ^bb0(%arg6: i32):
          %c1_i32_17 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_17) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c1_i32_18 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) {fallthrough = true} : (i32) -> ()
        ^bb3(%34: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %23 = "simt_step.if"(%22) ({
          %c4_i32_17 = arith.constant 4 : i32
          %32 = arith.addi %arg0, %c4_i32_17 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %c3_i32_17 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_17) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_10 = arith.constant 2 : i32
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c4_i32_11 = arith.constant 4 : i32
        %25 = arith.remsi %arg3, %c4_i32_11 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %26 = arith.addi %arg0, %c0_i32_12 : i32
        %27 = "simt_step.switch"(%25, %26) ({
        ^bb0(%arg6: i32):
          %c2_i32_17 = arith.constant 2 : i32
          %32 = arith.addi %arg0, %c2_i32_17 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c3_i32_18 = arith.constant 3 : i32
          %35 = arith.addi %arg0, %c3_i32_18 : i32
          "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %28 = arith.addi %arg0, %c4_i32_13 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb3(%29: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32_17 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32_18 : i32
          %34 = arith.cmpi slt, %arg7, %33 : i32
          "simt_step.condition"(%34, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_17 = arith.constant 1 : i32
          %32 = arith.addi %arg7, %c1_i32_17 : i32
          "simt_step.yield"(%arg0, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_16 = arith.constant 3 : i32
        %31 = arith.addi %arg0, %c3_i32_16 : i32
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      %15 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb3(%16: i32):  // no predecessors
      %c3_i32_5 = arith.constant 3 : i32
      %17 = arith.remsi %arg3, %c3_i32_5 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = "simt_step.switch"(%17, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %20 = "simt_step.if"(%19) ({
          %c1_i32_15 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_15) : (i32) -> ()
        }, {
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_7 = arith.constant 2 : i32
        %21 = arith.addi %arg0, %c2_i32_7 : i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.remsi %arg3, %c4_i32_8 : i32
        %c2_i32_9 = arith.constant 2 : i32
        %24 = "simt_step.switch"(%23, %c2_i32_9) ({
        ^bb0(%arg6: i32):
          %c3_i32_15 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%30: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c1_i32_10 = arith.constant 1 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c1_i32_11 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_11) {fallthrough = false} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %28 = arith.remsi %arg3, %c4_i32_15 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %29 = arith.addi %28, %c1_i32_16 : i32
          %30 = arith.cmpi slt, %arg7, %29 : i32
          "simt_step.condition"(%30, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_15 = arith.constant 2 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32_16 : i32
          "simt_step.continue"(%c2_i32_15, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_14 = arith.constant 0 : i32
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c4_i32_1 = arith.constant 4 : i32
      %10 = arith.addi %0, %c4_i32_1 : i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_2 = arith.constant 4 : i32
      %14 = arith.addi %0, %c4_i32_2 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg3: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.muli %arg5, %c4_i32_10 : i32
          %20 = arith.addi %19, %0 : i32
          %c16_i32_11 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32_11, %20 : i32
          %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %23 = arith.cmpi ne, %22, %c0_i32_12 : i32
          "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %19 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_6 = arith.constant true
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.muli %arg5, %c4_i32_10 : i32
          %20 = arith.addi %19, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %21 = arith.addi %c36_i32, %20 : i32
          %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %23 = arith.cmpi ne, %22, %c0_i32_11 : i32
          "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %19 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

