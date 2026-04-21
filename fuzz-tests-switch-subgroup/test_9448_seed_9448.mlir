module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = simt_step.lane_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_1 = arith.constant 0 : i32
          %9 = arith.addi %c0_i32_1, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %true_2 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %12 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        ^bb2(%13: i32):  // no predecessors
          %true_3 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %15 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb3(%16: i32):  // no predecessors
          %true_4 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %18 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %5 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = simt_step.lane_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %9 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %true_1 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %12 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        ^bb2(%13: i32):  // no predecessors
          %true_2 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %15 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb3(%16: i32):  // no predecessors
          %true_3 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %18 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %7 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %7 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %9 = arith.addi %0, %c2_i32 : i32
    %10 = "simt_step.switch"(%8, %9) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %13 = "simt_step.switch"(%12, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %64 = arith.muli %arg5, %c4_i32_23 : i32
          %65 = arith.addi %64, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %66 = arith.addi %c16_i32, %65 : i32
          %67 = "simt_step.buffer.load"(%arg1, %66) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %68 = arith.cmpi ne, %67, %c0_i32_24 : i32
          "simt_step.condition"(%68, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %64 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %65 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %66 = arith.muli %arg5, %c4_i32_24 : i32
          %67 = arith.addi %c176_i32, %66 : i32
          %68 = arith.addi %67, %0 : i32
          %true_25 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64, %65) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %39 = arith.addi %c192_i32, %0 : i32
        %true_12 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %42 = arith.addi %c36_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %44 = "simt_step.switch"(%43, %c0_i32_13) ({
        ^bb0(%arg4: i32):
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %c2_i32_23 = arith.constant 2 : i32
          %67 = arith.addi %0, %c2_i32_23 : i32
          %true_24 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %68 = arith.addi %c208_i32, %0 : i32
          %true_25 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %45 = arith.addi %c224_i32, %0 : i32
        %true_15 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %47 = arith.addi %c240_i32, %0 : i32
        %true_17 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %50 = arith.addi %c40_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_18 = arith.constant 3 : i32
        %52 = arith.addi %0, %c3_i32_18 : i32
        %53 = "simt_step.switch"(%51, %52) ({
        ^bb0(%arg4: i32):
          %c2_i32_23 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_23) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %65 = simt_step.lane_id
          %66 = arith.index_cast %65 : index to i32
          "simt_step.yield"(%66) {fallthrough = true} : (i32) -> ()
        ^bb2(%67: i32):  // no predecessors
          %c2_i32_24 = arith.constant 2 : i32
          %68 = arith.addi %0, %c2_i32_24 : i32
          %true_25 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %69 = arith.addi %c256_i32, %0 : i32
          %true_26 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb3(%71: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %54 = arith.addi %c272_i32, %0 : i32
        %true_20 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      ^bb3(%56: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %57 = arith.addi %c44_i32, %0 : i32
        %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
        %59 = simt_step.subgroup_id
        %60 = arith.index_cast %59 : index to i32
        %61 = "simt_step.switch"(%58, %60) ({
        ^bb0(%arg4: i32):
          %true_23 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %64 = arith.addi %c288_i32, %0 : i32
          %true_24 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %true_25 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %67 = arith.addi %c304_i32, %0 : i32
          %true_26 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%69: i32):  // no predecessors
          %c3_i32_27 = arith.constant 3 : i32
          %70 = arith.addi %0, %c3_i32_27 : i32
          "simt_step.yield"(%70) {fallthrough = true} : (i32) -> ()
        ^bb3(%71: i32):  // no predecessors
          %72 = simt_step.lane_id
          %73 = arith.index_cast %72 : index to i32
          %true_28 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %74 = arith.addi %c320_i32, %0 : i32
          %true_29 = arith.constant true
          %75 = "simt_step.wave_count_bits"(%true_29) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %74, %75) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%73) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_21 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %62 = arith.addi %c336_i32, %0 : i32
        %true_22 = arith.constant true
        %63 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %15 = arith.addi %c48_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_0 : i32
      %18 = "simt_step.if"(%17) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_11 : i32
          %40 = arith.addi %39, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %41 = arith.addi %c52_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_12 : i32
          "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %39 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_12 : i32
          %42 = arith.addi %c352_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_13 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%38#0) : (i32) -> ()
      }, {
        %38 = simt_step.subgroup_id
        %39 = arith.index_cast %38 : index to i32
        "simt_step.yield"(%39) : (i32) -> ()
      }) : (i1) -> i32
      %c368_i32 = arith.constant 368 : i32
      %19 = arith.addi %c368_i32, %0 : i32
      %true = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_1 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %21 = arith.addi %c384_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %24 = arith.addi %c72_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c76_i32 = arith.constant 76 : i32
        %38 = arith.addi %c76_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_9 : i32
        %41 = "simt_step.if"(%40) ({
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c400_i32 = arith.constant 400 : i32
        %42 = arith.addi %c400_i32, %0 : i32
        %true_10 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %44 = arith.addi %c416_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %c2_i32_13 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_13) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %27 = arith.addi %c432_i32, %0 : i32
      %true_4 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %30 = arith.addi %c80_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_5 : i32
      %33 = "simt_step.if"(%32) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_11 : i32
          %40 = arith.addi %39, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %41 = arith.addi %c84_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_12 : i32
          "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %39 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_12 : i32
          %42 = arith.addi %c448_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_13 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%38#0) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_11 : i32
          %40 = arith.addi %39, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %41 = arith.addi %c104_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_12 : i32
          "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %39 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_12 : i32
          %42 = arith.addi %c464_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_13 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%38#0) : (i32) -> ()
      }) : (i1) -> i32
      %c480_i32 = arith.constant 480 : i32
      %34 = arith.addi %c480_i32, %0 : i32
      %true_6 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %36 = arith.addi %c496_i32, %0 : i32
      %true_8 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

