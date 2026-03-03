module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %3 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %3, %c1_i32 : i32
      %5 = arith.cmpi slt, %arg5, %4 : i32
      "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %3 = arith.remsi %arg3, %c3_i32 : i32
      %4 = simt_step.subgroup_id
      %5 = arith.index_cast %4 : index to i32
      %6 = "simt_step.switch"(%3, %5) ({
      ^bb0(%arg6: i32):
        %c3_i32_2 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_2) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %10 = "simt_step.switch"(%9, %c1_i32_3) ({
        ^bb0(%arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %15 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%18: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          %19 = arith.addi %arg0, %c3_i32_10 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32_4 = arith.constant 3 : i32
        %11 = arith.addi %arg0, %c3_i32_4 : i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c3_i32_5 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_5) {fallthrough = false} : (i32) -> ()
      ^bb3(%13: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_10 : i32
          %17 = arith.cmpi slt, %arg8, %16 : i32
          "simt_step.condition"(%17, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c3_i32_9 = arith.constant 3 : i32
          %15 = arith.addi %arg0, %c3_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %16 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.yield"(%15, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_8 = arith.constant 3 : i32
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c4_i32_13 = arith.constant 4 : i32
      %23 = arith.muli %arg3, %c4_i32_13 : i32
      %24 = arith.addi %23, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %25 = arith.addi %c8_i32, %24 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_14 : i32
      "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %23 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %24 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%23, %24) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_13 = arith.constant 4 : i32
      %23 = arith.muli %arg3, %c4_i32_13 : i32
      %24 = arith.addi %23, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %25 = arith.addi %c28_i32, %24 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_14 : i32
      "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %23 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %24 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%23, %24) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %11 = simt_step.subgroup_id
    %12 = arith.index_cast %11 : index to i32
    %c0_i32_7 = arith.constant 0 : i32
    %c0_i32_8 = arith.constant 0 : i32
    %13:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_13 = arith.constant 4 : i32
      %23 = arith.muli %arg3, %c4_i32_13 : i32
      %24 = arith.addi %23, %0 : i32
      %c48_i32_14 = arith.constant 48 : i32
      %25 = arith.addi %c48_i32_14, %24 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_15 : i32
      "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %23 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %24 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%23, %24) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_9 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %14 = arith.addi %c48_i32, %0 : i32
    %true_10 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %16 = arith.addi %c68_i32, %0 : i32
    %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
    %18 = simt_step.lane_id
    %19 = arith.index_cast %18 : index to i32
    %20 = "simt_step.switch"(%17, %19) ({
    ^bb0(%arg2: i32):
      %c72_i32 = arith.constant 72 : i32
      %23 = arith.addi %c72_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_13 : i32
      %26 = "simt_step.if"(%25) ({
        %c76_i32 = arith.constant 76 : i32
        %29 = arith.addi %c76_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_17 = arith.constant 4 : i32
        %31 = arith.addi %0, %c4_i32_17 : i32
        %32 = "simt_step.switch"(%30, %31) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %34 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_18 = arith.constant true
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c0_i32_14 = arith.constant 0 : i32
      %c0_i32_15 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_17 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_17 : i32
        %30 = arith.addi %29, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %31 = arith.addi %c80_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_18 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c100_i32 = arith.constant 100 : i32
        %29 = arith.addi %c100_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %31 = "simt_step.switch"(%30, %c3_i32) ({
        ^bb0(%arg5: i32):
          %c3_i32_18 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_18) {fallthrough = true} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %32 = arith.addi %arg3, %31 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_16 = arith.constant true
      "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_11 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %21 = arith.addi %c64_i32, %0 : i32
    %true_12 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

