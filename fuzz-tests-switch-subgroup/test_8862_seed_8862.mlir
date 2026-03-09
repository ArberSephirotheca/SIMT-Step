module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = "simt_step.switch"(%2, %c0_i32_0) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %7 = simt_step.lane_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %22 = "simt_step.if"(%21) ({
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %30 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %30 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %25 = "simt_step.if"(%24) ({
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %30 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %30 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c2_i32_8 = arith.constant 2 : i32
        %27 = arith.remsi %arg3, %c2_i32_8 : i32
        %28 = "simt_step.switch"(%27, %arg0) ({
        ^bb0(%arg6: i32):
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %30 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %true_10 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %33 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %11 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32 : i32
          %24 = arith.cmpi slt, %arg6, %23 : i32
          "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.muli %arg6, %c4_i32 : i32
          %24 = arith.addi %c128_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) : (i32) -> ()
      }, {
        %c2_i32_6 = arith.constant 2 : i32
        %21 = arith.remsi %arg3, %c2_i32_6 : i32
        %22 = "simt_step.switch"(%21, %arg0) ({
        ^bb0(%arg5: i32):
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %24 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_8 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %27 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %30 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %17 = "simt_step.if"(%16) ({
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %22 = "simt_step.if"(%21) ({
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %24 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %24 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32 : i32
          %24 = arith.cmpi slt, %arg6, %23 : i32
          "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.muli %arg6, %c4_i32 : i32
          %24 = arith.addi %c224_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb3(%18: i32):  // no predecessors
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %20 = arith.addi %c240_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %25 = arith.addi %c12_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = simt_step.subgroup_id
      %28 = arith.index_cast %27 : index to i32
      %29 = "simt_step.switch"(%26, %28) ({
      ^bb0(%arg3: i32):
        %45 = simt_step.subgroup_id
        %46 = arith.index_cast %45 : index to i32
        %true_11 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %47 = arith.addi %c256_i32, %0 : i32
        %true_12 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb1(%49: i32):  // no predecessors
        %c16_i32 = arith.constant 16 : i32
        %50 = arith.addi %c16_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %52 = "simt_step.switch"(%51, %0) ({
        ^bb0(%arg4: i32):
          %true_15 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %62 = arith.addi %c272_i32, %0 : i32
          %true_16 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %65 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      ^bb2(%53: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb3(%54: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %55 = arith.addi %c20_i32, %0 : i32
        %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
        %57 = simt_step.subgroup_id
        %58 = arith.index_cast %57 : index to i32
        %59 = "simt_step.switch"(%56, %58) ({
        ^bb0(%arg4: i32):
          %62 = simt_step.lane_id
          %63 = arith.index_cast %62 : index to i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %65 = simt_step.lane_id
          %66 = arith.index_cast %65 : index to i32
          %true_15 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %67 = arith.addi %c288_i32, %0 : i32
          %true_16 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%66) {fallthrough = true} : (i32) -> ()
        ^bb2(%69: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          %70 = arith.addi %0, %c4_i32_17 : i32
          %true_18 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %71 = arith.addi %c304_i32, %0 : i32
          %true_19 = arith.constant true
          %72 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%70) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %60 = arith.addi %c320_i32, %0 : i32
        %true_14 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
    ^bb1(%30: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %31 = arith.addi %c24_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %33 = "simt_step.switch"(%32, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c28_i32 = arith.constant 28 : i32
        %45 = arith.addi %c28_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_11 : i32
        %48 = "simt_step.if"(%47) ({
          %71 = simt_step.lane_id
          %72 = arith.index_cast %71 : index to i32
          "simt_step.yield"(%72) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %49 = arith.addi %c336_i32, %0 : i32
        %true_12 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb1(%51: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %52 = arith.addi %c32_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %54 = arith.cmpi ne, %53, %c0_i32_13 : i32
        %55 = "simt_step.if"(%54) ({
          %71 = simt_step.lane_id
          %72 = arith.index_cast %71 : index to i32
          "simt_step.yield"(%72) : (i32) -> ()
        }, {
          %71 = simt_step.subgroup_id
          %72 = arith.index_cast %71 : index to i32
          "simt_step.yield"(%72) : (i32) -> ()
        }) : (i1) -> i32
        %c352_i32 = arith.constant 352 : i32
        %56 = arith.addi %c352_i32, %0 : i32
        %true_14 = arith.constant true
        %57 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%55) {fallthrough = true} : (i32) -> ()
      ^bb2(%58: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %59 = arith.addi %c36_i32, %0 : i32
        %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
        %61 = "simt_step.switch"(%60, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_19 = arith.constant 1 : i32
          %71 = arith.addi %0, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %72 = arith.addi %c368_i32, %0 : i32
          %true_21 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        ^bb1(%74: i32):  // no predecessors
          %c4_i32_22 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_22) {fallthrough = false} : (i32) -> ()
        ^bb2(%75: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %76 = arith.addi %0, %c2_i32 : i32
          %true_23 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %77 = arith.addi %c384_i32, %0 : i32
          %true_24 = arith.constant true
          %78 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %77, %78) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%76) {fallthrough = false} : (i32) -> ()
        ^bb3(%79: i32):  // no predecessors
          %c4_i32_25 = arith.constant 4 : i32
          %80 = arith.addi %0, %c4_i32_25 : i32
          %true_26 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %81 = arith.addi %c400_i32, %0 : i32
          %true_27 = arith.constant true
          %82 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %81, %82) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%80) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
      ^bb3(%62: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %63 = arith.addi %c40_i32, %0 : i32
        %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %65 = arith.cmpi ne, %64, %c0_i32_15 : i32
        %66 = "simt_step.if"(%65) ({
          %c2_i32 = arith.constant 2 : i32
          %71 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%71) : (i32) -> ()
        }, {
          %c4_i32_19 = arith.constant 4 : i32
          %71 = arith.addi %0, %c4_i32_19 : i32
          "simt_step.yield"(%71) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %67 = arith.addi %c416_i32, %0 : i32
        %true_16 = arith.constant true
        %68 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %69 = arith.addi %c432_i32, %0 : i32
        %true_18 = arith.constant true
        %70 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb2(%34: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %35:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %45 = arith.muli %arg4, %c4_i32_11 : i32
        %46 = arith.addi %45, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %47 = arith.addi %c44_i32, %46 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_12 : i32
        "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %45 = arith.addi %arg3, %arg4 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %46 = arith.addi %arg4, %c1_i32_11 : i32
        %true_12 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %47 = arith.muli %arg4, %c4_i32_13 : i32
        %48 = arith.addi %c448_i32, %47 : i32
        %49 = arith.addi %48, %0 : i32
        %true_14 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45, %46) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %36 = arith.addi %c464_i32, %0 : i32
      %true_8 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%35#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %39 = arith.addi %c64_i32, %0 : i32
      %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %41 = arith.cmpi ne, %40, %c0_i32_9 : i32
      %42 = "simt_step.if"(%41) ({
        %c68_i32 = arith.constant 68 : i32
        %45 = arith.addi %c68_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = simt_step.lane_id
        %48 = arith.index_cast %47 : index to i32
        %49 = "simt_step.switch"(%46, %48) ({
        ^bb0(%arg3: i32):
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          %true_11 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %52 = arith.addi %c480_i32, %0 : i32
          %true_12 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = true} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %true_13 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %55 = arith.addi %c496_i32, %0 : i32
          %true_14 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %58 = simt_step.lane_id
          %59 = arith.index_cast %58 : index to i32
          %true_15 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %60 = arith.addi %c512_i32, %0 : i32
          %true_16 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        ^bb3(%62: i32):  // no predecessors
          %c1_i32_17 = arith.constant 1 : i32
          %63 = arith.addi %0, %c1_i32_17 : i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%49) : (i32) -> ()
      }, {
        %c4_i32_11 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_11) : (i32) -> ()
      }) : (i1) -> i32
      %c528_i32 = arith.constant 528 : i32
      %43 = arith.addi %c528_i32, %0 : i32
      %true_10 = arith.constant true
      %44 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c544_i32 = arith.constant 544 : i32
    %10 = arith.addi %c544_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c72_i32 = arith.constant 72 : i32
    %12 = arith.addi %c72_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
    %15 = "simt_step.if"(%14) ({
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %26 = arith.muli %arg3, %c4_i32_7 : i32
        %27 = arith.addi %26, %0 : i32
        %c76_i32 = arith.constant 76 : i32
        %28 = arith.addi %c76_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
        "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %26 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c560_i32 = arith.constant 560 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %28 = arith.muli %arg3, %c4_i32_8 : i32
        %29 = arith.addi %c560_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_9 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%25#0) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %26 = arith.muli %arg3, %c4_i32_7 : i32
        %27 = arith.addi %26, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %28 = arith.addi %c96_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
        "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %26 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c576_i32 = arith.constant 576 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %28 = arith.muli %arg3, %c4_i32_8 : i32
        %29 = arith.addi %c576_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_9 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%25#0) : (i32) -> ()
    }) : (i1) -> i32
    %c592_i32 = arith.constant 592 : i32
    %16 = arith.addi %c592_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c116_i32 = arith.constant 116 : i32
    %18 = arith.addi %c116_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %20 = simt_step.lane_id
    %21 = arith.index_cast %20 : index to i32
    %22 = "simt_step.switch"(%19, %21) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_15 : i32
        %40 = arith.addi %39, %0 : i32
        %c120_i32 = arith.constant 120 : i32
        %41 = arith.addi %c120_i32, %40 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
        "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %46 = arith.muli %arg6, %c4_i32_20 : i32
          %47 = arith.addi %46, %0 : i32
          %c140_i32 = arith.constant 140 : i32
          %48 = arith.addi %c140_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_21 : i32
          "simt_step.condition"(%50, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %46 = arith.addi %arg5, %arg6 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %47 = arith.addi %arg6, %c1_i32_20 : i32
          %true_21 = arith.constant true
          %c608_i32 = arith.constant 608 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %48 = arith.muli %arg6, %c4_i32_22 : i32
          %49 = arith.addi %c608_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_23 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %40 = arith.addi %arg3, %39#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %41 = arith.addi %arg4, %c1_i32 : i32
        %true_17 = arith.constant true
        %c624_i32 = arith.constant 624 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_18 : i32
        %43 = arith.addi %c624_i32, %42 : i32
        %44 = arith.addi %43, %0 : i32
        %true_19 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40, %41) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %c640_i32 = arith.constant 640 : i32
      %26 = arith.addi %c640_i32, %0 : i32
      %true_8 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c160_i32 = arith.constant 160 : i32
      %29 = arith.addi %c160_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_9 : i32
      %32 = "simt_step.if"(%31) ({
        %c164_i32 = arith.constant 164 : i32
        %39 = arith.addi %c164_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = simt_step.lane_id
        %42 = arith.index_cast %41 : index to i32
        %43 = "simt_step.switch"(%40, %42) ({
        ^bb0(%arg3: i32):
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          %true_17 = arith.constant true
          %c656_i32 = arith.constant 656 : i32
          %48 = arith.addi %c656_i32, %0 : i32
          %true_18 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          %51 = arith.addi %0, %c0_i32_19 : i32
          %true_20 = arith.constant true
          %c672_i32 = arith.constant 672 : i32
          %52 = arith.addi %c672_i32, %0 : i32
          %true_21 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb2(%54: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c688_i32 = arith.constant 688 : i32
        %44 = arith.addi %c688_i32, %0 : i32
        %true_16 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) : (i32) -> ()
      }, {
        %c168_i32 = arith.constant 168 : i32
        %39 = arith.addi %c168_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_15 : i32
        %42 = "simt_step.if"(%41) ({
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c704_i32 = arith.constant 704 : i32
        %43 = arith.addi %c704_i32, %0 : i32
        %true_16 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) : (i32) -> ()
      }) : (i1) -> i32
      %c720_i32 = arith.constant 720 : i32
      %33 = arith.addi %c720_i32, %0 : i32
      %true_10 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_11 = arith.constant true
      %c736_i32 = arith.constant 736 : i32
      %35 = arith.addi %c736_i32, %0 : i32
      %true_12 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%37: i32):  // no predecessors
      %c0_i32_13 = arith.constant 0 : i32
      %c0_i32_14 = arith.constant 0 : i32
      %38:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_15 : i32
        %40 = arith.addi %39, %0 : i32
        %c172_i32 = arith.constant 172 : i32
        %41 = arith.addi %c172_i32, %40 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
        "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %39 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %arg4, %c1_i32 : i32
        %true_15 = arith.constant true
        %c752_i32 = arith.constant 752 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %41 = arith.muli %arg4, %c4_i32_16 : i32
        %42 = arith.addi %c752_i32, %41 : i32
        %43 = arith.addi %42, %0 : i32
        %true_17 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39, %40) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c768_i32 = arith.constant 768 : i32
    %23 = arith.addi %c768_i32, %0 : i32
    %true_4 = arith.constant true
    %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

