module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %7 = arith.addi %c0_i32_1, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }) : (i1) -> i32
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %3 = "simt_step.switch"(%2, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32 : i32
          %16 = arith.cmpi slt, %arg6, %15 : i32
          "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.muli %arg6, %c4_i32 : i32
          %16 = arith.addi %c32_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%14, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) : (i32) -> ()
      }, {
        %true = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %14 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c2_i32_2 = arith.constant 2 : i32
      %9 = arith.remsi %arg3, %c2_i32_2 : i32
      %10 = simt_step.subgroup_id
      %11 = arith.index_cast %10 : index to i32
      %12 = "simt_step.switch"(%9, %11) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %14 = "simt_step.if"(%13) ({
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %19 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %19 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %true = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %17 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %5 = arith.select %4, %1, %3 : i32
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
      %13 = arith.addi %c8_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_6 : i32
      "simt_step.if"(%15) ({
        %c2_i32 = arith.constant 2 : i32
        %16 = arith.remsi %0, %c2_i32 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %17 = arith.addi %0, %c0_i32_7 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %arg2, %c1_i32 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %21 = arith.addi %20, %c3_i32 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_7 : i32
      %16 = arith.addi %c112_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_8 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c32_i32 = arith.constant 32 : i32
    %7 = arith.addi %c32_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = "simt_step.switch"(%8, %0) ({
    ^bb0(%arg2: i32):
      %c36_i32 = arith.constant 36 : i32
      %13 = arith.addi %c36_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %0, %c1_i32 : i32
      %16 = "simt_step.switch"(%14, %15) ({
      ^bb0(%arg3: i32):
        %c40_i32 = arith.constant 40 : i32
        %26 = arith.addi %c40_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = simt_step.lane_id
        %29 = arith.index_cast %28 : index to i32
        %30 = "simt_step.switch"(%27, %29) ({
        ^bb0(%arg4: i32):
          %c2_i32_22 = arith.constant 2 : i32
          %55 = arith.addi %0, %c2_i32_22 : i32
          "simt_step.yield"(%55) {fallthrough = true} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %true_23 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %57 = arith.addi %c128_i32, %0 : i32
          %true_24 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %32 = arith.addi %c44_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_12 : i32
        %35 = "simt_step.if"(%34) ({
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }, {
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %36 = arith.addi %c144_i32, %0 : i32
        %true_13 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %38 = arith.addi %c160_i32, %0 : i32
        %true_15 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %41 = arith.addi %c48_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_16 : i32
        %44 = "simt_step.if"(%43) ({
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }, {
          %c1_i32_22 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_22) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %45 = arith.addi %c176_i32, %0 : i32
        %true_17 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_18 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %47 = arith.addi %c192_i32, %0 : i32
        %true_19 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb3(%49: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %50 = arith.addi %c52_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %52 = "simt_step.switch"(%51, %c2_i32) ({
        ^bb0(%arg4: i32):
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb1(%57: i32):  // no predecessors
          %58 = simt_step.lane_id
          %59 = arith.index_cast %58 : index to i32
          %true_22 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %60 = arith.addi %c208_i32, %0 : i32
          %true_23 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_20 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %53 = arith.addi %c224_i32, %0 : i32
        %true_21 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_12 : i32
        %27 = arith.addi %26, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %28 = arith.addi %c56_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_13 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c76_i32 = arith.constant 76 : i32
        %26 = arith.addi %c76_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_12 : i32
        %29 = "simt_step.if"(%28) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %30 = arith.addi %c240_i32, %0 : i32
        %true_13 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %32 = arith.addi %arg3, %29 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32_14 : i32
        %true_15 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_16 : i32
        %35 = arith.addi %c256_i32, %34 : i32
        %36 = arith.addi %35, %0 : i32
        %true_17 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %20 = simt_step.lane_id
      %21 = arith.index_cast %20 : index to i32
      %true_8 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %22 = arith.addi %c272_i32, %0 : i32
      %true_9 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_12 : i32
        %27 = arith.addi %26, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %28 = arith.addi %c80_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_13 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %26 = simt_step.subgroup_id
        %27 = arith.index_cast %26 : index to i32
        %28 = arith.addi %arg3, %27 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_14 : i32
        %31 = arith.addi %c288_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_15 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c304_i32 = arith.constant 304 : i32
    %10 = arith.addi %c304_i32, %0 : i32
    %true_3 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c100_i32 = arith.constant 100 : i32
      %15 = arith.addi %c100_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_7 : i32
      %16 = arith.addi %c320_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_8 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

