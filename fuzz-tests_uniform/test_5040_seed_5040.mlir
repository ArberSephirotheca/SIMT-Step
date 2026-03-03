module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %c2_i32_0 = arith.constant 2 : i32
      %7 = "simt_step.switch"(%6, %c2_i32_0) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_12 : i32
          %20 = arith.cmpi slt, %arg7, %19 : i32
          "simt_step.condition"(%20, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %18 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.yield"(%arg0, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_8 = arith.constant 2 : i32
        %15 = arith.addi %arg0, %c2_i32_8 : i32
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_12 : i32
          %20 = arith.cmpi slt, %arg7, %19 : i32
          "simt_step.condition"(%20, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %18 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.yield"(%arg0, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32_1 = arith.constant 1 : i32
      %8 = arith.addi %arg0, %c1_i32_1 : i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c2_i32_2 = arith.constant 2 : i32
      %10 = arith.remsi %arg3, %c2_i32_2 : i32
      %11 = "simt_step.switch"(%10, %arg0) ({
      ^bb0(%arg5: i32):
        %c1_i32_6 = arith.constant 1 : i32
        %14 = arith.addi %arg0, %c1_i32_6 : i32
        "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_12 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_11 = arith.constant 3 : i32
          %20 = arith.addi %arg0, %c3_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32_9 = arith.constant 4 : i32
        %17 = arith.addi %arg0, %c4_i32_9 : i32
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c4_i32_10 = arith.constant 4 : i32
        %19 = arith.addi %arg0, %c4_i32_10 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c2_i32_3 = arith.constant 2 : i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb3(%12: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32_7 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %15 = "simt_step.if"(%14) ({
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) : (i32) -> ()
        }, {
          %c4_i32_9 = arith.constant 4 : i32
          %18 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %16 = arith.addi %arg0, %c0_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.yield"(%15, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
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
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %16 = arith.muli %arg5, %c4_i32_8 : i32
        %17 = arith.addi %16, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %18 = arith.addi %c28_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_9 : i32
        "simt_step.condition"(%20, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %16 = arith.addi %arg4, %arg5 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %17 = arith.addi %arg5, %c1_i32_8 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %14 = arith.addi %arg2, %13#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
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
    %10 = "simt_step.switch"(%9, %0) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %13 = arith.addi %c52_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %15 = "simt_step.switch"(%14, %c4_i32_5) ({
      ^bb0(%arg3: i32):
        %c56_i32 = arith.constant 56 : i32
        %29 = arith.addi %c56_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = "simt_step.switch"(%30, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c4_i32_11 = arith.constant 4 : i32
        %33 = arith.addi %0, %c4_i32_11 : i32
        "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %35 = arith.addi %c60_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }, {
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %40 = arith.addi %c64_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_13 : i32
        %43 = "simt_step.if"(%42) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %17 = arith.addi %c68_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = "simt_step.switch"(%18, %0) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %29 = arith.addi %c72_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = "simt_step.switch"(%30, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %33 = arith.addi %c76_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_11 : i32
        %36 = "simt_step.if"(%35) ({
          %c3_i32 = arith.constant 3 : i32
          %42 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %42 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %38 = arith.addi %c80_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
        %41 = "simt_step.if"(%40) ({
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %21 = arith.addi %c84_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = "simt_step.switch"(%22, %0) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %30 = arith.addi %c88_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_10 : i32
        %33 = "simt_step.if"(%32) ({
          %c3_i32 = arith.constant 3 : i32
          %34 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %25 = arith.addi %c92_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %27 = arith.addi %0, %c1_i32 : i32
      %28 = "simt_step.switch"(%26, %27) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %29 = arith.addi %c96_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = "simt_step.switch"(%30, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c3_i32_15 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_15) {fallthrough = true} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %33 = arith.addi %c100_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_11 : i32
        %36 = "simt_step.if"(%35) ({
          %c0_i32_15 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c1_i32_15 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_15 : i32
          %40 = arith.addi %39, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %41 = arith.addi %c104_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32_15 : i32
          "simt_step.break"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

