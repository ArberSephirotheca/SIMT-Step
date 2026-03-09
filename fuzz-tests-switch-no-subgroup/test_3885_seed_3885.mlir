module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %2 = arith.remsi %arg3, %c2_i32 : i32
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c3_i32 = arith.constant 3 : i32
        %6 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %7 = "simt_step.switch"(%6, %c1_i32) ({
        ^bb0(%arg5: i32):
          %c2_i32_2 = arith.constant 2 : i32
          %10 = arith.addi %arg0, %c2_i32_2 : i32
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %c1_i32_3 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_3) {fallthrough = false} : (i32) -> ()
        ^bb2(%12: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%13: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %14 = arith.addi %arg0, %c2_i32_4 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_2 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32_2 : i32
          %12 = arith.cmpi slt, %arg6, %11 : i32
          "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_2 = arith.constant 0 : i32
          %c1_i32_3 = arith.constant 1 : i32
          %10 = arith.addi %arg6, %c1_i32_3 : i32
          "simt_step.yield"(%c0_i32_2, %10) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_8 : i32
        %28 = arith.addi %27, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %29 = arith.addi %c12_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_9 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %27 = arith.addi %c32_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %29 = "simt_step.switch"(%28, %c3_i32) ({
        ^bb0(%arg5: i32):
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %30 = arith.addi %arg3, %29 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32_8 : i32
        %true_9 = arith.constant true
        "simt_step.break"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %14 = arith.addi %c36_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_6 : i32
      %17 = "simt_step.if"(%16) ({
        %c40_i32 = arith.constant 40 : i32
        %27 = arith.addi %c40_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = "simt_step.switch"(%28, %0) ({
        ^bb0(%arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %31 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %33 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %27 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %19 = arith.addi %c44_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %21 = "simt_step.switch"(%20, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %27 = arith.addi %0, %c4_i32_8 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %29 = arith.addi %c48_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_9 : i32
        %32 = "simt_step.if"(%31) ({
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) : (i32) -> ()
        }, {
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_12 : i32
          %36 = arith.addi %35, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %37 = arith.addi %c52_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_13 : i32
          "simt_step.condition"(%39, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %35 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %36 = arith.addi %arg5, %c1_i32_12 : i32
          %true_13 = arith.constant true
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %23 = arith.addi %c72_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
      %26 = "simt_step.if"(%25) ({
        %c0_i32_8 = arith.constant 0 : i32
        %27 = arith.addi %0, %c0_i32_8 : i32
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_4 : i32
      %13 = arith.addi %12, %0 : i32
      %c76_i32 = arith.constant 76 : i32
      %14 = arith.addi %c76_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_5 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %12 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_4 : i32
      %15 = arith.addi %c16_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_5 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_4 : i32
      %13 = arith.addi %12, %0 : i32
      %c96_i32 = arith.constant 96 : i32
      %14 = arith.addi %c96_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_5 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c2_i32 = arith.constant 2 : i32
      %12 = arith.addi %0, %c2_i32 : i32
      %13 = arith.addi %arg2, %12 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c32_i32 = arith.constant 32 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_4 : i32
      %16 = arith.addi %c32_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_5 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

