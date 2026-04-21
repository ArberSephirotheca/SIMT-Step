module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.remsi %arg3, %c4_i32 : i32
      %3 = simt_step.lane_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %true_0 = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
        %c0_i32_1 = arith.constant 0 : i32
        %9 = arith.addi %c0_i32_1, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %11 = arith.remsi %arg3, %c2_i32 : i32
        %12 = simt_step.lane_id
        %13 = arith.index_cast %12 : index to i32
        %14 = "simt_step.switch"(%11, %13) ({
        ^bb0(%arg5: i32):
          %true_5 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %24 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %27 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %30 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %c2_i32_2 = arith.constant 2 : i32
        %16 = arith.remsi %arg3, %c2_i32_2 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = "simt_step.switch"(%16, %c1_i32) ({
        ^bb0(%arg5: i32):
          %true_5 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %24 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %27 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %30 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb3(%18: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %19 = arith.remsi %arg3, %c3_i32 : i32
        %c4_i32_3 = arith.constant 4 : i32
        %20 = "simt_step.switch"(%19, %c4_i32_3) ({
        ^bb0(%arg5: i32):
          %true_5 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %24 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %27 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %30 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %33 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %22 = arith.addi %c176_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %7 = arith.addi %c192_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %3 = arith.addi %c208_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
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
    %c2_i32 = arith.constant 2 : i32
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      "simt_step.yield"(%13) : (i32) -> ()
    }, {
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
      %15 = "simt_step.if"(%14) ({
        %c16_i32 = arith.constant 16 : i32
        %18 = arith.addi %c16_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.addi %0, %c0_i32_5 : i32
        %21 = "simt_step.switch"(%19, %20) ({
        ^bb0(%arg2: i32):
          %22 = simt_step.subgroup_id
          %23 = arith.index_cast %22 : index to i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %true_6 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %25 = arith.addi %c224_i32, %0 : i32
          %true_7 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %true_8 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %29 = arith.addi %c240_i32, %0 : i32
          %true_9 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %16 = arith.addi %c256_i32, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c272_i32 = arith.constant 272 : i32
    %9 = arith.addi %c272_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_3 : i32
      %13 = arith.addi %12, %0 : i32
      %c20_i32 = arith.constant 20 : i32
      %14 = arith.addi %c20_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c40_i32 = arith.constant 40 : i32
      %12 = arith.addi %c40_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg4: i32):
        %25 = simt_step.lane_id
        %26 = arith.index_cast %25 : index to i32
        %true_8 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %27 = arith.addi %c288_i32, %0 : i32
        %true_9 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %41 = arith.muli %arg6, %c4_i32_16 : i32
          %42 = arith.addi %41, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %43 = arith.addi %c44_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_17 : i32
          "simt_step.condition"(%45, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %41 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %42 = arith.addi %arg6, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %43 = arith.muli %arg6, %c4_i32_18 : i32
          %44 = arith.addi %c304_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_19 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %32 = arith.addi %c64_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.lane_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg5: i32):
          %true_16 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %41 = arith.addi %c320_i32, %0 : i32
          %true_17 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          %true_18 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %48 = arith.addi %c336_i32, %0 : i32
          %true_19 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          %true_20 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %53 = arith.addi %c352_i32, %0 : i32
          %true_21 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %37 = arith.addi %c368_i32, %0 : i32
        %true_13 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %39 = arith.addi %c384_i32, %0 : i32
        %true_15 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %17 = arith.addi %c400_i32, %0 : i32
      %true_4 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %19 = arith.addi %arg2, %16 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_6 : i32
      %22 = arith.addi %c416_i32, %21 : i32
      %23 = arith.addi %22, %0 : i32
      %true_7 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

