module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.remsi %arg3, %c4_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %11 = "simt_step.if"(%10) ({
        %c0_i32_7 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %21 = "simt_step.if"(%20) ({
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %23 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %23 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) : (i32) -> ()
      }, {
        %true_7 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %21 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %true_3 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %14 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %17 = "simt_step.if"(%16) ({
        %c0_i32_7 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %21 = "simt_step.if"(%20) ({
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %23 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %23 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) : (i32) -> ()
      }, {
        %true_7 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %21 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb3(%18: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %20 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %20, %c1_i32 : i32
        %22 = arith.cmpi slt, %arg6, %21 : i32
        "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32 = arith.constant 2 : i32
        %20 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32 = arith.constant 3 : i32
        %21 = arith.addi %arg0, %c3_i32 : i32
        %22 = "simt_step.switch"(%20, %21) ({
        ^bb0(%arg7: i32):
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg6, %c4_i32_8 : i32
          %26 = arith.addi %c128_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_10 : i32
          %31 = arith.addi %c144_i32, %30 : i32
          %32 = arith.addi %31, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %true_11 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg6, %c4_i32_12 : i32
          %36 = arith.addi %c160_i32, %35 : i32
          %37 = arith.addi %36, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_0 = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %7 = arith.addi %c176_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %9 = arith.select %8, %0, %5 : i32
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
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
      %16 = "simt_step.if"(%15) ({
        %c3_i32 = arith.constant 3 : i32
        %24 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg4, %c4_i32_8 : i32
          %26 = arith.addi %25, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %27 = arith.addi %c16_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
          "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %25 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg4, %c1_i32 : i32
          %true_8 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %27 = arith.muli %arg4, %c4_i32_9 : i32
          %28 = arith.addi %c192_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %17 = arith.addi %c208_i32, %0 : i32
      %true_3 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %20 = simt_step.subgroup_id
      %21 = arith.index_cast %20 : index to i32
      %true_4 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %22 = arith.addi %c224_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c240_i32 = arith.constant 240 : i32
    %8 = arith.addi %c240_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c36_i32 = arith.constant 36 : i32
    %10 = arith.addi %c36_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %12 = "simt_step.switch"(%11, %c0_i32_1) ({
    ^bb0(%arg2: i32):
      %c40_i32 = arith.constant 40 : i32
      %13 = arith.addi %c40_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_2 : i32
      %16 = "simt_step.if"(%15) ({
        %c44_i32 = arith.constant 44 : i32
        %46 = arith.addi %c44_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %48 = simt_step.lane_id
        %49 = arith.index_cast %48 : index to i32
        %50 = "simt_step.switch"(%47, %49) ({
        ^bb0(%arg3: i32):
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          %true_14 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %56 = arith.addi %c256_i32, %0 : i32
          %true_15 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%50) : (i32) -> ()
      }, {
        %c48_i32 = arith.constant 48 : i32
        %46 = arith.addi %c48_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %48 = simt_step.subgroup_id
        %49 = arith.index_cast %48 : index to i32
        %50 = "simt_step.switch"(%47, %49) ({
        ^bb0(%arg3: i32):
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          %true_16 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %55 = arith.addi %c272_i32, %0 : i32
          %true_17 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        ^bb1(%57: i32):  // no predecessors
          %58 = simt_step.lane_id
          %59 = arith.index_cast %58 : index to i32
          %true_18 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %60 = arith.addi %c288_i32, %0 : i32
          %true_19 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %51 = arith.addi %c304_i32, %0 : i32
        %true_15 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) : (i32) -> ()
      }) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %17 = arith.addi %c320_i32, %0 : i32
      %true_3 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %19 = arith.addi %c336_i32, %0 : i32
      %true_5 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %22 = arith.addi %c52_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
      %25 = "simt_step.if"(%24) ({
        %46 = simt_step.subgroup_id
        %47 = arith.index_cast %46 : index to i32
        "simt_step.yield"(%47) : (i32) -> ()
      }, {
        %c56_i32 = arith.constant 56 : i32
        %46 = arith.addi %c56_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %48 = simt_step.subgroup_id
        %49 = arith.index_cast %48 : index to i32
        %50 = "simt_step.switch"(%47, %49) ({
        ^bb0(%arg3: i32):
          %true_14 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %51 = arith.addi %c352_i32, %0 : i32
          %true_15 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %54 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%50) : (i32) -> ()
      }) : (i1) -> i32
      %c368_i32 = arith.constant 368 : i32
      %26 = arith.addi %c368_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %28 = arith.addi %c384_i32, %0 : i32
      %true_9 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %31 = arith.addi %c60_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %33 = simt_step.subgroup_id
      %34 = arith.index_cast %33 : index to i32
      %35 = "simt_step.switch"(%32, %34) ({
      ^bb0(%arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %46 = arith.addi %c64_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_14 : i32
        %49 = "simt_step.if"(%48) ({
          %65 = simt_step.subgroup_id
          %66 = arith.index_cast %65 : index to i32
          "simt_step.yield"(%66) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c400_i32 = arith.constant 400 : i32
        %50 = arith.addi %c400_i32, %0 : i32
        %true_15 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      ^bb1(%52: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %53 = arith.addi %c68_i32, %0 : i32
        %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %55 = arith.cmpi ne, %54, %c0_i32_16 : i32
        %56 = "simt_step.if"(%55) ({
          %c3_i32_20 = arith.constant 3 : i32
          %65 = arith.addi %0, %c3_i32_20 : i32
          "simt_step.yield"(%65) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %65 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%65) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %57 = arith.addi %c416_i32, %0 : i32
        %true_17 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      ^bb2(%59: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %60 = arith.addi %c72_i32, %0 : i32
        %61 = "simt_step.buffer.load"(%arg1, %60) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %62 = "simt_step.switch"(%61, %c3_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%65: i32):  // no predecessors
          %c3_i32_20 = arith.constant 3 : i32
          %true_21 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %66 = arith.addi %c432_i32, %0 : i32
          %true_22 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_20) {fallthrough = true} : (i32) -> ()
        ^bb2(%68: i32):  // no predecessors
          %69 = simt_step.subgroup_id
          %70 = arith.index_cast %69 : index to i32
          %true_23 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %71 = arith.addi %c448_i32, %0 : i32
          %true_24 = arith.constant true
          %72 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%70) {fallthrough = true} : (i32) -> ()
        ^bb3(%73: i32):  // no predecessors
          %74 = simt_step.lane_id
          %75 = arith.index_cast %74 : index to i32
          "simt_step.yield"(%75) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_18 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %63 = arith.addi %c464_i32, %0 : i32
        %true_19 = arith.constant true
        %64 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c480_i32 = arith.constant 480 : i32
      %36 = arith.addi %c480_i32, %0 : i32
      %true_11 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %39 = arith.addi %c76_i32, %0 : i32
      %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
      %41 = simt_step.lane_id
      %42 = arith.index_cast %41 : index to i32
      %43 = "simt_step.switch"(%40, %42) ({
      ^bb0(%arg3: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %46:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %61 = arith.muli %arg5, %c4_i32_21 : i32
          %62 = arith.addi %61, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %63 = arith.addi %c80_i32, %62 : i32
          %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %65 = arith.cmpi ne, %64, %c0_i32_22 : i32
          "simt_step.condition"(%65, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %61 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %62 = arith.addi %arg5, %c1_i32 : i32
          %true_21 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %63 = arith.muli %arg5, %c4_i32_22 : i32
          %64 = arith.addi %c496_i32, %63 : i32
          %65 = arith.addi %64, %0 : i32
          %true_23 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%61, %62) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%46#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%47: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %48 = arith.addi %c100_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_16 : i32
        %51 = "simt_step.if"(%50) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %52 = arith.addi %c512_i32, %0 : i32
        %true_17 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb2(%54: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %55 = arith.addi %c104_i32, %0 : i32
        %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_18 = arith.constant 4 : i32
        %57 = "simt_step.switch"(%56, %c4_i32_18) ({
        ^bb0(%arg4: i32):
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb1(%63: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%64: i32):  // no predecessors
          %true_21 = arith.constant true
          %c528_i32 = arith.constant 528 : i32
          %65 = arith.addi %c528_i32, %0 : i32
          %true_22 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c544_i32 = arith.constant 544 : i32
        %58 = arith.addi %c544_i32, %0 : i32
        %true_20 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      ^bb3(%60: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_12 = arith.constant true
      %c560_i32 = arith.constant 560 : i32
      %44 = arith.addi %c560_i32, %0 : i32
      %true_13 = arith.constant true
      %45 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

