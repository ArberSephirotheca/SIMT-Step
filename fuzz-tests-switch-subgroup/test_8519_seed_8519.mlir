module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_5 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %8 = "simt_step.if"(%7) ({
          %true_7 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg7, %c4_i32 : i32
          %12 = arith.addi %c16_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg7, %c4_i32 : i32
          %12 = arith.addi %c32_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %9 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.yield"(%8, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%5#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
      %c12_i32 = arith.constant 12 : i32
      %14 = arith.addi %c12_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %16 = arith.addi %0, %c0_i32_1 : i32
      %17 = "simt_step.switch"(%15, %16) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %18 = arith.addi %c16_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %20 = "simt_step.switch"(%19, %c2_i32) ({
        ^bb0(%arg3: i32):
          %30 = simt_step.subgroup_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          %true_6 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %35 = arith.addi %c48_i32, %0 : i32
          %true_7 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %38 = arith.addi %0, %c2_i32_8 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32_9 : i32
          %true_10 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %41 = arith.addi %c64_i32, %0 : i32
          %true_11 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %21 = arith.addi %c80_i32, %0 : i32
        %true_3 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %24 = arith.addi %c20_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
        %27 = "simt_step.if"(%26) ({
          %c3_i32 = arith.constant 3 : i32
          %30 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %c2_i32_6 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %28 = arith.addi %c96_i32, %0 : i32
        %true_5 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) : (i32) -> ()
    }, {
      %c24_i32 = arith.constant 24 : i32
      %14 = arith.addi %c24_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %16 = simt_step.lane_id
      %17 = arith.index_cast %16 : index to i32
      %18 = "simt_step.switch"(%15, %17) ({
      ^bb0(%arg2: i32):
        %c28_i32 = arith.constant 28 : i32
        %19 = arith.addi %c28_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %21 = "simt_step.switch"(%20, %0) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          %31 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %true_8 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %33 = arith.addi %c112_i32, %0 : i32
          %true_9 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          %37 = simt_step.lane_id
          %38 = arith.index_cast %37 : index to i32
          %true_10 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %39 = arith.addi %c128_i32, %0 : i32
          %true_11 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_1 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %22 = arith.addi %c144_i32, %0 : i32
        %true_2 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_7 : i32
          %32 = arith.addi %31, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %33 = arith.addi %c32_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32_7 : i32
          %true_8 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_9 : i32
          %34 = arith.addi %c160_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_5 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %29 = arith.addi %c176_i32, %0 : i32
        %true_6 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %c192_i32 = arith.constant 192 : i32
    %9 = arith.addi %c192_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %11 = arith.addi %c52_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %13 = "simt_step.switch"(%12, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %14 = arith.addi %c56_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_1 = arith.constant 1 : i32
      %16 = "simt_step.switch"(%15, %c1_i32_1) ({
      ^bb0(%arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_17 : i32
          %41 = arith.addi %40, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %42 = arith.addi %c60_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_18 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_19 : i32
          %43 = arith.addi %c208_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_20 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %32 = arith.addi %c224_i32, %0 : i32
        %true_13 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %35 = arith.addi %c80_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_14 = arith.constant 1 : i32
        %37 = "simt_step.switch"(%36, %c1_i32_14) ({
        ^bb0(%arg4: i32):
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          %true_17 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %42 = arith.addi %c240_i32, %0 : i32
          %true_18 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %true_19 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %45 = arith.addi %c256_i32, %0 : i32
          %true_20 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %38 = arith.addi %c272_i32, %0 : i32
        %true_16 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %17 = arith.addi %c288_i32, %0 : i32
      %true_3 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %19 = arith.addi %c304_i32, %0 : i32
      %true_5 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %22 = arith.addi %c84_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %24 = "simt_step.switch"(%23, %0) ({
      ^bb0(%arg3: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %true_11 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %29 = arith.addi %c320_i32, %0 : i32
        %true_12 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %32 = arith.addi %c88_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %34 = arith.addi %0, %c0_i32_13 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg4: i32):
          %36 = simt_step.lane_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          %true_14 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %41 = arith.addi %c336_i32, %0 : i32
          %true_15 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %25 = arith.addi %c352_i32, %0 : i32
      %true_7 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_10 : i32
        %30 = arith.addi %29, %0 : i32
        %c92_i32 = arith.constant 92 : i32
        %31 = arith.addi %c92_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_11 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %arg3, %c3_i32 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_12 : i32
        %32 = arith.addi %c368_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_13 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

