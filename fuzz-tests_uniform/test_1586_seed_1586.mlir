module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.addi %arg0, %c3_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %6, %c1_i32 : i32
      %8 = arith.cmpi slt, %arg5, %7 : i32
      "simt_step.condition"(%8, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32_5 : i32
        %12 = arith.cmpi slt, %arg7, %11 : i32
        "simt_step.condition"(%12, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32_9 : i32
          %15 = arith.cmpi slt, %arg9, %14 : i32
          "simt_step.condition"(%15, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %13 = arith.addi %arg9, %c1_i32_10 : i32
          "simt_step.yield"(%c1_i32_9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_7 = arith.constant 3 : i32
        %11 = arith.addi %arg0, %c3_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %12 = arith.addi %arg7, %c1_i32_8 : i32
        "simt_step.yield"(%10#0, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %7 = simt_step.subgroup_id
      %8 = arith.index_cast %7 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%6#0, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %5 = arith.select %4, %0, %1#0 : i32
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
      %c12_i32 = arith.constant 12 : i32
      %24 = arith.addi %c12_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_17 : i32
          %51 = arith.addi %50, %0 : i32
          %c16_i32_18 = arith.constant 16 : i32
          %52 = arith.addi %c16_i32_18, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_19 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %38 = arith.addi %c36_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_13 = arith.constant 3 : i32
        %40 = "simt_step.switch"(%39, %c3_i32_13) ({
        ^bb0(%arg4: i32):
          %c0_i32_17 = arith.constant 0 : i32
          %50 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %42 = arith.addi %c40_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %44 = "simt_step.switch"(%43, %c2_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c2_i32_17 = arith.constant 2 : i32
          %51 = arith.addi %0, %c2_i32_17 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %46 = arith.addi %c44_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_16 : i32
        %49 = "simt_step.if"(%48) ({
          %c3_i32_17 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_17) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c48_i32_6 = arith.constant 48 : i32
      %28 = arith.addi %c48_i32_6, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %30 = "simt_step.switch"(%29, %c0_i32_7) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %32 = arith.addi %c52_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %34 = arith.addi %0, %c3_i32 : i32
      %35 = "simt_step.switch"(%33, %34) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_14 : i32
          %43 = arith.addi %42, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %44 = arith.addi %c56_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_15 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %39 = arith.addi %c76_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = "simt_step.switch"(%40, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32_14 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %43 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c80_i32 = arith.constant 80 : i32
    %12 = arith.addi %c80_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %24 = arith.addi %0, %c4_i32_5 : i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %26 = arith.addi %c84_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = "simt_step.switch"(%27, %0) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %30 = arith.addi %c88_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_7 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %37 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb3(%35: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_12 : i32
          %38 = arith.addi %37, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %39 = arith.addi %c92_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_13 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %17 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c112_i32 = arith.constant 112 : i32
    %19 = arith.addi %c112_i32, %0 : i32
    %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
    %21 = "simt_step.switch"(%20, %0) ({
    ^bb0(%arg2: i32):
      %c116_i32 = arith.constant 116 : i32
      %24 = arith.addi %c116_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_9 = arith.constant 0 : i32
        %39 = arith.addi %0, %c0_i32_9 : i32
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %c120_i32 = arith.constant 120 : i32
        %39 = arith.addi %c120_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = "simt_step.switch"(%40, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%41) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c124_i32 = arith.constant 124 : i32
      %29 = arith.addi %c124_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = "simt_step.switch"(%30, %0) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c128_i32 = arith.constant 128 : i32
        %41 = arith.addi %c128_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %43 = arith.addi %0, %c2_i32 : i32
        %44 = "simt_step.switch"(%42, %43) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %49 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %46:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_13 : i32
          %48 = arith.addi %47, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %49 = arith.addi %c132_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_14 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%46#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c152_i32 = arith.constant 152 : i32
      %33 = arith.addi %c152_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %35 = arith.addi %0, %c0_i32_7 : i32
      %36 = "simt_step.switch"(%34, %35) ({
      ^bb0(%arg3: i32):
        %c156_i32 = arith.constant 156 : i32
        %39 = arith.addi %c156_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %41 = "simt_step.switch"(%40, %c1_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c1_i32_15 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_15 : i32
          %49 = arith.addi %48, %0 : i32
          %c160_i32 = arith.constant 160 : i32
          %50 = arith.addi %c160_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_16 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32_15 : i32
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c180_i32 = arith.constant 180 : i32
        %45 = arith.addi %c180_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_13 = arith.constant 3 : i32
        %47 = "simt_step.switch"(%46, %c3_i32_13) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c1_i32_15 = arith.constant 1 : i32
          %49 = arith.addi %0, %c1_i32_15 : i32
          "simt_step.yield"(%49) {fallthrough = true} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %51 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    ^bb3(%37: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %38 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %22 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

