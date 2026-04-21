module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c2_i32 = arith.constant 2 : i32
      %2 = arith.remsi %arg3, %c2_i32 : i32
      %c3_i32 = arith.constant 3 : i32
      %3 = arith.addi %arg0, %c3_i32 : i32
      %4 = "simt_step.switch"(%2, %3) ({
      ^bb0(%arg4: i32):
        %c2_i32_0 = arith.constant 2 : i32
        %7 = arith.remsi %arg3, %c2_i32_0 : i32
        %8 = "simt_step.switch"(%7, %arg0) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %19 = arith.addi %c0_i32_4, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_5 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %22 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %true_6 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %25 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %10 = simt_step.subgroup_id
        %11 = arith.index_cast %10 : index to i32
        %12 = "simt_step.switch"(%arg3, %11) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %19 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_4 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %22 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = true} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32 : i32
        %c2_i32_1 = arith.constant 2 : i32
        %15 = "simt_step.switch"(%14, %c2_i32_1) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %19 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_4 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %22 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %true_5 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %25 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %true_6 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %28 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %17 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %6 = arith.addi %c160_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) : (i32) -> ()
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
        %true = arith.constant true
        %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %c4_i32 = arith.constant 4 : i32
        %4 = arith.muli %arg5, %c4_i32 : i32
        %5 = arith.addi %c176_i32, %4 : i32
        %6 = arith.addi %5, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %6, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%3, %7) : (i32, i32) -> ()
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
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      %true_6 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %21 = arith.addi %c192_i32, %0 : i32
      %true_7 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_14 : i32
        %35 = arith.addi %34, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %36 = arith.addi %c12_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_15 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %41 = arith.muli %arg6, %c4_i32_19 : i32
          %42 = arith.addi %41, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %43 = arith.addi %c32_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_20 : i32
          "simt_step.condition"(%45, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %41 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %42 = arith.addi %arg6, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %43 = arith.muli %arg6, %c4_i32_21 : i32
          %44 = arith.addi %c208_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_22 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %35 = arith.addi %arg3, %34#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32 : i32
        %true_16 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_17 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_17 : i32
        %38 = arith.addi %c224_i32, %37 : i32
        %39 = arith.addi %38, %0 : i32
        %true_18 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %26 = arith.addi %c52_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_10 : i32
      %29 = "simt_step.if"(%28) ({
        %c56_i32 = arith.constant 56 : i32
        %34 = arith.addi %c56_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.lane_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg3: i32):
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %true_14 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %42 = arith.addi %c240_i32, %0 : i32
          %true_15 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %34 = arith.addi %c60_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_16 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %40 = arith.addi %0, %c0_i32_17 : i32
          %true_18 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %41 = arith.addi %c256_i32, %0 : i32
          %true_19 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %true_20 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %44 = arith.addi %c272_i32, %0 : i32
          %true_21 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %37 = arith.addi %c288_i32, %0 : i32
        %true_15 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      %c304_i32 = arith.constant 304 : i32
      %30 = arith.addi %c304_i32, %0 : i32
      %true_11 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_12 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %32 = arith.addi %c320_i32, %0 : i32
      %true_13 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c336_i32 = arith.constant 336 : i32
    %10 = arith.addi %c336_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c64_i32 = arith.constant 64 : i32
    %12 = arith.addi %c64_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_1 = arith.constant 4 : i32
    %14 = arith.addi %0, %c4_i32_1 : i32
    %15 = "simt_step.switch"(%13, %14) ({
    ^bb0(%arg2: i32):
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_14 : i32
        %39 = arith.addi %38, %0 : i32
        %c68_i32 = arith.constant 68 : i32
        %40 = arith.addi %c68_i32, %39 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_15 : i32
        "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c88_i32 = arith.constant 88 : i32
        %38 = arith.addi %c88_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %40 = arith.addi %0, %c2_i32 : i32
        %41 = "simt_step.switch"(%39, %40) ({
        ^bb0(%arg5: i32):
          %c2_i32_19 = arith.constant 2 : i32
          %50 = arith.addi %0, %c2_i32_19 : i32
          %true_20 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %51 = arith.addi %c352_i32, %0 : i32
          %true_21 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %c1_i32_22 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %42 = arith.addi %c368_i32, %0 : i32
        %true_15 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %44 = arith.addi %arg3, %41 : i32
        %c1_i32 = arith.constant 1 : i32
        %45 = arith.addi %arg4, %c1_i32 : i32
        %true_16 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %c4_i32_17 = arith.constant 4 : i32
        %46 = arith.muli %arg4, %c4_i32_17 : i32
        %47 = arith.addi %c384_i32, %46 : i32
        %48 = arith.addi %47, %0 : i32
        %true_18 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%44, %45) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %24 = arith.addi %c92_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %38 = arith.addi %c96_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %40 = arith.addi %0, %c2_i32 : i32
        %41 = "simt_step.switch"(%39, %40) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %c2_i32_19 = arith.constant 2 : i32
          %true_20 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %58 = arith.addi %c400_i32, %0 : i32
          %true_21 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_19) {fallthrough = true} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %61 = arith.addi %0, %c3_i32 : i32
          %true_22 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %62 = arith.addi %c416_i32, %0 : i32
          %true_23 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %42 = arith.addi %c432_i32, %0 : i32
        %true_15 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %45 = arith.addi %c100_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = "simt_step.switch"(%46, %0) ({
        ^bb0(%arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_19) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %58 = simt_step.subgroup_id
          %59 = arith.index_cast %58 : index to i32
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %c0_i32_20 = arith.constant 0 : i32
          %61 = arith.addi %0, %c0_i32_20 : i32
          %true_21 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %62 = arith.addi %c448_i32, %0 : i32
          %true_22 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %49 = arith.addi %c104_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_16 = arith.constant 4 : i32
        %51 = "simt_step.switch"(%50, %c4_i32_16) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %54 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %c2_i32_19 = arith.constant 2 : i32
          %true_20 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %56 = arith.addi %c464_i32, %0 : i32
          %true_21 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %52 = arith.addi %c480_i32, %0 : i32
        %true_18 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %27 = arith.addi %c496_i32, %0 : i32
      %true_9 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c108_i32 = arith.constant 108 : i32
      %30 = arith.addi %c108_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_10 : i32
      %33 = "simt_step.if"(%32) ({
        %c112_i32 = arith.constant 112 : i32
        %38 = arith.addi %c112_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = "simt_step.switch"(%39, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_16 = arith.constant 0 : i32
          %43 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_17 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %45 = arith.addi %c512_i32, %0 : i32
          %true_18 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %41 = arith.addi %c528_i32, %0 : i32
        %true_15 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c544_i32 = arith.constant 544 : i32
      %34 = arith.addi %c544_i32, %0 : i32
      %true_11 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_12 = arith.constant true
      %c560_i32 = arith.constant 560 : i32
      %36 = arith.addi %c560_i32, %0 : i32
      %true_13 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c576_i32 = arith.constant 576 : i32
    %16 = arith.addi %c576_i32, %0 : i32
    %true_3 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_6 : i32
      %20 = arith.addi %19, %0 : i32
      %c116_i32 = arith.constant 116 : i32
      %21 = arith.addi %c116_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_7 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c592_i32 = arith.constant 592 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_7 : i32
      %22 = arith.addi %c592_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_8 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

