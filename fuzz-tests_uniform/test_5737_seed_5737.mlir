module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c3_i32_0 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32_0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %7 = "simt_step.switch"(%6, %c0_i32_1) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_13 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_12 = arith.constant 3 : i32
          %23 = arith.addi %arg0, %c3_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %24 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32_7 = arith.constant 4 : i32
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %18 = "simt_step.switch"(%arg3, %c0_i32_8) ({
        ^bb0(%arg6: i32):
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_9 = arith.constant 1 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %21 = "simt_step.if"(%20) ({
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) : (i32) -> ()
        }, {
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %22 = arith.addi %arg0, %c0_i32_11 : i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c3_i32_2 = arith.constant 3 : i32
      %8 = arith.addi %arg0, %c3_i32_2 : i32
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      %10 = arith.remsi %arg3, %c3_i32_3 : i32
      %c4_i32 = arith.constant 4 : i32
      %11 = "simt_step.switch"(%10, %c4_i32) ({
      ^bb0(%arg5: i32):
        %c4_i32_5 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_5) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c3_i32_6 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_6) {fallthrough = false} : (i32) -> ()
      ^bb2(%17: i32):  // no predecessors
        %c3_i32_7 = arith.constant 3 : i32
        %18 = arith.remsi %arg3, %c3_i32_7 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %19 = "simt_step.switch"(%18, %c0_i32_8) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c2_i32_9 = arith.constant 2 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_14 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_13 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%arg0, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_12 = arith.constant 1 : i32
        %22 = arith.addi %arg0, %c1_i32_12 : i32
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %13 = arith.addi %arg0, %c2_i32 : i32
      %14 = "simt_step.switch"(%arg3, %13) ({
      ^bb0(%arg5: i32):
        %c3_i32_5 = arith.constant 3 : i32
        %16 = arith.remsi %arg3, %c3_i32_5 : i32
        %c2_i32_6 = arith.constant 2 : i32
        %17 = "simt_step.switch"(%16, %c2_i32_6) ({
        ^bb0(%arg6: i32):
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) {fallthrough = true} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_8 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c2_i32_4 = arith.constant 2 : i32
      %15 = arith.addi %arg0, %c2_i32_4 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %7 = "simt_step.switch"(%6, %c0_i32_0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %10 = arith.addi %c12_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %12 = "simt_step.switch"(%11, %0) ({
      ^bb0(%arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_7) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c16_i32_8 = arith.constant 16 : i32
        %20 = arith.addi %c16_i32_8, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %22 = arith.addi %0, %c0_i32_9 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %24 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.muli %arg4, %c4_i32_7 : i32
        %20 = arith.addi %19, %0 : i32
        %c20_i32 = arith.constant 20 : i32
        %21 = arith.addi %c20_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c40_i32 = arith.constant 40 : i32
        %19 = arith.addi %c40_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %23 = arith.addi %arg3, %22 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %16 = arith.addi %c44_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = "simt_step.switch"(%17, %0) ({
      ^bb0(%arg3: i32):
        %c48_i32 = arith.constant 48 : i32
        %19 = arith.addi %c48_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          %c0_i32_12 = arith.constant 0 : i32
          %30 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %c0_i32_12 = arith.constant 0 : i32
          %30 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %24 = arith.addi %c52_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        %27 = "simt_step.if"(%26) ({
          %c0_i32_12 = arith.constant 0 : i32
          %30 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %30 = arith.muli %arg5, %c4_i32_12 : i32
          %31 = arith.addi %30, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %32 = arith.addi %c56_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_13 : i32
          "simt_step.condition"(%34, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %30 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

