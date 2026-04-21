module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %1 = arith.addi %arg0, %c3_i32_0 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %3 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %4 = "simt_step.if"(%3) ({
        %c3_i32_2 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32_2 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %16 = "simt_step.switch"(%15, %c0_i32_3) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %18 = arith.addi %c0_i32_5, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %24 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb3(%25: i32):  // no predecessors
          %true_8 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %27 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %true_2 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %16 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%4) {fallthrough = true} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %7 = arith.addi %c80_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %9 = simt_step.lane_id
      %10 = arith.index_cast %9 : index to i32
      %11 = "simt_step.switch"(%arg3, %10) ({
      ^bb0(%arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %16 = "simt_step.if"(%15) ({
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %24 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %24 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c3_i32_3 = arith.constant 3 : i32
        %18 = arith.remsi %arg3, %c3_i32_3 : i32
        %c3_i32_4 = arith.constant 3 : i32
        %19 = arith.addi %arg0, %c3_i32_4 : i32
        %20 = "simt_step.switch"(%18, %19) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %24 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_7 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %27 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_8 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %30 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %22 = arith.addi %c176_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb3(%12: i32):  // no predecessors
      %true_1 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %14 = arith.addi %c192_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
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
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
      "simt_step.if"(%20) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c16_i32 = arith.constant 16 : i32
      %18 = arith.addi %c16_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = arith.addi %0, %c0_i32_3 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg2: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_13 : i32
          %33 = arith.addi %32, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %34 = arith.addi %c20_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_14 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %34 = arith.muli %arg4, %c4_i32_15 : i32
          %35 = arith.addi %c208_i32, %34 : i32
          %36 = arith.addi %35, %0 : i32
          %true_16 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_6 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %23 = arith.addi %c224_i32, %0 : i32
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c4_i32_8 = arith.constant 4 : i32
        %true_9 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %26 = arith.addi %c240_i32, %0 : i32
        %true_10 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_13 : i32
          %33 = arith.addi %32, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %34 = arith.addi %c40_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_14 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %34 = arith.muli %arg4, %c4_i32_15 : i32
          %35 = arith.addi %c256_i32, %34 : i32
          %36 = arith.addi %35, %0 : i32
          %true_16 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%30: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %31 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %c60_i32 = arith.constant 60 : i32
      %18 = arith.addi %c60_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg2: i32):
        %c64_i32 = arith.constant 64 : i32
        %21 = arith.addi %c64_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %23 = "simt_step.switch"(%22, %0) ({
        ^bb0(%arg3: i32):
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          %true_9 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %42 = arith.addi %c272_i32, %0 : i32
          %true_10 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_11 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %45 = arith.addi %c288_i32, %0 : i32
          %true_12 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %48 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %25 = arith.addi %c68_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_3 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %29 = arith.addi %c304_i32, %0 : i32
        %true_4 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_5 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %31 = arith.addi %c320_i32, %0 : i32
        %true_6 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %34 = arith.addi %c72_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
        %37 = "simt_step.if"(%36) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %38 = arith.addi %c336_i32, %0 : i32
        %true_8 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c352_i32 = arith.constant 352 : i32
    %10 = arith.addi %c352_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c76_i32 = arith.constant 76 : i32
    %12 = arith.addi %c76_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %14 = "simt_step.switch"(%13, %c0_i32_2) ({
    ^bb0(%arg2: i32):
      %c80_i32 = arith.constant 80 : i32
      %18 = arith.addi %c80_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_15 : i32
          %42 = arith.addi %41, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %43 = arith.addi %c84_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_16 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_17 : i32
          %44 = arith.addi %c368_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_18 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %32 = arith.addi %c104_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %34 = "simt_step.switch"(%33, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c0_i32_15 = arith.constant 0 : i32
          %41 = arith.addi %0, %c0_i32_15 : i32
          %true_16 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %42 = arith.addi %c384_i32, %0 : i32
          %true_17 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %35 = arith.addi %c400_i32, %0 : i32
        %true_10 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_15 : i32
          %42 = arith.addi %41, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %43 = arith.addi %c108_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_16 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_17 : i32
          %44 = arith.addi %c416_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_18 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %39 = arith.addi %c432_i32, %0 : i32
        %true_14 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c128_i32 = arith.constant 128 : i32
      %22 = arith.addi %c128_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_3 : i32
      %25 = "simt_step.if"(%24) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_9 : i32
          %32 = arith.addi %31, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %33 = arith.addi %c132_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32_9 : i32
          %true_10 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_11 : i32
          %34 = arith.addi %c448_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_12 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_9 : i32
          %32 = arith.addi %31, %0 : i32
          %c152_i32 = arith.constant 152 : i32
          %33 = arith.addi %c152_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32_9 : i32
          %true_10 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_11 : i32
          %34 = arith.addi %c464_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_12 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) : (i32) -> ()
      }) : (i1) -> i32
      %c480_i32 = arith.constant 480 : i32
      %26 = arith.addi %c480_i32, %0 : i32
      %true_4 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %28 = arith.addi %c496_i32, %0 : i32
      %true_6 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c172_i32 = arith.constant 172 : i32
    %15 = arith.addi %c172_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %17 = "simt_step.switch"(%16, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c176_i32 = arith.constant 176 : i32
      %18 = arith.addi %c176_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_12 : i32
          %30 = arith.addi %29, %0 : i32
          %c180_i32 = arith.constant 180 : i32
          %31 = arith.addi %c180_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_13 : i32
          "simt_step.condition"(%33, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %29 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %30 = arith.addi %arg5, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_14 : i32
          %32 = arith.addi %c512_i32, %31 : i32
          %33 = arith.addi %32, %0 : i32
          %true_15 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %25 = arith.addi %c528_i32, %0 : i32
        %true_9 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_12 : i32
          %30 = arith.addi %29, %0 : i32
          %c200_i32 = arith.constant 200 : i32
          %31 = arith.addi %c200_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_13 : i32
          "simt_step.condition"(%33, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %29 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %30 = arith.addi %arg5, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c544_i32 = arith.constant 544 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_14 : i32
          %32 = arith.addi %c544_i32, %31 : i32
          %33 = arith.addi %32, %0 : i32
          %true_15 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c560_i32 = arith.constant 560 : i32
      %21 = arith.addi %c560_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c4_i32_5 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_5) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

