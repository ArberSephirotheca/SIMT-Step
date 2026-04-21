module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
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
        %c0_i32_2 = arith.constant 0 : i32
        %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %4 = "simt_step.if"(%3) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c0_i32_3, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.continue"(%4, %5) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %3 = arith.addi %c32_i32, %arg0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_3 : i32
      %16 = arith.addi %15, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %17 = arith.addi %c8_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %15 = arith.addi %arg2, %arg3 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32_3 : i32
      %true_4 = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_5 : i32
      %18 = arith.addi %c48_i32, %17 : i32
      %19 = arith.addi %18, %0 : i32
      %true_6 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %8 = "simt_step.switch"(%7, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %15 = arith.addi %c32_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_3 = arith.constant 1 : i32
      %17 = "simt_step.switch"(%16, %c1_i32_3) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %25 = arith.addi %c36_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_6 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %29 = arith.addi %c64_i32, %0 : i32
        %true_7 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_8 = arith.constant true
        %c80_i32_9 = arith.constant 80 : i32
        %31 = arith.addi %c80_i32_9, %0 : i32
        %true_10 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %34 = arith.addi %c40_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_11 = arith.constant 2 : i32
        %36 = "simt_step.switch"(%35, %c2_i32_11) ({
        ^bb0(%arg4: i32):
          %c1_i32_12 = arith.constant 1 : i32
          %37 = arith.addi %0, %c1_i32_12 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %41 = arith.addi %0, %c3_i32_14 : i32
          %true_15 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %42 = arith.addi %c96_i32, %0 : i32
          %true_16 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %19 = arith.addi %c44_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %21 = arith.addi %0, %c2_i32 : i32
      %22 = "simt_step.switch"(%20, %21) ({
      ^bb0(%arg3: i32):
        %c48_i32 = arith.constant 48 : i32
        %25 = arith.addi %c48_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %27 = "simt_step.switch"(%26, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_16 = arith.constant 1 : i32
          %true_17 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %48 = arith.addi %c112_i32, %0 : i32
          %true_18 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          %true_19 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %53 = arith.addi %c128_i32, %0 : i32
          %true_20 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb2(%55: i32):  // no predecessors
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) {fallthrough = true} : (i32) -> ()
        ^bb3(%58: i32):  // no predecessors
          %c2_i32_21 = arith.constant 2 : i32
          %59 = arith.addi %0, %c2_i32_21 : i32
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %28 = arith.addi %c144_i32, %0 : i32
        %true_7 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_16 : i32
          %49 = arith.addi %48, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %50 = arith.addi %c52_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_17 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_18 : i32
          %51 = arith.addi %c160_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_19 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %33 = arith.addi %c72_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
        %36 = "simt_step.if"(%35) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %37 = arith.addi %c176_i32, %0 : i32
        %true_11 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %40 = arith.addi %c76_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_12 : i32
        %43 = "simt_step.if"(%42) ({
          %c2_i32_16 = arith.constant 2 : i32
          %48 = arith.addi %0, %c2_i32_16 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %44 = arith.addi %c192_i32, %0 : i32
        %true_13 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %46 = arith.addi %c208_i32, %0 : i32
        %true_15 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %23 = arith.addi %c224_i32, %0 : i32
      %true_5 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c80_i32 = arith.constant 80 : i32
    %9 = arith.addi %c80_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
    %12 = "simt_step.if"(%11) ({
      %c84_i32 = arith.constant 84 : i32
      %15 = arith.addi %c84_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
      %18 = "simt_step.if"(%17) ({
        %c88_i32 = arith.constant 88 : i32
        %21 = arith.addi %c88_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %23 = "simt_step.switch"(%22, %c0_i32_5) ({
        ^bb0(%arg2: i32):
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %true_7 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %26 = arith.addi %c240_i32, %0 : i32
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c92_i32 = arith.constant 92 : i32
        %21 = arith.addi %c92_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_5 : i32
        %24 = "simt_step.if"(%23) ({
          %27 = simt_step.lane_id
          %28 = arith.index_cast %27 : index to i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %25 = arith.addi %c256_i32, %0 : i32
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %19 = arith.addi %c272_i32, %0 : i32
      %true_4 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %c96_i32 = arith.constant 96 : i32
      %15 = arith.addi %c96_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
      %18 = "simt_step.if"(%17) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %21 = arith.addi %c100_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_5 : i32
        %24 = "simt_step.if"(%23) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_7 = arith.constant 0 : i32
          %27 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %25 = arith.addi %c288_i32, %0 : i32
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %c304_i32 = arith.constant 304 : i32
      %19 = arith.addi %c304_i32, %0 : i32
      %true_4 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %c320_i32 = arith.constant 320 : i32
    %13 = arith.addi %c320_i32, %0 : i32
    %true = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

