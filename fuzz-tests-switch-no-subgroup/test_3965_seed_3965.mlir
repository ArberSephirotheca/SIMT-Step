module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.remsi %arg3, %c4_i32 : i32
      %c3_i32 = arith.constant 3 : i32
      %3 = "simt_step.switch"(%2, %c3_i32) ({
      ^bb0(%arg4: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %7 = "simt_step.if"(%6) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_8 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_7 = arith.constant 1 : i32
          %16 = arith.addi %arg0, %c1_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.yield"(%16, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c4_i32_4 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg0, %c1_i32 : i32
        %13 = "simt_step.switch"(%11, %12) ({
        ^bb0(%arg5: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %16 = arith.addi %arg0, %c4_i32_7 : i32
          "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_8) {fallthrough = true} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %19 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb3(%20: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          %21 = arith.addi %arg0, %c1_i32_10 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb3(%14: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_8 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c2_i32 = arith.constant 2 : i32
          %16 = arith.addi %arg0, %c2_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32_7 : i32
          "simt_step.yield"(%16, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = simt_step.lane_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c3_i32_0 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_0) {fallthrough = false} : (i32) -> ()
      ^bb1(%6: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%7: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %23 = arith.addi %c8_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
      "simt_step.if"(%25) ({
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
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_6 : i32
        %25 = arith.addi %24, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %26 = arith.addi %c16_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
        "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_11 : i32
          %32 = arith.addi %31, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %33 = arith.addi %c36_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_12 : i32
          "simt_step.condition"(%35, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %31 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %32 = arith.addi %arg5, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %33 = arith.muli %arg5, %c4_i32_13 : i32
          %34 = arith.addi %c16_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_14 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %25 = arith.addi %arg2, %24#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        %true_8 = arith.constant true
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %27 = arith.muli %arg3, %c4_i32_9 : i32
        %28 = arith.addi %c32_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_10 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) : (i32) -> ()
    }, {
      %c56_i32 = arith.constant 56 : i32
      %23 = arith.addi %c56_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
      %26 = "simt_step.if"(%25) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %30 = arith.muli %arg3, %c4_i32_8 : i32
          %31 = arith.addi %30, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %32 = arith.addi %c60_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
          "simt_step.condition"(%34, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %30 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg3, %c1_i32 : i32
          %true_8 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %32 = arith.muli %arg3, %c4_i32_9 : i32
          %33 = arith.addi %c48_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_10 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) : (i32) -> ()
      }, {
        %c80_i32_6 = arith.constant 80 : i32
        %29 = arith.addi %c80_i32_6, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_7 : i32
        %32 = "simt_step.if"(%31) ({
          %c2_i32 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %33 = arith.addi %c64_i32, %0 : i32
        %true_8 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %27 = arith.addi %c80_i32, %0 : i32
      %true_5 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %10 = arith.addi %c96_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c84_i32 = arith.constant 84 : i32
    %12 = arith.addi %c84_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c88_i32 = arith.constant 88 : i32
      %23 = arith.addi %c88_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %25 = "simt_step.switch"(%24, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c92_i32 = arith.constant 92 : i32
        %30 = arith.addi %c92_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_8 : i32
        %33 = "simt_step.if"(%32) ({
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c96_i32_9 = arith.constant 96 : i32
        %35 = arith.addi %c96_i32_9, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        %38 = "simt_step.if"(%37) ({
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_13 : i32
          %42 = arith.addi %41, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %43 = arith.addi %c100_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_14 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_8 : i32
        %31 = arith.addi %30, %0 : i32
        %c120_i32 = arith.constant 120 : i32
        %32 = arith.addi %c120_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %30 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        "simt_step.break"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_8 : i32
        %31 = arith.addi %30, %0 : i32
        %c140_i32 = arith.constant 140 : i32
        %32 = arith.addi %c140_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %30 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c160_i32 = arith.constant 160 : i32
    %17 = arith.addi %c160_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %19 = arith.cmpi ne, %18, %c0_i32_2 : i32
    %20 = "simt_step.if"(%19) ({
      %c164_i32 = arith.constant 164 : i32
      %23 = arith.addi %c164_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
      %26 = "simt_step.if"(%25) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %30 = arith.muli %arg3, %c4_i32_8 : i32
          %31 = arith.addi %30, %0 : i32
          %c168_i32 = arith.constant 168 : i32
          %32 = arith.addi %c168_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
          "simt_step.condition"(%34, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %30 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg3, %c1_i32 : i32
          %true_8 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %32 = arith.muli %arg3, %c4_i32_9 : i32
          %33 = arith.addi %c112_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_10 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) : (i32) -> ()
      }, {
        %29 = simt_step.subgroup_id
        %30 = arith.index_cast %29 : index to i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %27 = arith.addi %c128_i32, %0 : i32
      %true_5 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) : (i32) -> ()
    }, {
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c144_i32 = arith.constant 144 : i32
    %21 = arith.addi %c144_i32, %0 : i32
    %true_3 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

