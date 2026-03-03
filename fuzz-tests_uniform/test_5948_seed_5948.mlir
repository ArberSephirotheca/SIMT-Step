module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %13 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %13, %c1_i32 : i32
      %15 = arith.cmpi slt, %arg5, %14 : i32
      "simt_step.condition"(%15, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%arg0, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %6 = arith.select %5, %1, %2#0 : i32
    %c3_i32 = arith.constant 3 : i32
    %7 = arith.remsi %arg3, %c3_i32 : i32
    %8 = "simt_step.switch"(%7, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %14 = "simt_step.if"(%13) ({
        %c3_i32_8 = arith.constant 3 : i32
        %21 = arith.remsi %arg3, %c3_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %22 = arith.addi %arg0, %c1_i32_9 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %27 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %24 = arith.addi %arg0, %c0_i32_10 : i32
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_12 : i32
          %24 = arith.cmpi slt, %arg6, %23 : i32
          "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32_11 : i32
          "simt_step.continue"(%arg0, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_10 = arith.constant 3 : i32
        "simt_step.yield"(%21#0) : (i32) -> ()
      }) : (i1) -> i32
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %17 = "simt_step.if"(%16) ({
        %c3_i32_8 = arith.constant 3 : i32
        %21 = arith.remsi %arg3, %c3_i32_8 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %22 = arith.addi %arg0, %c4_i32_9 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg5: i32):
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %25 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.addi %arg0, %c4_i32_11 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_12 : i32
          %25 = arith.cmpi slt, %arg6, %24 : i32
          "simt_step.condition"(%25, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c2_i32 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %24 = arith.addi %arg6, %c1_i32_11 : i32
          "simt_step.yield"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32_10 = arith.constant 4 : i32
        %22 = arith.addi %arg0, %c4_i32_10 : i32
        "simt_step.yield"(%21#0) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_11 : i32
          %24 = arith.cmpi slt, %arg6, %23 : i32
          "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32_10 : i32
          "simt_step.yield"(%arg0, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_12 : i32
          %24 = arith.cmpi slt, %arg6, %23 : i32
          "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32_11 : i32
          "simt_step.continue"(%arg0, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_10 = arith.constant 1 : i32
        "simt_step.yield"(%21#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %12 = arith.select %11, %6, %8 : i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %20 = arith.addi %c12_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c16_i32 = arith.constant 16 : i32
        %27 = arith.addi %c16_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_4 : i32
        %30 = "simt_step.if"(%29) ({
          %c1_i32_5 = arith.constant 1 : i32
          %31 = arith.addi %0, %c1_i32_5 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %27 = arith.addi %c20_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_4 : i32
        %30 = "simt_step.if"(%29) ({
          %c4_i32_5 = arith.constant 4 : i32
          %31 = arith.addi %0, %c4_i32_5 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %10 = arith.addi %c32_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c24_i32 = arith.constant 24 : i32
    %12 = arith.addi %c24_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %14 = arith.addi %0, %c1_i32 : i32
    %15 = "simt_step.switch"(%13, %14) ({
    ^bb0(%arg2: i32):
      %c3_i32 = arith.constant 3 : i32
      %20 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      %22 = arith.addi %0, %c3_i32_3 : i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %24 = arith.addi %c28_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_4 = arith.constant 1 : i32
      %26 = arith.addi %0, %c1_i32_4 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_12 : i32
          %36 = arith.addi %35, %0 : i32
          %c32_i32_13 = arith.constant 32 : i32
          %37 = arith.addi %c32_i32_13, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_14 : i32
          "simt_step.condition"(%39, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %35 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %36 = arith.addi %arg5, %c1_i32_12 : i32
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %31 = arith.addi %c52_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_10 = arith.constant 1 : i32
        %33 = arith.addi %0, %c1_i32_10 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg4: i32):
          %c1_i32_12 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32_12 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c3_i32_6 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32_6) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %16 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %18 = simt_step.subgroup_id
    %19 = arith.index_cast %18 : index to i32
    return
  }
}

