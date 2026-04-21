module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %c3_i32 = arith.constant 3 : i32
      %7 = "simt_step.switch"(%6, %c3_i32) ({
      ^bb0(%arg5: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_3 : i32
        %17 = simt_step.subgroup_id
        %18 = arith.index_cast %17 : index to i32
        %19 = "simt_step.switch"(%16, %18) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %26 = arith.addi %c0_i32_7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %29 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %32 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          %true_10 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %35 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %21 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %true_5 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %24 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_3 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_3 : i32
        %17 = simt_step.lane_id
        %18 = arith.index_cast %17 : index to i32
        %19 = "simt_step.switch"(%16, %18) ({
        ^bb0(%arg7: i32):
          %true_4 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %22 = arith.muli %arg6, %c4_i32_5 : i32
          %23 = arith.addi %c96_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %27 = arith.muli %arg6, %c4_i32_7 : i32
          %28 = arith.addi %c112_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %true_8 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_9 : i32
          %33 = arith.addi %c128_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %37 = arith.muli %arg6, %c4_i32_11 : i32
          %38 = arith.addi %c144_i32, %37 : i32
          %39 = arith.addi %38, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %true_1 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %12 = arith.addi %c160_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %15 = "simt_step.if"(%14) ({
        %true_3 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %17 = arith.addi %c176_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %true_3 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %17 = arith.addi %c192_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c208_i32 = arith.constant 208 : i32
    %5 = arith.addi %c208_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c4_i32_2 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_2 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %11 = arith.addi %c28_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = simt_step.lane_id
      %14 = arith.index_cast %13 : index to i32
      %15 = "simt_step.switch"(%12, %14) ({
      ^bb0(%arg4: i32):
        %c1_i32_4 = arith.constant 1 : i32
        %22 = arith.addi %0, %c1_i32_4 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %24 = arith.addi %c32_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = "simt_step.switch"(%25, %0) ({
        ^bb0(%arg5: i32):
          %29 = simt_step.subgroup_id
          %30 = arith.index_cast %29 : index to i32
          %true_7 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %31 = arith.addi %c224_i32, %0 : i32
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          %34 = arith.addi %0, %c4_i32_9 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %27 = arith.addi %c240_i32, %0 : i32
        %true_6 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %16 = arith.addi %arg2, %15 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %c4_i32_2 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_2 : i32
      %19 = arith.addi %c256_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_3 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c36_i32 = arith.constant 36 : i32
    %6 = arith.addi %c36_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c40_i32 = arith.constant 40 : i32
      %11 = arith.addi %c40_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %32 = simt_step.subgroup_id
        %33 = arith.index_cast %32 : index to i32
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c44_i32 = arith.constant 44 : i32
        %32 = arith.addi %c44_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.subgroup_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg3: i32):
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %0, %c1_i32 : i32
          %true_12 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %41 = arith.addi %c272_i32, %0 : i32
          %true_13 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %37 = arith.addi %c288_i32, %0 : i32
        %true_10 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      %c304_i32 = arith.constant 304 : i32
      %15 = arith.addi %c304_i32, %0 : i32
      %true = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %17 = arith.addi %c320_i32, %0 : i32
      %true_4 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %20 = arith.addi %c48_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %22 = "simt_step.switch"(%21, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c52_i32 = arith.constant 52 : i32
        %32 = arith.addi %c52_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
        %35 = "simt_step.if"(%34) ({
          %c2_i32_17 = arith.constant 2 : i32
          %50 = arith.addi %0, %c2_i32_17 : i32
          "simt_step.yield"(%50) : (i32) -> ()
        }, {
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %36 = arith.addi %c336_i32, %0 : i32
        %true_10 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %38 = arith.addi %c352_i32, %0 : i32
        %true_12 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %41 = arith.addi %c56_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = simt_step.subgroup_id
        %44 = arith.index_cast %43 : index to i32
        %45 = "simt_step.switch"(%42, %44) ({
        ^bb0(%arg4: i32):
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          %true_17 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %55 = arith.addi %c368_i32, %0 : i32
          %true_18 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %46 = arith.addi %c384_i32, %0 : i32
        %true_14 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %49:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_17 : i32
          %51 = arith.addi %50, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %52 = arith.addi %c60_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_18 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_18 : i32
          %53 = arith.addi %c400_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_19 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%49#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %24 = arith.addi %c80_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
      %27 = "simt_step.if"(%26) ({
        %c84_i32 = arith.constant 84 : i32
        %32 = arith.addi %c84_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.subgroup_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          %true_11 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %42 = arith.addi %c416_i32, %0 : i32
          %true_12 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_13 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %45 = arith.addi %c432_i32, %0 : i32
          %true_14 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %37 = arith.addi %c448_i32, %0 : i32
        %true_10 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) : (i32) -> ()
      }, {
        %c88_i32 = arith.constant 88 : i32
        %32 = arith.addi %c88_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.subgroup_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg3: i32):
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          %true_11 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %41 = arith.addi %c464_i32, %0 : i32
          %true_12 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          %true_13 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %46 = arith.addi %c480_i32, %0 : i32
          %true_14 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          %49 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %37 = arith.addi %c496_i32, %0 : i32
        %true_10 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %28 = arith.addi %c512_i32, %0 : i32
      %true_6 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %31:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_9 : i32
        %33 = arith.addi %32, %0 : i32
        %c92_i32 = arith.constant 92 : i32
        %34 = arith.addi %c92_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_10 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %32 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        %true_9 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_10 : i32
        %35 = arith.addi %c528_i32, %34 : i32
        %36 = arith.addi %35, %0 : i32
        %true_11 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

