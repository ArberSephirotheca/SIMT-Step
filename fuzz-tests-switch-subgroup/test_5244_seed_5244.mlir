module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %6 = "simt_step.if"(%5) ({
        %c0_i32_4 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %9 = "simt_step.if"(%8) ({
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c16_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c32_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }, {
        %true_4 = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.muli %arg5, %c4_i32 : i32
        %10 = arith.addi %c48_i32, %9 : i32
        %11 = arith.addi %10, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %23 = arith.addi %c12_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      %25 = "simt_step.switch"(%24, %c4_i32_3) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %61 = arith.muli %arg5, %c4_i32_23 : i32
          %62 = arith.addi %61, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %63 = arith.addi %c16_i32, %62 : i32
          %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %65 = arith.cmpi ne, %64, %c0_i32_24 : i32
          "simt_step.condition"(%65, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %61 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %62 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %63 = arith.muli %arg5, %c4_i32_24 : i32
          %64 = arith.addi %c64_i32, %63 : i32
          %65 = arith.addi %64, %0 : i32
          %true_25 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%61, %62) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %41 = arith.addi %c36_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
        %44 = "simt_step.if"(%43) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c4_i32_23 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_23) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32_14 = arith.constant 80 : i32
        %45 = arith.addi %c80_i32_14, %0 : i32
        %true_15 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %47 = arith.addi %c96_i32, %0 : i32
        %true_17 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %50 = arith.addi %c40_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_18 = arith.constant 4 : i32
        %52 = arith.addi %0, %c4_i32_18 : i32
        %53 = "simt_step.switch"(%51, %52) ({
        ^bb0(%arg4: i32):
          %c0_i32_23 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_23) {fallthrough = true} : (i32) -> ()
        ^bb1(%61: i32):  // no predecessors
          %62 = simt_step.lane_id
          %63 = arith.index_cast %62 : index to i32
          %true_24 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %64 = arith.addi %c112_i32, %0 : i32
          %true_25 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63) {fallthrough = true} : (i32) -> ()
        ^bb2(%66: i32):  // no predecessors
          %c3_i32_26 = arith.constant 3 : i32
          %true_27 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %67 = arith.addi %c128_i32, %0 : i32
          %true_28 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_28) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %54 = arith.addi %c144_i32, %0 : i32
        %true_20 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      ^bb3(%56: i32):  // no predecessors
        %57 = simt_step.lane_id
        %58 = arith.index_cast %57 : index to i32
        %true_21 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %59 = arith.addi %c160_i32, %0 : i32
        %true_22 = arith.constant true
        %60 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %27 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %true_4 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %29 = arith.addi %c176_i32, %0 : i32
      %true_5 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %32 = arith.addi %c44_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32_6 = arith.constant 3 : i32
      %34 = "simt_step.switch"(%33, %c3_i32_6) ({
      ^bb0(%arg3: i32):
        %39 = simt_step.subgroup_id
        %40 = arith.index_cast %39 : index to i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %42 = arith.addi %c48_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_11 : i32
        %45 = "simt_step.if"(%44) ({
          %c0_i32_17 = arith.constant 0 : i32
          %56 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%56) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %56 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %46 = arith.addi %c192_i32, %0 : i32
        %true_12 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %48 = arith.addi %c208_i32, %0 : i32
        %true_14 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
      ^bb2(%50: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %51 = arith.addi %c52_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %53 = "simt_step.switch"(%52, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32_17 = arith.constant 3 : i32
          %56 = arith.addi %0, %c3_i32_17 : i32
          %true_18 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %57 = arith.addi %c224_i32, %0 : i32
          %true_19 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %60 = simt_step.subgroup_id
          %61 = arith.index_cast %60 : index to i32
          %true_20 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %62 = arith.addi %c240_i32, %0 : i32
          %true_21 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb2(%64: i32):  // no predecessors
          %65 = simt_step.lane_id
          %66 = arith.index_cast %65 : index to i32
          %true_22 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %67 = arith.addi %c256_i32, %0 : i32
          %true_23 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
        ^bb3(%69: i32):  // no predecessors
          %70 = simt_step.lane_id
          %71 = arith.index_cast %70 : index to i32
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %54 = arith.addi %c272_i32, %0 : i32
        %true_16 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %35 = arith.addi %c288_i32, %0 : i32
      %true_8 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %37 = arith.addi %c304_i32, %0 : i32
      %true_10 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c56_i32 = arith.constant 56 : i32
    %10 = arith.addi %c56_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_0 : i32
    %13 = "simt_step.if"(%12) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_5 : i32
        %25 = arith.addi %24, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %26 = arith.addi %c60_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
        "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %24 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %26 = arith.muli %arg3, %c4_i32_6 : i32
        %27 = arith.addi %c320_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_7 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) : (i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c336_i32 = arith.constant 336 : i32
    %14 = arith.addi %c336_i32, %0 : i32
    %true = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c80_i32 = arith.constant 80 : i32
    %16 = arith.addi %c80_i32, %0 : i32
    %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
    %18 = simt_step.lane_id
    %19 = arith.index_cast %18 : index to i32
    %20 = "simt_step.switch"(%17, %19) ({
    ^bb0(%arg2: i32):
      %c84_i32 = arith.constant 84 : i32
      %23 = arith.addi %c84_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %25 = "simt_step.switch"(%24, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_12 : i32
          %35 = arith.addi %34, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %36 = arith.addi %c88_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_13 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32 : i32
          %true_12 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_13 : i32
          %37 = arith.addi %c352_i32, %36 : i32
          %38 = arith.addi %37, %0 : i32
          %true_14 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %31 = arith.addi %c368_i32, %0 : i32
        %true_10 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c4_i32_11 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_7 : i32
        %31 = arith.addi %30, %0 : i32
        %c108_i32 = arith.constant 108 : i32
        %32 = arith.addi %c108_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_8 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %37 = arith.muli %arg6, %c4_i32_12 : i32
          %38 = arith.addi %37, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %39 = arith.addi %c128_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_13 : i32
          "simt_step.condition"(%41, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %37 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %38 = arith.addi %arg6, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %39 = arith.muli %arg6, %c4_i32_14 : i32
          %40 = arith.addi %c384_i32, %39 : i32
          %41 = arith.addi %40, %0 : i32
          %true_15 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %31 = arith.addi %arg3, %30#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_9 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_10 : i32
        %34 = arith.addi %c400_i32, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_11 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %28 = arith.addi %c416_i32, %0 : i32
      %true_6 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c432_i32 = arith.constant 432 : i32
    %21 = arith.addi %c432_i32, %0 : i32
    %true_2 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

