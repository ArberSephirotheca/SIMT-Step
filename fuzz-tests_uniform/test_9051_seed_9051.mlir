module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_3 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %11 = "simt_step.if"(%10) ({
          %c2_i32_4 = arith.constant 2 : i32
          %13 = arith.addi %arg0, %c2_i32_4 : i32
          "simt_step.yield"(%13) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.addi %arg0, %c3_i32 : i32
        "simt_step.yield"(%11) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32 : i32
          %13 = arith.cmpi slt, %arg6, %12 : i32
          "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_5 = arith.constant 0 : i32
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%c0_i32_5, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32_5 : i32
          %15 = arith.cmpi slt, %arg8, %14 : i32
          "simt_step.condition"(%15, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.addi %arg0, %c4_i32 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %14 = arith.addi %arg8, %c1_i32_5 : i32
          "simt_step.break"(%13, %14) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32 = arith.constant 3 : i32
        %11 = arith.addi %arg0, %c3_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%10#0, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %20 = arith.addi %c12_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_7 : i32
      %23 = "simt_step.if"(%22) ({
        %c4_i32_8 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_8) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_11 : i32
          %26 = arith.addi %25, %0 : i32
          %c16_i32_12 = arith.constant 16 : i32
          %27 = arith.addi %c16_i32_12, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_13 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %c36_i32 = arith.constant 36 : i32
      %20 = arith.addi %c36_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_7 = arith.constant 4 : i32
      %22 = arith.addi %0, %c4_i32_7 : i32
      %23 = "simt_step.switch"(%21, %22) ({
      ^bb0(%arg2: i32):
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %25 = arith.addi %c40_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %27 = "simt_step.switch"(%26, %c2_i32) ({
        ^bb0(%arg3: i32):
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %30 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %32 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_7 : i32
      %21 = arith.addi %20, %0 : i32
      %c44_i32 = arith.constant 44 : i32
      %22 = arith.addi %c44_i32, %21 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_8 : i32
      "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c64_i32 = arith.constant 64 : i32
      %20 = arith.addi %c64_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = "simt_step.switch"(%21, %0) ({
      ^bb0(%arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %33 = arith.muli %arg6, %c4_i32_15 : i32
          %34 = arith.addi %33, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %35 = arith.addi %c68_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_16 : i32
          "simt_step.condition"(%37, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %33 = arith.addi %arg5, %arg6 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %34 = arith.addi %arg6, %c1_i32_15 : i32
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %27 = arith.addi %c88_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %0, %c3_i32 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg5: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %33 = arith.muli %arg6, %c4_i32_15 : i32
          %34 = arith.addi %33, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %35 = arith.addi %c92_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_16 : i32
          "simt_step.condition"(%37, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %33 = arith.addi %arg5, %arg6 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %34 = arith.addi %arg6, %c1_i32_15 : i32
          "simt_step.continue"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %23 = arith.addi %arg2, %22 : i32
      %c1_i32 = arith.constant 1 : i32
      %24 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%23, %24) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c112_i32 = arith.constant 112 : i32
    %14 = arith.addi %c112_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_5 = arith.constant 0 : i32
    %16 = arith.cmpi ne, %15, %c0_i32_5 : i32
    %17 = "simt_step.if"(%16) ({
      %c0_i32_7 = arith.constant 0 : i32
      %20 = arith.addi %0, %c0_i32_7 : i32
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_10 : i32
        %22 = arith.addi %21, %0 : i32
        %c116_i32 = arith.constant 116 : i32
        %23 = arith.addi %c116_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_11 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %21 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.continue"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      "simt_step.yield"(%20#0) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %18 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

