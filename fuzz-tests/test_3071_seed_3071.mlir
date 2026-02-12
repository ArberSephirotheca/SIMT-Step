module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = simt_step.subgroup_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %8 = arith.remsi %arg3, %c2_i32 : i32
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.addi %arg0, %c4_i32 : i32
      %10 = "simt_step.switch"(%8, %9) ({
      ^bb0(%arg5: i32):
        %c3_i32_5 = arith.constant 3 : i32
        %18 = arith.remsi %arg3, %c3_i32_5 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %19 = "simt_step.switch"(%18, %c4_i32_6) ({
        ^bb0(%arg6: i32):
          %c3_i32_11 = arith.constant 3 : i32
          %25 = arith.addi %arg0, %c3_i32_11 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %27 = arith.addi %arg0, %c0_i32_12 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.addi %arg0, %c4_i32_11 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c4_i32_9 = arith.constant 4 : i32
        %23 = arith.remsi %arg3, %c4_i32_9 : i32
        %24 = "simt_step.switch"(%23, %arg0) ({
        ^bb0(%arg6: i32):
          %c0_i32_11 = arith.constant 0 : i32
          %25 = arith.addi %arg0, %c0_i32_11 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          %27 = arith.addi %arg0, %c2_i32_12 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %30 = arith.addi %arg0, %c3_i32_14 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c2_i32_10 = arith.constant 2 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c3_i32_1 = arith.constant 3 : i32
      %12 = arith.remsi %arg3, %c3_i32_1 : i32
      %13 = "simt_step.switch"(%12, %arg0) ({
      ^bb0(%arg5: i32):
        %c2_i32_5 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_5) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_12 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %26 = arith.addi %arg0, %c1_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c3_i32_8 = arith.constant 3 : i32
        %21 = arith.remsi %arg3, %c3_i32_8 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg0, %c1_i32 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          %27 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          %29 = arith.addi %arg0, %c2_i32_12 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb3(%30: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.addi %arg0, %c4_i32_13 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_12 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.break"(%arg0, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c2_i32_2 = arith.constant 2 : i32
      %14 = arith.addi %arg0, %c2_i32_2 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      %16 = arith.remsi %arg3, %c3_i32_3 : i32
      %17 = "simt_step.switch"(%16, %arg0) ({
      ^bb0(%arg5: i32):
        %c4_i32_5 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_5) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c4_i32_6 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_6) {fallthrough = true} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %21 = "simt_step.if"(%20) ({
          %c4_i32_8 = arith.constant 4 : i32
          %24 = arith.addi %arg0, %c4_i32_8 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %c1_i32_8 = arith.constant 1 : i32
          %24 = arith.addi %arg0, %c1_i32_8 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb3(%22: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %7 = arith.select %6, %0, %5 : i32
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
      %8 = arith.addi %c12_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %10 = "simt_step.switch"(%9, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %12 = arith.addi %c16_i32, %0 : i32
        %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_0 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %13, %c0_i32_0 : i32
        %15 = "simt_step.if"(%14) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c0_i32_3 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_3) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c1_i32_1 = arith.constant 1 : i32
        %17 = arith.addi %0, %c1_i32_1 : i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %19 = arith.addi %c20_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_2 : i32
        %22 = "simt_step.if"(%21) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_3 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_3) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

