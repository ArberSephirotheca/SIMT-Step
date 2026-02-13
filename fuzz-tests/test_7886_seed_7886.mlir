module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%4) {fallthrough = true} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c4_i32_0 = arith.constant 4 : i32
      %6 = arith.remsi %arg3, %c4_i32_0 : i32
      %c2_i32 = arith.constant 2 : i32
      %7 = "simt_step.switch"(%6, %c2_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %24 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %25 = arith.addi %24, %c1_i32_10 : i32
          %26 = arith.cmpi slt, %arg7, %25 : i32
          "simt_step.condition"(%26, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %24 = arith.addi %arg7, %c1_i32_9 : i32
          "simt_step.yield"(%arg0, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c4_i32_6 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_6 : i32
        %16 = "simt_step.switch"(%15, %arg0) ({
        ^bb0(%arg6: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %24 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %26 = arith.addi %arg0, %c4_i32_10 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb2(%17: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %19 = "simt_step.if"(%18) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32_9 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_9) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %21 = arith.remsi %arg3, %c3_i32 : i32
        %c2_i32_8 = arith.constant 2 : i32
        %22 = arith.addi %arg0, %c2_i32_8 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg6: i32):
          %c3_i32_9 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_9) {fallthrough = true} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %c0_i32_11 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %10 = "simt_step.if"(%9) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_7 : i32
          %16 = arith.cmpi slt, %arg6, %15 : i32
          "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_6 = arith.constant 1 : i32
          %14 = arith.addi %arg6, %c1_i32_6 : i32
          "simt_step.yield"(%arg0, %14) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %14 = "simt_step.if"(%13) ({
          %c4_i32_5 = arith.constant 4 : i32
          %15 = arith.addi %arg0, %c4_i32_5 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %15 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c2_i32_3 = arith.constant 2 : i32
      %12 = arith.addi %arg0, %c2_i32_3 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %arg0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %11 = arith.addi %c8_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      "simt_step.if"(%13) ({
        %c2_i32 = arith.constant 2 : i32
        %14 = "simt_step.switch"(%0, %c2_i32) ({
        ^bb0(%arg2: i32):
          %c4_i32_3 = arith.constant 4 : i32
          %15 = arith.addi %arg2, %c4_i32_3 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c1_i32_4 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_4 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c16_i32_2 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32_2, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_3 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %24 = arith.muli %arg4, %c4_i32_10 : i32
          %25 = arith.addi %24, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %26 = arith.addi %c20_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_11 : i32
          "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %24 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %25 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) : (i32) -> ()
      }, {
        %c40_i32 = arith.constant 40 : i32
        %23 = arith.addi %c40_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_8 : i32
        %26 = "simt_step.if"(%25) ({
          %c1_i32_9 = arith.constant 1 : i32
          %27 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %27 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %16 = arith.addi %c44_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_4 : i32
      %19 = "simt_step.if"(%18) ({
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_8 : i32
        %24 = arith.addi %23, %0 : i32
        %c48_i32 = arith.constant 48 : i32
        %25 = arith.addi %c48_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_12 : i32
          %27 = arith.addi %26, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %28 = arith.addi %c68_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_13 : i32
          "simt_step.condition"(%30, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %26 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %27 = arith.addi %arg6, %c1_i32_12 : i32
          %true_13 = arith.constant true
          "simt_step.break"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %24 = arith.addi %arg3, %23#0 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c4_i32_7 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c1_i32 = arith.constant 1 : i32
    return
  }
}

