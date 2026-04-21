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
        %c3_i32_1 = arith.constant 3 : i32
        %5 = arith.remsi %arg3, %c3_i32_1 : i32
        %c2_i32 = arith.constant 2 : i32
        %6 = "simt_step.switch"(%5, %c2_i32) ({
        ^bb0(%arg7: i32):
          %true_2 = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg6, %c4_i32 : i32
          %10 = arith.addi %c0_i32_3, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %true_4 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32_5 : i32
          %15 = arith.addi %c16_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          %true_6 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32_7 : i32
          %20 = arith.addi %c32_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%6, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%1#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%2: i32):  // no predecessors
      %true = arith.constant true
      %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %4 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%3) {fallthrough = false} : (i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %7 = arith.addi %0, %c2_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.addi %0, %c3_i32 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_22 : i32
          %61 = arith.addi %60, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %62 = arith.addi %c16_i32, %61 : i32
          %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %64 = arith.cmpi ne, %63, %c0_i32_23 : i32
          "simt_step.condition"(%64, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %60 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %61 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %62 = arith.muli %arg5, %c4_i32_23 : i32
          %63 = arith.addi %c64_i32, %62 : i32
          %64 = arith.addi %63, %0 : i32
          %true_24 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60, %61) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %38 = arith.addi %c80_i32, %0 : i32
        %true_14 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %41 = arith.addi %c36_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = "simt_step.switch"(%42, %0) ({
        ^bb0(%arg4: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %60 = arith.addi %0, %c4_i32_22 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb1(%61: i32):  // no predecessors
          %62 = simt_step.lane_id
          %63 = arith.index_cast %62 : index to i32
          %true_23 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %64 = arith.addi %c96_i32, %0 : i32
          %true_24 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %44 = arith.addi %c112_i32, %0 : i32
        %true_16 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %47 = arith.addi %c40_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_17 : i32
        %50 = "simt_step.if"(%49) ({
          %c4_i32_22 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_22) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %51 = arith.addi %c128_i32, %0 : i32
        %true_18 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %53 = arith.addi %c144_i32, %0 : i32
        %true_20 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      ^bb3(%55: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %56 = arith.addi %c44_i32, %0 : i32
        %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_21 = arith.constant 3 : i32
        %58 = arith.addi %0, %c3_i32_21 : i32
        %59 = "simt_step.switch"(%57, %58) ({
        ^bb0(%arg4: i32):
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = true} : (i32) -> ()
        ^bb1(%62: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%63: i32):  // no predecessors
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb3(%66: i32):  // no predecessors
          %67 = simt_step.lane_id
          %68 = arith.index_cast %67 : index to i32
          %true_22 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %69 = arith.addi %c160_i32, %0 : i32
          %true_23 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %16 = arith.addi %c176_i32, %0 : i32
      %true_3 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %18 = arith.addi %c192_i32, %0 : i32
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %21 = arith.addi %c48_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = simt_step.lane_id
      %24 = arith.index_cast %23 : index to i32
      %25 = "simt_step.switch"(%22, %24) ({
      ^bb0(%arg3: i32):
        %c52_i32 = arith.constant 52 : i32
        %37 = arith.addi %c52_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.lane_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg4: i32):
          %68 = simt_step.lane_id
          %69 = arith.index_cast %68 : index to i32
          %true_24 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %70 = arith.addi %c208_i32, %0 : i32
          %true_25 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        ^bb1(%72: i32):  // no predecessors
          %c0_i32_26 = arith.constant 0 : i32
          %73 = arith.addi %0, %c0_i32_26 : i32
          "simt_step.yield"(%73) {fallthrough = false} : (i32) -> ()
        ^bb2(%74: i32):  // no predecessors
          %c4_i32_27 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %42 = arith.addi %c224_i32, %0 : i32
        %true_12 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %45 = arith.addi %c56_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_13 : i32
        %48 = "simt_step.if"(%47) ({
          %68 = simt_step.subgroup_id
          %69 = arith.index_cast %68 : index to i32
          "simt_step.yield"(%69) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %49 = arith.addi %c240_i32, %0 : i32
        %true_14 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %51 = arith.addi %c256_i32, %0 : i32
        %true_16 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb2(%53: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %54 = arith.addi %c60_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %56 = arith.cmpi ne, %55, %c0_i32_17 : i32
        %57 = "simt_step.if"(%56) ({
          %c2_i32_24 = arith.constant 2 : i32
          %68 = arith.addi %0, %c2_i32_24 : i32
          "simt_step.yield"(%68) : (i32) -> ()
        }, {
          %c4_i32_24 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_24) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %58 = arith.addi %c272_i32, %0 : i32
        %true_18 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = true} : (i32) -> ()
      ^bb3(%60: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %61 = arith.addi %c64_i32, %0 : i32
        %62 = "simt_step.buffer.load"(%arg1, %61) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_19 = arith.constant 4 : i32
        %63 = "simt_step.switch"(%62, %c4_i32_19) ({
        ^bb0(%arg4: i32):
          %c0_i32_24 = arith.constant 0 : i32
          %68 = arith.addi %0, %c0_i32_24 : i32
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb1(%69: i32):  // no predecessors
          %70 = simt_step.lane_id
          %71 = arith.index_cast %70 : index to i32
          %true_25 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %72 = arith.addi %c288_i32, %0 : i32
          %true_26 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        ^bb2(%74: i32):  // no predecessors
          %true_27 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %75 = arith.addi %c304_i32, %0 : i32
          %true_28 = arith.constant true
          %76 = "simt_step.wave_count_bits"(%true_28) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %75, %76) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_20 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %64 = arith.addi %c320_i32, %0 : i32
        %true_21 = arith.constant true
        %65 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_22 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %66 = arith.addi %c336_i32, %0 : i32
        %true_23 = arith.constant true
        %67 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %26 = arith.addi %c352_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %29 = arith.addi %c68_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_8 : i32
      %32 = "simt_step.if"(%31) ({
        %c2_i32_11 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_11) : (i32) -> ()
      }, {
        %c72_i32 = arith.constant 72 : i32
        %37 = arith.addi %c72_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.subgroup_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg3: i32):
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          %true_13 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %46 = arith.addi %c368_i32, %0 : i32
          %true_14 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c3_i32_15 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %50 = arith.addi %0, %c0_i32_16 : i32
          %true_17 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %51 = arith.addi %c384_i32, %0 : i32
          %true_18 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %42 = arith.addi %c400_i32, %0 : i32
        %true_12 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) : (i32) -> ()
      }) : (i1) -> i32
      %c416_i32 = arith.constant 416 : i32
      %33 = arith.addi %c416_i32, %0 : i32
      %true_9 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb3(%35: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %36 = arith.addi %0, %c0_i32_10 : i32
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c432_i32 = arith.constant 432 : i32
    %9 = arith.addi %c432_i32, %0 : i32
    %true_0 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %11 = arith.addi %0, %c0_i32_1 : i32
    return
  }
}

