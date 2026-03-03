module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%4) {fallthrough = true} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_8 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %16 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.break"(%c0_i32_7, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_6 = arith.constant 0 : i32
        "simt_step.yield"(%15#0) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32 : i32
        %c2_i32_4 = arith.constant 2 : i32
        %16 = "simt_step.switch"(%15, %c2_i32_4) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_5 = arith.constant 1 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %10 = "simt_step.if"(%9) ({
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %c2_i32 = arith.constant 2 : i32
          %18 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %c4_i32_6 = arith.constant 4 : i32
          %18 = arith.addi %arg0, %c4_i32_6 : i32
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %17 = arith.addi %arg0, %c0_i32_5 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %c0_i32_5 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_5) : (i32) -> ()
        }, {
          %c3_i32_5 = arith.constant 3 : i32
          %18 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %12 = arith.remsi %arg3, %c4_i32 : i32
      %c3_i32_2 = arith.constant 3 : i32
      %13 = arith.addi %arg0, %c3_i32_2 : i32
      %14 = "simt_step.switch"(%12, %13) ({
      ^bb0(%arg5: i32):
        %c3_i32_4 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_4) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_5 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %17 = arith.addi %arg0, %c0_i32_6 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg6: i32):
          %c2_i32 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %22 = "simt_step.if"(%21) ({
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_9 : i32
      %18 = arith.addi %17, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %19 = arith.addi %c8_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_10 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %17 = arith.addi %c28_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_9 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %24 = arith.muli %arg5, %c4_i32_13 : i32
          %25 = arith.addi %24, %0 : i32
          %c32_i32_14 = arith.constant 32 : i32
          %26 = arith.addi %c32_i32_14, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_15 : i32
          "simt_step.condition"(%28, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %24 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %25 = arith.addi %arg5, %c1_i32_13 : i32
          "simt_step.continue"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%23#0) : (i32) -> ()
      }, {
        %c52_i32 = arith.constant 52 : i32
        %23 = arith.addi %c52_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %25 = arith.addi %0, %c2_i32 : i32
        %26 = "simt_step.switch"(%24, %25) ({
        ^bb0(%arg4: i32):
          %c0_i32_11 = arith.constant 0 : i32
          %27 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%30: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      %21 = arith.addi %arg2, %20 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c56_i32 = arith.constant 56 : i32
    %8 = arith.addi %c56_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %10 = arith.addi %0, %c3_i32 : i32
    %11 = "simt_step.switch"(%9, %10) ({
    ^bb0(%arg2: i32):
      %c60_i32 = arith.constant 60 : i32
      %17 = arith.addi %c60_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %19 = "simt_step.switch"(%18, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %24 = arith.addi %0, %c4_i32_16 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_20 : i32
          %28 = arith.addi %27, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %29 = arith.addi %c64_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_21 : i32
          "simt_step.condition"(%31, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %27 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_16 : i32
        %25 = arith.addi %24, %0 : i32
        %c84_i32 = arith.constant 84 : i32
        %26 = arith.addi %c84_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_17 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %27 = arith.muli %arg6, %c4_i32_19 : i32
          %28 = arith.addi %27, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %29 = arith.addi %c104_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_20 : i32
          "simt_step.condition"(%31, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %27 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %28 = arith.addi %arg6, %c1_i32_19 : i32
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %25 = arith.addi %arg3, %24#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%21#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c0_i32_13 = arith.constant 0 : i32
      %c0_i32_14 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_16 : i32
        %25 = arith.addi %24, %0 : i32
        %c124_i32 = arith.constant 124 : i32
        %26 = arith.addi %c124_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_17 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %27 = arith.muli %arg6, %c4_i32_19 : i32
          %28 = arith.addi %27, %0 : i32
          %c144_i32 = arith.constant 144 : i32
          %29 = arith.addi %c144_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_20 : i32
          "simt_step.condition"(%31, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %27 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %28 = arith.addi %arg6, %c1_i32_19 : i32
          "simt_step.break"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %25 = arith.addi %arg3, %24#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_15 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %c0_i32_6 = arith.constant 0 : i32
    %14:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_9 : i32
      %18 = arith.addi %17, %0 : i32
      %c164_i32 = arith.constant 164 : i32
      %19 = arith.addi %c164_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_10 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c184_i32 = arith.constant 184 : i32
      %17 = arith.addi %c184_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32_9 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32_9 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg4: i32):
        %c3_i32_11 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_11) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c188_i32 = arith.constant 188 : i32
        %24 = arith.addi %c188_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_12 = arith.constant 1 : i32
        %26 = "simt_step.switch"(%25, %c1_i32_12) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_17 : i32
          %31 = arith.addi %30, %0 : i32
          %c192_i32 = arith.constant 192 : i32
          %32 = arith.addi %c192_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_18 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %30 = arith.addi %arg5, %arg6 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32_17 : i32
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %21 = arith.addi %arg2, %20 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_7 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %15 = arith.addi %c48_i32, %0 : i32
    %true_8 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

