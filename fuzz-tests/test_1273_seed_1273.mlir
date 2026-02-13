module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.addi %arg0, %c4_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %6 = "simt_step.if"(%5) ({
        %c2_i32_3 = arith.constant 2 : i32
        %12 = arith.remsi %arg3, %c2_i32_3 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %13 = "simt_step.switch"(%12, %c4_i32_4) ({
        ^bb0(%arg5: i32):
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          %16 = arith.addi %arg0, %c0_i32_6 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32_5 = arith.constant 3 : i32
        "simt_step.yield"(%13) : (i32) -> ()
      }, {
        %c2_i32_3 = arith.constant 2 : i32
        %12 = arith.remsi %arg3, %c2_i32_3 : i32
        %13 = "simt_step.switch"(%12, %arg0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %15 = arith.addi %arg0, %c2_i32_4 : i32
          "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
        ^bb2(%16: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_3 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%arg0, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %10 = arith.remsi %arg3, %c2_i32 : i32
      %11 = "simt_step.switch"(%10, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %13 = "simt_step.if"(%12) ({
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.addi %arg0, %c4_i32_7 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32 : i32
          %21 = arith.cmpi slt, %arg7, %20 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %19 = arith.addi %arg0, %c0_i32_7 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c4_i32_6 = arith.constant 4 : i32
        %17 = arith.addi %arg0, %c4_i32_6 : i32
        %18 = "simt_step.switch"(%arg3, %17) ({
        ^bb0(%arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = "simt_step.switch"(%6, %c0_i32_0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = "simt_step.switch"(%14, %0) ({
      ^bb0(%arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_5 : i32
          %30 = arith.addi %29, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %31 = arith.addi %c16_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_6 : i32
          "simt_step.condition"(%33, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %29 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg5, %c1_i32 : i32
          %true_5 = arith.constant true
          "simt_step.break"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %25 = arith.addi %c36_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_4 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %17 = arith.addi %c40_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_1 : i32
      %20 = "simt_step.if"(%19) ({
        %c44_i32 = arith.constant 44 : i32
        %21 = arith.addi %c44_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_2 : i32
        %24 = "simt_step.if"(%23) ({
          %c3_i32 = arith.constant 3 : i32
          %25 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %c48_i32 = arith.constant 48 : i32
        %21 = arith.addi %c48_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_2 : i32
        %24 = "simt_step.if"(%23) ({
          %c4_i32_3 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_3) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c52_i32 = arith.constant 52 : i32
    %8 = arith.addi %c52_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %20 = arith.muli %arg4, %c4_i32_4 : i32
        %21 = arith.addi %20, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %22 = arith.addi %c56_i32, %21 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        "simt_step.condition"(%24, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %20 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.yield"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %16 = arith.addi %c76_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_3 : i32
      %19 = "simt_step.if"(%18) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %21 = arith.muli %arg4, %c4_i32_6 : i32
          %22 = arith.addi %21, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %23 = arith.addi %c80_i32, %22 : i32
          %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
          "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %21 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %arg4, %c1_i32 : i32
          %true = arith.constant true
          "simt_step.yield"(%21, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %20 = arith.addi %c100_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_4 : i32
        %23 = "simt_step.if"(%22) ({
          %c4_i32_5 = arith.constant 4 : i32
          %24 = arith.addi %0, %c4_i32_5 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %c0_i32_5 = arith.constant 0 : i32
          %24 = arith.addi %0, %c0_i32_5 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

