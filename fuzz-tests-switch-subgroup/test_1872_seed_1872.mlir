module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %2 = "simt_step.switch"(%arg3, %arg0) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32 : i32
          %11 = arith.cmpi slt, %arg6, %10 : i32
          "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_3 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg6, %c4_i32 : i32
          %11 = arith.addi %c0_i32_4, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%6: i32):  // no predecessors
        %true_2 = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %8 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %4 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %3 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
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
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %21 = simt_step.lane_id
        %22 = arith.index_cast %21 : index to i32
        %23 = "simt_step.switch"(%0, %22) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %25 = arith.addi %arg4, %c3_i32 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %27 = arith.addi %26, %c2_i32 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %20 = simt_step.lane_id
      %21 = arith.index_cast %20 : index to i32
      %true_2 = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %22 = arith.addi %c64_i32, %0 : i32
      %true_3 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %25 = arith.addi %c12_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_4 : i32
      %28 = "simt_step.if"(%27) ({
        %c4_i32_12 = arith.constant 4 : i32
        %47 = arith.addi %0, %c4_i32_12 : i32
        "simt_step.yield"(%47) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %47 = arith.addi %c16_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %49 = arith.addi %0, %c2_i32 : i32
        %50 = "simt_step.switch"(%48, %49) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %true_14 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %54 = arith.addi %c80_i32, %0 : i32
          %true_15 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %57 = arith.addi %0, %c1_i32 : i32
          %true_16 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %58 = arith.addi %c96_i32, %0 : i32
          %true_17 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %51 = arith.addi %c112_i32, %0 : i32
        %true_13 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %29 = arith.addi %c128_i32, %0 : i32
      %true_5 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %32 = arith.addi %c20_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_6 : i32
      %35 = "simt_step.if"(%34) ({
        %c24_i32 = arith.constant 24 : i32
        %47 = arith.addi %c24_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %49 = simt_step.subgroup_id
        %50 = arith.index_cast %49 : index to i32
        %51 = "simt_step.switch"(%48, %50) ({
        ^bb0(%arg3: i32):
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %true_13 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %55 = arith.addi %c144_i32, %0 : i32
          %true_14 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%51) : (i32) -> ()
      }, {
        %47 = simt_step.subgroup_id
        %48 = arith.index_cast %47 : index to i32
        "simt_step.yield"(%48) : (i32) -> ()
      }) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %36 = arith.addi %c160_i32, %0 : i32
      %true_7 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %39 = arith.addi %c28_i32, %0 : i32
      %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %41 = arith.cmpi ne, %40, %c0_i32_8 : i32
      %42 = "simt_step.if"(%41) ({
        %c32_i32 = arith.constant 32 : i32
        %47 = arith.addi %c32_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_12 : i32
        %50 = "simt_step.if"(%49) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %51 = arith.addi %c176_i32, %0 : i32
        %true_13 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) : (i32) -> ()
      }, {
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %47:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_14 : i32
          %49 = arith.addi %48, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %50 = arith.addi %c36_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_15 : i32
          "simt_step.condition"(%52, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %48 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %50 = arith.muli %arg4, %c4_i32_15 : i32
          %51 = arith.addi %c192_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_16 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%47#0) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %43 = arith.addi %c208_i32, %0 : i32
      %true_9 = arith.constant true
      %44 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %45 = arith.addi %c224_i32, %0 : i32
      %true_11 = arith.constant true
      %46 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c56_i32 = arith.constant 56 : i32
    %9 = arith.addi %c56_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
    %12 = "simt_step.if"(%11) ({
      %c3_i32 = arith.constant 3 : i32
      %20 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c60_i32 = arith.constant 60 : i32
      %20 = arith.addi %c60_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_2 : i32
      %23 = "simt_step.if"(%22) ({
        %c64_i32 = arith.constant 64 : i32
        %26 = arith.addi %c64_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        %30 = "simt_step.switch"(%27, %29) ({
        ^bb0(%arg2: i32):
          %c0_i32_4 = arith.constant 0 : i32
          %31 = arith.addi %0, %c0_i32_4 : i32
          "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          %true_5 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %35 = arith.addi %c240_i32, %0 : i32
          %true_6 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c68_i32 = arith.constant 68 : i32
        %26 = arith.addi %c68_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = simt_step.lane_id
        %29 = arith.index_cast %28 : index to i32
        %30 = "simt_step.switch"(%27, %29) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_6 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %38 = arith.addi %c256_i32, %0 : i32
          %true_7 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %31 = arith.addi %c272_i32, %0 : i32
        %true_5 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %24 = arith.addi %c288_i32, %0 : i32
      %true_3 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c304_i32 = arith.constant 304 : i32
    %13 = arith.addi %c304_i32, %0 : i32
    %true = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c72_i32 = arith.constant 72 : i32
    %15 = arith.addi %c72_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %17 = simt_step.lane_id
    %18 = arith.index_cast %17 : index to i32
    %19 = "simt_step.switch"(%16, %18) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_10 : i32
        %40 = arith.addi %39, %0 : i32
        %c76_i32 = arith.constant 76 : i32
        %41 = arith.addi %c76_i32, %40 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_11 : i32
        "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %39 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %41 = arith.muli %arg4, %c4_i32_11 : i32
        %42 = arith.addi %c320_i32, %41 : i32
        %43 = arith.addi %42, %0 : i32
        %true_12 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%39, %40) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_10 : i32
        %40 = arith.addi %39, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %41 = arith.addi %c96_i32, %40 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_11 : i32
        "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.muli %arg6, %c4_i32_15 : i32
          %47 = arith.addi %46, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %48 = arith.addi %c116_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_16 : i32
          "simt_step.condition"(%50, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %46 = arith.addi %arg5, %arg6 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %47 = arith.addi %arg6, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.muli %arg6, %c4_i32_17 : i32
          %49 = arith.addi %c336_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %40 = arith.addi %arg3, %39#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %41 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_13 : i32
        %43 = arith.addi %c352_i32, %42 : i32
        %44 = arith.addi %43, %0 : i32
        %true_14 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40, %41) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %23 = arith.addi %c368_i32, %0 : i32
      %true_7 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c136_i32 = arith.constant 136 : i32
      %26 = arith.addi %c136_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = simt_step.subgroup_id
      %29 = arith.index_cast %28 : index to i32
      %30 = "simt_step.switch"(%27, %29) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %63 = arith.muli %arg5, %c4_i32_21 : i32
          %64 = arith.addi %63, %0 : i32
          %c140_i32 = arith.constant 140 : i32
          %65 = arith.addi %c140_i32, %64 : i32
          %66 = "simt_step.buffer.load"(%arg1, %65) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %67 = arith.cmpi ne, %66, %c0_i32_22 : i32
          "simt_step.condition"(%67, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %63 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %64 = arith.addi %arg5, %c1_i32 : i32
          %true_21 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %65 = arith.muli %arg5, %c4_i32_22 : i32
          %66 = arith.addi %c384_i32, %65 : i32
          %67 = arith.addi %66, %0 : i32
          %true_23 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63, %64) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c160_i32 = arith.constant 160 : i32
        %41 = arith.addi %c160_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_12 : i32
        %44 = "simt_step.if"(%43) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c400_i32 = arith.constant 400 : i32
        %45 = arith.addi %c400_i32, %0 : i32
        %true_13 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %48 = arith.addi %c164_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_14 : i32
        %51 = "simt_step.if"(%50) ({
          %c0_i32_21 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_21) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %52 = arith.addi %c416_i32, %0 : i32
        %true_15 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %54 = arith.addi %c432_i32, %0 : i32
        %true_17 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb3(%56: i32):  // no predecessors
        %c168_i32 = arith.constant 168 : i32
        %57 = arith.addi %c168_i32, %0 : i32
        %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_18 = arith.constant 4 : i32
        %59 = arith.addi %0, %c4_i32_18 : i32
        %60 = "simt_step.switch"(%58, %59) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%63: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %64 = arith.addi %0, %c3_i32 : i32
          %true_21 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %65 = arith.addi %c448_i32, %0 : i32
          %true_22 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        ^bb2(%67: i32):  // no predecessors
          %true_23 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %68 = arith.addi %c464_i32, %0 : i32
          %true_24 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%70: i32):  // no predecessors
          %true_25 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %71 = arith.addi %c480_i32, %0 : i32
          %true_26 = arith.constant true
          %72 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %61 = arith.addi %c496_i32, %0 : i32
        %true_20 = arith.constant true
        %62 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c172_i32 = arith.constant 172 : i32
      %32 = arith.addi %c172_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %34 = simt_step.lane_id
      %35 = arith.index_cast %34 : index to i32
      %36 = "simt_step.switch"(%33, %35) ({
      ^bb0(%arg3: i32):
        %c176_i32 = arith.constant 176 : i32
        %39 = arith.addi %c176_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = simt_step.lane_id
        %42 = arith.index_cast %41 : index to i32
        %43 = "simt_step.switch"(%40, %42) ({
        ^bb0(%arg4: i32):
          %true_16 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %58 = arith.addi %c512_i32, %0 : i32
          %true_17 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %true_18 = arith.constant true
          %c528_i32 = arith.constant 528 : i32
          %61 = arith.addi %c528_i32, %0 : i32
          %true_19 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%63: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%64: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c180_i32 = arith.constant 180 : i32
        %48 = arith.addi %c180_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_10 : i32
        %51 = "simt_step.if"(%50) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %58 = simt_step.subgroup_id
          %59 = arith.index_cast %58 : index to i32
          "simt_step.yield"(%59) : (i32) -> ()
        }) : (i1) -> i32
        %c544_i32 = arith.constant 544 : i32
        %52 = arith.addi %c544_i32, %0 : i32
        %true_11 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c560_i32 = arith.constant 560 : i32
        %54 = arith.addi %c560_i32, %0 : i32
        %true_13 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb3(%56: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %57:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %58 = arith.muli %arg5, %c4_i32_16 : i32
          %59 = arith.addi %58, %0 : i32
          %c184_i32 = arith.constant 184 : i32
          %60 = arith.addi %c184_i32, %59 : i32
          %61 = "simt_step.buffer.load"(%arg1, %60) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %62 = arith.cmpi ne, %61, %c0_i32_17 : i32
          "simt_step.condition"(%62, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %58 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %59 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c576_i32 = arith.constant 576 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_17 : i32
          %61 = arith.addi %c576_i32, %60 : i32
          %62 = arith.addi %61, %0 : i32
          %true_18 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%58, %59) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%57#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c592_i32 = arith.constant 592 : i32
      %37 = arith.addi %c592_i32, %0 : i32
      %true_9 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

