module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %true_4 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %13 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %13 = "simt_step.if"(%12) ({
        %true_5 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %15 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) : (i32) -> ()
      }, {
        %true_5 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %15 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
    %c2_i32 = arith.constant 2 : i32
    %6 = arith.remsi %arg3, %c2_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %7 = "simt_step.switch"(%6, %c3_i32) ({
    ^bb0(%arg4: i32):
      %c3_i32_4 = arith.constant 3 : i32
      %12 = arith.remsi %arg3, %c3_i32_4 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg0, %c1_i32 : i32
      %14 = "simt_step.switch"(%12, %13) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %29 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %30 = arith.addi %29, %c1_i32_12 : i32
          %31 = arith.cmpi slt, %arg7, %30 : i32
          "simt_step.condition"(%31, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_12 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%arg0, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c1_i32_9 = arith.constant 1 : i32
        %23 = arith.addi %arg0, %c1_i32_9 : i32
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb3(%25: i32):  // no predecessors
        %c2_i32_10 = arith.constant 2 : i32
        %26 = arith.remsi %arg3, %c2_i32_10 : i32
        %c3_i32_11 = arith.constant 3 : i32
        %27 = arith.addi %arg0, %c3_i32_11 : i32
        %28 = "simt_step.switch"(%26, %27) ({
        ^bb0(%arg6: i32):
          %c0_i32_12 = arith.constant 0 : i32
          %29 = arith.addi %arg0, %c0_i32_12 : i32
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          %31 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %17 = "simt_step.if"(%16) ({
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          %c1_i32_8 = arith.constant 1 : i32
          %23 = arith.addi %arg0, %c1_i32_8 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_7 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %22 = "simt_step.if"(%21) ({
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }, {
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %9 = arith.addi %c64_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %11 = arith.select %10, %5, %7 : i32
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
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_6 : i32
      "simt_step.if"(%15) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %8 = "simt_step.switch"(%7, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_11 : i32
        %26 = arith.addi %25, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %27 = arith.addi %c16_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c36_i32 = arith.constant 36 : i32
        %25 = arith.addi %c36_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_11 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        %29 = arith.addi %arg3, %28 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c2_i32_8 = arith.constant 2 : i32
      %15 = arith.addi %0, %c2_i32_8 : i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %17 = arith.addi %c40_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_9 = arith.constant 2 : i32
      %19 = "simt_step.switch"(%18, %c2_i32_9) ({
      ^bb0(%arg3: i32):
        %c44_i32 = arith.constant 44 : i32
        %25 = arith.addi %c44_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %27 = arith.addi %0, %c0_i32_11 : i32
        %28 = "simt_step.switch"(%26, %27) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %33 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %30 = arith.addi %c48_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        %32 = "simt_step.switch"(%31, %c4_i32_12) ({
        ^bb0(%arg4: i32):
          %c0_i32_14 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb3(%20: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %21 = arith.addi %c52_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_10 : i32
      %24 = "simt_step.if"(%23) ({
        %c56_i32 = arith.constant 56 : i32
        %25 = arith.addi %c56_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_11 : i32
        %28 = "simt_step.if"(%27) ({
          %c3_i32 = arith.constant 3 : i32
          %29 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %25 = arith.addi %c60_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %0, %c1_i32 : i32
        %28 = "simt_step.switch"(%26, %27) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c80_i32 = arith.constant 80 : i32
    %9 = arith.addi %c80_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c64_i32 = arith.constant 64 : i32
      %15 = arith.addi %c64_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c84_i32 = arith.constant 84 : i32
      %13 = arith.addi %c84_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = "simt_step.switch"(%14, %0) ({
      ^bb0(%arg4: i32):
        %c88_i32 = arith.constant 88 : i32
        %22 = arith.addi %c88_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_9 : i32
        %25 = "simt_step.if"(%24) ({
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c4_i32_10 = arith.constant 4 : i32
        %27 = arith.addi %0, %c4_i32_10 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %16 = arith.addi %arg2, %15 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_7 : i32
      %19 = arith.addi %c96_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_8 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c92_i32 = arith.constant 92 : i32
      %15 = arith.addi %c92_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg2, %c1_i32 : i32
      %c1_i32_6 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32_6 : i32
      %true_7 = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_8 : i32
      %16 = arith.addi %c112_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_9 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

