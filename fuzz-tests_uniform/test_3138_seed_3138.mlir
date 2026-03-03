module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c1_i32 = arith.constant 1 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32_3 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %9 = arith.addi %8, %c1_i32_6 : i32
        %10 = arith.cmpi slt, %arg7, %9 : i32
        "simt_step.condition"(%10, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %9 = "simt_step.if"(%8) ({
          %13 = simt_step.lane_id
          %14 = arith.index_cast %13 : index to i32
          "simt_step.yield"(%14) : (i32) -> ()
        }, {
          %13 = simt_step.lane_id
          %14 = arith.index_cast %13 : index to i32
          "simt_step.yield"(%14) : (i32) -> ()
        }) : (i1) -> i32
        %10 = simt_step.lane_id
        %11 = arith.index_cast %10 : index to i32
        %c1_i32_7 = arith.constant 1 : i32
        %12 = arith.addi %arg7, %c1_i32_7 : i32
        "simt_step.yield"(%9, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.addi %arg0, %c2_i32 : i32
      %c1_i32_5 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32_5 : i32
      "simt_step.yield"(%5#0, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %c1_i32, %0#0 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %7 = arith.addi %0, %c4_i32_0 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c4_i32_8 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %24 = arith.addi %c12_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_9 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_10 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_10) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c16_i32_2 = arith.constant 16 : i32
    %11 = arith.addi %c16_i32_2, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %13 = "simt_step.switch"(%12, %c0_i32_3) ({
    ^bb0(%arg2: i32):
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_15 : i32
        %38 = arith.addi %37, %0 : i32
        %c20_i32 = arith.constant 20 : i32
        %39 = arith.addi %c20_i32, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_16 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %37 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %25 = arith.addi %c40_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %27 = arith.addi %0, %c0_i32_11 : i32
      %28 = "simt_step.switch"(%26, %27) ({
      ^bb0(%arg3: i32):
        %c44_i32 = arith.constant 44 : i32
        %37 = arith.addi %c44_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %39 = arith.addi %0, %c3_i32 : i32
        %40 = "simt_step.switch"(%38, %39) ({
        ^bb0(%arg4: i32):
          %c0_i32_23 = arith.constant 0 : i32
          %49 = arith.addi %0, %c0_i32_23 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c3_i32_24 = arith.constant 3 : i32
          %51 = arith.addi %0, %c3_i32_24 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_23 : i32
          %50 = arith.addi %49, %0 : i32
          %c48_i32_24 = arith.constant 48 : i32
          %51 = arith.addi %c48_i32_24, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_25 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_25 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_23 : i32
          %50 = arith.addi %49, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %51 = arith.addi %c68_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_24 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_21 = arith.constant true
        "simt_step.yield"(%44#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %46 = arith.addi %c88_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %48 = "simt_step.switch"(%47, %c2_i32) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c4_i32_23 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_22 = arith.constant true
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_12 = arith.constant true
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %30 = arith.addi %c92_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %32 = "simt_step.switch"(%31, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_22 : i32
          %54 = arith.addi %53, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %55 = arith.addi %c96_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_23 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%37#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %39 = arith.addi %c116_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_18 : i32
        %42 = "simt_step.if"(%41) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %44 = arith.addi %c120_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %46 = arith.addi %0, %c0_i32_19 : i32
        %47 = "simt_step.switch"(%45, %46) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %53 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %c0_i32_22 = arith.constant 0 : i32
          %55 = arith.addi %0, %c0_i32_22 : i32
          "simt_step.yield"(%55) {fallthrough = true} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_20 = arith.constant true
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      ^bb3(%48: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %49 = arith.addi %c124_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %51 = arith.cmpi ne, %50, %c0_i32_21 : i32
        %52 = "simt_step.if"(%51) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_13 = arith.constant true
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c128_i32 = arith.constant 128 : i32
      %34 = arith.addi %c128_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %36 = "simt_step.switch"(%35, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_20 : i32
          %44 = arith.addi %43, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %45 = arith.addi %c132_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_21 : i32
          "simt_step.condition"(%47, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %43 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c152_i32 = arith.constant 152 : i32
        %39 = arith.addi %c152_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_18 = arith.constant 4 : i32
        %41 = arith.addi %0, %c4_i32_18 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %46 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_14 = arith.constant true
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %0 : i32
    %true_5 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c156_i32 = arith.constant 156 : i32
    %16 = arith.addi %c156_i32, %0 : i32
    %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
    %18 = simt_step.lane_id
    %19 = arith.index_cast %18 : index to i32
    %20 = "simt_step.switch"(%17, %19) ({
    ^bb0(%arg2: i32):
      %c160_i32 = arith.constant 160 : i32
      %23 = arith.addi %c160_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = "simt_step.switch"(%24, %0) ({
      ^bb0(%arg3: i32):
        %c164_i32 = arith.constant 164 : i32
        %35 = arith.addi %c164_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          %c2_i32_17 = arith.constant 2 : i32
          %46 = arith.addi %0, %c2_i32_17 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_17 : i32
          %47 = arith.addi %46, %0 : i32
          %c168_i32 = arith.constant 168 : i32
          %48 = arith.addi %c168_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_18 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c188_i32 = arith.constant 188 : i32
        %43 = arith.addi %c188_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = "simt_step.switch"(%44, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_17 = arith.constant 0 : i32
          %46 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%46) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_18) {fallthrough = true} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) {fallthrough = true} : (i32) -> ()
        ^bb3(%49: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_20 : i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c192_i32 = arith.constant 192 : i32
      %27 = arith.addi %c192_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_9 = arith.constant 4 : i32
      %29 = "simt_step.switch"(%28, %c4_i32_9) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_19 : i32
          %45 = arith.addi %44, %0 : i32
          %c196_i32 = arith.constant 196 : i32
          %46 = arith.addi %c196_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_20 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_19 : i32
          %45 = arith.addi %44, %0 : i32
          %c216_i32 = arith.constant 216 : i32
          %46 = arith.addi %c216_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_20 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%38#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c236_i32 = arith.constant 236 : i32
        %40 = arith.addi %c236_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_18 : i32
        %43 = "simt_step.if"(%42) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c240_i32 = arith.constant 240 : i32
      %31 = arith.addi %c240_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_11 : i32
      %34 = "simt_step.if"(%33) ({
        %c244_i32 = arith.constant 244 : i32
        %35 = arith.addi %c244_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %43 = arith.addi %0, %c3_i32_14 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%37) : (i32) -> ()
      }, {
        %c248_i32 = arith.constant 248 : i32
        %35 = arith.addi %c248_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          %c3_i32 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_6 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %21 = arith.addi %c48_i32, %0 : i32
    %true_7 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

