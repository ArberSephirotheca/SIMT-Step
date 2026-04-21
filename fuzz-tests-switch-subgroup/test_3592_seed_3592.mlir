module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %1 = arith.remsi %arg3, %c3_i32 : i32
      %2 = simt_step.lane_id
      %3 = arith.index_cast %2 : index to i32
      %4 = "simt_step.switch"(%1, %3) ({
      ^bb0(%arg6: i32):
        %c3_i32_1 = arith.constant 3 : i32
        %10 = arith.remsi %arg3, %c3_i32_1 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %11 = arith.addi %arg0, %c0_i32_2 : i32
        %12 = "simt_step.switch"(%10, %11) ({
        ^bb0(%arg7: i32):
          %true_6 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_8 : i32
          %23 = arith.addi %c0_i32_7, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_9 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_10 : i32
          %28 = arith.addi %c16_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %true_11 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_12 : i32
          %33 = arith.addi %c32_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c4_i32_3 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_3 : i32
        %15 = "simt_step.switch"(%14, %arg0) ({
        ^bb0(%arg7: i32):
          %true_6 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_7 : i32
          %23 = arith.addi %c48_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_8 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_9 : i32
          %28 = arith.addi %c64_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %true_10 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_11 : i32
          %33 = arith.addi %c80_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          %true_12 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_13 : i32
          %38 = arith.addi %c96_i32, %37 : i32
          %39 = arith.addi %38, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %true_4 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %18 = arith.muli %arg5, %c4_i32_5 : i32
        %19 = arith.addi %c112_i32, %18 : i32
        %20 = arith.addi %19, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.muli %arg5, %c4_i32 : i32
      %7 = arith.addi %c128_i32, %6 : i32
      %8 = arith.addi %7, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
      %c8_i32 = arith.constant 8 : i32
      %20 = arith.addi %c8_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_2 : i32
      "simt_step.if"(%22) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %20 = arith.addi %c16_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.lane_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %41 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %43 = arith.addi %c20_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_10 : i32
        %46 = "simt_step.if"(%45) ({
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }, {
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %47 = arith.addi %c144_i32, %0 : i32
        %true_11 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = true} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %50 = arith.addi %c24_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %52 = "simt_step.switch"(%51, %c0_i32_12) ({
        ^bb0(%arg4: i32):
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          %true_15 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %57 = arith.addi %c160_i32, %0 : i32
          %true_16 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          %60 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%60) {fallthrough = true} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %true_18 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %62 = arith.addi %c176_i32, %0 : i32
          %true_19 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%64: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          %65 = arith.addi %0, %c4_i32_20 : i32
          %true_21 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %66 = arith.addi %c192_i32, %0 : i32
          %true_22 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %53 = arith.addi %c208_i32, %0 : i32
        %true_14 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %41 = arith.muli %arg4, %c4_i32_10 : i32
        %42 = arith.addi %41, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %43 = arith.addi %c28_i32, %42 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_11 : i32
        "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %41 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %42 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_11 : i32
        %44 = arith.addi %c224_i32, %43 : i32
        %45 = arith.addi %44, %0 : i32
        %true_12 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41, %42) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_4 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %27 = arith.addi %c240_i32, %0 : i32
      %true_5 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %30 = arith.addi %c48_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
      %33 = "simt_step.if"(%32) ({
        %c52_i32 = arith.constant 52 : i32
        %41 = arith.addi %c52_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_10 : i32
        %44 = "simt_step.if"(%43) ({
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %45 = arith.addi %c256_i32, %0 : i32
        %true_11 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        %c56_i32 = arith.constant 56 : i32
        %41 = arith.addi %c56_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_10 : i32
        %44 = "simt_step.if"(%43) ({
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %45 = arith.addi %c272_i32, %0 : i32
        %true_11 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %34 = arith.addi %c288_i32, %0 : i32
      %true_7 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %37 = simt_step.subgroup_id
      %38 = arith.index_cast %37 : index to i32
      %true_8 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %39 = arith.addi %c304_i32, %0 : i32
      %true_9 = arith.constant true
      %40 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %c60_i32 = arith.constant 60 : i32
    %11 = arith.addi %c60_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = "simt_step.switch"(%12, %0) ({
    ^bb0(%arg2: i32):
      %c64_i32 = arith.constant 64 : i32
      %20 = arith.addi %c64_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = "simt_step.switch"(%21, %0) ({
      ^bb0(%arg3: i32):
        %true_10 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %38 = arith.addi %c320_i32, %0 : i32
        %true_11 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %41 = arith.addi %c68_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_12 : i32
        %44 = "simt_step.if"(%43) ({
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }, {
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %45 = arith.addi %c336_i32, %0 : i32
        %true_13 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %47 = arith.addi %c352_i32, %0 : i32
        %true_15 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %50 = arith.addi %0, %c2_i32 : i32
        %true_16 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %51 = arith.addi %c368_i32, %0 : i32
        %true_17 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      ^bb3(%53: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %54:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_20 : i32
          %56 = arith.addi %55, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %57 = arith.addi %c72_i32, %56 : i32
          %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %59 = arith.cmpi ne, %58, %c0_i32_21 : i32
          "simt_step.condition"(%59, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %55 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %56 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_21 : i32
          %58 = arith.addi %c384_i32, %57 : i32
          %59 = arith.addi %58, %0 : i32
          %true_22 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%55, %56) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%54#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %23 = arith.addi %c400_i32, %0 : i32
      %true_3 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %26 = arith.addi %c92_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = simt_step.subgroup_id
      %29 = arith.index_cast %28 : index to i32
      %30 = "simt_step.switch"(%27, %29) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %38 = arith.addi %c96_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_10 : i32
        %41 = "simt_step.if"(%40) ({
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %42 = arith.addi %c416_i32, %0 : i32
        %true_11 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %44 = arith.addi %c432_i32, %0 : i32
        %true_13 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %47:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_16 : i32
          %49 = arith.addi %48, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %50 = arith.addi %c100_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_17 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_17 : i32
          %51 = arith.addi %c448_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_18 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%47#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %true_4 = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %32 = arith.addi %c464_i32, %0 : i32
      %true_5 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %35:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_10 : i32
        %39 = arith.addi %38, %0 : i32
        %c120_i32 = arith.constant 120 : i32
        %40 = arith.addi %c120_i32, %39 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_11 : i32
        "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %38 = simt_step.subgroup_id
        %39 = arith.index_cast %38 : index to i32
        %40 = arith.addi %arg3, %39 : i32
        %c1_i32 = arith.constant 1 : i32
        %41 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_11 : i32
        %43 = arith.addi %c480_i32, %42 : i32
        %44 = arith.addi %43, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40, %41) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %36 = arith.addi %c496_i32, %0 : i32
      %true_9 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %c140_i32 = arith.constant 140 : i32
    %14 = arith.addi %c140_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
    %17 = "simt_step.if"(%16) ({
      %c144_i32 = arith.constant 144 : i32
      %20 = arith.addi %c144_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = "simt_step.switch"(%21, %0) ({
      ^bb0(%arg2: i32):
        %c148_i32 = arith.constant 148 : i32
        %25 = arith.addi %c148_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_4 : i32
        %28 = "simt_step.if"(%27) ({
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %34 = simt_step.subgroup_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %29 = arith.addi %c512_i32, %0 : i32
        %true_5 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_6 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %31 = arith.addi %c528_i32, %0 : i32
        %true_7 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c544_i32 = arith.constant 544 : i32
      %23 = arith.addi %c544_i32, %0 : i32
      %true_3 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      %c152_i32 = arith.constant 152 : i32
      %20 = arith.addi %c152_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.subgroup_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg2: i32):
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c156_i32 = arith.constant 156 : i32
        %28 = arith.addi %c156_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = "simt_step.switch"(%29, %0) ({
        ^bb0(%arg3: i32):
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          %true_4 = arith.constant true
          %c560_i32 = arith.constant 560 : i32
          %35 = arith.addi %c560_i32, %0 : i32
          %true_5 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_6 : i32
          %true_7 = arith.constant true
          %c576_i32 = arith.constant 576 : i32
          %40 = arith.addi %c576_i32, %0 : i32
          %true_8 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %c592_i32 = arith.constant 592 : i32
        %31 = arith.addi %c592_i32, %0 : i32
        %true_3 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c608_i32 = arith.constant 608 : i32
    %18 = arith.addi %c608_i32, %0 : i32
    %true = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

