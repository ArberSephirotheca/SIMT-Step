module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = "simt_step.switch"(%0, %c1_i32) ({
    ^bb0(%arg4: i32):
      %true_0 = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %true_1 = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %8 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.remsi %arg3, %c4_i32 : i32
      %c4_i32_2 = arith.constant 4 : i32
      %11 = "simt_step.switch"(%10, %c4_i32_2) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_12 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg7, %c4_i32_12 : i32
          %27 = arith.addi %c32_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_13 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_12 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg7, %c4_i32_12 : i32
          %27 = arith.addi %c48_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_13 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%17: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %19 = "simt_step.if"(%18) ({
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %26 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) : (i32) -> ()
        }, {
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %26 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %c2_i32_9 = arith.constant 2 : i32
        %21 = arith.addi %arg0, %c2_i32_9 : i32
        %22 = "simt_step.switch"(%arg3, %21) ({
        ^bb0(%arg6: i32):
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %26 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_12 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %29 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %24 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %13 = arith.addi %c144_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c160_i32 = arith.constant 160 : i32
    %3 = arith.addi %c160_i32, %arg0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_5 : i32
        %19 = arith.addi %18, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %20 = arith.addi %c12_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
        "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %18 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %20 = arith.muli %arg3, %c4_i32_6 : i32
        %21 = arith.addi %c176_i32, %20 : i32
        %22 = arith.addi %21, %0 : i32
        %true_7 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_3) : (i32) -> ()
    }) : (i1) -> i32
    %c192_i32 = arith.constant 192 : i32
    %9 = arith.addi %c192_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c36_i32 = arith.constant 36 : i32
      %17 = arith.addi %c36_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_3 : i32
      %20 = "simt_step.if"(%19) ({
        %c40_i32 = arith.constant 40 : i32
        %23 = arith.addi %c40_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_5 = arith.constant 4 : i32
        %25 = "simt_step.switch"(%24, %c4_i32_5) ({
        ^bb0(%arg2: i32):
          %26 = simt_step.subgroup_id
          %27 = arith.index_cast %26 : index to i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %30 = arith.addi %0, %c4_i32_7 : i32
          %true_8 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %31 = arith.addi %c208_i32, %0 : i32
          %true_9 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c44_i32 = arith.constant 44 : i32
        %23 = arith.addi %c44_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_5 : i32
        %26 = "simt_step.if"(%25) ({
          %29 = simt_step.lane_id
          %30 = arith.index_cast %29 : index to i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %27 = arith.addi %c224_i32, %0 : i32
        %true_6 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %21 = arith.addi %c240_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c48_i32 = arith.constant 48 : i32
      %17 = arith.addi %c48_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg2: i32):
        %c52_i32 = arith.constant 52 : i32
        %21 = arith.addi %c52_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_3 : i32
        %24 = "simt_step.if"(%23) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %25 = arith.addi %c256_i32, %0 : i32
        %true_4 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_5 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %27 = arith.addi %c272_i32, %0 : i32
        %true_6 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %30 = arith.addi %c56_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.subgroup_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg3: i32):
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %true_9 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %47 = arith.addi %c288_i32, %0 : i32
          %true_10 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %36 = simt_step.subgroup_id
        %37 = arith.index_cast %36 : index to i32
        %true_7 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %38 = arith.addi %c304_i32, %0 : i32
        %true_8 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %41 = arith.addi %c60_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %43 = "simt_step.switch"(%42, %c1_i32) ({
        ^bb0(%arg3: i32):
          %c0_i32_9 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_9 : i32
          %true_10 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %45 = arith.addi %c320_i32, %0 : i32
          %true_11 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %true_13 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %48 = arith.addi %c336_i32, %0 : i32
          %true_14 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          %true_15 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %54 = arith.addi %c352_i32, %0 : i32
          %true_16 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c368_i32 = arith.constant 368 : i32
    %15 = arith.addi %c368_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

