module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.remsi %arg3, %c4_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %22 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %23 = arith.addi %22, %c1_i32_9 : i32
        %24 = arith.cmpi slt, %arg6, %23 : i32
        "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.yield"(%c0_i32_8, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c4_i32_3 = arith.constant 4 : i32
      %12 = arith.remsi %arg3, %c4_i32_3 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %13 = "simt_step.switch"(%12, %c4_i32_4) ({
      ^bb0(%arg5: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.addi %arg0, %c0_i32_8 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %25 = "simt_step.if"(%24) ({
          %c1_i32_14 = arith.constant 1 : i32
          %31 = arith.addi %arg0, %c1_i32_14 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c3_i32_14 = arith.constant 3 : i32
          %31 = arith.addi %arg0, %c3_i32_14 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %31 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %32 = arith.addi %31, %c1_i32_15 : i32
          %33 = arith.cmpi slt, %arg7, %32 : i32
          "simt_step.condition"(%33, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c0_i32_14 = arith.constant 0 : i32
          %31 = arith.addi %arg0, %c0_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %32 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %30 = "simt_step.if"(%29) ({
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }, {
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_13 = arith.constant 1 : i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %15 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32_5 = arith.constant 1 : i32
      %16 = arith.addi %arg0, %c1_i32_5 : i32
      %17 = "simt_step.switch"(%15, %16) ({
      ^bb0(%arg5: i32):
        %c1_i32_8 = arith.constant 1 : i32
        %22 = "simt_step.switch"(%arg3, %c1_i32_8) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.addi %arg0, %c4_i32_12 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %25 = "simt_step.if"(%24) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c3_i32_12 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c2_i32_11 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb3(%18: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %23 = "simt_step.if"(%22) ({
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) : (i32) -> ()
        }, {
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_9 = arith.constant 1 : i32
        %24 = arith.addi %arg0, %c1_i32_9 : i32
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_12 : i32
          %25 = arith.cmpi slt, %arg6, %24 : i32
          "simt_step.condition"(%25, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %23 = arith.addi %arg6, %c1_i32_11 : i32
          "simt_step.yield"(%arg0, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_10 = arith.constant 3 : i32
        "simt_step.yield"(%22#0) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32_7 = arith.constant 2 : i32
      %21 = arith.addi %arg0, %c2_i32_7 : i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %7 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %9 = arith.select %8, %1, %5 : i32
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
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = "simt_step.switch"(%12, %0) ({
      ^bb0(%arg2: i32):
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c16_i32_2 = arith.constant 16 : i32
        %15 = arith.addi %c16_i32_2, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
        %18 = "simt_step.if"(%17) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %20 = arith.addi %c20_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_4 : i32
        %23 = "simt_step.if"(%22) ({
          %c0_i32_5 = arith.constant 0 : i32
          %24 = arith.addi %0, %c0_i32_5 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %c2_i32_5 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      "simt_step.yield"(%13) : (i32) -> ()
    }, {
      %c24_i32 = arith.constant 24 : i32
      %11 = arith.addi %c24_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = "simt_step.switch"(%12, %0) ({
      ^bb0(%arg2: i32):
        %c28_i32 = arith.constant 28 : i32
        %14 = arith.addi %c28_i32, %0 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %15, %c0_i32_2 : i32
        %17 = "simt_step.if"(%16) ({
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %25 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %19 = arith.addi %c32_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
        %22 = "simt_step.if"(%21) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c0_i32_5 = arith.constant 0 : i32
          %25 = arith.addi %0, %c0_i32_5 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %24 = arith.addi %0, %c0_i32_4 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

