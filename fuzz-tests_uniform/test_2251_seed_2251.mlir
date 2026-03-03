module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %5 = "simt_step.switch"(%4, %arg0) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%6: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32_6 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_5 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32_5 : i32
          "simt_step.yield"(%arg0, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%8: i32):  // no predecessors
        %c3_i32_3 = arith.constant 3 : i32
        %9 = arith.remsi %arg3, %c3_i32_3 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %10 = arith.addi %arg0, %c4_i32_4 : i32
        %11 = "simt_step.switch"(%9, %10) ({
        ^bb0(%arg5: i32):
          %c1_i32_5 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_5) {fallthrough = true} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          %14 = arith.addi %arg0, %c4_i32_6 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %16 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
        ^bb3(%17: i32):  // no predecessors
          %c1_i32_7 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32_7 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %4 = simt_step.subgroup_id
      %5 = arith.index_cast %4 : index to i32
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_12 : i32
        %22 = arith.addi %21, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %23 = arith.addi %c12_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_13 : i32
        "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %21 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_12 : i32
        %22 = arith.addi %21, %0 : i32
        %c32_i32_13 = arith.constant 32 : i32
        %23 = arith.addi %c32_i32_13, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_14 : i32
        "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %21 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%16#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %18 = arith.addi %c52_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c56_i32 = arith.constant 56 : i32
        %21 = arith.addi %c56_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %23 = "simt_step.switch"(%22, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32_15 = arith.constant 2 : i32
          %29 = arith.addi %0, %c2_i32_15 : i32
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %31 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %25 = arith.addi %c60_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %27 = arith.addi %0, %c4_i32_13 : i32
        %28 = "simt_step.switch"(%26, %27) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %30 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb3(%32: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_11 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c64_i32 = arith.constant 64 : i32
      %15 = arith.addi %c64_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c84_i32 = arith.constant 84 : i32
      %13 = arith.addi %c84_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %15 = "simt_step.switch"(%14, %c2_i32) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32_12 : i32
          %25 = arith.addi %24, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %26 = arith.addi %c88_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_13 : i32
          "simt_step.condition"(%28, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %24 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %25 = arith.addi %arg6, %c1_i32_12 : i32
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %21 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb3(%22: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32_12 : i32
          %25 = arith.addi %24, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %26 = arith.addi %c108_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_13 : i32
          "simt_step.condition"(%28, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %24 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %25 = arith.addi %arg6, %c1_i32_12 : i32
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %16 = arith.addi %arg2, %15 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

