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
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%arg3, %4) ({
      ^bb0(%arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %8 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %9 = "simt_step.switch"(%8, %c1_i32_3) ({
        ^bb0(%arg7: i32):
          %c1_i32_6 = arith.constant 1 : i32
          %13 = arith.addi %arg0, %c1_i32_6 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c3_i32_4 = arith.constant 3 : i32
        %11 = arith.remsi %arg3, %c3_i32_4 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %12 = "simt_step.switch"(%11, %c0_i32_5) ({
        ^bb0(%arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%14: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%15: i32):  // no predecessors
          %c2_i32_6 = arith.constant 2 : i32
          %16 = arith.addi %arg0, %c2_i32_6 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %6 = arith.addi %arg0, %c0_i32_2 : i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5, %7) : (i32, i32) -> ()
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
      %22 = "simt_step.if"(%21) ({
        %c16_i32_14 = arith.constant 16 : i32
        %29 = arith.addi %c16_i32_14, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = "simt_step.switch"(%30, %0) ({
        ^bb0(%arg3: i32):
          %c3_i32_16 = arith.constant 3 : i32
          %32 = arith.addi %0, %c3_i32_16 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %29 = arith.addi %c20_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_14 : i32
        %32 = "simt_step.if"(%31) ({
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %24 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_14 : i32
        %30 = arith.addi %29, %0 : i32
        %c24_i32 = arith.constant 24 : i32
        %31 = arith.addi %c24_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_15 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_17 : i32
          %33 = arith.addi %32, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %34 = arith.addi %c44_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_18 : i32
          "simt_step.condition"(%36, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %32 = arith.addi %arg5, %arg6 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %33 = arith.addi %arg6, %c1_i32_17 : i32
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        %30 = arith.addi %arg3, %29#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%26#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%27: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_14 : i32
        %30 = arith.addi %29, %0 : i32
        %c64_i32 = arith.constant 64 : i32
        %31 = arith.addi %c64_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_15 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c84_i32 = arith.constant 84 : i32
        %29 = arith.addi %c84_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %31 = "simt_step.switch"(%30, %c1_i32) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32_16 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %32 = arith.addi %arg3, %31 : i32
        %c1_i32_15 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32_15 : i32
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_7 : i32
      %20 = arith.addi %19, %0 : i32
      %c88_i32 = arith.constant 88 : i32
      %21 = arith.addi %c88_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_7 = arith.constant 0 : i32
      %19 = arith.addi %0, %c0_i32_7 : i32
      %20 = arith.addi %arg2, %19 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c108_i32 = arith.constant 108 : i32
    %13 = arith.addi %c108_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_5 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_5 : i32
    %16 = "simt_step.if"(%15) ({
      %c0_i32_7 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_7) : (i32) -> ()
    }, {
      %c112_i32 = arith.constant 112 : i32
      %19 = arith.addi %c112_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
      %22 = "simt_step.if"(%21) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %23 = simt_step.lane_id
        %24 = arith.index_cast %23 : index to i32
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %17 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

