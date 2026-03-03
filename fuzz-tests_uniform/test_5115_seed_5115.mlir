module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %3 = "simt_step.if"(%2) ({
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %7 = arith.select %6, %1, %3 : i32
    %c3_i32 = arith.constant 3 : i32
    %8 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %9 = "simt_step.switch"(%8, %c1_i32) ({
    ^bb0(%arg4: i32):
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_4) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %18 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %19 = arith.addi %18, %c1_i32_8 : i32
        %20 = arith.cmpi slt, %arg6, %19 : i32
        "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32 = arith.constant 2 : i32
        %18 = arith.remsi %arg3, %c2_i32 : i32
        %c4_i32 = arith.constant 4 : i32
        %19 = "simt_step.switch"(%18, %c4_i32) ({
        ^bb0(%arg7: i32):
          %c3_i32_10 = arith.constant 3 : i32
          %22 = arith.addi %arg0, %c3_i32_10 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %20 = arith.addi %arg0, %c4_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %21 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.break"(%19, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c3_i32_7 = arith.constant 3 : i32
      %17 = arith.addi %arg0, %c3_i32_7 : i32
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %11 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %13 = arith.select %12, %7, %9 : i32
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
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.addi %0, %c3_i32 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg3: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_14 : i32
          %29 = arith.addi %28, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %30 = arith.addi %c16_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_15 : i32
          "simt_step.condition"(%32, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %28 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_6 = arith.constant true
        "simt_step.yield"(%22#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_7) {fallthrough = true} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_14 : i32
          %29 = arith.addi %28, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %30 = arith.addi %c36_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_15 : i32
          "simt_step.condition"(%32, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %28 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_14 : i32
          %29 = arith.addi %28, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %30 = arith.addi %c56_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_15 : i32
          "simt_step.condition"(%32, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %28 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %18 = arith.addi %c76_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c80_i32 = arith.constant 80 : i32
        %22 = arith.addi %c80_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_4 : i32
        %25 = "simt_step.if"(%24) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32_6 = arith.constant 2 : i32
          %28 = arith.addi %0, %c2_i32_6 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c4_i32_5 = arith.constant 4 : i32
        %27 = arith.addi %0, %c4_i32_5 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_3) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %10 = arith.addi %c32_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

