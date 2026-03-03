module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %1 = arith.remsi %arg3, %c3_i32_0 : i32
    %2 = "simt_step.switch"(%1, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_8 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %16 = "simt_step.if"(%15) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32_11 = arith.constant 2 : i32
          %19 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32_9 = arith.constant 2 : i32
        %17 = arith.addi %arg0, %c2_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %18 = arith.addi %arg6, %c1_i32_10 : i32
        "simt_step.yield"(%16, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32 = arith.constant 2 : i32
      %8 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32_8 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %16 = "simt_step.if"(%15) ({
          %c2_i32_10 = arith.constant 2 : i32
          %18 = arith.addi %arg0, %c2_i32_10 : i32
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %c1_i32_10 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32_10 : i32
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32 = arith.constant 4 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32_6 = arith.constant 2 : i32
      %11 = arith.addi %arg0, %c2_i32_6 : i32
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c3_i32_7 = arith.constant 3 : i32
      %13 = arith.remsi %arg3, %c3_i32_7 : i32
      %14 = "simt_step.switch"(%13, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_17 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_18 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_17 = arith.constant 3 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_18 : i32
          "simt_step.yield"(%c3_i32_17, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_10 = arith.constant 3 : i32
        "simt_step.yield"(%15#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_17 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_18 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c0_i32_17 = arith.constant 0 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_18 : i32
          "simt_step.yield"(%c0_i32_17, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_17 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_18 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_18 : i32
          "simt_step.yield"(%c4_i32_17, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_15 = arith.constant 0 : i32
        %20 = arith.addi %arg0, %c0_i32_15 : i32
        "simt_step.yield"(%19#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%21: i32):  // no predecessors
        %c1_i32_16 = arith.constant 1 : i32
        %22 = arith.addi %arg0, %c1_i32_16 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %6 = arith.select %5, %0, %2 : i32
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
    %c1_i32 = arith.constant 1 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_10 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_10 : i32
      %19 = arith.addi %18, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %20 = arith.addi %c8_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_11 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32_10 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32_10 : i32
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
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
      %c4_i32_10 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_10 : i32
      %19 = arith.addi %18, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %20 = arith.addi %c28_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_11 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32_10 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32_10 : i32
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
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
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %18 = arith.addi %c52_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c56_i32 = arith.constant 56 : i32
        %35 = arith.addi %c56_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_20 : i32
          %42 = arith.addi %41, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %43 = arith.addi %c60_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_21 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_20 : i32
          "simt_step.continue"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %22 = arith.addi %c80_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %24 = arith.addi %0, %c0_i32_11 : i32
      %25 = "simt_step.switch"(%23, %24) ({
      ^bb0(%arg3: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %35 = arith.addi %0, %c4_i32_16 : i32
        "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c4_i32_17 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_12 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %27 = arith.addi %c84_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_13 : i32
      %30 = "simt_step.if"(%29) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c88_i32 = arith.constant 88 : i32
        %35 = arith.addi %c88_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32_17 = arith.constant 1 : i32
          %38 = arith.addi %0, %c1_i32_17 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %42 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %32 = arith.addi %c92_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %34 = "simt_step.switch"(%33, %c0_i32_14) ({
      ^bb0(%arg3: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_24 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_24 : i32
          %45 = arith.addi %44, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %46 = arith.addi %c96_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_25 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_25 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_24 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_24 : i32
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %37 = arith.addi %c116_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_19 : i32
        %40 = "simt_step.if"(%39) ({
          %c1_i32_24 = arith.constant 1 : i32
          %44 = arith.addi %0, %c1_i32_24 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c0_i32_20 = arith.constant 0 : i32
        %c0_i32_21 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_20, %c0_i32_21) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_24 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_24 : i32
          %45 = arith.addi %44, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %46 = arith.addi %c120_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_25 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_25 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_24 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_24 : i32
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_22 = arith.constant true
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%43: i32):  // no predecessors
        %c1_i32_23 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_15 = arith.constant true
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_7 = arith.constant true
    %c48_i32_8 = arith.constant 48 : i32
    %16 = arith.addi %c48_i32_8, %0 : i32
    %true_9 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

