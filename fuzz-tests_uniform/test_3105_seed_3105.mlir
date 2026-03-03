module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = arith.addi %arg0, %c1_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_10 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32_11 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %15 = "simt_step.if"(%14) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %17 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_11 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32_11 : i32
        "simt_step.continue"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c0_i32_2 = arith.constant 0 : i32
      %6 = arith.addi %arg0, %c0_i32_2 : i32
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_10 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32_11 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %15 = "simt_step.if"(%14) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_11 = arith.constant 4 : i32
        %16 = arith.addi %arg0, %c4_i32_11 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_12 : i32
        "simt_step.yield"(%15, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c0_i32_5 = arith.constant 0 : i32
      %9 = arith.addi %arg0, %c0_i32_5 : i32
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_10 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32_11 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_10 : i32
        %c2_i32 = arith.constant 2 : i32
        %15 = arith.addi %arg0, %c2_i32 : i32
        %16 = "simt_step.switch"(%14, %15) ({
        ^bb0(%arg7: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          %19 = arith.addi %arg0, %c2_i32_13 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb2(%20: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb3(%21: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          %22 = arith.addi %arg0, %c2_i32_15 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32_11 = arith.constant 1 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_12 : i32
        "simt_step.break"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%12: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_10 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32_11 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %15 = "simt_step.if"(%14) ({
          %c1_i32_13 = arith.constant 1 : i32
          %17 = arith.addi %arg0, %c1_i32_13 : i32
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32_12 : i32
        "simt_step.yield"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %23 = arith.addi %c12_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
      %26 = "simt_step.if"(%25) ({
        %c16_i32_6 = arith.constant 16 : i32
        %27 = arith.addi %c16_i32_6, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = simt_step.subgroup_id
        %30 = arith.index_cast %29 : index to i32
        %31 = "simt_step.switch"(%28, %30) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %27 = arith.addi %c20_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_6 : i32
        %30 = "simt_step.if"(%29) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) : (i32) -> ()
    }, {
      %c24_i32 = arith.constant 24 : i32
      %23 = arith.addi %c24_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %25 = "simt_step.switch"(%24, %c4_i32_5) ({
      ^bb0(%arg2: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_13 : i32
          %31 = arith.addi %30, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %32 = arith.addi %c28_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_14 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_13 : i32
          %31 = arith.addi %30, %0 : i32
          %c48_i32_14 = arith.constant 48 : i32
          %32 = arith.addi %c48_i32_14, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_15 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%25) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %11 = arith.addi %c68_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_12 : i32
        %31 = arith.addi %30, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %32 = arith.addi %c72_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_13 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %30 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %25 = arith.addi %c92_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = "simt_step.switch"(%26, %0) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %30 = arith.addi %c96_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_12 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_19 : i32
          %40 = arith.addi %39, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %41 = arith.addi %c100_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_20 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_19 : i32
          %40 = arith.addi %39, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %41 = arith.addi %c120_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_20 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_12 : i32
        %31 = arith.addi %30, %0 : i32
        %c140_i32 = arith.constant 140 : i32
        %32 = arith.addi %c140_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_13 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c160_i32 = arith.constant 160 : i32
        %30 = arith.addi %c160_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_12 : i32
        %33 = "simt_step.if"(%32) ({
          %c1_i32_13 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32_13 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %36 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %34 = arith.addi %arg3, %33 : i32
        %c1_i32 = arith.constant 1 : i32
        %35 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%34, %35) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c164_i32 = arith.constant 164 : i32
    %18 = arith.addi %c164_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %20 = "simt_step.switch"(%19, %0) ({
    ^bb0(%arg2: i32):
      %c168_i32 = arith.constant 168 : i32
      %23 = arith.addi %c168_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %25 = arith.addi %0, %c1_i32 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_16 : i32
          %45 = arith.addi %44, %0 : i32
          %c172_i32 = arith.constant 172 : i32
          %46 = arith.addi %c172_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_17 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_16 : i32
          "simt_step.continue"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c192_i32 = arith.constant 192 : i32
        %38 = arith.addi %c192_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
        %41 = "simt_step.if"(%40) ({
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) : (i32) -> ()
        }, {
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_16 : i32
          %45 = arith.addi %44, %0 : i32
          %c196_i32 = arith.constant 196 : i32
          %46 = arith.addi %c196_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_17 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_16 : i32
          "simt_step.break"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c216_i32 = arith.constant 216 : i32
      %28 = arith.addi %c216_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_6 = arith.constant 4 : i32
      %30 = "simt_step.switch"(%29, %c4_i32_6) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_14 : i32
          %47 = arith.addi %46, %0 : i32
          %c220_i32 = arith.constant 220 : i32
          %48 = arith.addi %c220_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_15 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32_14 : i32
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c240_i32 = arith.constant 240 : i32
        %38 = arith.addi %c240_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
        %41 = "simt_step.if"(%40) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_14 = arith.constant 4 : i32
          %46 = arith.addi %0, %c4_i32_14 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c244_i32 = arith.constant 244 : i32
        %43 = arith.addi %c244_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = "simt_step.switch"(%44, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_14 = arith.constant 0 : i32
          %46 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%46) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          %48 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%48) {fallthrough = true} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c248_i32 = arith.constant 248 : i32
      %32 = arith.addi %c248_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_8 : i32
      %35 = "simt_step.if"(%34) ({
        %c252_i32 = arith.constant 252 : i32
        %36 = arith.addi %c252_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %38 = "simt_step.switch"(%37, %c3_i32) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          %41 = arith.addi %0, %c3_i32_10 : i32
          "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c0_i32_11 = arith.constant 0 : i32
          %43 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %45 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %21 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

