module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = "simt_step.switch"(%arg3, %c3_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %1:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %6 = arith.addi %5, %c1_i32 : i32
        %7 = arith.cmpi slt, %arg6, %6 : i32
        "simt_step.condition"(%7, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.remsi %arg3, %c4_i32 : i32
        %6 = simt_step.subgroup_id
        %7 = arith.index_cast %6 : index to i32
        %8 = "simt_step.switch"(%5, %7) ({
        ^bb0(%arg7: i32):
          %true = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_2 = arith.constant 0 : i32
          %c4_i32_3 = arith.constant 4 : i32
          %11 = arith.muli %arg6, %c4_i32_3 : i32
          %12 = arith.addi %c0_i32_2, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %true_4 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32_5 : i32
          %17 = arith.addi %c16_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32_7 : i32
          %22 = arith.addi %c32_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          %true_8 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_9 : i32
          %27 = arith.addi %c48_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%8, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%1#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%2: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %3 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %4 = "simt_step.if"(%3) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %5:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.addi %6, %c1_i32 : i32
          %8 = arith.cmpi slt, %arg6, %7 : i32
          "simt_step.condition"(%8, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg6, %c4_i32 : i32
          %8 = arith.addi %c64_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%6, %10) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%5#0) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %5:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %7 = arith.addi %6, %c1_i32 : i32
          %8 = arith.cmpi slt, %arg6, %7 : i32
          "simt_step.condition"(%8, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg6, %c4_i32 : i32
          %8 = arith.addi %c80_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%6, %10) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%5#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
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
      %c8_i32 = arith.constant 8 : i32
      %17 = arith.addi %c8_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_2 : i32
      "simt_step.if"(%19) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %c16_i32 = arith.constant 16 : i32
      %17 = arith.addi %c16_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %19 = "simt_step.switch"(%18, %c3_i32) ({
      ^bb0(%arg2: i32):
        %true_2 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %20 = arith.addi %c96_i32, %0 : i32
        %true_3 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %23 = arith.addi %c20_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = "simt_step.switch"(%24, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %0, %c1_i32 : i32
          %true_8 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %31 = arith.addi %c112_i32, %0 : i32
          %true_9 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          %34 = arith.addi %0, %c1_i32_10 : i32
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb3(%37: i32):  // no predecessors
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %26 = arith.addi %c128_i32, %0 : i32
        %true_5 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_8 : i32
          %31 = arith.addi %30, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %32 = arith.addi %c24_i32, %31 : i32
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
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_9 : i32
          %33 = arith.addi %c144_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_10 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c160_i32 = arith.constant 160 : i32
    %10 = arith.addi %c160_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c44_i32 = arith.constant 44 : i32
    %12 = arith.addi %c44_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %20 = arith.addi %c48_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_2 : i32
      %23 = "simt_step.if"(%22) ({
        %c52_i32 = arith.constant 52 : i32
        %35 = arith.addi %c52_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %37 = "simt_step.switch"(%36, %c4_i32_8) ({
        ^bb0(%arg3: i32):
          %true_11 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %40 = arith.addi %c176_i32, %0 : i32
          %true_12 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %43 = simt_step.lane_id
          %44 = arith.index_cast %43 : index to i32
          %true_13 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %45 = arith.addi %c192_i32, %0 : i32
          %true_14 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          %true_16 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %51 = arith.addi %c208_i32, %0 : i32
          %true_17 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %38 = arith.addi %c224_i32, %0 : i32
        %true_10 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_8) : (i32) -> ()
      }) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %24 = arith.addi %c240_i32, %0 : i32
      %true_3 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %26 = arith.addi %c256_i32, %0 : i32
      %true_5 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %29 = arith.addi %c56_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
      %32 = "simt_step.if"(%31) ({
        %35 = simt_step.lane_id
        %36 = arith.index_cast %35 : index to i32
        "simt_step.yield"(%36) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %35 = arith.addi %c60_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %39 = arith.addi %c272_i32, %0 : i32
        %true_9 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %33 = arith.addi %c288_i32, %0 : i32
      %true_7 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

