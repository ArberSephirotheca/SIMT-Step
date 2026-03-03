module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %1 = arith.addi %arg0, %c3_i32_0 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %5 = "simt_step.switch"(%arg3, %arg0) ({
      ^bb0(%arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32 : i32
        %17 = "simt_step.switch"(%16, %arg0) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_9) {fallthrough = true} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb3(%25: i32):  // no predecessors
          %c3_i32_11 = arith.constant 3 : i32
          %26 = arith.addi %arg0, %c3_i32_11 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32_6 = arith.constant 4 : i32
        %18 = arith.addi %arg0, %c4_i32_6 : i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %20 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32_7 = arith.constant 3 : i32
        %21 = arith.addi %arg0, %c3_i32_7 : i32
        %22 = "simt_step.switch"(%20, %21) ({
        ^bb0(%arg6: i32):
          %c0_i32_9 = arith.constant 0 : i32
          %23 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_8 = arith.constant 3 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %6 = arith.addi %arg0, %c0_i32_1 : i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c3_i32_2 = arith.constant 3 : i32
      %8 = arith.remsi %arg3, %c3_i32_2 : i32
      %c3_i32_3 = arith.constant 3 : i32
      %9 = arith.addi %arg0, %c3_i32_3 : i32
      %10 = "simt_step.switch"(%8, %9) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%c4_i32, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %20 = "simt_step.if"(%19) ({
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb3(%22: i32):  // no predecessors
        %c2_i32_9 = arith.constant 2 : i32
        %23 = arith.remsi %arg3, %c2_i32_9 : i32
        %c2_i32_10 = arith.constant 2 : i32
        %24 = arith.addi %arg0, %c2_i32_10 : i32
        %25 = "simt_step.switch"(%23, %24) ({
        ^bb0(%arg6: i32):
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c2_i32_11 = arith.constant 2 : i32
        %26 = arith.addi %arg0, %c2_i32_11 : i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %11 = arith.addi %arg0, %c0_i32_4 : i32
      "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %15 = "simt_step.if"(%14) ({
        %c0_i32_6 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %17 = "simt_step.if"(%16) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_7 = arith.constant 3 : i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %16 = "simt_step.switch"(%arg3, %c0_i32_6) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c4_i32_3 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_3 : i32
      %9 = arith.addi %8, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %10 = arith.addi %c8_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_4 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %8 = arith.addi %c28_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_3 : i32
      %11 = "simt_step.if"(%10) ({
        %c32_i32 = arith.constant 32 : i32
        %14 = arith.addi %c32_i32, %0 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
        %17 = "simt_step.if"(%16) ({
          %18 = simt_step.lane_id
          %19 = arith.index_cast %18 : index to i32
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %14 = arith.addi %c36_i32, %0 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_4 = arith.constant 1 : i32
        %16 = "simt_step.switch"(%15, %c1_i32_4) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %17 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      %12 = arith.addi %arg2, %11 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

