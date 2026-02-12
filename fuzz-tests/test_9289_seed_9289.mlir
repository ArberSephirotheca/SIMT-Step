module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c2_i32_3 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32_3) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %0, %5 : i32
    %c3_i32 = arith.constant 3 : i32
    %8 = arith.remsi %arg3, %c3_i32 : i32
    %9 = "simt_step.switch"(%8, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %21 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %22 = arith.addi %21, %c1_i32_7 : i32
        %23 = arith.cmpi slt, %arg6, %22 : i32
        "simt_step.condition"(%23, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_10 : i32
          %25 = arith.cmpi slt, %arg8, %24 : i32
          "simt_step.condition"(%25, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c2_i32_10 = arith.constant 2 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %23 = arith.addi %arg8, %c1_i32_11 : i32
          "simt_step.yield"(%c2_i32_10, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_9 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.yield"(%21#0, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c2_i32_5 = arith.constant 2 : i32
      %16 = arith.remsi %arg3, %c2_i32_5 : i32
      %17 = "simt_step.switch"(%16, %arg0) ({
      ^bb0(%arg5: i32):
        %21 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c3_i32_7 = arith.constant 3 : i32
        %23 = arith.remsi %arg3, %c3_i32_7 : i32
        %24 = "simt_step.switch"(%23, %arg0) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          %29 = arith.addi %arg0, %c1_i32_8 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c3_i32_6 = arith.constant 3 : i32
      %19 = arith.remsi %arg3, %c3_i32_6 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = "simt_step.switch"(%19, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.addi %arg0, %c0_i32_7 : i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_10 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %25 = arith.addi %arg0, %c1_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %11 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %13 = arith.select %12, %7, %9 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %8 = arith.addi %c8_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_5 : i32
      "simt_step.if"(%10) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c1_i32 = arith.constant 1 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_5 : i32
      %9 = arith.addi %8, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %10 = arith.addi %c12_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_6 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c32_i32 = arith.constant 32 : i32
      %8 = arith.addi %c32_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %10 = arith.addi %0, %c4_i32_5 : i32
      %11 = "simt_step.switch"(%9, %10) ({
      ^bb0(%arg4: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32_14 : i32
          %22 = arith.addi %21, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %23 = arith.addi %c36_i32, %22 : i32
          %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %25 = arith.cmpi ne, %24, %c0_i32_15 : i32
          "simt_step.condition"(%25, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %21 = arith.addi %arg5, %arg6 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32_14 : i32
          %true_15 = arith.constant true
          "simt_step.yield"(%21, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32_14 : i32
          %22 = arith.addi %21, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %23 = arith.addi %c56_i32, %22 : i32
          %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %25 = arith.cmpi ne, %24, %c0_i32_15 : i32
          "simt_step.condition"(%25, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %21 = arith.addi %arg5, %arg6 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32_14 : i32
          %true_15 = arith.constant true
          "simt_step.yield"(%21, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %12 = arith.addi %arg2, %11 : i32
      %c1_i32_6 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32_6 : i32
      %true = arith.constant true
      %c32_i32_7 = arith.constant 32 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_8 : i32
      %15 = arith.addi %c32_i32_7, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_9 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_5 : i32
      %9 = arith.addi %8, %0 : i32
      %c76_i32 = arith.constant 76 : i32
      %10 = arith.addi %c76_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_6 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %15 = arith.muli %arg5, %c4_i32_10 : i32
        %16 = arith.addi %15, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %17 = arith.addi %c96_i32, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_11 : i32
        "simt_step.condition"(%19, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c116_i32 = arith.constant 116 : i32
        %15 = arith.addi %c116_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %17 = simt_step.lane_id
        %18 = arith.index_cast %17 : index to i32
        %19 = "simt_step.switch"(%16, %18) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %20 = arith.addi %c48_i32, %0 : i32
        %true_11 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %22 = arith.addi %arg4, %19 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %23 = arith.addi %arg5, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %24 = arith.muli %arg5, %c4_i32_14 : i32
        %25 = arith.addi %c64_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_15 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %9 = arith.addi %arg2, %8#0 : i32
      %c1_i32_7 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32_7 : i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_8 : i32
      %12 = arith.addi %c80_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_9 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

