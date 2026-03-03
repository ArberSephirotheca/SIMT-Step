module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = "simt_step.switch"(%0, %c2_i32) ({
    ^bb0(%arg4: i32):
      %c2_i32_0 = arith.constant 2 : i32
      %4 = arith.remsi %arg3, %c2_i32_0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %5 = arith.addi %arg0, %c0_i32_1 : i32
      %6 = "simt_step.switch"(%4, %5) ({
      ^bb0(%arg5: i32):
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg0, %c1_i32 : i32
        %17 = "simt_step.switch"(%arg3, %16) ({
        ^bb0(%arg6: i32):
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) {fallthrough = true} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c1_i32_11 = arith.constant 1 : i32
        %19 = arith.addi %arg0, %c1_i32_11 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_15 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_14 = arith.constant 1 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %22 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.yield"(%c1_i32_14, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_10 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_13 : i32
          %20 = arith.cmpi slt, %arg8, %19 : i32
          "simt_step.condition"(%20, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c3_i32 = arith.constant 3 : i32
          %18 = arith.addi %arg0, %c3_i32 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %19 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.continue"(%18, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%16#0, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c0_i32_4 = arith.constant 0 : i32
      %9 = arith.addi %arg0, %c0_i32_4 : i32
      "simt_step.yield"(%8#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c4_i32_5 = arith.constant 4 : i32
      %11 = arith.remsi %arg3, %c4_i32_5 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %12 = arith.addi %arg0, %c4_i32_6 : i32
      %13 = "simt_step.switch"(%11, %12) ({
      ^bb0(%arg5: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %17 = "simt_step.if"(%16) ({
          %c4_i32_16 = arith.constant 4 : i32
          %25 = arith.addi %arg0, %c4_i32_16 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_11 = arith.constant 4 : i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %20 = "simt_step.if"(%19) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_14 : i32
        %23 = "simt_step.if"(%22) ({
          %c0_i32_16 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_16) : (i32) -> ()
        }, {
          %c0_i32_16 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c2_i32_15 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_15) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb3(%14: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_10 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %16 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg7: i32):
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32_9 = arith.constant 4 : i32
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %c4_i32_5 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_5 : i32
      %15 = arith.addi %14, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %16 = arith.addi %c8_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_6 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %17 = arith.muli %arg5, %c4_i32_8 : i32
        %18 = arith.addi %17, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %19 = arith.addi %c28_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_9 : i32
        "simt_step.condition"(%21, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.addi %0, %c2_i32 : i32
        %18 = arith.addi %arg4, %17 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %19 = arith.addi %arg5, %c1_i32_8 : i32
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %15 = arith.addi %arg2, %14#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %8 = arith.addi %c48_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_3 : i32
    %11 = "simt_step.if"(%10) ({
      %c52_i32 = arith.constant 52 : i32
      %14 = arith.addi %c52_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_5 : i32
      %17 = "simt_step.if"(%16) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %19 = arith.muli %arg3, %c4_i32_9 : i32
          %20 = arith.addi %19, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %21 = arith.addi %c56_i32, %20 : i32
          %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %23 = arith.cmpi ne, %22, %c0_i32_10 : i32
          "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %19 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%18#0) : (i32) -> ()
      }, {
        %c76_i32 = arith.constant 76 : i32
        %18 = arith.addi %c76_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %20 = arith.addi %0, %c3_i32 : i32
        %21 = "simt_step.switch"(%19, %20) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.addi %0, %c4_i32_7 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %15 = arith.muli %arg3, %c4_i32_8 : i32
        %16 = arith.addi %15, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %17 = arith.addi %c80_i32, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_9 : i32
        "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %15 = arith.addi %arg2, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.break"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%14#0) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

