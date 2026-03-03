module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %1 = "simt_step.switch"(%0, %c3_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_11 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32_12 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_12 : i32
        "simt_step.yield"(%c0_i32_11, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c3_i32_3 = arith.constant 3 : i32
      %7 = arith.addi %arg0, %c3_i32_3 : i32
      "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c3_i32_4 = arith.constant 3 : i32
      %9 = arith.remsi %arg3, %c3_i32_4 : i32
      %10 = "simt_step.switch"(%9, %arg0) ({
      ^bb0(%arg5: i32):
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %18 = "simt_step.switch"(%17, %c0_i32_11) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %c2_i32_20 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %21 = "simt_step.if"(%20) ({
          %c1_i32_20 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_20) : (i32) -> ()
        }, {
          %c1_i32_20 = arith.constant 1 : i32
          %27 = arith.addi %arg0, %c1_i32_20 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_13 = arith.constant 1 : i32
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_20 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_21 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c0_i32_20 = arith.constant 0 : i32
          %27 = arith.addi %arg0, %c0_i32_20 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32_21 : i32
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_16 = arith.constant 1 : i32
        %24 = arith.addi %arg0, %c1_i32_16 : i32
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%25: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_20 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_21 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32_21 : i32
          "simt_step.break"(%c4_i32_20, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_19 = arith.constant 3 : i32
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_11 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32_12 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32 : i32
        %18 = "simt_step.switch"(%17, %arg0) ({
        ^bb0(%arg7: i32):
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_11 = arith.constant 3 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32_12 : i32
        "simt_step.break"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c3_i32_7 = arith.constant 3 : i32
      %13 = arith.addi %arg0, %c3_i32_7 : i32
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%14: i32):  // no predecessors
      %c4_i32_8 = arith.constant 4 : i32
      %15 = arith.remsi %arg3, %c4_i32_8 : i32
      %c4_i32_9 = arith.constant 4 : i32
      %16 = "simt_step.switch"(%15, %c4_i32_9) ({
      ^bb0(%arg5: i32):
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32_11 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_20 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32_21 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_20 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32_20 : i32
          "simt_step.yield"(%arg0, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c4_i32_14 = arith.constant 4 : i32
        %23 = arith.remsi %arg3, %c4_i32_14 : i32
        %c3_i32_15 = arith.constant 3 : i32
        %24 = arith.addi %arg0, %c3_i32_15 : i32
        %25 = "simt_step.switch"(%23, %24) ({
        ^bb0(%arg6: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %30 = arith.addi %arg0, %c4_i32_20 : i32
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %c1_i32_21 = arith.constant 1 : i32
          %33 = arith.addi %arg0, %c1_i32_21 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb3(%34: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_16 = arith.constant 3 : i32
        %26 = arith.addi %arg0, %c3_i32_16 : i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_20 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32_21 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_20 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32_20 : i32
          "simt_step.yield"(%arg0, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_19 = arith.constant 0 : i32
        %29 = arith.addi %arg0, %c0_i32_19 : i32
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32_10 = arith.constant 1 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %5 = arith.select %4, %arg0, %1 : i32
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
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %18 = "simt_step.switch"(%17, %c0_i32_9) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_15 : i32
          %29 = arith.addi %28, %0 : i32
          %c16_i32_16 = arith.constant 16 : i32
          %30 = arith.addi %c16_i32_16, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_17 : i32
          "simt_step.condition"(%32, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %28 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%21#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %24 = arith.addi %c36_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_14 : i32
        %27 = "simt_step.if"(%26) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %20 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
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
      %c4_i32_9 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_9 : i32
      %17 = arith.addi %16, %0 : i32
      %c40_i32 = arith.constant 40 : i32
      %18 = arith.addi %c40_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_10 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c60_i32 = arith.constant 60 : i32
      %16 = arith.addi %c60_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %18 = "simt_step.switch"(%17, %c3_i32) ({
      ^bb0(%arg4: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_15 : i32
          %27 = arith.addi %26, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %28 = arith.addi %c64_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_16 : i32
          "simt_step.condition"(%30, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %26 = arith.addi %arg5, %arg6 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %27 = arith.addi %arg6, %c1_i32_15 : i32
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%21#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %23 = arith.addi %c84_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %25 = "simt_step.switch"(%24, %c4_i32_13) ({
        ^bb0(%arg5: i32):
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) {fallthrough = true} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      %19 = arith.addi %arg2, %18 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %c0_i32_6 = arith.constant 0 : i32
    %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_9 : i32
      %17 = arith.addi %16, %0 : i32
      %c88_i32 = arith.constant 88 : i32
      %18 = arith.addi %c88_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_10 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c108_i32 = arith.constant 108 : i32
      %16 = arith.addi %c108_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_10) {fallthrough = true} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c112_i32 = arith.constant 112 : i32
        %24 = arith.addi %c112_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_11 : i32
        %27 = "simt_step.if"(%26) ({
          %c1_i32_12 = arith.constant 1 : i32
          %28 = arith.addi %0, %c1_i32_12 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      %21 = arith.addi %arg2, %20 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_7 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %14 = arith.addi %c48_i32, %0 : i32
    %true_8 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

