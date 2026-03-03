module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%arg0, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_7 = arith.constant 0 : i32
        %12 = arith.addi %arg0, %c0_i32_7 : i32
        "simt_step.yield"(%11#0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32 : i32
          %14 = arith.cmpi slt, %arg6, %13 : i32
          "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c2_i32 = arith.constant 2 : i32
          %12 = arith.addi %arg0, %c2_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%12, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_7 = arith.constant 3 : i32
        "simt_step.yield"(%11#0) : (i32) -> ()
      }) : (i1) -> i32
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %8 = "simt_step.if"(%7) ({
        %c0_i32_5 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %12 = "simt_step.if"(%11) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c0_i32_6 = arith.constant 0 : i32
          %13 = arith.addi %arg0, %c0_i32_6 : i32
          "simt_step.yield"(%13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32 : i32
          %14 = arith.cmpi slt, %arg6, %13 : i32
          "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %12 = arith.addi %arg0, %c4_i32_7 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%12, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%11#0) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32_2 = arith.constant 3 : i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg6, %12 : i32
        "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %12 = "simt_step.if"(%11) ({
          %c1_i32_7 = arith.constant 1 : i32
          %15 = arith.addi %arg0, %c1_i32_7 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %c0_i32_7 = arith.constant 0 : i32
          %15 = arith.addi %arg0, %c0_i32_7 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_6 = arith.constant 4 : i32
        %13 = arith.addi %arg0, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%12, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_11 : i32
      %18 = arith.addi %17, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %19 = arith.addi %c8_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_12 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %17 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_11 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_11 : i32
      %18 = arith.addi %17, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %19 = arith.addi %c28_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_12 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %17 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %11 = arith.addi %c48_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_7 = arith.constant 4 : i32
    %13 = arith.addi %0, %c4_i32_7 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_18 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_18 : i32
        %27 = arith.addi %26, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %28 = arith.addi %c52_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_19 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %26 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c0_i32_14 = arith.constant 0 : i32
      %c0_i32_15 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_18 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_18 : i32
        %27 = arith.addi %26, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %28 = arith.addi %c72_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_19 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c92_i32 = arith.constant 92 : i32
        %26 = arith.addi %c92_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %28 = "simt_step.switch"(%27, %c1_i32) ({
        ^bb0(%arg5: i32):
          %c0_i32_20 = arith.constant 0 : i32
          %31 = arith.addi %0, %c0_i32_20 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c4_i32_21 = arith.constant 4 : i32
          %34 = arith.addi %0, %c4_i32_21 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_18 = arith.constant true
        %29 = arith.addi %arg3, %28 : i32
        %c1_i32_19 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32_19 : i32
        "simt_step.break"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_16 = arith.constant true
      "simt_step.yield"(%20#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %22 = arith.addi %c96_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_17 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_17 : i32
      %25 = "simt_step.if"(%24) ({
        %c100_i32 = arith.constant 100 : i32
        %26 = arith.addi %c100_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_18 : i32
        %29 = "simt_step.if"(%28) ({
          %c2_i32_19 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_19) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %27 = arith.muli %arg4, %c4_i32_21 : i32
          %28 = arith.addi %27, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %29 = arith.addi %c104_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_22 : i32
          "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %27 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_20 = arith.constant true
        "simt_step.yield"(%26#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_8 = arith.constant true
    %c48_i32_9 = arith.constant 48 : i32
    %15 = arith.addi %c48_i32_9, %0 : i32
    %true_10 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

