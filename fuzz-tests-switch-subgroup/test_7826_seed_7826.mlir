module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true_1 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.addi %c0_i32_2, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) : (i32) -> ()
    }, {
      %true_1 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) : (i32) -> ()
    }) : (i1) -> i32
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.remsi %arg3, %c4_i32 : i32
    %3 = simt_step.subgroup_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %true_1 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %11 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %26 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %26, %c1_i32 : i32
        %28 = arith.cmpi slt, %arg6, %27 : i32
        "simt_step.condition"(%28, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %27 = arith.muli %arg6, %c4_i32_7 : i32
        %28 = arith.addi %c48_i32, %27 : i32
        %29 = arith.addi %28, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%26, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %15 = arith.remsi %arg3, %c2_i32 : i32
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      %18 = "simt_step.switch"(%15, %17) ({
      ^bb0(%arg5: i32):
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %27 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c2_i32_7 = arith.constant 2 : i32
        %29 = arith.remsi %arg3, %c2_i32_7 : i32
        %30 = simt_step.subgroup_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg6: i32):
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %37 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_10 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %40 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %true_11 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %43 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c4_i32_8 = arith.constant 4 : i32
        %34 = arith.remsi %arg3, %c4_i32_8 : i32
        %c3_i32 = arith.constant 3 : i32
        %35 = "simt_step.switch"(%34, %c3_i32) ({
        ^bb0(%arg6: i32):
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %37 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_10 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %40 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %true_11 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %43 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %true_12 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %46 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %46, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
    ^bb3(%19: i32):  // no predecessors
      %c2_i32_4 = arith.constant 2 : i32
      %20 = arith.remsi %arg3, %c2_i32_4 : i32
      %21 = simt_step.lane_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %27 = "simt_step.if"(%26) ({
          %true_10 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %38 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %38 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %true_7 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %30 = arith.addi %c224_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c4_i32_8 = arith.constant 4 : i32
        %32 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg0, %c1_i32 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %38 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %true_11 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %41 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %41, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %true_12 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %44 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %44, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb3(%45: i32):  // no predecessors
          %true_13 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %47 = arith.addi %c288_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %47, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %36 = arith.addi %c304_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %25 = arith.addi %c320_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c336_i32 = arith.constant 336 : i32
    %7 = arith.addi %c336_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %9 = arith.select %8, %1, %5 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c2_i32 = arith.constant 2 : i32
      %15 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_3 : i32
        %17 = arith.addi %16, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %18 = arith.addi %c12_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %16 = arith.addi %arg2, %c2_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %17 = arith.addi %arg3, %c1_i32_3 : i32
        %true_4 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_5 : i32
        %19 = arith.addi %c352_i32, %18 : i32
        %20 = arith.addi %19, %0 : i32
        %true_6 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) : (i32) -> ()
    }) : (i1) -> i32
    %c368_i32 = arith.constant 368 : i32
    %9 = arith.addi %c368_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %13 = arith.addi %0, %c1_i32 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %c36_i32 = arith.constant 36 : i32
      %15 = arith.addi %c36_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %17 = "simt_step.switch"(%16, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_11 : i32
          %28 = arith.addi %27, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %29 = arith.addi %c40_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_12 : i32
          "simt_step.condition"(%31, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %27 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %28 = arith.addi %arg5, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_13 : i32
          %30 = arith.addi %c384_i32, %29 : i32
          %31 = arith.addi %30, %0 : i32
          %true_14 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %23 = arith.addi %c400_i32, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_11 : i32
          %28 = arith.addi %27, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %29 = arith.addi %c60_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_12 : i32
          "simt_step.condition"(%31, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %27 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %28 = arith.addi %arg5, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_13 : i32
          %30 = arith.addi %c416_i32, %29 : i32
          %31 = arith.addi %30, %0 : i32
          %true_14 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %18 = arith.addi %c432_i32, %0 : i32
      %true_2 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_5 : i32
        %23 = arith.addi %22, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %24 = arith.addi %c80_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32_5 : i32
        %true_6 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_7 : i32
        %25 = arith.addi %c448_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_8 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

