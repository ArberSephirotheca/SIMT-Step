module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.addi %arg0, %c2_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %12 = arith.remsi %arg3, %c4_i32_6 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %12, %c1_i32 : i32
      %14 = arith.cmpi slt, %arg5, %13 : i32
      "simt_step.condition"(%14, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %5 = arith.select %4, %0, %1#0 : i32
    %c4_i32 = arith.constant 4 : i32
    %6 = arith.remsi %arg3, %c4_i32 : i32
    %c4_i32_3 = arith.constant 4 : i32
    %7 = "simt_step.switch"(%6, %c4_i32_3) ({
    ^bb0(%arg4: i32):
      %c0_i32_6 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_13 : i32
          %24 = arith.cmpi slt, %arg6, %23 : i32
          "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_12 = arith.constant 0 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32_13 : i32
          "simt_step.yield"(%c0_i32_12, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_11 = arith.constant 0 : i32
        %21 = arith.addi %arg0, %c0_i32_11 : i32
        "simt_step.yield"(%20#0) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %21 = "simt_step.if"(%20) ({
          %c2_i32_11 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %c2_i32_11 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_10 = arith.constant 2 : i32
        %22 = arith.addi %arg0, %c2_i32_10 : i32
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %16 = arith.remsi %arg3, %c3_i32 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %17 = "simt_step.switch"(%16, %c0_i32_8) ({
      ^bb0(%arg5: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %21 = "simt_step.if"(%20) ({
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %25 = "simt_step.if"(%24) ({
          %c3_i32_13 = arith.constant 3 : i32
          %28 = arith.addi %arg0, %c3_i32_13 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          %28 = arith.addi %arg0, %c4_i32_13 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_11 = arith.constant 3 : i32
        %26 = arith.addi %arg0, %c3_i32_11 : i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c4_i32_12 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb3(%19: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %12 = arith.muli %arg3, %c4_i32_4 : i32
        %13 = arith.addi %12, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %14 = arith.addi %c12_i32, %13 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %15, %c0_i32_5 : i32
        "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c32_i32_4 = arith.constant 32 : i32
        %12 = arith.addi %c32_i32_4, %0 : i32
        %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
        %14 = simt_step.subgroup_id
        %15 = arith.index_cast %14 : index to i32
        %16 = "simt_step.switch"(%13, %15) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %17 = arith.addi %arg2, %16 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.break"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_3 = arith.constant true
      "simt_step.yield"(%11#0) : (i32) -> ()
    }, {
      %c36_i32 = arith.constant 36 : i32
      %11 = arith.addi %c36_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = simt_step.lane_id
      %14 = arith.index_cast %13 : index to i32
      %15 = "simt_step.switch"(%12, %14) ({
      ^bb0(%arg2: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %22 = arith.muli %arg4, %c4_i32_6 : i32
          %23 = arith.addi %22, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %24 = arith.addi %c40_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
          "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %22 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_4 = arith.constant true
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %18 = arith.addi %c60_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
        %21 = "simt_step.if"(%20) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

