module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32 : i32
        %8 = arith.cmpi slt, %arg5, %7 : i32
        "simt_step.condition"(%8, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %true = arith.constant true
        %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.muli %arg5, %c4_i32 : i32
        %8 = arith.addi %c0_i32_5, %7 : i32
        %9 = arith.addi %8, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%6, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) : (i32) -> ()
    }, {
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %6 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_5 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32_8 : i32
          %11 = arith.cmpi slt, %arg9, %10 : i32
          "simt_step.condition"(%11, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg9, %c4_i32 : i32
          %11 = arith.addi %c32_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_8 = arith.constant 1 : i32
          %13 = arith.addi %arg9, %c1_i32_8 : i32
          "simt_step.continue"(%9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_7 = arith.constant 1 : i32
        %8 = arith.addi %arg7, %c1_i32_7 : i32
        "simt_step.yield"(%7#0, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %1, %2#0 : i32
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
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %25 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %25 = "simt_step.switch"(%0, %0) ({
        ^bb0(%arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %27 = arith.addi %arg4, %c4_i32_7 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %29 = arith.addi %28, %c3_i32 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.addi %0, %c0_i32_1 : i32
    %9 = "simt_step.switch"(%7, %8) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %25 = arith.addi %c12_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %27 = "simt_step.switch"(%26, %c4_i32_5) ({
      ^bb0(%arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %33 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_10 : i32
          %43 = arith.addi %42, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %44 = arith.addi %c16_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_11 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          %true_10 = arith.constant true
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%37: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %38 = arith.addi %c36_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_9 : i32
        %41 = "simt_step.if"(%40) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_10 = arith.constant 4 : i32
          %42 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %29 = arith.addi %c40_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
      %32 = "simt_step.if"(%31) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c44_i32 = arith.constant 44 : i32
    %10 = arith.addi %c44_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = simt_step.subgroup_id
    %13 = arith.index_cast %12 : index to i32
    %14 = "simt_step.switch"(%11, %13) ({
    ^bb0(%arg2: i32):
      %c48_i32_5 = arith.constant 48 : i32
      %24 = arith.addi %c48_i32_5, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c2_i32_10 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %42 = arith.addi %c52_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %44 = "simt_step.switch"(%43, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %52 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %c2_i32_11 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
      ^bb3(%46: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %47 = arith.addi %c56_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_12 : i32
        %50 = "simt_step.if"(%49) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%51) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %28 = arith.addi %c60_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_6 = arith.constant 4 : i32
      %30 = arith.addi %0, %c4_i32_6 : i32
      %31 = "simt_step.switch"(%29, %30) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_13 : i32
          %48 = arith.addi %47, %0 : i32
          %c64_i32_14 = arith.constant 64 : i32
          %49 = arith.addi %c64_i32_14, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_15 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          "simt_step.yield"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %43 = arith.addi %c84_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_12 = arith.constant 2 : i32
        %45 = arith.addi %0, %c2_i32_12 : i32
        %46 = "simt_step.switch"(%44, %45) ({
        ^bb0(%arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c88_i32 = arith.constant 88 : i32
      %33 = arith.addi %c88_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %35 = "simt_step.switch"(%34, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c92_i32 = arith.constant 92 : i32
        %41 = arith.addi %c92_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_10 : i32
        %44 = "simt_step.if"(%43) ({
          %c0_i32_14 = arith.constant 0 : i32
          %55 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%55) : (i32) -> ()
        }, {
          %c2_i32_14 = arith.constant 2 : i32
          %55 = arith.addi %0, %c2_i32_14 : i32
          "simt_step.yield"(%55) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %46 = arith.addi %c96_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %48 = "simt_step.switch"(%47, %c3_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %56 = arith.addi %0, %c3_i32_14 : i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %50 = arith.addi %c100_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_11 = arith.constant 4 : i32
        %52 = arith.addi %0, %c4_i32_11 : i32
        %53 = "simt_step.switch"(%51, %52) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %57 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb3(%58: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          %59 = arith.addi %0, %c2_i32_15 : i32
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      ^bb3(%54: i32):  // no predecessors
        %c2_i32_13 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_13) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %37 = arith.addi %c104_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_8 = arith.constant 2 : i32
      %39 = arith.addi %0, %c2_i32_8 : i32
      %40 = "simt_step.switch"(%38, %39) ({
      ^bb0(%arg3: i32):
        %c108_i32 = arith.constant 108 : i32
        %41 = arith.addi %c108_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %43 = "simt_step.switch"(%42, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb2(%52: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %c112_i32 = arith.constant 112 : i32
        %46 = arith.addi %c112_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_11 : i32
        %49 = "simt_step.if"(%48) ({
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%50) : (i32) -> ()
        }, {
          %c4_i32_12 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %15 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c116_i32 = arith.constant 116 : i32
    %17 = arith.addi %c116_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %19 = simt_step.lane_id
    %20 = arith.index_cast %19 : index to i32
    %21 = "simt_step.switch"(%18, %20) ({
    ^bb0(%arg2: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %24 = arith.addi %0, %c4_i32_5 : i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c120_i32 = arith.constant 120 : i32
      %26 = arith.addi %c120_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %28 = arith.addi %0, %c2_i32 : i32
      %29 = "simt_step.switch"(%27, %28) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %31 = arith.addi %c124_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_7 = arith.constant 2 : i32
        %33 = "simt_step.switch"(%32, %c2_i32_7) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_11 : i32
          %37 = arith.addi %36, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %38 = arith.addi %c128_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %22 = arith.addi %c64_i32, %0 : i32
    %true_4 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

