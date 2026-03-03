module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %1 = "simt_step.switch"(%0, %c0_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32_8 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %18 = "simt_step.if"(%17) ({
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %c2_i32_9 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_9) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_8 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %7 = "simt_step.switch"(%6, %arg0) ({
      ^bb0(%arg5: i32):
        %c2_i32_7 = arith.constant 2 : i32
        %17 = arith.addi %arg0, %c2_i32_7 : i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c2_i32_8 = arith.constant 2 : i32
        %19 = arith.remsi %arg3, %c2_i32_8 : i32
        %c3_i32_9 = arith.constant 3 : i32
        %20 = arith.addi %arg0, %c3_i32_9 : i32
        %21 = "simt_step.switch"(%19, %20) ({
        ^bb0(%arg6: i32):
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %24 = arith.addi %arg0, %c4_i32_11 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %8 = arith.addi %arg0, %c3_i32 : i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %11 = "simt_step.if"(%10) ({
        %c0_i32_7 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %18 = "simt_step.if"(%17) ({
          %c2_i32_8 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_8) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %18 = "simt_step.if"(%17) ({
          %c0_i32_9 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_9) : (i32) -> ()
        }, {
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %19 = arith.addi %arg0, %c4_i32_8 : i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      %c4_i32_4 = arith.constant 4 : i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb3(%12: i32):  // no predecessors
      %c3_i32_5 = arith.constant 3 : i32
      %13 = arith.remsi %arg3, %c3_i32_5 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg0, %c1_i32 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %28 = arith.remsi %arg3, %c4_i32_16 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %29 = arith.addi %28, %c1_i32_17 : i32
          %30 = arith.cmpi slt, %arg7, %29 : i32
          "simt_step.condition"(%30, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_16 = arith.constant 2 : i32
          %28 = arith.addi %arg0, %c2_i32_16 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32_17 : i32
          "simt_step.continue"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32_9 = arith.constant 4 : i32
        %18 = arith.addi %arg0, %c4_i32_9 : i32
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %28 = arith.remsi %arg3, %c4_i32_16 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %29 = arith.addi %28, %c1_i32_17 : i32
          %30 = arith.cmpi slt, %arg7, %29 : i32
          "simt_step.condition"(%30, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_16 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32_16 : i32
          "simt_step.yield"(%arg0, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %23 = "simt_step.if"(%22) ({
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) : (i32) -> ()
        }, {
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c3_i32_13 = arith.constant 3 : i32
        %25 = arith.remsi %arg3, %c3_i32_13 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %26 = "simt_step.switch"(%25, %c4_i32_14) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%30: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c1_i32_15 = arith.constant 1 : i32
        %27 = arith.addi %arg0, %c1_i32_15 : i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %16 = arith.addi %arg0, %c0_i32_6 : i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = "simt_step.switch"(%6, %c0_i32_0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %10 = arith.addi %c12_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_2 : i32
      %13 = "simt_step.if"(%12) ({
        %c16_i32_7 = arith.constant 16 : i32
        %28 = arith.addi %c16_i32_7, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
        %31 = "simt_step.if"(%30) ({
          %c1_i32_9 = arith.constant 1 : i32
          %32 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_10 : i32
          %30 = arith.addi %29, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %31 = arith.addi %c20_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_11 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32_10 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %15 = arith.addi %c40_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
      %18 = "simt_step.if"(%17) ({
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }, {
        %c4_i32_7 = arith.constant 4 : i32
        %28 = arith.addi %0, %c4_i32_7 : i32
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %20 = arith.addi %c44_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %22 = "simt_step.switch"(%21, %c0_i32_4) ({
      ^bb0(%arg3: i32):
        %c48_i32 = arith.constant 48 : i32
        %28 = arith.addi %c48_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_7 : i32
        %31 = "simt_step.if"(%30) ({
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) : (i32) -> ()
        }, {
          %c4_i32_11 = arith.constant 4 : i32
          %41 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %33 = arith.addi %c52_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %35 = "simt_step.switch"(%34, %c0_i32_8) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c1_i32_11 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %37 = arith.addi %c56_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_10 : i32
        %40 = "simt_step.if"(%39) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c1_i32_11 = arith.constant 1 : i32
          %41 = arith.addi %0, %c1_i32_11 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %24 = arith.addi %c60_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %26 = arith.addi %0, %c1_i32 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_11 : i32
          %33 = arith.addi %32, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %34 = arith.addi %c64_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_12 : i32
          "simt_step.condition"(%36, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %32 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %33 = arith.addi %arg5, %c1_i32_11 : i32
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %31 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

