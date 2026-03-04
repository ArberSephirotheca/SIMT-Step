module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c3_i32_0 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32_0 : i32
      %c4_i32 = arith.constant 4 : i32
      %7 = "simt_step.switch"(%6, %c4_i32) ({
      ^bb0(%arg5: i32):
        %c2_i32_5 = arith.constant 2 : i32
        %16 = arith.remsi %arg3, %c2_i32_5 : i32
        %c3_i32_6 = arith.constant 3 : i32
        %17 = "simt_step.switch"(%16, %c3_i32_6) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          %25 = arith.addi %arg0, %c0_i32_10 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %c3_i32_9 = arith.constant 3 : i32
        %21 = arith.remsi %arg3, %c3_i32_9 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg0, %c1_i32 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          %26 = arith.addi %arg0, %c0_i32_10 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb3(%27: i32):  // no predecessors
          %c3_i32_11 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %10 = "simt_step.if"(%9) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%arg0, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %17 = "simt_step.if"(%16) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_5 = arith.constant 2 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%c2_i32_5, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %14 = arith.remsi %arg3, %c2_i32 : i32
      %15 = "simt_step.switch"(%14, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %17 = "simt_step.if"(%16) ({
          %c0_i32_9 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_9) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_9 : i32
          "simt_step.yield"(%c1_i32, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %22 = "simt_step.if"(%21) ({
          %c3_i32_9 = arith.constant 3 : i32
          %23 = arith.addi %arg0, %c3_i32_9 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %9 = arith.addi %c8_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
      "simt_step.if"(%11) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %8 = "simt_step.switch"(%7, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %9 = arith.addi %c16_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
      %12 = "simt_step.if"(%11) ({
        %c20_i32 = arith.constant 20 : i32
        %22 = arith.addi %c20_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
        %25 = "simt_step.if"(%24) ({
          %c2_i32 = arith.constant 2 : i32
          %26 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c24_i32 = arith.constant 24 : i32
        %22 = arith.addi %c24_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.addi %0, %c0_i32_7 : i32
        %25 = "simt_step.switch"(%23, %24) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          %27 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          %29 = arith.addi %0, %c4_i32_9 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_7 : i32
        %23 = arith.addi %22, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %24 = arith.addi %c28_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c48_i32 = arith.constant 48 : i32
        %22 = arith.addi %c48_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
        %25 = "simt_step.if"(%24) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32_9 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_9) : (i32) -> ()
        }) : (i1) -> i32
        %26 = arith.addi %arg3, %25 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %27 = arith.addi %arg4, %c1_i32_8 : i32
        %true = arith.constant true
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_7 : i32
        %23 = arith.addi %22, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %24 = arith.addi %c52_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32_7 : i32
        %true = arith.constant true
        "simt_step.continue"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %18 = arith.addi %c72_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %20 = arith.addi %0, %c3_i32 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %22 = arith.addi %0, %c0_i32_7 : i32
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %24 = arith.addi %c76_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        %27 = "simt_step.if"(%26) ({
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) : (i32) -> ()
        }, {
          %c1_i32_9 = arith.constant 1 : i32
          %28 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c1_i32_1 = arith.constant 1 : i32
    return
  }
}

