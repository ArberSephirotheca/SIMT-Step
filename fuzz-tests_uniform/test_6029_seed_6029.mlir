module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c2_i32 = arith.constant 2 : i32
      %12 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32 : i32
        %15 = arith.cmpi slt, %arg5, %14 : i32
        "simt_step.condition"(%15, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %13 = simt_step.subgroup_id
        %14 = arith.index_cast %13 : index to i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%14, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32 = arith.constant 4 : i32
    %4 = arith.remsi %arg3, %c4_i32 : i32
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %7 = "simt_step.switch"(%4, %6) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %12 = arith.remsi %arg3, %c2_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = "simt_step.switch"(%12, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c2_i32_9 = arith.constant 2 : i32
        %24 = arith.remsi %arg3, %c2_i32_9 : i32
        %25 = "simt_step.switch"(%24, %arg0) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c3_i32_12 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32_10 = arith.constant 1 : i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c3_i32_11 = arith.constant 3 : i32
        %27 = arith.remsi %arg3, %c3_i32_11 : i32
        %28 = "simt_step.switch"(%27, %arg0) ({
        ^bb0(%arg6: i32):
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c2_i32_4 = arith.constant 2 : i32
      %15 = arith.remsi %arg3, %c2_i32_4 : i32
      %16 = "simt_step.switch"(%15, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %25 = "simt_step.if"(%24) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %28 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %29 = arith.addi %28, %c1_i32_14 : i32
          %30 = arith.cmpi slt, %arg7, %29 : i32
          "simt_step.condition"(%30, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_13 = arith.constant 2 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32_14 : i32
          "simt_step.yield"(%c2_i32_13, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c1_i32_6 = arith.constant 1 : i32
      %18 = arith.addi %arg0, %c1_i32_6 : i32
      %19 = "simt_step.switch"(%arg3, %18) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %29 = arith.addi %28, %c1_i32_13 : i32
          %30 = arith.cmpi slt, %arg7, %29 : i32
          "simt_step.condition"(%30, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_12 = arith.constant 2 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%c2_i32_12, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %27 = "simt_step.if"(%26) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb3(%20: i32):  // no predecessors
      %c2_i32_7 = arith.constant 2 : i32
      %21 = arith.remsi %arg3, %c2_i32_7 : i32
      %22 = "simt_step.switch"(%21, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %25 = "simt_step.if"(%24) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %26 = arith.addi %arg0, %c4_i32_10 : i32
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32_14 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %30 = arith.addi %arg0, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %31 = arith.addi %arg7, %c1_i32_14 : i32
          "simt_step.break"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c2_i32_8 = arith.constant 2 : i32
      %23 = arith.addi %arg0, %c2_i32_8 : i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %11 = arith.select %10, %1, %7 : i32
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
    %c3_i32 = arith.constant 3 : i32
    %7 = arith.addi %0, %c3_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %26 = arith.addi %c16_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_5 : i32
        %29 = "simt_step.if"(%28) ({
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }, {
          %c1_i32_7 = arith.constant 1 : i32
          %34 = arith.addi %0, %c1_i32_7 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %31 = arith.addi %c20_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %22 = arith.addi %c24_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %24 = arith.addi %0, %c1_i32 : i32
      %25 = "simt_step.switch"(%23, %24) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_10 : i32
          %35 = arith.addi %34, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %36 = arith.addi %c28_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_11 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32_10 : i32
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %28 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c48_i32_8 = arith.constant 48 : i32
        %30 = arith.addi %c48_i32_8, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_9 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_0 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %11 = arith.addi %c52_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %19 = arith.addi %c56_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %21 = arith.addi %0, %c2_i32 : i32
      %22 = "simt_step.switch"(%20, %21) ({
      ^bb0(%arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %28 = arith.addi %c60_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = "simt_step.switch"(%29, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %38 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %42 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %32 = arith.addi %c64_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_6 : i32
        %35 = "simt_step.if"(%34) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %37 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %24 = arith.addi %c68_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
      %27 = "simt_step.if"(%26) ({
        %c72_i32 = arith.constant 72 : i32
        %28 = arith.addi %c72_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_5 : i32
        %31 = "simt_step.if"(%30) ({
          %c2_i32_6 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_6) : (i32) -> ()
        }, {
          %c2_i32_6 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32_6 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c76_i32 = arith.constant 76 : i32
        %28 = arith.addi %c76_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_5 = arith.constant 4 : i32
        %30 = arith.addi %0, %c4_i32_5 : i32
        %31 = "simt_step.switch"(%29, %30) ({
        ^bb0(%arg3: i32):
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          %34 = arith.addi %0, %c4_i32_8 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%31) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %16 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

