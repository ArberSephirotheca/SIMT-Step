module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %true_0 = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %7 = "simt_step.switch"(%arg3, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %12 = "simt_step.if"(%11) ({
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %17 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %17 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) {fallthrough = true} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %true_3 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %15 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %10 = "simt_step.if"(%9) ({
        %true_2 = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %12 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%11) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %12 = "simt_step.if"(%11) ({
          %true_3 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %14 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }, {
          %true_3 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %14 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c112_i32 = arith.constant 112 : i32
    %3 = arith.addi %c112_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_3 : i32
      %18 = arith.addi %17, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %19 = arith.addi %c8_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %17 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_4 : i32
      %20 = arith.addi %c128_i32, %19 : i32
      %21 = arith.addi %20, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
    %9 = "simt_step.if"(%8) ({
      %c32_i32 = arith.constant 32 : i32
      %17 = arith.addi %c32_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.muli %arg3, %c4_i32_7 : i32
          %25 = arith.addi %24, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %26 = arith.addi %c36_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
          "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %24 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_8 : i32
          %27 = arith.addi %c144_i32, %26 : i32
          %28 = arith.addi %27, %0 : i32
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.muli %arg3, %c4_i32_7 : i32
          %25 = arith.addi %24, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %26 = arith.addi %c56_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
          "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %24 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_8 : i32
          %27 = arith.addi %c160_i32, %26 : i32
          %28 = arith.addi %27, %0 : i32
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) : (i32) -> ()
      }) : (i1) -> i32
      %c176_i32 = arith.constant 176 : i32
      %21 = arith.addi %c176_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) : (i32) -> ()
    }) : (i1) -> i32
    %c192_i32 = arith.constant 192 : i32
    %10 = arith.addi %c192_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c76_i32 = arith.constant 76 : i32
    %12 = arith.addi %c76_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c80_i32 = arith.constant 80 : i32
      %17 = arith.addi %c80_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg3: i32):
        %c84_i32 = arith.constant 84 : i32
        %43 = arith.addi %c84_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.subgroup_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg4: i32):
          %c4_i32_23 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_23) {fallthrough = false} : (i32) -> ()
        ^bb1(%71: i32):  // no predecessors
          %72 = simt_step.lane_id
          %73 = arith.index_cast %72 : index to i32
          %true_24 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %74 = arith.addi %c208_i32, %0 : i32
          %true_25 = arith.constant true
          %75 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %74, %75) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%73) {fallthrough = true} : (i32) -> ()
        ^bb2(%76: i32):  // no predecessors
          %77 = simt_step.lane_id
          %78 = arith.index_cast %77 : index to i32
          %true_26 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %79 = arith.addi %c224_i32, %0 : i32
          %true_27 = arith.constant true
          %80 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %79, %80) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%78) {fallthrough = true} : (i32) -> ()
        ^bb3(%81: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %48 = arith.addi %c240_i32, %0 : i32
        %true_14 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
      ^bb1(%50: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %51 = arith.addi %c88_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %53 = arith.cmpi ne, %52, %c0_i32_15 : i32
        %54 = "simt_step.if"(%53) ({
          %71 = simt_step.subgroup_id
          %72 = arith.index_cast %71 : index to i32
          "simt_step.yield"(%72) : (i32) -> ()
        }, {
          %71 = simt_step.lane_id
          %72 = arith.index_cast %71 : index to i32
          "simt_step.yield"(%72) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %55 = arith.addi %c256_i32, %0 : i32
        %true_16 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %57 = arith.addi %c272_i32, %0 : i32
        %true_18 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = true} : (i32) -> ()
      ^bb2(%59: i32):  // no predecessors
        %60 = simt_step.subgroup_id
        %61 = arith.index_cast %60 : index to i32
        %true_19 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %62 = arith.addi %c288_i32, %0 : i32
        %true_20 = arith.constant true
        %63 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%61) {fallthrough = true} : (i32) -> ()
      ^bb3(%64: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %65 = arith.addi %c92_i32, %0 : i32
        %66 = "simt_step.buffer.load"(%arg1, %65) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %67 = arith.cmpi ne, %66, %c0_i32_21 : i32
        %68 = "simt_step.if"(%67) ({
          %71 = simt_step.subgroup_id
          %72 = arith.index_cast %71 : index to i32
          "simt_step.yield"(%72) : (i32) -> ()
        }, {
          %71 = simt_step.lane_id
          %72 = arith.index_cast %71 : index to i32
          "simt_step.yield"(%72) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %69 = arith.addi %c304_i32, %0 : i32
        %true_22 = arith.constant true
        %70 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %22 = arith.addi %c320_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_13 : i32
        %44 = arith.addi %43, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %45 = arith.addi %c96_i32, %44 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_14 : i32
        "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %43 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %44 = arith.addi %arg4, %c1_i32 : i32
        %true_13 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %45 = arith.muli %arg4, %c4_i32_14 : i32
        %46 = arith.addi %c336_i32, %45 : i32
        %47 = arith.addi %46, %0 : i32
        %true_15 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43, %44) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %26 = arith.addi %c352_i32, %0 : i32
      %true_8 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c116_i32 = arith.constant 116 : i32
      %29 = arith.addi %c116_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = simt_step.subgroup_id
      %32 = arith.index_cast %31 : index to i32
      %33 = "simt_step.switch"(%30, %32) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %43 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %45 = arith.addi %c120_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %47 = "simt_step.switch"(%46, %c2_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          %true_15 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %53 = arith.addi %c368_i32, %0 : i32
          %true_16 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb2(%55: i32):  // no predecessors
          %c2_i32_17 = arith.constant 2 : i32
          %true_18 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %56 = arith.addi %c384_i32, %0 : i32
          %true_19 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %48 = arith.addi %c400_i32, %0 : i32
        %true_14 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %34 = arith.addi %c416_i32, %0 : i32
      %true_10 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c124_i32 = arith.constant 124 : i32
      %37 = arith.addi %c124_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
      %40 = "simt_step.if"(%39) ({
        %43 = simt_step.subgroup_id
        %44 = arith.index_cast %43 : index to i32
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        %c128_i32 = arith.constant 128 : i32
        %43 = arith.addi %c128_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_13 : i32
        %46 = "simt_step.if"(%45) ({
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %47 = arith.addi %c432_i32, %0 : i32
        %true_14 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) : (i32) -> ()
      }) : (i1) -> i32
      %c448_i32 = arith.constant 448 : i32
      %41 = arith.addi %c448_i32, %0 : i32
      %true_12 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

