module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %3 = arith.remsi %arg3, %c2_i32 : i32
      %4 = simt_step.subgroup_id
      %5 = arith.index_cast %4 : index to i32
      %6 = "simt_step.switch"(%3, %5) ({
      ^bb0(%arg5: i32):
        %c0_i32 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32 : i32
        %13 = "simt_step.if"(%12) ({
          %true_4 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %23 = arith.addi %c0_i32_5, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %23 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %16 = "simt_step.switch"(%15, %c0_i32_1) ({
        ^bb0(%arg6: i32):
          %true_4 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %23 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %true_5 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %26 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %true_6 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %29 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %18 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %21 = "simt_step.if"(%20) ({
          %true_4 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %23 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %23 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %8 = arith.addi %c128_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %true_0 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %11 = arith.addi %c144_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_12 : i32
        %29 = arith.addi %28, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %30 = arith.addi %c12_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_13 : i32
        %31 = arith.addi %c160_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_14 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_4 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %14 = arith.addi %c176_i32, %0 : i32
      %true_5 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_12 : i32
        %29 = arith.addi %28, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %30 = arith.addi %c32_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %35 = arith.muli %arg6, %c4_i32_17 : i32
          %36 = arith.addi %35, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %37 = arith.addi %c52_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_18 : i32
          "simt_step.condition"(%39, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %35 = arith.addi %arg5, %arg6 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %36 = arith.addi %arg6, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %37 = arith.muli %arg6, %c4_i32_19 : i32
          %38 = arith.addi %c192_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_20 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %29 = arith.addi %arg3, %28#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_15 : i32
        %32 = arith.addi %c208_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_16 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %18 = arith.addi %c224_i32, %0 : i32
      %true_9 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %21 = arith.addi %c72_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      %25 = "simt_step.switch"(%22, %24) ({
      ^bb0(%arg3: i32):
        %28 = simt_step.lane_id
        %29 = arith.index_cast %28 : index to i32
        %true_12 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %30 = arith.addi %c240_i32, %0 : i32
        %true_13 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %33 = arith.addi %c76_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = simt_step.lane_id
        %36 = arith.index_cast %35 : index to i32
        %37 = "simt_step.switch"(%34, %36) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %52 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %54 = simt_step.lane_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          %true_18 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %57 = arith.addi %c256_i32, %0 : i32
          %true_19 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%59: i32):  // no predecessors
          %60 = simt_step.subgroup_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %39 = arith.addi %c80_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_14 : i32
        %42 = "simt_step.if"(%41) ({
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %52 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%52) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %43 = arith.addi %c272_i32, %0 : i32
        %true_15 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %46 = arith.addi %c84_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_16 : i32
        %49 = "simt_step.if"(%48) ({
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %50 = arith.addi %c288_i32, %0 : i32
        %true_17 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_12 : i32
        %29 = arith.addi %28, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %30 = arith.addi %c88_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c108_i32 = arith.constant 108 : i32
        %28 = arith.addi %c108_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_12 : i32
        %31 = "simt_step.if"(%30) ({
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) : (i32) -> ()
        }, {
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %32 = arith.addi %c304_i32, %0 : i32
        %true_13 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %34 = arith.addi %arg3, %31 : i32
        %c1_i32 = arith.constant 1 : i32
        %35 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_15 : i32
        %37 = arith.addi %c320_i32, %36 : i32
        %38 = arith.addi %37, %0 : i32
        %true_16 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34, %35) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c336_i32 = arith.constant 336 : i32
    %10 = arith.addi %c336_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32_1 = arith.constant 4 : i32
    %12 = arith.addi %0, %c4_i32_1 : i32
    return
  }
}

