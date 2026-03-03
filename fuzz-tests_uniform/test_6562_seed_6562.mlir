module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
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
      %c4_i32 = arith.constant 4 : i32
      %13 = arith.addi %arg0, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %6 = arith.select %5, %1, %2#0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %8 = "simt_step.if"(%7) ({
      %c3_i32 = arith.constant 3 : i32
      %13 = arith.remsi %arg3, %c3_i32 : i32
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg4: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %18 = "simt_step.if"(%17) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c3_i32_12 = arith.constant 3 : i32
          %27 = arith.addi %arg0, %c3_i32_12 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %20 = arith.remsi %arg3, %c2_i32 : i32
        %21 = "simt_step.switch"(%20, %arg0) ({
        ^bb0(%arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.addi %arg0, %c4_i32_12 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_12 : i32
          %29 = arith.cmpi slt, %arg6, %28 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_12 = arith.constant 1 : i32
          %27 = arith.addi %arg6, %c1_i32_12 : i32
          "simt_step.continue"(%arg0, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_11 = arith.constant 1 : i32
        %26 = arith.addi %arg0, %c1_i32_11 : i32
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32_6 = arith.constant 3 : i32
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %13 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = "simt_step.switch"(%13, %c1_i32) ({
      ^bb0(%arg4: i32):
        %c1_i32_6 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %21 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32_12 : i32
          %23 = arith.cmpi slt, %arg6, %22 : i32
          "simt_step.condition"(%23, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c2_i32_11 = arith.constant 2 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %21 = arith.addi %arg6, %c1_i32_12 : i32
          "simt_step.yield"(%c2_i32_11, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_9 = arith.constant 3 : i32
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      %15 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%14) : (i32) -> ()
    }) : (i1) -> i32
    %true_4 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.addi %0, %c0_i32_0 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c0_i32_8 = arith.constant 0 : i32
      %20 = arith.addi %0, %c0_i32_8 : i32
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %22 = arith.addi %c12_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_9 : i32
      %25 = "simt_step.if"(%24) ({
        %c16_i32 = arith.constant 16 : i32
        %33 = arith.addi %c16_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_15 : i32
        %36 = "simt_step.if"(%35) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %c0_i32_16 = arith.constant 0 : i32
          %37 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %33 = arith.addi %c20_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_15 : i32
        %36 = "simt_step.if"(%35) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_15 : i32
        %34 = arith.addi %33, %0 : i32
        %c24_i32 = arith.constant 24 : i32
        %35 = arith.addi %c24_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_16 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c44_i32 = arith.constant 44 : i32
        %33 = arith.addi %c44_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_15 : i32
        %36 = "simt_step.if"(%35) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        %37 = arith.addi %arg3, %36 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%27#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c48_i32_13 = arith.constant 48 : i32
      %29 = arith.addi %c48_i32_13, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_14 : i32
      %32 = "simt_step.if"(%31) ({
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %34 = arith.muli %arg4, %c4_i32_18 : i32
          %35 = arith.addi %34, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %36 = arith.addi %c52_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_19 : i32
          "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %34 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%33#0) : (i32) -> ()
      }, {
        %c4_i32_15 = arith.constant 4 : i32
        %33 = arith.addi %0, %c4_i32_15 : i32
        "simt_step.yield"(%33) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_8 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_8 : i32
      %21 = arith.addi %20, %0 : i32
      %c72_i32 = arith.constant 72 : i32
      %22 = arith.addi %c72_i32, %21 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_9 : i32
      "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %20 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_4 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %12 = arith.addi %c48_i32, %0 : i32
    %true_5 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c92_i32 = arith.constant 92 : i32
    %14 = arith.addi %c92_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_6 = arith.constant 0 : i32
    %16 = arith.cmpi ne, %15, %c0_i32_6 : i32
    %17 = "simt_step.if"(%16) ({
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) : (i32) -> ()
    }, {
      %c96_i32 = arith.constant 96 : i32
      %20 = arith.addi %c96_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.lane_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg2: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_14 : i32
          %36 = arith.addi %35, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %37 = arith.addi %c100_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %28 = arith.addi %c120_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = "simt_step.switch"(%29, %0) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          %38 = arith.addi %0, %c2_i32_14 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb3(%31: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %32 = arith.addi %c124_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = "simt_step.switch"(%33, %0) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %18 = arith.addi %c64_i32, %0 : i32
    %true_7 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

