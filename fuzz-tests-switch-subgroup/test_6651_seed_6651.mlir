module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.remsi %arg3, %c4_i32 : i32
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
        %7 = "simt_step.if"(%6) ({
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %17 = arith.addi %c0_i32_5, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %17 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %10 = "simt_step.if"(%9) ({
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %17 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %17 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      ^bb2(%11: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_4 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_4 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32_5 : i32
          %18 = arith.addi %c64_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%13: i32):  // no predecessors
        %true = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %15 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
        %9 = "simt_step.if"(%8) ({
          %true_4 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %21 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %21 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c3_i32_1 = arith.constant 3 : i32
        %11 = arith.remsi %arg3, %c3_i32_1 : i32
        %12 = "simt_step.switch"(%11, %arg0) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %21 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_5 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %24 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %27 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %30 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %14 = arith.remsi %arg3, %c2_i32 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %15 = arith.addi %arg0, %c0_i32_2 : i32
        %16 = "simt_step.switch"(%14, %15) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %21 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_5 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %24 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb3(%17: i32):  // no predecessors
        %true_3 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %19 = arith.addi %c224_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %7 = arith.addi %c240_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) : (i32) -> ()
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
    %c1_i32 = arith.constant 1 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_3 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %12 = arith.addi %arg2, %arg3 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32_3 : i32
      %true_4 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_5 : i32
      %15 = arith.addi %c256_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_6 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
    %9 = "simt_step.if"(%8) ({
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg2: i32):
        %c36_i32 = arith.constant 36 : i32
        %17 = arith.addi %c36_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %19 = "simt_step.switch"(%18, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32_9 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %37 = arith.addi %0, %c4_i32_10 : i32
          %true_11 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %38 = arith.addi %c272_i32, %0 : i32
          %true_12 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %20 = arith.addi %c288_i32, %0 : i32
        %true_4 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %23 = simt_step.subgroup_id
        %24 = arith.index_cast %23 : index to i32
        %true_5 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %25 = arith.addi %c304_i32, %0 : i32
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %28 = simt_step.lane_id
        %29 = arith.index_cast %28 : index to i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb3(%30: i32):  // no predecessors
        %31 = simt_step.lane_id
        %32 = arith.index_cast %31 : index to i32
        %true_7 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %33 = arith.addi %c320_i32, %0 : i32
        %true_8 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %13 = arith.muli %arg3, %c4_i32_5 : i32
        %14 = arith.addi %13, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %15 = arith.addi %c40_i32, %14 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
        "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %13 = arith.addi %c60_i32, %0 : i32
        %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
        %15 = simt_step.subgroup_id
        %16 = arith.index_cast %15 : index to i32
        %17 = "simt_step.switch"(%14, %16) ({
        ^bb0(%arg4: i32):
          %26 = simt_step.subgroup_id
          %27 = arith.index_cast %26 : index to i32
          %true_11 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %28 = arith.addi %c336_i32, %0 : i32
          %true_12 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %true_13 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %31 = arith.addi %c352_i32, %0 : i32
          %true_14 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c1_i32_15 = arith.constant 1 : i32
          %true_16 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %34 = arith.addi %c368_i32, %0 : i32
          %true_17 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %18 = arith.addi %c384_i32, %0 : i32
        %true_6 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %20 = arith.addi %arg2, %17 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %21 = arith.addi %arg3, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_9 : i32
        %23 = arith.addi %c400_i32, %22 : i32
        %24 = arith.addi %23, %0 : i32
        %true_10 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) : (i32) -> ()
    }) : (i1) -> i32
    %c416_i32 = arith.constant 416 : i32
    %10 = arith.addi %c416_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

