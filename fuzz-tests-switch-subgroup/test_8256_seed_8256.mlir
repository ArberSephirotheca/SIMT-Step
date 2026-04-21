module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %c3_i32 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %7 = "simt_step.switch"(%6, %c1_i32) ({
      ^bb0(%arg4: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %11 = "simt_step.if"(%10) ({
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %21 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %true_4 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %14 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %17 = "simt_step.if"(%16) ({
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %21 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %21 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb3(%18: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_8 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_8 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32 : i32
          %22 = arith.addi %c96_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %24 = arith.addi %arg6, %c1_i32_9 : i32
          "simt_step.continue"(%20, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %9 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg5, %8 : i32
        "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c3_i32 = arith.constant 3 : i32
        %7 = arith.remsi %arg3, %c3_i32 : i32
        %8 = "simt_step.switch"(%7, %arg0) ({
        ^bb0(%arg6: i32):
          %true_5 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %15 = arith.muli %arg5, %c4_i32_6 : i32
          %16 = arith.addi %c128_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %true_7 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32_8 : i32
          %21 = arith.addi %c144_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %25 = arith.muli %arg5, %c4_i32_10 : i32
          %26 = arith.addi %c160_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %true_11 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %30 = arith.muli %arg5, %c4_i32_12 : i32
          %31 = arith.addi %c176_i32, %30 : i32
          %32 = arith.addi %31, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %9 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.muli %arg5, %c4_i32 : i32
        %11 = arith.addi %c192_i32, %10 : i32
        %12 = arith.addi %11, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%8, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
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
      %23 = arith.addi %c8_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
      "simt_step.if"(%25) ({
        %c2_i32 = arith.constant 2 : i32
        %26 = arith.remsi %0, %c2_i32 : i32
        %c2_i32_5 = arith.constant 2 : i32
        %27 = "simt_step.switch"(%26, %c2_i32_5) ({
        ^bb0(%arg2: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %28 = arith.addi %arg2, %c4_i32_6 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %29, %c1_i32 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %32 = arith.addi %31, %c0_i32_7 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c16_i32 = arith.constant 16 : i32
      %26 = arith.addi %c16_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = simt_step.subgroup_id
      %29 = arith.index_cast %28 : index to i32
      %30 = "simt_step.switch"(%27, %29) ({
      ^bb0(%arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %33 = arith.addi %0, %c2_i32 : i32
        %true_6 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %34 = arith.addi %c208_i32, %0 : i32
        %true_7 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %37 = arith.addi %c20_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.subgroup_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg4: i32):
          %true_14 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %53 = arith.addi %c224_i32, %0 : i32
          %true_15 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %true_17 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %57 = arith.addi %c240_i32, %0 : i32
          %true_18 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %42 = arith.addi %c256_i32, %0 : i32
        %true_9 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %44 = arith.addi %c272_i32, %0 : i32
        %true_11 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %47 = arith.addi %c24_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_12 : i32
        %50 = "simt_step.if"(%49) ({
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %51 = arith.addi %c288_i32, %0 : i32
        %true_13 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %31 = arith.addi %c304_i32, %0 : i32
      %true_5 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c28_i32 = arith.constant 28 : i32
    %11 = arith.addi %c28_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c32_i32 = arith.constant 32 : i32
      %23 = arith.addi %c32_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %25 = "simt_step.switch"(%24, %c1_i32) ({
      ^bb0(%arg2: i32):
        %c36_i32 = arith.constant 36 : i32
        %26 = arith.addi %c36_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_4 : i32
        %29 = "simt_step.if"(%28) ({
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %30 = arith.addi %c320_i32, %0 : i32
        %true_5 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %33 = arith.addi %c40_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_6 : i32
        %36 = "simt_step.if"(%35) ({
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %37 = arith.addi %c336_i32, %0 : i32
        %true_7 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %40 = arith.addi %c44_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_8 : i32
        %43 = "simt_step.if"(%42) ({
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c352_i32 = arith.constant 352 : i32
        %44 = arith.addi %c352_i32, %0 : i32
        %true_9 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %46 = arith.addi %c368_i32, %0 : i32
        %true_11 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) : (i32) -> ()
    }, {
      %c48_i32 = arith.constant 48 : i32
      %23 = arith.addi %c48_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = "simt_step.switch"(%24, %0) ({
      ^bb0(%arg2: i32):
        %26 = simt_step.subgroup_id
        %27 = arith.index_cast %26 : index to i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %true_5 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %29 = arith.addi %c384_i32, %0 : i32
        %true_6 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c0_i32_4) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) : (i32) -> ()
    }) : (i1) -> i32
    %c400_i32 = arith.constant 400 : i32
    %15 = arith.addi %c400_i32, %0 : i32
    %true = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %17 = arith.addi %c52_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %19 = arith.cmpi ne, %18, %c0_i32_2 : i32
    %20 = "simt_step.if"(%19) ({
      %c56_i32 = arith.constant 56 : i32
      %23 = arith.addi %c56_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
      %26 = "simt_step.if"(%25) ({
        %c60_i32 = arith.constant 60 : i32
        %29 = arith.addi %c60_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %31 = "simt_step.switch"(%30, %c1_i32) ({
        ^bb0(%arg2: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c3_i32_6 = arith.constant 3 : i32
          %33 = arith.addi %0, %c3_i32_6 : i32
          %true_7 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %34 = arith.addi %c416_i32, %0 : i32
          %true_8 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %37 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %29 = arith.addi %c64_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_6 : i32
        %32 = "simt_step.if"(%31) ({
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %33 = arith.addi %c432_i32, %0 : i32
        %true_7 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      %c448_i32 = arith.constant 448 : i32
      %27 = arith.addi %c448_i32, %0 : i32
      %true_5 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_6 : i32
        %25 = arith.addi %24, %0 : i32
        %c68_i32 = arith.constant 68 : i32
        %26 = arith.addi %c68_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
        "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c88_i32 = arith.constant 88 : i32
        %24 = arith.addi %c88_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        %27 = "simt_step.if"(%26) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %36 = simt_step.lane_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        %c464_i32 = arith.constant 464 : i32
        %28 = arith.addi %c464_i32, %0 : i32
        %true_7 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %30 = arith.addi %arg2, %27 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg3, %c1_i32 : i32
        %true_8 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %32 = arith.muli %arg3, %c4_i32_9 : i32
        %33 = arith.addi %c480_i32, %32 : i32
        %34 = arith.addi %33, %0 : i32
        %true_10 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) : (i32) -> ()
    }) : (i1) -> i32
    %c496_i32 = arith.constant 496 : i32
    %21 = arith.addi %c496_i32, %0 : i32
    %true_3 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

