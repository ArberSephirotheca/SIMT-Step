module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c3_i32_0 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32_0 : i32
      %7 = "simt_step.switch"(%6, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %19 = "simt_step.if"(%18) ({
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) : (i32) -> ()
        }, {
          %c1_i32_13 = arith.constant 1 : i32
          %27 = arith.addi %arg0, %c1_i32_13 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_8 = arith.constant 1 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %22 = "simt_step.if"(%21) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.addi %arg0, %c4_i32_10 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %26 = "simt_step.if"(%25) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_12 = arith.constant 3 : i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %8 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %11 = "simt_step.if"(%10) ({
        %c1_i32_7 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32_7 : i32
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %19 = "simt_step.if"(%18) ({
          %c4_i32_9 = arith.constant 4 : i32
          %21 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %c0_i32_9 = arith.constant 0 : i32
          %21 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_8 = arith.constant 2 : i32
        %20 = arith.addi %arg0, %c2_i32_8 : i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %13 = arith.remsi %arg3, %c4_i32 : i32
      %c3_i32_2 = arith.constant 3 : i32
      %14 = "simt_step.switch"(%13, %c3_i32_2) ({
      ^bb0(%arg5: i32):
        %c3_i32_7 = arith.constant 3 : i32
        %18 = arith.addi %arg0, %c3_i32_7 : i32
        "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %21 = "simt_step.if"(%20) ({
          %c0_i32_11 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_11) : (i32) -> ()
        }, {
          %c2_i32_11 = arith.constant 2 : i32
          %25 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_9 = arith.constant 2 : i32
        %22 = arith.addi %arg0, %c2_i32_9 : i32
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c1_i32_10 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_10) {fallthrough = true} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb3(%15: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %18 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %19 = arith.addi %18, %c1_i32_8 : i32
        %20 = arith.cmpi slt, %arg6, %19 : i32
        "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %18 = arith.addi %arg0, %c0_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32_6 = arith.constant 4 : i32
      %17 = arith.addi %arg0, %c4_i32_6 : i32
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.addi %0, %c0_i32_0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_6 : i32
      %17 = arith.addi %16, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_7 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_9 : i32
        %20 = arith.addi %19, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %21 = arith.addi %c28_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_10 : i32
        "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %19 = arith.addi %arg4, %0 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %20 = arith.addi %arg5, %c1_i32_9 : i32
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %17 = arith.addi %arg2, %16#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %7 = arith.addi %c16_i32, %0 : i32
    %true_3 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %9 = arith.addi %c48_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %11 = simt_step.subgroup_id
    %12 = arith.index_cast %11 : index to i32
    %13 = "simt_step.switch"(%10, %12) ({
    ^bb0(%arg2: i32):
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_10 : i32
        %23 = arith.addi %22, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %24 = arith.addi %c52_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_11 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %25 = arith.muli %arg6, %c4_i32_13 : i32
          %26 = arith.addi %25, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %27 = arith.addi %c72_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_14 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %25 = arith.addi %arg5, %arg6 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %26 = arith.addi %arg6, %c1_i32_13 : i32
          "simt_step.break"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %23 = arith.addi %arg3, %22#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %19 = arith.addi %c92_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %22 = arith.addi %c96_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %24 = "simt_step.switch"(%23, %c4_i32_10) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %30 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          %34 = arith.addi %0, %c4_i32_14 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %26 = arith.addi %c100_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_12 : i32
        %29 = "simt_step.if"(%28) ({
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          %30 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %0 : i32
    %true_5 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

