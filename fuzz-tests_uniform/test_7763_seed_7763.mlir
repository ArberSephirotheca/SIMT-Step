module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c4_i32_0 = arith.constant 4 : i32
      %5 = "simt_step.switch"(%4, %c4_i32_0) ({
      ^bb0(%arg5: i32):
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %12 = arith.remsi %arg3, %c2_i32 : i32
        %13 = "simt_step.switch"(%12, %arg0) ({
        ^bb0(%arg6: i32):
          %c2_i32_11 = arith.constant 2 : i32
          %20 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %16 = "simt_step.if"(%15) ({
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %arg0, %c1_i32_11 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %c0_i32_11 = arith.constant 0 : i32
          %20 = arith.addi %arg0, %c0_i32_11 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_7 = arith.constant 2 : i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb3(%17: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_12 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_10 = arith.constant 2 : i32
        %19 = arith.addi %arg0, %c2_i32_10 : i32
        "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32_10 : i32
          %14 = arith.cmpi slt, %arg8, %13 : i32
          "simt_step.condition"(%14, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c3_i32_9 = arith.constant 3 : i32
          %12 = arith.addi %arg0, %c3_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %13 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.yield"(%12, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %11 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.continue"(%10#0, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c3_i32_3 = arith.constant 3 : i32
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32_6 = arith.constant 3 : i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%c3_i32_6, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
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
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %18 = "simt_step.switch"(%17, %c0_i32_4) ({
      ^bb0(%arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.addi %0, %c0_i32_6 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c16_i32_1 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32_1, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_2 : i32
    %13 = "simt_step.if"(%12) ({
      %c20_i32 = arith.constant 20 : i32
      %16 = arith.addi %c20_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = "simt_step.switch"(%17, %0) ({
      ^bb0(%arg2: i32):
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %20 = arith.addi %c24_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
        %23 = "simt_step.if"(%22) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %25 = arith.addi %c28_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %27 = "simt_step.switch"(%26, %c0_i32_6) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %32 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_11 : i32
          %31 = arith.addi %30, %0 : i32
          %c32_i32_12 = arith.constant 32 : i32
          %32 = arith.addi %c32_i32_12, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_13 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

