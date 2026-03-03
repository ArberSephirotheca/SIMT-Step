module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %6 = arith.addi %5, %c1_i32 : i32
        %7 = arith.cmpi slt, %arg5, %6 : i32
        "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %5 = simt_step.lane_id
        %6 = arith.index_cast %5 : index to i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%6, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%4#0) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32 : i32
          %12 = arith.cmpi slt, %arg5, %11 : i32
          "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %10 = simt_step.subgroup_id
          %11 = arith.index_cast %10 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%11, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %8 = simt_step.lane_id
        %9 = arith.index_cast %8 : index to i32
        "simt_step.yield"(%7#0) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %7 = arith.remsi %arg3, %c3_i32 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %8 = arith.addi %arg0, %c0_i32_2 : i32
        %9 = "simt_step.switch"(%7, %8) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%11: i32):  // no predecessors
          %c0_i32_4 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_4) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_3 = arith.constant 3 : i32
        "simt_step.yield"(%9) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%5) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %15, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %17 = arith.addi %c8_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_7 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %15 = arith.addi %c28_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      %18 = "simt_step.if"(%17) ({
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }, {
        %c32_i32_8 = arith.constant 32 : i32
        %21 = arith.addi %c32_i32_8, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_9 : i32
        %24 = "simt_step.if"(%23) ({
          %25 = simt_step.lane_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %19 = arith.addi %arg2, %18 : i32
      %c1_i32_7 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32_7 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %8 = arith.addi %0, %c0_i32_3 : i32
    %c1_i32 = arith.constant 1 : i32
    %c36_i32 = arith.constant 36 : i32
    %9 = arith.addi %c36_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_4 : i32
    %12 = "simt_step.if"(%11) ({
      %c40_i32 = arith.constant 40 : i32
      %15 = arith.addi %c40_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg2: i32):
        %c44_i32 = arith.constant 44 : i32
        %20 = arith.addi %c44_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_7 = arith.constant 1 : i32
        %22 = arith.addi %0, %c1_i32_7 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg3: i32):
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32_12 : i32
          "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %25 = arith.addi %c48_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
        %28 = "simt_step.if"(%27) ({
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %30 = arith.addi %c52_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %32 = "simt_step.switch"(%31, %c2_i32) ({
        ^bb0(%arg3: i32):
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %34 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb3(%37: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_9 : i32
        %17 = arith.addi %16, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %18 = arith.addi %c56_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_10 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %16 = arith.addi %arg2, %arg3 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %17 = arith.addi %arg3, %c1_i32_9 : i32
        "simt_step.break"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%15#0) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %true_5 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

