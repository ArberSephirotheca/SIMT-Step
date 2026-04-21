module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %4 = "simt_step.if"(%3) ({
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
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%4, %5) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %4 = "simt_step.if"(%3) ({
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
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.continue"(%4, %5) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = "simt_step.switch"(%18, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %29 = arith.addi %c16_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_5 : i32
        %32 = "simt_step.if"(%31) ({
          %54 = simt_step.lane_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }, {
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %33 = arith.addi %c64_i32, %0 : i32
        %true_6 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_7 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %35 = arith.addi %c80_i32, %0 : i32
        %true_8 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %38 = arith.addi %c20_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_9 : i32
        %41 = "simt_step.if"(%40) ({
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %42 = arith.addi %c96_i32, %0 : i32
        %true_10 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %54 = arith.muli %arg5, %c4_i32_18 : i32
          %55 = arith.addi %54, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %56 = arith.addi %c24_i32, %55 : i32
          %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %58 = arith.cmpi ne, %57, %c0_i32_19 : i32
          "simt_step.condition"(%58, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %54 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %55 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %56 = arith.muli %arg5, %c4_i32_19 : i32
          %57 = arith.addi %c112_i32, %56 : i32
          %58 = arith.addi %57, %0 : i32
          %true_20 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54, %55) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %46 = arith.addi %c128_i32, %0 : i32
        %true_14 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%48: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %49 = arith.addi %c44_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_15 = arith.constant 2 : i32
        %51 = "simt_step.switch"(%50, %c2_i32_15) ({
        ^bb0(%arg4: i32):
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) {fallthrough = true} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %true_19 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %58 = arith.addi %c144_i32, %0 : i32
          %true_20 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %c4_i32_21 = arith.constant 4 : i32
          %true_22 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %61 = arith.addi %c160_i32, %0 : i32
          %true_23 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %52 = arith.addi %c176_i32, %0 : i32
        %true_17 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %20 = arith.addi %c192_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %23 = arith.addi %c48_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_3 : i32
      %26 = "simt_step.if"(%25) ({
        %c52_i32 = arith.constant 52 : i32
        %29 = arith.addi %c52_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %31 = "simt_step.switch"(%30, %c1_i32) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          %32 = arith.addi %0, %c3_i32 : i32
          %true_5 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %33 = arith.addi %c208_i32, %0 : i32
          %true_6 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          %true_8 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %36 = arith.addi %c224_i32, %0 : i32
          %true_9 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          %true_11 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %39 = arith.addi %c240_i32, %0 : i32
          %true_12 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c56_i32 = arith.constant 56 : i32
        %29 = arith.addi %c56_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = simt_step.subgroup_id
        %32 = arith.index_cast %31 : index to i32
        %33 = "simt_step.switch"(%30, %32) ({
        ^bb0(%arg3: i32):
          %true_7 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %36 = arith.addi %c256_i32, %0 : i32
          %true_8 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          %true_9 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %41 = arith.addi %c272_i32, %0 : i32
          %true_10 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %34 = arith.addi %c288_i32, %0 : i32
        %true_6 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) : (i32) -> ()
      }) : (i1) -> i32
      %c304_i32 = arith.constant 304 : i32
      %27 = arith.addi %c304_i32, %0 : i32
      %true_4 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c320_i32 = arith.constant 320 : i32
    %10 = arith.addi %c320_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %c60_i32 = arith.constant 60 : i32
    %12 = arith.addi %c60_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.lane_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c64_i32 = arith.constant 64 : i32
      %17 = arith.addi %c64_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_18 : i32
          %61 = arith.addi %60, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %62 = arith.addi %c68_i32, %61 : i32
          %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %64 = arith.cmpi ne, %63, %c0_i32_19 : i32
          "simt_step.condition"(%64, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %60 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %61 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %62 = arith.muli %arg5, %c4_i32_19 : i32
          %63 = arith.addi %c336_i32, %62 : i32
          %64 = arith.addi %63, %0 : i32
          %true_20 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60, %61) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %43 = arith.addi %c352_i32, %0 : i32
        %true_11 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %46 = arith.addi %c88_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        %48 = arith.addi %0, %c4_i32_12 : i32
        %49 = "simt_step.switch"(%47, %48) ({
        ^bb0(%arg4: i32):
          %c2_i32_18 = arith.constant 2 : i32
          %60 = arith.addi %0, %c2_i32_18 : i32
          %true_19 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %61 = arith.addi %c368_i32, %0 : i32
          %true_20 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb1(%63: i32):  // no predecessors
          %c4_i32_21 = arith.constant 4 : i32
          %true_22 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %64 = arith.addi %c384_i32, %0 : i32
          %true_23 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_21) {fallthrough = false} : (i32) -> ()
        ^bb2(%66: i32):  // no predecessors
          %67 = simt_step.lane_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%49) {fallthrough = true} : (i32) -> ()
      ^bb2(%50: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %51 = arith.addi %c92_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %53 = "simt_step.switch"(%52, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_18 = arith.constant 0 : i32
          %true_19 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %60 = arith.addi %c400_i32, %0 : i32
          %true_20 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb1(%62: i32):  // no predecessors
          %63 = simt_step.subgroup_id
          %64 = arith.index_cast %63 : index to i32
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %54 = arith.addi %c416_i32, %0 : i32
        %true_14 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = true} : (i32) -> ()
      ^bb3(%56: i32):  // no predecessors
        %c4_i32_15 = arith.constant 4 : i32
        %57 = arith.addi %0, %c4_i32_15 : i32
        %true_16 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %58 = arith.addi %c432_i32, %0 : i32
        %true_17 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %21 = arith.addi %c448_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %23 = arith.addi %c464_i32, %0 : i32
      %true_4 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %26 = arith.addi %c96_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_5 : i32
      %29 = "simt_step.if"(%28) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_10 : i32
          %44 = arith.addi %43, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %45 = arith.addi %c100_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_11 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_10 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_11 : i32
          %46 = arith.addi %c480_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_12 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_10 : i32
          %44 = arith.addi %43, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %45 = arith.addi %c120_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_11 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_10 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_11 : i32
          %46 = arith.addi %c496_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_12 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %30 = arith.addi %c512_i32, %0 : i32
      %true_6 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c140_i32 = arith.constant 140 : i32
      %33 = arith.addi %c140_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %35 = simt_step.lane_id
      %36 = arith.index_cast %35 : index to i32
      %37 = "simt_step.switch"(%34, %36) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %true_8 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %42 = arith.addi %c528_i32, %0 : i32
        %true_9 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c144_i32 = arith.constant 144 : i32
        %45 = arith.addi %c144_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_10 : i32
        %48 = "simt_step.if"(%47) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %c544_i32 = arith.constant 544 : i32
        %49 = arith.addi %c544_i32, %0 : i32
        %true_11 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb2(%51: i32):  // no predecessors
        %52 = simt_step.subgroup_id
        %53 = arith.index_cast %52 : index to i32
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c148_i32 = arith.constant 148 : i32
      %39 = arith.addi %c148_i32, %0 : i32
      %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_7 = arith.constant 4 : i32
      %41 = "simt_step.switch"(%40, %c4_i32_7) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %62 = arith.muli %arg5, %c4_i32_17 : i32
          %63 = arith.addi %62, %0 : i32
          %c152_i32 = arith.constant 152 : i32
          %64 = arith.addi %c152_i32, %63 : i32
          %65 = "simt_step.buffer.load"(%arg1, %64) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %66 = arith.cmpi ne, %65, %c0_i32_18 : i32
          "simt_step.condition"(%66, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %62 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %63 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c560_i32 = arith.constant 560 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %64 = arith.muli %arg5, %c4_i32_18 : i32
          %65 = arith.addi %c560_i32, %64 : i32
          %66 = arith.addi %65, %0 : i32
          %true_19 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%62, %63) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c3_i32_10 = arith.constant 3 : i32
        %44 = arith.addi %0, %c3_i32_10 : i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %c172_i32 = arith.constant 172 : i32
        %46 = arith.addi %c172_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %48 = simt_step.subgroup_id
        %49 = arith.index_cast %48 : index to i32
        %50 = "simt_step.switch"(%47, %49) ({
        ^bb0(%arg4: i32):
          %62 = simt_step.lane_id
          %63 = arith.index_cast %62 : index to i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %65 = simt_step.subgroup_id
          %66 = arith.index_cast %65 : index to i32
          "simt_step.yield"(%66) {fallthrough = true} : (i32) -> ()
        ^bb2(%67: i32):  // no predecessors
          %68 = simt_step.lane_id
          %69 = arith.index_cast %68 : index to i32
          %true_17 = arith.constant true
          %c576_i32 = arith.constant 576 : i32
          %70 = arith.addi %c576_i32, %0 : i32
          %true_18 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        ^bb3(%72: i32):  // no predecessors
          %73 = simt_step.subgroup_id
          %74 = arith.index_cast %73 : index to i32
          "simt_step.yield"(%74) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c592_i32 = arith.constant 592 : i32
        %51 = arith.addi %c592_i32, %0 : i32
        %true_12 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
      ^bb3(%53: i32):  // no predecessors
        %c176_i32 = arith.constant 176 : i32
        %54 = arith.addi %c176_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %56 = arith.cmpi ne, %55, %c0_i32_13 : i32
        %57 = "simt_step.if"(%56) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %62 = simt_step.subgroup_id
          %63 = arith.index_cast %62 : index to i32
          "simt_step.yield"(%63) : (i32) -> ()
        }) : (i1) -> i32
        %c608_i32 = arith.constant 608 : i32
        %58 = arith.addi %c608_i32, %0 : i32
        %true_14 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c624_i32 = arith.constant 624 : i32
        %60 = arith.addi %c624_i32, %0 : i32
        %true_16 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

