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
      %true_2 = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %7 = simt_step.subgroup_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg4: i32):
        %c2_i32_3 = arith.constant 2 : i32
        %12 = arith.remsi %arg3, %c2_i32_3 : i32
        %13 = simt_step.subgroup_id
        %14 = arith.index_cast %13 : index to i32
        %15 = "simt_step.switch"(%12, %14) ({
        ^bb0(%arg5: i32):
          %true_6 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %22 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %25 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %17 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %true_5 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %20 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %11 = arith.addi %c96_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9) : (i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %7 = "simt_step.switch"(%6, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %10 = arith.addi %c12_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_1 : i32
      %13 = "simt_step.if"(%12) ({
        %c16_i32 = arith.constant 16 : i32
        %43 = arith.addi %c16_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg3: i32):
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %true_15 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %51 = arith.addi %c112_i32, %0 : i32
          %true_16 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%47) : (i32) -> ()
      }, {
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_17 : i32
          %45 = arith.addi %44, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %46 = arith.addi %c20_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_18 : i32
          "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %44 = arith.addi %arg3, %arg4 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %45 = arith.addi %arg4, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_19 : i32
          %47 = arith.addi %c128_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_20 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) : (i32) -> ()
      }) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %14 = arith.addi %c144_i32, %0 : i32
      %true_2 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %16 = arith.addi %c160_i32, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %19 = arith.addi %c40_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_5 : i32
      %22 = "simt_step.if"(%21) ({
        %c44_i32 = arith.constant 44 : i32
        %43 = arith.addi %c44_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg3: i32):
          %true_17 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %50 = arith.addi %c176_i32, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %48 = arith.addi %c192_i32, %0 : i32
        %true_16 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) : (i32) -> ()
      }, {
        %c48_i32 = arith.constant 48 : i32
        %43 = arith.addi %c48_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_15 : i32
        %46 = "simt_step.if"(%45) ({
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }, {
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %47 = arith.addi %c208_i32, %0 : i32
        %true_16 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %23 = arith.addi %c224_i32, %0 : i32
      %true_6 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %25 = arith.addi %c240_i32, %0 : i32
      %true_8 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %28 = arith.addi %c52_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %30 = "simt_step.switch"(%29, %0) ({
      ^bb0(%arg3: i32):
        %c56_i32 = arith.constant 56 : i32
        %43 = arith.addi %c56_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.subgroup_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg4: i32):
          %67 = simt_step.lane_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb1(%69: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_23 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %70 = arith.addi %c256_i32, %0 : i32
          %true_24 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%72: i32):  // no predecessors
          %c1_i32_25 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_25) {fallthrough = false} : (i32) -> ()
        ^bb3(%73: i32):  // no predecessors
          %true_26 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %74 = arith.addi %c272_i32, %0 : i32
          %true_27 = arith.constant true
          %75 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %74, %75) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      ^bb1(%48: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %49:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %67 = arith.muli %arg5, %c4_i32_23 : i32
          %68 = arith.addi %67, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %69 = arith.addi %c60_i32, %68 : i32
          %70 = "simt_step.buffer.load"(%arg1, %69) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %71 = arith.cmpi ne, %70, %c0_i32_24 : i32
          "simt_step.condition"(%71, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %67 = arith.addi %arg4, %arg5 : i32
          %c1_i32_23 = arith.constant 1 : i32
          %68 = arith.addi %arg5, %c1_i32_23 : i32
          %true_24 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_25 = arith.constant 4 : i32
          %69 = arith.muli %arg5, %c4_i32_25 : i32
          %70 = arith.addi %c288_i32, %69 : i32
          %71 = arith.addi %70, %0 : i32
          %true_26 = arith.constant true
          %72 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67, %68) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%49#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%50: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %51 = arith.addi %c80_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %53 = arith.addi %0, %c3_i32 : i32
        %54 = "simt_step.switch"(%52, %53) ({
        ^bb0(%arg4: i32):
          %67 = simt_step.lane_id
          %68 = arith.index_cast %67 : index to i32
          %true_23 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %69 = arith.addi %c304_i32, %0 : i32
          %true_24 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb1(%71: i32):  // no predecessors
          %72 = simt_step.lane_id
          %73 = arith.index_cast %72 : index to i32
          "simt_step.yield"(%73) {fallthrough = true} : (i32) -> ()
        ^bb2(%74: i32):  // no predecessors
          %75 = simt_step.subgroup_id
          %76 = arith.index_cast %75 : index to i32
          "simt_step.yield"(%76) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %55 = arith.addi %c320_i32, %0 : i32
        %true_18 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
      ^bb3(%57: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %58 = arith.addi %c84_i32, %0 : i32
        %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
        %60 = simt_step.subgroup_id
        %61 = arith.index_cast %60 : index to i32
        %62 = "simt_step.switch"(%59, %61) ({
        ^bb0(%arg4: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %67 = arith.addi %0, %c4_i32_23 : i32
          %true_24 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %68 = arith.addi %c336_i32, %0 : i32
          %true_25 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        ^bb1(%70: i32):  // no predecessors
          %71 = simt_step.lane_id
          %72 = arith.index_cast %71 : index to i32
          %true_26 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %73 = arith.addi %c352_i32, %0 : i32
          %true_27 = arith.constant true
          %74 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %73, %74) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%72) {fallthrough = true} : (i32) -> ()
        ^bb2(%75: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %63 = arith.addi %c368_i32, %0 : i32
        %true_20 = arith.constant true
        %64 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_21 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %65 = arith.addi %c384_i32, %0 : i32
        %true_22 = arith.constant true
        %66 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %31 = arith.addi %c400_i32, %0 : i32
      %true_10 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_11 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %33 = arith.addi %c416_i32, %0 : i32
      %true_12 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb3(%35: i32):  // no predecessors
      %c88_i32 = arith.constant 88 : i32
      %36 = arith.addi %c88_i32, %0 : i32
      %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
      %38 = simt_step.subgroup_id
      %39 = arith.index_cast %38 : index to i32
      %40 = "simt_step.switch"(%37, %39) ({
      ^bb0(%arg3: i32):
        %c92_i32 = arith.constant 92 : i32
        %43 = arith.addi %c92_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_15 : i32
        %46 = "simt_step.if"(%45) ({
          %73 = simt_step.subgroup_id
          %74 = arith.index_cast %73 : index to i32
          "simt_step.yield"(%74) : (i32) -> ()
        }, {
          %73 = simt_step.lane_id
          %74 = arith.index_cast %73 : index to i32
          "simt_step.yield"(%74) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %47 = arith.addi %c432_i32, %0 : i32
        %true_16 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb1(%49: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %50 = arith.addi %c96_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %52 = arith.cmpi ne, %51, %c0_i32_17 : i32
        %53 = "simt_step.if"(%52) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %73 = simt_step.subgroup_id
          %74 = arith.index_cast %73 : index to i32
          "simt_step.yield"(%74) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %54 = arith.addi %c448_i32, %0 : i32
        %true_18 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %56 = arith.addi %c464_i32, %0 : i32
        %true_20 = arith.constant true
        %57 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      ^bb2(%58: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %59 = arith.addi %c100_i32, %0 : i32
        %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_21 = arith.constant 1 : i32
        %61 = "simt_step.switch"(%60, %c1_i32_21) ({
        ^bb0(%arg4: i32):
          %73 = simt_step.lane_id
          %74 = arith.index_cast %73 : index to i32
          %true_28 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %75 = arith.addi %c480_i32, %0 : i32
          %true_29 = arith.constant true
          %76 = "simt_step.wave_count_bits"(%true_29) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %75, %76) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%74) {fallthrough = false} : (i32) -> ()
        ^bb1(%77: i32):  // no predecessors
          %78 = simt_step.subgroup_id
          %79 = arith.index_cast %78 : index to i32
          "simt_step.yield"(%79) {fallthrough = false} : (i32) -> ()
        ^bb2(%80: i32):  // no predecessors
          %81 = simt_step.subgroup_id
          %82 = arith.index_cast %81 : index to i32
          %true_30 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %83 = arith.addi %c496_i32, %0 : i32
          %true_31 = arith.constant true
          %84 = "simt_step.wave_count_bits"(%true_31) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %83, %84) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%82) {fallthrough = false} : (i32) -> ()
        ^bb3(%85: i32):  // no predecessors
          %c1_i32_32 = arith.constant 1 : i32
          %true_33 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %86 = arith.addi %c512_i32, %0 : i32
          %true_34 = arith.constant true
          %87 = "simt_step.wave_count_bits"(%true_34) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %86, %87) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_22 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %62 = arith.addi %c528_i32, %0 : i32
        %true_23 = arith.constant true
        %63 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
      ^bb3(%64: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %65 = arith.addi %c104_i32, %0 : i32
        %66 = "simt_step.buffer.load"(%arg1, %65) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_24 = arith.constant 0 : i32
        %67 = arith.cmpi ne, %66, %c0_i32_24 : i32
        %68 = "simt_step.if"(%67) ({
          %73 = simt_step.subgroup_id
          %74 = arith.index_cast %73 : index to i32
          "simt_step.yield"(%74) : (i32) -> ()
        }, {
          %73 = simt_step.lane_id
          %74 = arith.index_cast %73 : index to i32
          "simt_step.yield"(%74) : (i32) -> ()
        }) : (i1) -> i32
        %c544_i32 = arith.constant 544 : i32
        %69 = arith.addi %c544_i32, %0 : i32
        %true_25 = arith.constant true
        %70 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_26 = arith.constant true
        %c560_i32 = arith.constant 560 : i32
        %71 = arith.addi %c560_i32, %0 : i32
        %true_27 = arith.constant true
        %72 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_13 = arith.constant true
      %c576_i32 = arith.constant 576 : i32
      %41 = arith.addi %c576_i32, %0 : i32
      %true_14 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c592_i32 = arith.constant 592 : i32
    %8 = arith.addi %c592_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

