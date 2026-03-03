module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %c2_i32 = arith.constant 2 : i32
      %5 = arith.addi %arg0, %c2_i32 : i32
      %6 = "simt_step.switch"(%4, %5) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_7 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_7 = arith.constant 1 : i32
          %16 = arith.addi %arg0, %c1_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.yield"(%16, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%11: i32):  // no predecessors
        %c1_i32_4 = arith.constant 1 : i32
        %12 = arith.addi %arg0, %c1_i32_4 : i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb3(%13: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %15 = "simt_step.if"(%14) ({
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %c2_i32_1 = arith.constant 2 : i32
      %7 = arith.addi %arg0, %c2_i32_1 : i32
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_1) : (i32) -> ()
    }) : (i1) -> i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %22 = arith.addi %c12_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %24 = arith.addi %0, %c3_i32 : i32
      %25 = "simt_step.switch"(%23, %24) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_15 : i32
          %43 = arith.addi %42, %0 : i32
          %c16_i32_16 = arith.constant 16 : i32
          %44 = arith.addi %c16_i32_16, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_17 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c3_i32_12 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_12) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %33 = arith.addi %c36_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
        %36 = "simt_step.if"(%35) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb3(%37: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %38 = arith.addi %c40_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_14 : i32
        %41 = "simt_step.if"(%40) ({
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c2_i32_15 = arith.constant 2 : i32
          %42 = arith.addi %0, %c2_i32_15 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %27 = arith.addi %c44_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %29 = "simt_step.switch"(%28, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c48_i32_9 = arith.constant 48 : i32
        %30 = arith.addi %c48_i32_9, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %34 = arith.addi %c52_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_11 : i32
        %37 = "simt_step.if"(%36) ({
          %c4_i32_12 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c2_i32_12 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32_12 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %22 = arith.muli %arg3, %c4_i32_7 : i32
      %23 = arith.addi %22, %0 : i32
      %c56_i32 = arith.constant 56 : i32
      %24 = arith.addi %c56_i32, %23 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
      "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %0, %c1_i32 : i32
      %23 = arith.addi %arg2, %22 : i32
      %c1_i32_7 = arith.constant 1 : i32
      %24 = arith.addi %arg3, %c1_i32_7 : i32
      "simt_step.yield"(%23, %24) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c76_i32 = arith.constant 76 : i32
    %15 = arith.addi %c76_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %17 = simt_step.lane_id
    %18 = arith.index_cast %17 : index to i32
    %19 = "simt_step.switch"(%16, %18) ({
    ^bb0(%arg2: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %22 = arith.addi %0, %c4_i32_7 : i32
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %24 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %26 = arith.addi %c80_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
      %29 = "simt_step.if"(%28) ({
        %c84_i32 = arith.constant 84 : i32
        %32 = arith.addi %c84_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_12 : i32
        %35 = "simt_step.if"(%34) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) : (i32) -> ()
      }, {
        %c1_i32_12 = arith.constant 1 : i32
        %32 = arith.addi %0, %c1_i32_12 : i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %31:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_12 : i32
        %33 = arith.addi %32, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %34 = arith.addi %c88_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_13 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c108_i32 = arith.constant 108 : i32
        %32 = arith.addi %c108_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_12 : i32
        %35 = "simt_step.if"(%34) ({
          %c1_i32_14 = arith.constant 1 : i32
          %38 = arith.addi %0, %c1_i32_14 : i32
          "simt_step.yield"(%38) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %38 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%38) : (i32) -> ()
        }) : (i1) -> i32
        %36 = arith.addi %arg3, %35 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_13 : i32
        "simt_step.yield"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_5 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %20 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

