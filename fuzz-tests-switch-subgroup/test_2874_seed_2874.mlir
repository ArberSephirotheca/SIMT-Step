module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c4_i32_0 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32_0 : i32
      %c2_i32 = arith.constant 2 : i32
      %5 = "simt_step.switch"(%4, %c2_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %28 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %28, %c1_i32 : i32
          %30 = arith.cmpi slt, %arg7, %29 : i32
          "simt_step.condition"(%30, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %29 = arith.muli %arg7, %c4_i32_10 : i32
          %30 = arith.addi %c0_i32_9, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%28, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %21 = "simt_step.if"(%20) ({
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %29 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %29 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %24 = "simt_step.if"(%23) ({
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %29 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %29 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb3(%25: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %27 = "simt_step.if"(%26) ({
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %29 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %29 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c4_i32_1 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32_1 : i32
      %c3_i32 = arith.constant 3 : i32
      %8 = arith.addi %arg0, %c3_i32 : i32
      %9 = "simt_step.switch"(%7, %8) ({
      ^bb0(%arg5: i32):
        %c0_i32 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32 : i32
        %19 = "simt_step.if"(%18) ({
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %30 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %30 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %true_4 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %22 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %true_5 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %25 = arith.addi %c160_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %28 = "simt_step.if"(%27) ({
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %30 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %30 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %11 = arith.addi %c208_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %true_2 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %14 = arith.addi %c224_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb3(%15: i32):  // no predecessors
      %true_3 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %17 = arith.addi %c240_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
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
      %c4_i32_5 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_5 : i32
      %18 = arith.addi %17, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %19 = arith.addi %c8_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %19 = arith.addi %arg2, %18 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_6 : i32
      %22 = arith.addi %c256_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_7 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %17 = arith.addi %c32_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %24 = simt_step.subgroup_id
        %25 = arith.index_cast %24 : index to i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %27 = arith.addi %c36_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %29 = "simt_step.switch"(%28, %c4_i32_8) ({
        ^bb0(%arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %true_18 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %48 = arith.addi %c272_i32, %0 : i32
          %true_19 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %30 = arith.addi %c288_i32, %0 : i32
        %true_10 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %33 = arith.addi %c40_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_11 : i32
        %36 = "simt_step.if"(%35) ({
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %37 = arith.addi %c304_i32, %0 : i32
        %true_12 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %39 = arith.addi %c320_i32, %0 : i32
        %true_14 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %42 = arith.addi %c44_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_15 : i32
        %45 = "simt_step.if"(%44) ({
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %46 = arith.addi %c336_i32, %0 : i32
        %true_16 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %21 = arith.addi %c352_i32, %0 : i32
      %true_6 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c3_i32_7 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32_7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c368_i32 = arith.constant 368 : i32
    %9 = arith.addi %c368_i32, %0 : i32
    %true_2 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %11 = arith.addi %c48_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_3 : i32
    %14 = "simt_step.if"(%13) ({
      %c52_i32 = arith.constant 52 : i32
      %17 = arith.addi %c52_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg2: i32):
        %c56_i32 = arith.constant 56 : i32
        %22 = arith.addi %c56_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %24 = arith.addi %0, %c2_i32 : i32
        %25 = "simt_step.switch"(%23, %24) ({
        ^bb0(%arg3: i32):
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          %true_15 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %49 = arith.addi %c384_i32, %0 : i32
          %true_16 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          %52 = arith.addi %0, %c4_i32_17 : i32
          %true_18 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %53 = arith.addi %c400_i32, %0 : i32
          %true_19 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb2(%55: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_20) {fallthrough = false} : (i32) -> ()
        ^bb3(%56: i32):  // no predecessors
          %true_21 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %57 = arith.addi %c416_i32, %0 : i32
          %true_22 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %26 = arith.addi %c432_i32, %0 : i32
        %true_6 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %29 = arith.addi %c60_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = simt_step.lane_id
        %32 = arith.index_cast %31 : index to i32
        %33 = "simt_step.switch"(%30, %32) ({
        ^bb0(%arg3: i32):
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          %true_15 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %49 = arith.addi %c448_i32, %0 : i32
          %true_16 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %34 = arith.addi %c464_i32, %0 : i32
        %true_8 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %47 = arith.muli %arg4, %c4_i32_15 : i32
          %48 = arith.addi %47, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %49 = arith.addi %c64_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_16 : i32
          "simt_step.condition"(%51, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %47 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %49 = arith.muli %arg4, %c4_i32_16 : i32
          %50 = arith.addi %c480_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_17 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %38 = arith.addi %c496_i32, %0 : i32
        %true_12 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %41 = arith.addi %c84_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
        %44 = "simt_step.if"(%43) ({
          %c4_i32_15 = arith.constant 4 : i32
          %47 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %45 = arith.addi %c512_i32, %0 : i32
        %true_14 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %c88_i32 = arith.constant 88 : i32
      %17 = arith.addi %c88_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %19 = "simt_step.switch"(%18, %c4_i32_5) ({
      ^bb0(%arg2: i32):
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %25 = arith.addi %c92_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_8 : i32
        %28 = "simt_step.if"(%27) ({
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        %c528_i32 = arith.constant 528 : i32
        %29 = arith.addi %c528_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c544_i32 = arith.constant 544 : i32
        %31 = arith.addi %c544_i32, %0 : i32
        %true_11 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_16 : i32
          %38 = arith.addi %37, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %39 = arith.addi %c96_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_17 : i32
          "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %37 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c560_i32 = arith.constant 560 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_17 : i32
          %40 = arith.addi %c560_i32, %39 : i32
          %41 = arith.addi %40, %0 : i32
          %true_18 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        %c576_i32 = arith.constant 576 : i32
        %35 = arith.addi %c576_i32, %0 : i32
        %true_15 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c592_i32 = arith.constant 592 : i32
      %20 = arith.addi %c592_i32, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c608_i32 = arith.constant 608 : i32
    %15 = arith.addi %c608_i32, %0 : i32
    %true_4 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

