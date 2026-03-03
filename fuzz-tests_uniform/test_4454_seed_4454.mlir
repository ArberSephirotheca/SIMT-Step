module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %c2_i32 = arith.constant 2 : i32
      %5 = arith.addi %arg0, %c2_i32 : i32
      %6 = "simt_step.switch"(%4, %5) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_11 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %15 = arith.addi %arg0, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %16 = arith.addi %arg6, %c1_i32_11 : i32
          "simt_step.yield"(%15, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_11 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c3_i32_10 = arith.constant 3 : i32
          %15 = arith.addi %arg0, %c3_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %16 = arith.addi %arg6, %c1_i32_11 : i32
          "simt_step.yield"(%15, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%9#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%11: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_11 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %15 = arith.addi %arg6, %c1_i32_10 : i32
          "simt_step.yield"(%arg0, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_8 = arith.constant 1 : i32
        "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%13: i32):  // no predecessors
        %c3_i32_9 = arith.constant 3 : i32
        %14 = "simt_step.switch"(%arg3, %c3_i32_9) ({
        ^bb0(%arg5: i32):
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c3_i32_1 = arith.constant 3 : i32
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %c3_i32_1 = arith.constant 3 : i32
      %5 = "simt_step.switch"(%4, %c3_i32_1) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %8 = "simt_step.if"(%7) ({
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %11 = "simt_step.if"(%10) ({
          %c1_i32_6 = arith.constant 1 : i32
          %15 = arith.addi %arg0, %c1_i32_6 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %c1_i32_6 = arith.constant 1 : i32
          %15 = arith.addi %arg0, %c1_i32_6 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %14 = "simt_step.if"(%13) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_5 = arith.constant 3 : i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.addi %0, %c0_i32_0 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %25 = arith.addi %c12_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = "simt_step.switch"(%26, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32_8 = arith.constant 16 : i32
        %32 = arith.addi %c16_i32_8, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %34 = "simt_step.switch"(%33, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %41 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %43 = arith.addi %0, %c3_i32_14 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %36 = arith.addi %c20_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_14 : i32
          %42 = arith.addi %41, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %43 = arith.addi %c24_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_15 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_14 : i32
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %29 = arith.addi %c44_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %31 = "simt_step.switch"(%30, %c1_i32) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c48_i32_8 = arith.constant 48 : i32
        %33 = arith.addi %c48_i32_8, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_9 : i32
        %36 = "simt_step.if"(%35) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %11 = arith.addi %c52_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.subgroup_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %25 = arith.addi %c56_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %27 = arith.addi %0, %c3_i32 : i32
      %28 = "simt_step.switch"(%26, %27) ({
      ^bb0(%arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %44 = arith.addi %c60_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %46 = "simt_step.switch"(%45, %c2_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb1(%47: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %48:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %56 = arith.muli %arg5, %c4_i32_18 : i32
          %57 = arith.addi %56, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %58 = arith.addi %c64_i32, %57 : i32
          %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %60 = arith.cmpi ne, %59, %c0_i32_19 : i32
          "simt_step.condition"(%60, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %56 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %57 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.yield"(%56, %57) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%48#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %50:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %56 = arith.muli %arg5, %c4_i32_18 : i32
          %57 = arith.addi %56, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %58 = arith.addi %c84_i32, %57 : i32
          %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %60 = arith.cmpi ne, %59, %c0_i32_19 : i32
          "simt_step.condition"(%60, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %56 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %57 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.yield"(%56, %57) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%50#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%51: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %52 = arith.addi %c104_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %54 = arith.addi %0, %c1_i32 : i32
        %55 = "simt_step.switch"(%53, %54) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          %57 = arith.addi %0, %c0_i32_18 : i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb2(%58: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) {fallthrough = false} : (i32) -> ()
        ^bb3(%59: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          %60 = arith.addi %0, %c4_i32_20 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %c108_i32 = arith.constant 108 : i32
      %30 = arith.addi %c108_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_7 : i32
      %33 = "simt_step.if"(%32) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_13 : i32
          %46 = arith.addi %45, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %47 = arith.addi %c112_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_14 : i32
          "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %45 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.break"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%44#0) : (i32) -> ()
      }, {
        %c132_i32 = arith.constant 132 : i32
        %44 = arith.addi %c132_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_10 : i32
        %47 = "simt_step.if"(%46) ({
          %c4_i32_11 = arith.constant 4 : i32
          %48 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %c3_i32_11 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_11) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%47) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb2(%34: i32):  // no predecessors
      %c136_i32 = arith.constant 136 : i32
      %35 = arith.addi %c136_i32, %0 : i32
      %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
      %38 = "simt_step.if"(%37) ({
        %c1_i32 = arith.constant 1 : i32
        %44 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        %c140_i32 = arith.constant 140 : i32
        %44 = arith.addi %c140_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %46 = "simt_step.switch"(%45, %c4_i32_10) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %49 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%49) {fallthrough = true} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %51 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%46) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
    ^bb3(%39: i32):  // no predecessors
      %c144_i32 = arith.constant 144 : i32
      %40 = arith.addi %c144_i32, %0 : i32
      %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %42 = arith.cmpi ne, %41, %c0_i32_9 : i32
      %43 = "simt_step.if"(%42) ({
        %c148_i32 = arith.constant 148 : i32
        %44 = arith.addi %c148_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %46 = arith.addi %0, %c0_i32_10 : i32
        %47 = "simt_step.switch"(%45, %46) ({
        ^bb0(%arg3: i32):
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%47) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_13 : i32
          %46 = arith.addi %45, %0 : i32
          %c152_i32 = arith.constant 152 : i32
          %47 = arith.addi %c152_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_14 : i32
          "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %45 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%44#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c172_i32 = arith.constant 172 : i32
    %18 = arith.addi %c172_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %20 = simt_step.lane_id
    %21 = arith.index_cast %20 : index to i32
    %22 = "simt_step.switch"(%19, %21) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_10 : i32
        %31 = arith.addi %30, %0 : i32
        %c176_i32 = arith.constant 176 : i32
        %32 = arith.addi %c176_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_11 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %30 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c196_i32 = arith.constant 196 : i32
      %27 = arith.addi %c196_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = "simt_step.switch"(%28, %0) ({
      ^bb0(%arg3: i32):
        %c200_i32 = arith.constant 200 : i32
        %30 = arith.addi %c200_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %32 = "simt_step.switch"(%31, %c0_i32_10) ({
        ^bb0(%arg4: i32):
          %c1_i32_15 = arith.constant 1 : i32
          %48 = arith.addi %0, %c1_i32_15 : i32
          "simt_step.yield"(%48) {fallthrough = true} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %50 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %52 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c204_i32 = arith.constant 204 : i32
        %34 = arith.addi %c204_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %0, %c1_i32 : i32
        %37 = "simt_step.switch"(%35, %36) ({
        ^bb0(%arg4: i32):
          %c1_i32_15 = arith.constant 1 : i32
          %48 = arith.addi %0, %c1_i32_15 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c208_i32 = arith.constant 208 : i32
        %39 = arith.addi %c208_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_13 : i32
        %42 = "simt_step.if"(%41) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb3(%43: i32):  // no predecessors
        %c212_i32 = arith.constant 212 : i32
        %44 = arith.addi %c212_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_14 : i32
        %47 = "simt_step.if"(%46) ({
          %c2_i32 = arith.constant 2 : i32
          %48 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %23 = arith.addi %c48_i32, %0 : i32
    %true_5 = arith.constant true
    %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

