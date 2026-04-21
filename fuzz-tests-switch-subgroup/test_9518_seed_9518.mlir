module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = "simt_step.switch"(%2, %arg0) ({
    ^bb0(%arg4: i32):
      %true_1 = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_6 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32 = arith.constant 4 : i32
        %17 = arith.muli %arg6, %c4_i32 : i32
        %18 = arith.addi %c32_i32, %17 : i32
        %19 = arith.addi %18, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%16, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %true_4 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %12 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %15 = "simt_step.if"(%14) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg6, %18 : i32
          "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_8 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg6, %c4_i32 : i32
          %19 = arith.addi %c64_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.continue"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) : (i32) -> ()
      }, {
        %c3_i32_6 = arith.constant 3 : i32
        %16 = arith.remsi %arg3, %c3_i32_6 : i32
        %17 = "simt_step.switch"(%16, %arg0) ({
        ^bb0(%arg5: i32):
          %true_7 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %19 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %22 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %25 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %true_10 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %28 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %5 = arith.select %4, %0, %3 : i32
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
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_2 : i32
      "simt_step.if"(%17) ({
        %c2_i32 = arith.constant 2 : i32
        %18 = arith.remsi %0, %c2_i32 : i32
        %19 = simt_step.lane_id
        %20 = arith.index_cast %19 : index to i32
        %21 = "simt_step.switch"(%18, %20) ({
        ^bb0(%arg2: i32):
          %c4_i32_3 = arith.constant 4 : i32
          %22 = arith.addi %arg2, %c4_i32_3 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %24 = arith.addi %23, %c2_i32_4 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %26 = arith.addi %25, %c3_i32 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c16_i32 = arith.constant 16 : i32
      %15 = arith.addi %c16_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg2: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %true_3 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %20 = arith.addi %c144_i32, %0 : i32
        %true_4 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c0_i32_2) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.muli %arg4, %c4_i32_7 : i32
          %25 = arith.addi %24, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %26 = arith.addi %c20_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
          "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %24 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg4, %c1_i32 : i32
          %true_7 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %26 = arith.muli %arg4, %c4_i32_8 : i32
          %27 = arith.addi %c160_i32, %26 : i32
          %28 = arith.addi %27, %0 : i32
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_4 : i32
        %17 = arith.addi %16, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %18 = arith.addi %c40_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %16 = arith.addi %c60_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %18 = "simt_step.switch"(%17, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c0_i32_9 = arith.constant 0 : i32
          %27 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %29 = simt_step.lane_id
          %30 = arith.index_cast %29 : index to i32
          %true_10 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %31 = arith.addi %c176_i32, %0 : i32
          %true_11 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %34 = simt_step.subgroup_id
          %35 = arith.index_cast %34 : index to i32
          %true_12 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %36 = arith.addi %c192_i32, %0 : i32
          %true_13 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %19 = arith.addi %c208_i32, %0 : i32
        %true_5 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %21 = arith.addi %arg2, %18 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_7 : i32
        %24 = arith.addi %c224_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_8 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) : (i32) -> ()
    }) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %10 = arith.addi %c240_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c64_i32 = arith.constant 64 : i32
    %12 = arith.addi %c64_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = "simt_step.switch"(%13, %0) ({
    ^bb0(%arg2: i32):
      %c68_i32 = arith.constant 68 : i32
      %15 = arith.addi %c68_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_2 : i32
      %18 = "simt_step.if"(%17) ({
        %c72_i32 = arith.constant 72 : i32
        %25 = arith.addi %c72_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_8 : i32
        %28 = "simt_step.if"(%27) ({
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %29 = arith.addi %c256_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c76_i32 = arith.constant 76 : i32
        %25 = arith.addi %c76_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_8 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_10 = arith.constant 0 : i32
          %31 = arith.addi %0, %c0_i32_10 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %29 = arith.addi %c272_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %19 = arith.addi %c288_i32, %0 : i32
      %true_3 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %21 = arith.addi %c304_i32, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_8 : i32
        %26 = arith.addi %25, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %27 = arith.addi %c80_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c100_i32 = arith.constant 100 : i32
        %25 = arith.addi %c100_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %27 = simt_step.lane_id
        %28 = arith.index_cast %27 : index to i32
        %29 = "simt_step.switch"(%26, %28) ({
        ^bb0(%arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %true_14 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %39 = arith.addi %c320_i32, %0 : i32
          %true_15 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          %true_16 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %47 = arith.addi %c336_i32, %0 : i32
          %true_17 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %30 = arith.addi %c352_i32, %0 : i32
        %true_9 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %32 = arith.addi %arg3, %29 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_11 : i32
        %35 = arith.addi %c368_i32, %34 : i32
        %36 = arith.addi %35, %0 : i32
        %true_12 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

