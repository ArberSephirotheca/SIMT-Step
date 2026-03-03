module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %3 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %3, %c1_i32 : i32
      %5 = arith.cmpi slt, %arg5, %4 : i32
      "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %3:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_4 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_4 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32_7 : i32
          %11 = arith.cmpi slt, %arg9, %10 : i32
          "simt_step.condition"(%11, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %c2_i32 = arith.constant 2 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %arg9, %c1_i32_7 : i32
          "simt_step.yield"(%c2_i32, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_6 = arith.constant 1 : i32
        %8 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.continue"(%7#0, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %4 = simt_step.lane_id
      %5 = arith.index_cast %4 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%3#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %24 = arith.addi %c12_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %26 = "simt_step.switch"(%25, %c1_i32) ({
      ^bb0(%arg2: i32):
        %c16_i32_6 = arith.constant 16 : i32
        %27 = arith.addi %c16_i32_6, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_7 : i32
        %30 = "simt_step.if"(%29) ({
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) : (i32) -> ()
        }, {
          %c1_i32_10 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32_10 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %32 = arith.addi %c20_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %34 = arith.addi %0, %c4_i32_8 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg3: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32_10 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%26) : (i32) -> ()
    }, {
      %c24_i32 = arith.constant 24 : i32
      %24 = arith.addi %c24_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = simt_step.lane_id
      %27 = arith.index_cast %26 : index to i32
      %28 = "simt_step.switch"(%25, %27) ({
      ^bb0(%arg2: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_12 : i32
          %41 = arith.addi %40, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %42 = arith.addi %c28_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_13 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c48_i32_9 = arith.constant 48 : i32
        %31 = arith.addi %c48_i32_9, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_10 : i32
        %34 = "simt_step.if"(%33) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %36 = arith.addi %c52_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_11 : i32
        %39 = "simt_step.if"(%38) ({
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%28) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c56_i32 = arith.constant 56 : i32
    %11 = arith.addi %c56_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c60_i32 = arith.constant 60 : i32
      %24 = arith.addi %c60_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %26 = arith.addi %0, %c3_i32 : i32
      %27 = "simt_step.switch"(%25, %26) ({
      ^bb0(%arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %40 = arith.addi %c64_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_11 : i32
        %43 = "simt_step.if"(%42) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c3_i32_13 = arith.constant 3 : i32
          %45 = arith.addi %0, %c3_i32_13 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c4_i32_12 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %29 = arith.addi %c68_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
      %32 = "simt_step.if"(%31) ({
        %c72_i32 = arith.constant 72 : i32
        %40 = arith.addi %c72_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_11 : i32
        %43 = "simt_step.if"(%42) ({
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) : (i32) -> ()
        }, {
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %34 = arith.addi %c76_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
      %37 = "simt_step.if"(%36) ({
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_14 : i32
          %42 = arith.addi %41, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %43 = arith.addi %c80_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_15 : i32
          "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %41 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%40#0) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %40 = arith.addi %c100_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_11 = arith.constant 3 : i32
        %42 = arith.addi %0, %c3_i32_11 : i32
        %43 = "simt_step.switch"(%41, %42) ({
        ^bb0(%arg3: i32):
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%46: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          %47 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %39:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %40 = arith.muli %arg4, %c4_i32_11 : i32
        %41 = arith.addi %40, %0 : i32
        %c104_i32 = arith.constant 104 : i32
        %42 = arith.addi %c104_i32, %41 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_12 : i32
        "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %40 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %41 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%40, %41) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c124_i32 = arith.constant 124 : i32
    %18 = arith.addi %c124_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
    %21 = "simt_step.if"(%20) ({
      %24 = simt_step.lane_id
      %25 = arith.index_cast %24 : index to i32
      "simt_step.yield"(%25) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_8 : i32
        %26 = arith.addi %25, %0 : i32
        %c128_i32 = arith.constant 128 : i32
        %27 = arith.addi %c128_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
        "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %25 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.break"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%24#0) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %22 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

