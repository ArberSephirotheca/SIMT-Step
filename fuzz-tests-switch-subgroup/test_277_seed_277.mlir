module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %10, %c1_i32 : i32
      %12 = arith.cmpi slt, %arg5, %11 : i32
      "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %11 = arith.muli %arg5, %c4_i32 : i32
      %12 = arith.addi %c0_i32_4, %11 : i32
      %13 = arith.addi %12, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%10, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%arg3, %2) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %true_4 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %14 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0#0, %3 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %7 = "simt_step.if"(%6) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg5, %12 : i32
        "simt_step.condition"(%13, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %true = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.muli %arg5, %c4_i32 : i32
        %13 = arith.addi %c48_i32, %12 : i32
        %14 = arith.addi %13, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%11, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %11 = "simt_step.if"(%10) ({
        %true = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %13 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %13 = "simt_step.if"(%12) ({
          %true = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %15 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }, {
          %true = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %15 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %9 = arith.select %8, %5, %7 : i32
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
      %11 = arith.addi %c8_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
      "simt_step.if"(%13) ({
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
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c4_i32_1 = arith.constant 4 : i32
      %11 = arith.addi %0, %c4_i32_1 : i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_11 : i32
        %34 = arith.addi %33, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %35 = arith.addi %c16_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %33 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32 : i32
        %true_11 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_12 : i32
        %36 = arith.addi %c112_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_13 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %15 = arith.addi %c36_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg3: i32):
        %c40_i32 = arith.constant 40 : i32
        %33 = arith.addi %c40_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_11 = arith.constant 4 : i32
        %35 = "simt_step.switch"(%34, %c4_i32_11) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %57 = arith.addi %0, %c1_i32 : i32
          %true_18 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %58 = arith.addi %c128_i32, %0 : i32
          %true_19 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %61 = simt_step.subgroup_id
          %62 = arith.index_cast %61 : index to i32
          %true_20 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %63 = arith.addi %c144_i32, %0 : i32
          %true_21 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb2(%65: i32):  // no predecessors
          %66 = simt_step.subgroup_id
          %67 = arith.index_cast %66 : index to i32
          %true_22 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %68 = arith.addi %c160_i32, %0 : i32
          %true_23 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        ^bb3(%70: i32):  // no predecessors
          %71 = simt_step.subgroup_id
          %72 = arith.index_cast %71 : index to i32
          "simt_step.yield"(%72) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %37 = arith.addi %c44_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.subgroup_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %true_18 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %60 = arith.addi %c176_i32, %0 : i32
          %true_19 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          %c0_i32_20 = arith.constant 0 : i32
          %true_21 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %63 = arith.addi %c192_i32, %0 : i32
          %true_22 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_20) {fallthrough = false} : (i32) -> ()
        ^bb3(%65: i32):  // no predecessors
          %c3_i32_23 = arith.constant 3 : i32
          %true_24 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %66 = arith.addi %c208_i32, %0 : i32
          %true_25 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %42 = arith.addi %c224_i32, %0 : i32
        %true_13 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %45 = arith.addi %c48_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %47 = "simt_step.switch"(%46, %c3_i32) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          %60 = arith.addi %0, %c0_i32_18 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %62 = simt_step.subgroup_id
          %63 = arith.index_cast %62 : index to i32
          %true_19 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %64 = arith.addi %c240_i32, %0 : i32
          %true_20 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb3(%66: i32):  // no predecessors
          %67 = simt_step.lane_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %48 = arith.addi %c256_i32, %0 : i32
        %true_15 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
      ^bb3(%50: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %51 = arith.addi %c52_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %53 = arith.cmpi ne, %52, %c0_i32_16 : i32
        %54 = "simt_step.if"(%53) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %57 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %55 = arith.addi %c272_i32, %0 : i32
        %true_17 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %20 = arith.addi %c288_i32, %0 : i32
      %true_4 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %22 = arith.addi %c304_i32, %0 : i32
      %true_6 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %25 = arith.addi %c56_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_7 : i32
      %28 = "simt_step.if"(%27) ({
        %33 = simt_step.subgroup_id
        %34 = arith.index_cast %33 : index to i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %33 = arith.addi %c60_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %35 = "simt_step.switch"(%34, %c1_i32) ({
        ^bb0(%arg3: i32):
          %36 = simt_step.lane_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          %true_12 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %42 = arith.addi %c320_i32, %0 : i32
          %true_13 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %29 = arith.addi %c336_i32, %0 : i32
      %true_8 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %31 = arith.addi %c352_i32, %0 : i32
      %true_10 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

