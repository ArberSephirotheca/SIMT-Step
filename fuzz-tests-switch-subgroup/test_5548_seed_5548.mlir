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
      %c0_i32_1 = arith.constant 0 : i32
      %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %2 = "simt_step.if"(%1) ({
        %c0_i32_2 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c0_i32_3, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c32_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c48_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%2, %3) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %21 = arith.addi %c12_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_3 : i32
      %24 = "simt_step.if"(%23) ({
        %37 = simt_step.lane_id
        %38 = arith.index_cast %37 : index to i32
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %37 = arith.addi %c16_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = "simt_step.switch"(%38, %0) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          %true_9 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %43 = arith.addi %c64_i32, %0 : i32
          %true_10 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %49 = arith.addi %0, %c3_i32 : i32
          %true_11 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %50 = arith.addi %c80_i32, %0 : i32
          %true_12 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%39) : (i32) -> ()
      }) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %25 = arith.addi %c96_i32, %0 : i32
      %true_4 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %27 = arith.addi %c112_i32, %0 : i32
      %true_6 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %30 = simt_step.lane_id
      %31 = arith.index_cast %30 : index to i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %33 = simt_step.lane_id
      %34 = arith.index_cast %33 : index to i32
      %true_7 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %35 = arith.addi %c128_i32, %0 : i32
      %true_8 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c144_i32 = arith.constant 144 : i32
    %8 = arith.addi %c144_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %10 = simt_step.lane_id
    %11 = arith.index_cast %10 : index to i32
    %12 = simt_step.subgroup_id
    %13 = arith.index_cast %12 : index to i32
    %c20_i32 = arith.constant 20 : i32
    %14 = arith.addi %c20_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %16 = simt_step.subgroup_id
    %17 = arith.index_cast %16 : index to i32
    %18 = "simt_step.switch"(%15, %17) ({
    ^bb0(%arg2: i32):
      %c24_i32 = arith.constant 24 : i32
      %21 = arith.addi %c24_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_3 : i32
      %24 = "simt_step.if"(%23) ({
        %c28_i32 = arith.constant 28 : i32
        %37 = arith.addi %c28_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        %40 = "simt_step.if"(%39) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %41 = arith.addi %c160_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) : (i32) -> ()
      }, {
        %c32_i32 = arith.constant 32 : i32
        %37 = arith.addi %c32_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        %40 = "simt_step.if"(%39) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          %43 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %41 = arith.addi %c176_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) : (i32) -> ()
      }) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %25 = arith.addi %c192_i32, %0 : i32
      %true_4 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %28 = arith.addi %c36_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %30 = "simt_step.switch"(%29, %0) ({
      ^bb0(%arg3: i32):
        %c40_i32 = arith.constant 40 : i32
        %37 = arith.addi %c40_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        %40 = "simt_step.if"(%39) ({
          %c1_i32_21 = arith.constant 1 : i32
          %63 = arith.addi %0, %c1_i32_21 : i32
          "simt_step.yield"(%63) : (i32) -> ()
        }, {
          %c0_i32_21 = arith.constant 0 : i32
          %63 = arith.addi %0, %c0_i32_21 : i32
          "simt_step.yield"(%63) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %41 = arith.addi %c208_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %44 = arith.addi %0, %c1_i32 : i32
        %true_13 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %45 = arith.addi %c224_i32, %0 : i32
        %true_14 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %48 = arith.addi %c44_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_15 : i32
        %51 = "simt_step.if"(%50) ({
          %63 = simt_step.subgroup_id
          %64 = arith.index_cast %63 : index to i32
          "simt_step.yield"(%64) : (i32) -> ()
        }, {
          %63 = simt_step.lane_id
          %64 = arith.index_cast %63 : index to i32
          "simt_step.yield"(%64) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %52 = arith.addi %c240_i32, %0 : i32
        %true_16 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb3(%54: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %55 = arith.addi %c48_i32, %0 : i32
        %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %57 = arith.cmpi ne, %56, %c0_i32_17 : i32
        %58 = "simt_step.if"(%57) ({
          %c4_i32_21 = arith.constant 4 : i32
          %63 = arith.addi %0, %c4_i32_21 : i32
          "simt_step.yield"(%63) : (i32) -> ()
        }, {
          %c0_i32_21 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_21) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %59 = arith.addi %c256_i32, %0 : i32
        %true_18 = arith.constant true
        %60 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %61 = arith.addi %c272_i32, %0 : i32
        %true_20 = arith.constant true
        %62 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %31 = arith.addi %c288_i32, %0 : i32
      %true_6 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_11 : i32
        %38 = arith.addi %37, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %39 = arith.addi %c52_i32, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_12 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.muli %arg6, %c4_i32_16 : i32
          %45 = arith.addi %44, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %46 = arith.addi %c72_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_17 : i32
          "simt_step.condition"(%48, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %44 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %45 = arith.addi %arg6, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %46 = arith.muli %arg6, %c4_i32_18 : i32
          %47 = arith.addi %c304_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_19 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %38 = arith.addi %arg3, %37#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %39 = arith.addi %arg4, %c1_i32 : i32
        %true_13 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %40 = arith.muli %arg4, %c4_i32_14 : i32
        %41 = arith.addi %c320_i32, %40 : i32
        %42 = arith.addi %41, %0 : i32
        %true_15 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%38, %39) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %35 = arith.addi %c336_i32, %0 : i32
      %true_10 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c352_i32 = arith.constant 352 : i32
    %19 = arith.addi %c352_i32, %0 : i32
    %true_2 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

