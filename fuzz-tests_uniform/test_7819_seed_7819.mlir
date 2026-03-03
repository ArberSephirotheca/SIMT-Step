module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_2 = arith.constant 1 : i32
        %10 = arith.addi %9, %c1_i32_2 : i32
        %11 = arith.cmpi slt, %arg6, %10 : i32
        "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32_2 = arith.constant 3 : i32
        %9 = arith.addi %arg0, %c3_i32_2 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %10 = arith.addi %arg6, %c1_i32_3 : i32
        "simt_step.yield"(%9, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %7 = arith.remsi %arg3, %c3_i32 : i32
      %8 = "simt_step.switch"(%7, %arg0) ({
      ^bb0(%arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c2_i32_2 = arith.constant 2 : i32
        %10 = "simt_step.switch"(%9, %c2_i32_2) ({
        ^bb0(%arg6: i32):
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c0_i32_11 = arith.constant 0 : i32
          %21 = arith.addi %arg0, %c0_i32_11 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb3(%23: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32_3 = arith.constant 4 : i32
        "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c3_i32_4 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %13 = "simt_step.switch"(%12, %c1_i32_5) ({
        ^bb0(%arg6: i32):
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb3(%22: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %23 = arith.addi %arg0, %c0_i32_12 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c1_i32_6 = arith.constant 1 : i32
        %15 = arith.addi %arg0, %c1_i32_6 : i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb3(%16: i32):  // no predecessors
        %c3_i32_7 = arith.constant 3 : i32
        %17 = arith.remsi %arg3, %c3_i32_7 : i32
        %c2_i32_8 = arith.constant 2 : i32
        %18 = arith.addi %arg0, %c2_i32_8 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.addi %arg0, %c4_i32_11 : i32
          "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
        ^bb3(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32_9 = arith.constant 1 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %c4_i32_7 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_7 : i32
      %22 = arith.addi %21, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %23 = arith.addi %c8_i32, %22 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_8 : i32
      "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %21 = arith.addi %c28_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = simt_step.lane_id
      %24 = arith.index_cast %23 : index to i32
      %25 = "simt_step.switch"(%22, %24) ({
      ^bb0(%arg4: i32):
        %c2_i32_8 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c32_i32_9 = arith.constant 32 : i32
        %29 = arith.addi %c32_i32_9, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %31 = arith.addi %0, %c3_i32 : i32
        %32 = "simt_step.switch"(%30, %31) ({
        ^bb0(%arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %33 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %26 = arith.addi %arg2, %25 : i32
      %c1_i32 = arith.constant 1 : i32
      %27 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%26, %27) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c36_i32 = arith.constant 36 : i32
    %8 = arith.addi %c36_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %10 = arith.addi %0, %c2_i32 : i32
    %11 = "simt_step.switch"(%9, %10) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %22 = arith.addi %c40_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
      %25 = "simt_step.if"(%24) ({
        %c44_i32 = arith.constant 44 : i32
        %31 = arith.addi %c44_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_10 = arith.constant 3 : i32
        %33 = arith.addi %0, %c3_i32_10 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %37 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb3(%27: i32):  // no predecessors
      %c48_i32_8 = arith.constant 48 : i32
      %28 = arith.addi %c48_i32_8, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %30 = "simt_step.switch"(%29, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c3_i32_10 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_10) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %33 = arith.addi %c52_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_11 : i32
        %36 = "simt_step.if"(%35) ({
          %c3_i32_13 = arith.constant 3 : i32
          %42 = arith.addi %0, %c3_i32_13 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb3(%37: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %38 = arith.addi %c56_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
        %41 = "simt_step.if"(%40) ({
          %c4_i32_13 = arith.constant 4 : i32
          %42 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %14 = arith.addi %c60_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %16 = simt_step.lane_id
    %17 = arith.index_cast %16 : index to i32
    %18 = "simt_step.switch"(%15, %17) ({
    ^bb0(%arg2: i32):
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_7) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c4_i32_8 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_8) {fallthrough = true} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %24 = arith.addi %c64_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_9 = arith.constant 2 : i32
      %26 = "simt_step.switch"(%25, %c2_i32_9) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %30 = arith.muli %arg5, %c4_i32_14 : i32
          %31 = arith.addi %30, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %32 = arith.addi %c68_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_15 : i32
          "simt_step.condition"(%34, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %30 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_5 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %19 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

