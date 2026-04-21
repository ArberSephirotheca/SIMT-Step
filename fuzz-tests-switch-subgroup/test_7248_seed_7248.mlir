module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32 : i32
          %7 = arith.cmpi slt, %arg5, %6 : i32
          "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c0_i32_3, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %7 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %7 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %3 = arith.addi %c48_i32, %arg0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %23 = arith.addi %c8_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
      "simt_step.if"(%25) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
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
      %c2_i32 = arith.constant 2 : i32
      %23 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %10 = arith.addi %c64_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c16_i32 = arith.constant 16 : i32
    %12 = arith.addi %c16_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %14 = "simt_step.switch"(%13, %c3_i32) ({
    ^bb0(%arg2: i32):
      %23 = simt_step.lane_id
      %24 = arith.index_cast %23 : index to i32
      %true_6 = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %25 = arith.addi %c80_i32, %0 : i32
      %true_7 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %28 = arith.addi %c20_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %30 = simt_step.subgroup_id
      %31 = arith.index_cast %30 : index to i32
      %32 = "simt_step.switch"(%29, %31) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %47 = arith.addi %c24_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_16 : i32
        %50 = "simt_step.if"(%49) ({
          %c2_i32_22 = arith.constant 2 : i32
          %62 = arith.addi %0, %c2_i32_22 : i32
          "simt_step.yield"(%62) : (i32) -> ()
        }, {
          %62 = simt_step.lane_id
          %63 = arith.index_cast %62 : index to i32
          "simt_step.yield"(%63) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %51 = arith.addi %c96_i32, %0 : i32
        %true_17 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      ^bb1(%53: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %54 = arith.addi %c28_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %56 = arith.cmpi ne, %55, %c0_i32_18 : i32
        %57 = "simt_step.if"(%56) ({
          %c3_i32_22 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_22) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %58 = arith.addi %c112_i32, %0 : i32
        %true_19 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_20 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %60 = arith.addi %c128_i32, %0 : i32
        %true_21 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %33 = arith.addi %c144_i32, %0 : i32
      %true_9 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%35: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %36 = arith.addi %c32_i32, %0 : i32
      %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %38 = arith.cmpi ne, %37, %c0_i32_10 : i32
      %39 = "simt_step.if"(%38) ({
        %c36_i32 = arith.constant 36 : i32
        %47 = arith.addi %c36_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %49 = simt_step.lane_id
        %50 = arith.index_cast %49 : index to i32
        %51 = "simt_step.switch"(%48, %50) ({
        ^bb0(%arg3: i32):
          %c0_i32_18 = arith.constant 0 : i32
          %true_19 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %54 = arith.addi %c160_i32, %0 : i32
          %true_20 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          %true_21 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %59 = arith.addi %c176_i32, %0 : i32
          %true_22 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %c4_i32_23 = arith.constant 4 : i32
          %true_24 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %62 = arith.addi %c192_i32, %0 : i32
          %true_25 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_23) {fallthrough = false} : (i32) -> ()
        ^bb3(%64: i32):  // no predecessors
          %c0_i32_26 = arith.constant 0 : i32
          %65 = arith.addi %0, %c0_i32_26 : i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %52 = arith.addi %c208_i32, %0 : i32
        %true_17 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) : (i32) -> ()
      }, {
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %47:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_18 : i32
          %49 = arith.addi %48, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %50 = arith.addi %c40_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_19 : i32
          "simt_step.condition"(%52, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %48 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg4, %c1_i32 : i32
          %true_18 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %50 = arith.muli %arg4, %c4_i32_19 : i32
          %51 = arith.addi %c224_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_20 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%47#0) : (i32) -> ()
      }) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %40 = arith.addi %c240_i32, %0 : i32
      %true_11 = arith.constant true
      %41 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_12 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %42 = arith.addi %c256_i32, %0 : i32
      %true_13 = arith.constant true
      %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
    ^bb3(%44: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %true_14 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %45 = arith.addi %c272_i32, %0 : i32
      %true_15 = arith.constant true
      %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c288_i32 = arith.constant 288 : i32
    %15 = arith.addi %c288_i32, %0 : i32
    %true_3 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %17 = arith.addi %c60_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
    %20 = "simt_step.if"(%19) ({
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_8 : i32
        %25 = arith.addi %24, %0 : i32
        %c64_i32_9 = arith.constant 64 : i32
        %26 = arith.addi %c64_i32_9, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_10 : i32
        "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %24 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg3, %c1_i32 : i32
        %true_8 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %26 = arith.muli %arg3, %c4_i32_9 : i32
        %27 = arith.addi %c304_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_10 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) : (i32) -> ()
    }, {
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c320_i32 = arith.constant 320 : i32
    %21 = arith.addi %c320_i32, %0 : i32
    %true_5 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

