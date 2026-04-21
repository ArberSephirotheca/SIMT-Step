module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c0_i32 = arith.constant 0 : i32
    %1 = "simt_step.switch"(%0, %c0_i32) ({
    ^bb0(%arg4: i32):
      %true_0 = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32_1, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %7 = "simt_step.switch"(%arg3, %arg0) ({
      ^bb0(%arg5: i32):
        %true_2 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %17 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %true_3 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %20 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %9 = arith.remsi %arg3, %c2_i32 : i32
      %10 = simt_step.subgroup_id
      %11 = arith.index_cast %10 : index to i32
      %12 = "simt_step.switch"(%9, %11) ({
      ^bb0(%arg5: i32):
        %c3_i32_2 = arith.constant 3 : i32
        %16 = arith.remsi %arg3, %c3_i32_2 : i32
        %17 = simt_step.subgroup_id
        %18 = arith.index_cast %17 : index to i32
        %19 = "simt_step.switch"(%16, %18) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %27 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %30 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %33 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%34: i32):  // no predecessors
          %true_9 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %36 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %true_3 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %22 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c2_i32_4 = arith.constant 2 : i32
        %24 = arith.remsi %arg3, %c2_i32_4 : i32
        %c2_i32_5 = arith.constant 2 : i32
        %25 = "simt_step.switch"(%24, %c2_i32_5) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %27 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %30 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.remsi %arg3, %c3_i32 : i32
      %15 = "simt_step.switch"(%14, %arg0) ({
      ^bb0(%arg5: i32):
        %c4_i32_2 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_2 : i32
        %17 = "simt_step.switch"(%16, %arg0) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %27 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %30 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %33 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%34: i32):  // no predecessors
          %true_9 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %36 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c2_i32_3 = arith.constant 2 : i32
        %19 = arith.remsi %arg3, %c2_i32_3 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %20 = "simt_step.switch"(%19, %c0_i32_4) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %27 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %30 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %33 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c2_i32_5 = arith.constant 2 : i32
        %22 = arith.remsi %arg3, %c2_i32_5 : i32
        %23 = simt_step.lane_id
        %24 = arith.index_cast %23 : index to i32
        %25 = "simt_step.switch"(%22, %24) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %27 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %30 = arith.addi %c288_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c304_i32 = arith.constant 304 : i32
    %3 = arith.addi %c304_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c1_i32 = arith.constant 1 : i32
    %7 = "simt_step.switch"(%6, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %9 = arith.addi %c12_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
      %12 = "simt_step.if"(%11) ({
        %20 = simt_step.subgroup_id
        %21 = arith.index_cast %20 : index to i32
        "simt_step.yield"(%21) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %20 = arith.addi %c16_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %26 = simt_step.subgroup_id
          %27 = arith.index_cast %26 : index to i32
          %true_5 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %28 = arith.addi %c320_i32, %0 : i32
          %true_6 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          %true_7 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %36 = arith.addi %c336_i32, %0 : i32
          %true_8 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %c352_i32 = arith.constant 352 : i32
      %13 = arith.addi %c352_i32, %0 : i32
      %true = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      %true_3 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %18 = arith.addi %c368_i32, %0 : i32
      %true_4 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_2 : i32
      %10 = arith.addi %9, %0 : i32
      %c20_i32 = arith.constant 20 : i32
      %11 = arith.addi %c20_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_3 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c40_i32 = arith.constant 40 : i32
      %9 = arith.addi %c40_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
      %12 = "simt_step.if"(%11) ({
        %c44_i32 = arith.constant 44 : i32
        %21 = arith.addi %c44_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_7 : i32
        %24 = "simt_step.if"(%23) ({
          %27 = simt_step.subgroup_id
          %28 = arith.index_cast %27 : index to i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %27 = simt_step.subgroup_id
          %28 = arith.index_cast %27 : index to i32
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        %c384_i32 = arith.constant 384 : i32
        %25 = arith.addi %c384_i32, %0 : i32
        %true_8 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %21 = simt_step.subgroup_id
        %22 = arith.index_cast %21 : index to i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      %c400_i32 = arith.constant 400 : i32
      %13 = arith.addi %c400_i32, %0 : i32
      %true = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %15 = arith.addi %arg2, %12 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32_3 : i32
      %true_4 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_5 : i32
      %18 = arith.addi %c416_i32, %17 : i32
      %19 = arith.addi %18, %0 : i32
      %true_6 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

