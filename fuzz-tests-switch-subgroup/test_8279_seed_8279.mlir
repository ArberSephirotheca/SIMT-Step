module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %5 = "simt_step.if"(%4) ({
        %true_1 = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %13 = arith.addi %c0_i32_2, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %13 = "simt_step.if"(%12) ({
          %true_2 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %15 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }, {
          %true_2 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %15 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %8 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %11 = "simt_step.if"(%10) ({
        %c0_i32_1 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %13 = "simt_step.if"(%12) ({
          %true_2 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %15 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }, {
          %true_2 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %15 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %13 = "simt_step.if"(%12) ({
          %true_2 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %15 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }, {
          %true_2 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %15 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
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
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %48 = arith.muli %arg4, %c4_i32_15 : i32
        %49 = arith.addi %48, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %50 = arith.addi %c12_i32, %49 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %52 = arith.cmpi ne, %51, %c0_i32_16 : i32
        "simt_step.condition"(%52, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %48 = arith.addi %c32_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_15 : i32
        %51 = "simt_step.if"(%50) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %60 = simt_step.subgroup_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %52 = arith.addi %c128_i32, %0 : i32
        %true_16 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %54 = arith.addi %arg3, %51 : i32
        %c1_i32 = arith.constant 1 : i32
        %55 = arith.addi %arg4, %c1_i32 : i32
        %true_17 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %56 = arith.muli %arg4, %c4_i32_18 : i32
        %57 = arith.addi %c144_i32, %56 : i32
        %58 = arith.addi %57, %0 : i32
        %true_19 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54, %55) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %22 = arith.addi %c160_i32, %0 : i32
      %true_6 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %25 = arith.addi %c36_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = simt_step.lane_id
      %28 = arith.index_cast %27 : index to i32
      %29 = "simt_step.switch"(%26, %28) ({
      ^bb0(%arg3: i32):
        %c40_i32 = arith.constant 40 : i32
        %48 = arith.addi %c40_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %50 = "simt_step.switch"(%49, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%67: i32):  // no predecessors
          %68 = simt_step.subgroup_id
          %69 = arith.index_cast %68 : index to i32
          %true_21 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %70 = arith.addi %c176_i32, %0 : i32
          %true_22 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      ^bb1(%51: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %52 = arith.addi %c44_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %54 = simt_step.subgroup_id
        %55 = arith.index_cast %54 : index to i32
        %56 = "simt_step.switch"(%53, %55) ({
        ^bb0(%arg4: i32):
          %67 = simt_step.subgroup_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) {fallthrough = true} : (i32) -> ()
        ^bb1(%69: i32):  // no predecessors
          %70 = simt_step.lane_id
          %71 = arith.index_cast %70 : index to i32
          %true_21 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %72 = arith.addi %c192_i32, %0 : i32
          %true_22 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %57 = arith.addi %c208_i32, %0 : i32
        %true_16 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      ^bb2(%59: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %60 = arith.addi %c48_i32, %0 : i32
        %61 = "simt_step.buffer.load"(%arg1, %60) : (!simt_step.resource<Global, i32>, i32) -> i32
        %62 = "simt_step.switch"(%61, %0) ({
        ^bb0(%arg4: i32):
          %67 = simt_step.subgroup_id
          %68 = arith.index_cast %67 : index to i32
          %true_21 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %69 = arith.addi %c224_i32, %0 : i32
          %true_22 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = true} : (i32) -> ()
        ^bb1(%71: i32):  // no predecessors
          %72 = simt_step.subgroup_id
          %73 = arith.index_cast %72 : index to i32
          "simt_step.yield"(%73) {fallthrough = false} : (i32) -> ()
        ^bb2(%74: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_23 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %75 = arith.addi %c240_i32, %0 : i32
          %true_24 = arith.constant true
          %76 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %75, %76) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb3(%77: i32):  // no predecessors
          %78 = simt_step.subgroup_id
          %79 = arith.index_cast %78 : index to i32
          %true_25 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %80 = arith.addi %c256_i32, %0 : i32
          %true_26 = arith.constant true
          %81 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %80, %81) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%79) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %63 = arith.addi %c272_i32, %0 : i32
        %true_18 = arith.constant true
        %64 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %65 = arith.addi %c288_i32, %0 : i32
        %true_20 = arith.constant true
        %66 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %31 = arith.addi %c52_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_7 : i32
      %34 = "simt_step.if"(%33) ({
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %48:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %49 = arith.muli %arg4, %c4_i32_17 : i32
          %50 = arith.addi %49, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %51 = arith.addi %c56_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_18 : i32
          "simt_step.condition"(%53, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %49 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %51 = arith.muli %arg4, %c4_i32_18 : i32
          %52 = arith.addi %c304_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_19 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%48#0) : (i32) -> ()
      }, {
        %c76_i32 = arith.constant 76 : i32
        %48 = arith.addi %c76_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_15 : i32
        %51 = "simt_step.if"(%50) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %52 = arith.addi %c320_i32, %0 : i32
        %true_16 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %35 = arith.addi %c336_i32, %0 : i32
      %true_8 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %37 = arith.addi %c352_i32, %0 : i32
      %true_10 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    ^bb3(%39: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %40 = arith.addi %c80_i32, %0 : i32
      %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %42 = arith.cmpi ne, %41, %c0_i32_11 : i32
      %43 = "simt_step.if"(%42) ({
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %48:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %49 = arith.muli %arg4, %c4_i32_17 : i32
          %50 = arith.addi %49, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %51 = arith.addi %c84_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_18 : i32
          "simt_step.condition"(%53, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %49 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %51 = arith.muli %arg4, %c4_i32_18 : i32
          %52 = arith.addi %c368_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_19 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%48#0) : (i32) -> ()
      }, {
        %c104_i32 = arith.constant 104 : i32
        %48 = arith.addi %c104_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %50 = arith.addi %0, %c2_i32 : i32
        %51 = "simt_step.switch"(%49, %50) ({
        ^bb0(%arg3: i32):
          %c2_i32_15 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          %true_16 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %55 = arith.addi %c384_i32, %0 : i32
          %true_17 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54) {fallthrough = true} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %58 = simt_step.subgroup_id
          %59 = arith.index_cast %58 : index to i32
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%51) : (i32) -> ()
      }) : (i1) -> i32
      %c400_i32 = arith.constant 400 : i32
      %44 = arith.addi %c400_i32, %0 : i32
      %true_12 = arith.constant true
      %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_13 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %46 = arith.addi %c416_i32, %0 : i32
      %true_14 = arith.constant true
      %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c432_i32 = arith.constant 432 : i32
    %8 = arith.addi %c432_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c108_i32 = arith.constant 108 : i32
    %10 = arith.addi %c108_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = simt_step.subgroup_id
    %13 = arith.index_cast %12 : index to i32
    %14 = "simt_step.switch"(%11, %13) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_7 : i32
        %28 = arith.addi %27, %0 : i32
        %c112_i32 = arith.constant 112 : i32
        %29 = arith.addi %c112_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_8 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %27 = arith.addi %arg3, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_8 : i32
        %30 = arith.addi %c448_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_9 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %22 = arith.addi %c464_i32, %0 : i32
      %true_6 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %25 = simt_step.subgroup_id
      %26 = arith.index_cast %25 : index to i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c132_i32 = arith.constant 132 : i32
    %15 = arith.addi %c132_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %17 = arith.cmpi ne, %16, %c0_i32_1 : i32
    %18 = "simt_step.if"(%17) ({
      %c136_i32 = arith.constant 136 : i32
      %21 = arith.addi %c136_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = "simt_step.switch"(%22, %0) ({
      ^bb0(%arg2: i32):
        %c140_i32 = arith.constant 140 : i32
        %24 = arith.addi %c140_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_3 = arith.constant 4 : i32
        %26 = arith.addi %0, %c4_i32_3 : i32
        %27 = "simt_step.switch"(%25, %26) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          %true_10 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %47 = arith.addi %c480_i32, %0 : i32
          %true_11 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %true_12 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %50 = arith.addi %c496_i32, %0 : i32
          %true_13 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%52: i32):  // no predecessors
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %0, %c3_i32 : i32
        %true_4 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %30 = arith.addi %c512_i32, %0 : i32
        %true_5 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c144_i32 = arith.constant 144 : i32
        %33 = arith.addi %c144_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_6 : i32
        %36 = "simt_step.if"(%35) ({
          %c2_i32 = arith.constant 2 : i32
          %47 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c528_i32 = arith.constant 528 : i32
        %37 = arith.addi %c528_i32, %0 : i32
        %true_7 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_8 = arith.constant true
        %c544_i32 = arith.constant 544 : i32
        %39 = arith.addi %c544_i32, %0 : i32
        %true_9 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c148_i32 = arith.constant 148 : i32
        %42 = arith.addi %c148_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %44 = simt_step.subgroup_id
        %45 = arith.index_cast %44 : index to i32
        %46 = "simt_step.switch"(%43, %45) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          %true_10 = arith.constant true
          %c560_i32 = arith.constant 560 : i32
          %50 = arith.addi %c560_i32, %0 : i32
          %true_11 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c576_i32 = arith.constant 576 : i32
    %19 = arith.addi %c576_i32, %0 : i32
    %true_2 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

