module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32_2 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32_2 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_5 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.muli %arg7, %c4_i32 : i32
        %9 = arith.addi %c0_i32_5, %8 : i32
        %10 = arith.addi %9, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_6 = arith.constant 1 : i32
        %11 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.yield"(%7, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32_4 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32_4 : i32
      "simt_step.yield"(%5#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %2 = "simt_step.switch"(%1, %c1_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %6 = "simt_step.if"(%5) ({
        %c3_i32_6 = arith.constant 3 : i32
        %17 = arith.remsi %arg3, %c3_i32_6 : i32
        %c3_i32_7 = arith.constant 3 : i32
        %18 = "simt_step.switch"(%17, %c3_i32_7) ({
        ^bb0(%arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %21 = arith.addi %arg0, %c2_i32_8 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c2_i32_6 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_6 : i32
        %18 = "simt_step.switch"(%17, %arg0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c1_i32_7 = arith.constant 1 : i32
          %20 = arith.addi %arg0, %c1_i32_7 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %8 = arith.remsi %arg3, %c2_i32 : i32
      %c3_i32_3 = arith.constant 3 : i32
      %9 = arith.addi %arg0, %c3_i32_3 : i32
      %10 = "simt_step.switch"(%8, %9) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %18 = "simt_step.if"(%17) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32_9 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32_9 : i32
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_9 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_9 = arith.constant 3 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_10 : i32
          "simt_step.yield"(%c3_i32_9, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %22 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg6: i32):
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %12 = "simt_step.switch"(%arg3, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %18 = "simt_step.if"(%17) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c4_i32 = arith.constant 4 : i32
          %21 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %21 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32_9 : i32
          %23 = arith.cmpi slt, %arg7, %22 : i32
          "simt_step.condition"(%23, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %21 = arith.addi %arg0, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %22 = arith.addi %arg7, %c1_i32_9 : i32
          "simt_step.yield"(%21, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32_4 = arith.constant 3 : i32
      %13 = arith.addi %arg0, %c3_i32_4 : i32
      "simt_step.yield"(%12) {fallthrough = true} : (i32) -> ()
    ^bb3(%14: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_8 : i32
          %20 = arith.cmpi slt, %arg6, %19 : i32
          "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_8 = arith.constant 1 : i32
          %18 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.continue"(%arg0, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) : (i32) -> ()
      }, {
        %c1_i32_6 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_6) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %4 = arith.select %3, %0#0, %2 : i32
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
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_1 : i32
      %19 = "simt_step.if"(%18) ({
        %c0_i32_3 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_3) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %23 = arith.muli %arg3, %c4_i32_5 : i32
          %24 = arith.addi %23, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %25 = arith.addi %c16_i32, %24 : i32
          %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %27 = arith.cmpi ne, %26, %c0_i32_6 : i32
          "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %23 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg3, %c1_i32 : i32
          %true_5 = arith.constant true
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_6 : i32
          %26 = arith.addi %c16_i32, %25 : i32
          %27 = arith.addi %26, %0 : i32
          %true_7 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) : (i32) -> ()
      }) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %20 = arith.addi %c32_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %9 = arith.addi %c48_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c36_i32 = arith.constant 36 : i32
    %11 = arith.addi %c36_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.subgroup_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c40_i32 = arith.constant 40 : i32
      %16 = arith.addi %c40_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %18 = arith.addi %0, %c3_i32 : i32
      %19 = "simt_step.switch"(%17, %18) ({
      ^bb0(%arg3: i32):
        %c44_i32 = arith.constant 44 : i32
        %27 = arith.addi %c44_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_3 = arith.constant 1 : i32
        %29 = "simt_step.switch"(%28, %c1_i32_3) ({
        ^bb0(%arg4: i32):
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          %42 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c48_i32_4 = arith.constant 48 : i32
        %31 = arith.addi %c48_i32_4, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_5 : i32
        %34 = "simt_step.if"(%33) ({
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %c4_i32_7 = arith.constant 4 : i32
          %40 = arith.addi %0, %c4_i32_7 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %36 = arith.addi %c52_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_6 : i32
        %39 = "simt_step.if"(%38) ({
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_3 : i32
        %28 = arith.addi %27, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %29 = arith.addi %c56_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_4 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c76_i32 = arith.constant 76 : i32
        %27 = arith.addi %c76_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = "simt_step.switch"(%28, %0) ({
        ^bb0(%arg5: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c2_i32_5 = arith.constant 2 : i32
          %33 = arith.addi %0, %c2_i32_5 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %30 = arith.addi %arg3, %29 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32_3 : i32
        %true_4 = arith.constant true
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %23 = arith.addi %c80_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %25 = arith.addi %0, %c1_i32 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c84_i32 = arith.constant 84 : i32
        %27 = arith.addi %c84_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_3 : i32
        %30 = "simt_step.if"(%29) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %32 = arith.addi %c88_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_4 = arith.constant 1 : i32
        %34 = "simt_step.switch"(%33, %c1_i32_4) ({
        ^bb0(%arg4: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_5 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

