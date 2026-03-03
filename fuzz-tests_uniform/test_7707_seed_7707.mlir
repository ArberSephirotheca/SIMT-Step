module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.addi %arg0, %c1_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %12 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32_6 = arith.constant 1 : i32
      %13 = arith.addi %12, %c1_i32_6 : i32
      %14 = arith.cmpi slt, %arg5, %13 : i32
      "simt_step.condition"(%14, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      %c1_i32_6 = arith.constant 1 : i32
      %14 = arith.addi %arg5, %c1_i32_6 : i32
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %5 = arith.select %4, %0, %1#0 : i32
    %c2_i32 = arith.constant 2 : i32
    %6 = arith.remsi %arg3, %c2_i32 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %7 = "simt_step.switch"(%6, %c0_i32_3) ({
    ^bb0(%arg4: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_12 : i32
          %21 = arith.cmpi slt, %arg6, %20 : i32
          "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c3_i32 = arith.constant 3 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %19 = arith.addi %arg6, %c1_i32_11 : i32
          "simt_step.yield"(%c3_i32, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %19 = "simt_step.if"(%18) ({
          %c0_i32_10 = arith.constant 0 : i32
          %20 = arith.addi %arg0, %c0_i32_10 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c4_i32_7 = arith.constant 4 : i32
      %15 = arith.remsi %arg3, %c4_i32_7 : i32
      %16 = "simt_step.switch"(%15, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %29 = arith.remsi %arg3, %c4_i32_18 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %30 = arith.addi %29, %c1_i32_19 : i32
          %31 = arith.cmpi slt, %arg7, %30 : i32
          "simt_step.condition"(%31, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_18 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32_18 : i32
          "simt_step.yield"(%arg0, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_11 : i32
        %21 = "simt_step.if"(%20) ({
          %c2_i32_18 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_18) : (i32) -> ()
        }, {
          %c2_i32_18 = arith.constant 2 : i32
          %29 = arith.addi %arg0, %c2_i32_18 : i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c2_i32_12 = arith.constant 2 : i32
        %23 = arith.remsi %arg3, %c2_i32_12 : i32
        %c2_i32_13 = arith.constant 2 : i32
        %24 = "simt_step.switch"(%23, %c2_i32_13) ({
        ^bb0(%arg6: i32):
          %c1_i32_18 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_19) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %c0_i32_20 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c4_i32_14 = arith.constant 4 : i32
        %25 = arith.addi %arg0, %c4_i32_14 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %29 = arith.remsi %arg3, %c4_i32_18 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %30 = arith.addi %29, %c1_i32_19 : i32
          %31 = arith.cmpi slt, %arg7, %30 : i32
          "simt_step.condition"(%31, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_18 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32_18 : i32
          "simt_step.continue"(%arg0, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32_17 = arith.constant 4 : i32
        %28 = arith.addi %arg0, %c4_i32_17 : i32
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32_8 = arith.constant 1 : i32
      %17 = arith.addi %arg0, %c1_i32_8 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %11 = arith.select %10, %5, %7 : i32
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
    %c1_i32 = arith.constant 1 : i32
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_0 : i32
    %10 = "simt_step.if"(%9) ({
      %c12_i32 = arith.constant 12 : i32
      %20 = arith.addi %c12_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c16_i32 = arith.constant 16 : i32
        %24 = arith.addi %c16_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
        %27 = "simt_step.if"(%26) ({
          %28 = simt_step.lane_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %28 = simt_step.subgroup_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %24 = simt_step.lane_id
        %25 = arith.index_cast %24 : index to i32
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c20_i32 = arith.constant 20 : i32
    %13 = arith.addi %c20_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %15 = simt_step.lane_id
    %16 = arith.index_cast %15 : index to i32
    %17 = "simt_step.switch"(%14, %16) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_7 : i32
        %28 = arith.addi %27, %0 : i32
        %c24_i32 = arith.constant 24 : i32
        %29 = arith.addi %c24_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_8 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %27 = arith.addi %arg3, %arg4 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32_7 : i32
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      "simt_step.yield"(%20#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %23 = arith.addi %c44_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
      %26 = "simt_step.if"(%25) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %28 = arith.muli %arg4, %c4_i32_10 : i32
          %29 = arith.addi %28, %0 : i32
          %c48_i32_11 = arith.constant 48 : i32
          %30 = arith.addi %c48_i32_11, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_12 : i32
          "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %28 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %29 = arith.addi %arg4, %c1_i32_10 : i32
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%27#0) : (i32) -> ()
      }, {
        %c68_i32 = arith.constant 68 : i32
        %27 = arith.addi %c68_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_7 : i32
        %30 = "simt_step.if"(%29) ({
          %c2_i32 = arith.constant 2 : i32
          %31 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c4_i32_8 = arith.constant 4 : i32
          %31 = arith.addi %0, %c4_i32_8 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %18 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

