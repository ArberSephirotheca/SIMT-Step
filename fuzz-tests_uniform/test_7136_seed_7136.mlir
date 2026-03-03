module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c1_i32 = arith.constant 1 : i32
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c4_i32_1 = arith.constant 4 : i32
      %9 = "simt_step.switch"(%8, %c4_i32_1) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %19 = "simt_step.if"(%18) ({
          %c2_i32_14 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_14) : (i32) -> ()
        }, {
          %c3_i32_14 = arith.constant 3 : i32
          %29 = arith.addi %arg0, %c3_i32_14 : i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_8 = arith.constant 1 : i32
        %20 = arith.addi %arg0, %c1_i32_8 : i32
        "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c2_i32_9 = arith.constant 2 : i32
        %22 = arith.remsi %arg3, %c2_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %23 = "simt_step.switch"(%22, %c1_i32_10) ({
        ^bb0(%arg6: i32):
          %c3_i32_14 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          %31 = arith.addi %arg0, %c2_i32_15 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %c3_i32_11 = arith.constant 3 : i32
        %24 = arith.addi %arg0, %c3_i32_11 : i32
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c3_i32_12 = arith.constant 3 : i32
        %26 = arith.remsi %arg3, %c3_i32_12 : i32
        %27 = "simt_step.switch"(%26, %arg0) ({
        ^bb0(%arg6: i32):
          %c3_i32_14 = arith.constant 3 : i32
          %29 = arith.addi %arg0, %c3_i32_14 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_13 = arith.constant 3 : i32
        "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %12 = "simt_step.if"(%11) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_11 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_10 = arith.constant 0 : i32
          %20 = arith.addi %arg0, %c0_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %21 = arith.addi %arg6, %c1_i32_11 : i32
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_9 = arith.constant 1 : i32
        %19 = arith.addi %arg0, %c1_i32_9 : i32
        "simt_step.yield"(%18#0) : (i32) -> ()
      }, {
        "simt_step.yield"(%arg0) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32_3 = arith.constant 2 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c3_i32_4 = arith.constant 3 : i32
      %14 = arith.remsi %arg3, %c3_i32_4 : i32
      %c2_i32_5 = arith.constant 2 : i32
      %15 = arith.addi %arg0, %c2_i32_5 : i32
      %16 = "simt_step.switch"(%14, %15) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_14 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_15 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_14 = arith.constant 1 : i32
          %25 = arith.addi %arg7, %c1_i32_14 : i32
          "simt_step.yield"(%arg0, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_9 = arith.constant 1 : i32
        "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c2_i32_10 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c2_i32_11 = arith.constant 2 : i32
        %21 = arith.addi %arg0, %c2_i32_11 : i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb3(%22: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %24 = "simt_step.if"(%23) ({
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }, {
          %c3_i32_14 = arith.constant 3 : i32
          %25 = arith.addi %arg0, %c3_i32_14 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_13 = arith.constant 1 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c3_i32_6 = arith.constant 3 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %c1_i32, %3 : i32
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
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %9 = "simt_step.switch"(%8, %c0_i32_0) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
      %16 = "simt_step.if"(%15) ({
        %c16_i32_3 = arith.constant 16 : i32
        %17 = arith.addi %c16_i32_3, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %19 = arith.addi %0, %c0_i32_4 : i32
        %20 = "simt_step.switch"(%18, %19) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %23 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %18 = arith.muli %arg4, %c4_i32_6 : i32
          %19 = arith.addi %18, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %20 = arith.addi %c20_i32, %19 : i32
          %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %22 = arith.cmpi ne, %21, %c0_i32_7 : i32
          "simt_step.condition"(%22, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %18 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%18, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_5 = arith.constant true
        "simt_step.yield"(%17#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

