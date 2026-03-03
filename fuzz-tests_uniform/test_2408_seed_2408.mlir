module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %9, %c1_i32 : i32
      %11 = arith.cmpi slt, %arg5, %10 : i32
      "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32_6 : i32
        %13 = arith.cmpi slt, %arg7, %12 : i32
        "simt_step.condition"(%13, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %11 = simt_step.lane_id
        %12 = arith.index_cast %11 : index to i32
        %c1_i32_6 = arith.constant 1 : i32
        %13 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.break"(%12, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32 = arith.constant 2 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%9#0, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %3 = arith.remsi %arg3, %c3_i32 : i32
    %4 = "simt_step.switch"(%3, %arg0) ({
    ^bb0(%arg4: i32):
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %18 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %19 = arith.addi %18, %c1_i32_9 : i32
        %20 = arith.cmpi slt, %arg6, %19 : i32
        "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c1_i32_8 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32 = arith.constant 2 : i32
      %11 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_12 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %21 = arith.addi %arg6, %c1_i32_12 : i32
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_10 = arith.constant 3 : i32
        %19 = arith.addi %arg0, %c3_i32_10 : i32
        "simt_step.yield"(%18#0) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %19 = "simt_step.if"(%18) ({
          %c4_i32_10 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_10 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %c3_i32_10 = arith.constant 3 : i32
          %20 = arith.addi %arg0, %c3_i32_10 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_9 = arith.constant 3 : i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb3(%15: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %16 = arith.remsi %arg3, %c4_i32 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %17 = "simt_step.switch"(%16, %c4_i32_7) ({
      ^bb0(%arg5: i32):
        %c1_i32_8 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c4_i32_9 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32_9 : i32
        %20 = "simt_step.switch"(%19, %arg0) ({
        ^bb0(%arg6: i32):
          %c3_i32_13 = arith.constant 3 : i32
          %26 = arith.addi %arg0, %c3_i32_13 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          %28 = arith.addi %arg0, %c2_i32_14 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %c0_i32_15 = arith.constant 0 : i32
          %30 = arith.addi %arg0, %c0_i32_15 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %c2_i32_16 = arith.constant 2 : i32
          %32 = arith.addi %arg0, %c2_i32_16 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %23 = "simt_step.if"(%22) ({
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) : (i32) -> ()
        }, {
          %c3_i32_13 = arith.constant 3 : i32
          %26 = arith.addi %arg0, %c3_i32_13 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_14 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_13 = arith.constant 3 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_14 : i32
          "simt_step.yield"(%c3_i32_13, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %8 = arith.select %7, %0#0, %4 : i32
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
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_6 : i32
        %23 = arith.addi %22, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %24 = arith.addi %c12_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %25 = arith.muli %arg6, %c4_i32_9 : i32
          %26 = arith.addi %25, %0 : i32
          %c32_i32_10 = arith.constant 32 : i32
          %27 = arith.addi %c32_i32_10, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_11 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %25 = arith.addi %arg5, %arg6 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %26 = arith.addi %arg6, %c1_i32_9 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        %23 = arith.addi %arg3, %22#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %10 = arith.addi %c32_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %12 = arith.addi %c52_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.lane_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %19 = arith.addi %c56_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
      %22 = "simt_step.if"(%21) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_12 : i32
          %36 = arith.addi %35, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %37 = arith.addi %c60_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_13 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32_12 : i32
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %34 = arith.addi %c80_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_9 : i32
        %37 = "simt_step.if"(%36) ({
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %24 = arith.addi %c84_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c1_i32_9 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %36 = arith.addi %c88_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_14 = arith.constant 0 : i32
          %41 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_14 : i32
          %42 = arith.addi %41, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %43 = arith.addi %c92_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_15 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_14 : i32
          "simt_step.break"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c112_i32 = arith.constant 112 : i32
      %28 = arith.addi %c112_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %30 = arith.addi %0, %c1_i32 : i32
      %31 = "simt_step.switch"(%29, %30) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_14 : i32
          %48 = arith.addi %47, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %49 = arith.addi %c116_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_15 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32_14 : i32
          "simt_step.break"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%34#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %36 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c136_i32 = arith.constant 136 : i32
        %38 = arith.addi %c136_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
        %41 = "simt_step.if"(%40) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c140_i32 = arith.constant 140 : i32
        %43 = arith.addi %c140_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_13 : i32
        %46 = "simt_step.if"(%45) ({
          %c0_i32_14 = arith.constant 0 : i32
          %47 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %c4_i32_14 = arith.constant 4 : i32
          %47 = arith.addi %0, %c4_i32_14 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %33:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_9 : i32
        %35 = arith.addi %34, %0 : i32
        %c144_i32 = arith.constant 144 : i32
        %36 = arith.addi %c144_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_10 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %34 = arith.addi %arg3, %arg4 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %35 = arith.addi %arg4, %c1_i32_9 : i32
        "simt_step.yield"(%34, %35) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %17 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

