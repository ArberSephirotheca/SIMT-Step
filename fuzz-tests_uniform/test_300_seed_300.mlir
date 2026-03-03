module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %7 = "simt_step.if"(%6) ({
        %c4_i32_9 = arith.constant 4 : i32
        %17 = arith.addi %arg0, %c4_i32_9 : i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32_1 = arith.constant 3 : i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_12 : i32
          %21 = arith.cmpi slt, %arg8, %20 : i32
          "simt_step.condition"(%21, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c3_i32_11 = arith.constant 3 : i32
          %19 = arith.addi %arg0, %c3_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %20 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.yield"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32 = arith.constant 2 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%17#0, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c3_i32_4 = arith.constant 3 : i32
      %11 = arith.remsi %arg3, %c3_i32_4 : i32
      %c3_i32_5 = arith.constant 3 : i32
      %12 = arith.addi %arg0, %c3_i32_5 : i32
      %13 = "simt_step.switch"(%11, %12) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %18 = "simt_step.if"(%17) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %19 = arith.addi %arg0, %c4_i32_10 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %23 = arith.remsi %arg3, %c2_i32 : i32
        %24 = "simt_step.switch"(%23, %arg0) ({
        ^bb0(%arg6: i32):
          %c3_i32_12 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32_11 = arith.constant 1 : i32
        %25 = arith.addi %arg0, %c1_i32_11 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb3(%14: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %18 = "simt_step.if"(%17) ({
          %c2_i32 = arith.constant 2 : i32
          %21 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %c0_i32_11 = arith.constant 0 : i32
          %21 = arith.addi %arg0, %c0_i32_11 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg0, %c1_i32 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %20 = arith.addi %arg6, %c1_i32_10 : i32
        "simt_step.yield"(%18, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32 = arith.constant 4 : i32
      %16 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
      %21 = "simt_step.if"(%20) ({
        %c16_i32_8 = arith.constant 16 : i32
        %27 = arith.addi %c16_i32_8, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %0, %c1_i32 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %31 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %27 = arith.addi %c20_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        %30 = "simt_step.if"(%29) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %31 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %24 = arith.addi %c24_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c28_i32 = arith.constant 28 : i32
        %27 = arith.addi %c28_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = "simt_step.switch"(%28, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %31 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.addi %0, %c0_i32_1 : i32
    %15 = "simt_step.switch"(%13, %14) ({
    ^bb0(%arg2: i32):
      %c36_i32 = arith.constant 36 : i32
      %18 = arith.addi %c36_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_17 : i32
          %38 = arith.addi %37, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %39 = arith.addi %c40_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_18 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%27#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_17 : i32
          %38 = arith.addi %37, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %39 = arith.addi %c60_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_18 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_17 : i32
          %38 = arith.addi %37, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %39 = arith.addi %c80_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_18 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%31#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%32: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %33 = arith.addi %c100_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_16 : i32
        %36 = "simt_step.if"(%35) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %23 = arith.addi %c104_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
      %26 = "simt_step.if"(%25) ({
        %c108_i32 = arith.constant 108 : i32
        %27 = arith.addi %c108_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_7 : i32
        %30 = "simt_step.if"(%29) ({
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c32_i32_3 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32_3, %0 : i32
    %true_4 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

