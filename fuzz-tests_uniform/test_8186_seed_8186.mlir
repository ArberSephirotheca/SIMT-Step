module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = "simt_step.switch"(%0, %c2_i32) ({
    ^bb0(%arg4: i32):
      %c4_i32_0 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32_0 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg0, %c1_i32 : i32
      %6 = "simt_step.switch"(%4, %5) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %16 = "simt_step.if"(%15) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %17 = arith.addi %arg0, %c4_i32_8 : i32
        "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c4_i32_9 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_9) {fallthrough = true} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %24 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %25 = arith.addi %24, %c1_i32_14 : i32
          %26 = arith.cmpi slt, %arg7, %25 : i32
          "simt_step.condition"(%26, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_13 = arith.constant 3 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %24 = arith.addi %arg7, %c1_i32_14 : i32
          "simt_step.break"(%c3_i32_13, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%20#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%21: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %23 = "simt_step.if"(%22) ({
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) : (i32) -> ()
        }, {
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %9 = "simt_step.if"(%8) ({
        %c2_i32_7 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_7 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %16 = "simt_step.switch"(%15, %c4_i32_8) ({
        ^bb0(%arg5: i32):
          %c3_i32 = arith.constant 3 : i32
          %17 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %16 = "simt_step.if"(%15) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %12 = "simt_step.if"(%11) ({
        "simt_step.yield"(%arg0) : (i32) -> ()
      }, {
        %c2_i32_7 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_7 : i32
        %16 = "simt_step.switch"(%15, %arg0) ({
        ^bb0(%arg5: i32):
          %c3_i32 = arith.constant 3 : i32
          %17 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          %19 = arith.addi %arg0, %c2_i32_9 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb2(%20: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %c2_i32_8 = arith.constant 2 : i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32_3 = arith.constant 2 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_8 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_12 : i32
          %19 = arith.cmpi slt, %arg8, %18 : i32
          "simt_step.condition"(%19, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %17 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.yield"(%c1_i32_11, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_9 = arith.constant 0 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32_10 : i32
        "simt_step.yield"(%15#0, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32_6 = arith.constant 1 : i32
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_9 : i32
      %17 = arith.addi %16, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_10 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_12 : i32
        %20 = arith.addi %19, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %21 = arith.addi %c28_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_13 : i32
        "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %19 = simt_step.subgroup_id
        %20 = arith.index_cast %19 : index to i32
        %21 = arith.addi %arg4, %20 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %22 = arith.addi %arg5, %c1_i32_12 : i32
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      %17 = arith.addi %arg2, %16#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_9 : i32
      %17 = arith.addi %16, %0 : i32
      %c48_i32_10 = arith.constant 48 : i32
      %18 = arith.addi %c48_i32_10, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_11 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_9 = arith.constant 0 : i32
      %16 = arith.addi %0, %c0_i32_9 : i32
      %17 = arith.addi %arg2, %16 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %11 = arith.addi %c68_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %13 = "simt_step.switch"(%12, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_18 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_18 : i32
        %29 = arith.addi %28, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %30 = arith.addi %c72_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_19 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      "simt_step.yield"(%16#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %18 = arith.addi %c92_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_12 : i32
      %21 = "simt_step.if"(%20) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_21 : i32
          %30 = arith.addi %29, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %31 = arith.addi %c96_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_22 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_20 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c116_i32 = arith.constant 116 : i32
      %23 = arith.addi %c116_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %25 = "simt_step.switch"(%24, %c0_i32_13) ({
      ^bb0(%arg3: i32):
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_27 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_27 : i32
          %41 = arith.addi %40, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %42 = arith.addi %c120_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_28 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_28 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32_27 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32_27 : i32
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_20 = arith.constant true
        "simt_step.yield"(%28#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c0_i32_21 = arith.constant 0 : i32
        %c0_i32_22 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_21, %c0_i32_22) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_27 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_27 : i32
          %41 = arith.addi %40, %0 : i32
          %c140_i32 = arith.constant 140 : i32
          %42 = arith.addi %c140_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_28 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_28 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32_27 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32_27 : i32
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_23 = arith.constant true
        "simt_step.yield"(%30#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c160_i32 = arith.constant 160 : i32
        %32 = arith.addi %c160_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %34 = "simt_step.switch"(%33, %c1_i32) ({
        ^bb0(%arg4: i32):
          %c4_i32_27 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_27) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %41 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c2_i32_28 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_24 = arith.constant true
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb3(%35: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %36 = arith.addi %c164_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_25 = arith.constant 2 : i32
        %38 = arith.addi %0, %c2_i32_25 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg4: i32):
          %c2_i32_27 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32_27 : i32
          "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c0_i32_28 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_28 : i32
          "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %c4_i32_29 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_29) {fallthrough = true} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_26 = arith.constant true
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_14 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c0_i32_15 = arith.constant 0 : i32
      %c0_i32_16 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_18 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_18 : i32
        %29 = arith.addi %28, %0 : i32
        %c168_i32 = arith.constant 168 : i32
        %30 = arith.addi %c168_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_19 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c188_i32 = arith.constant 188 : i32
        %28 = arith.addi %c188_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_18 : i32
        %31 = "simt_step.if"(%30) ({
          %c3_i32 = arith.constant 3 : i32
          %34 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %c4_i32_19 = arith.constant 4 : i32
          %34 = arith.addi %0, %c4_i32_19 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %32 = arith.addi %arg3, %31 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_17 = arith.constant true
      "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_7 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %14 = arith.addi %c48_i32, %0 : i32
    %true_8 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

