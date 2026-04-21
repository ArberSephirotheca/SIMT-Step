module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_1 = arith.constant 0 : i32
        %5 = arith.addi %c0_i32_1, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }, {
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %5 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
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
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c32_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c48_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.break"(%4, %5) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
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
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %19 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %19 = arith.remsi %0, %c2_i32 : i32
        %20 = simt_step.subgroup_id
        %21 = arith.index_cast %20 : index to i32
        %22 = "simt_step.switch"(%19, %21) ({
        ^bb0(%arg4: i32):
          %c0_i32_6 = arith.constant 0 : i32
          %24 = arith.addi %arg4, %c0_i32_6 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %26 = arith.addi %25, %c0_i32_7 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.addi %27, %c0_i32_8 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
      %21 = "simt_step.if"(%20) ({
        %c16_i32 = arith.constant 16 : i32
        %24 = arith.addi %c16_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = "simt_step.switch"(%25, %0) ({
        ^bb0(%arg2: i32):
          %c3_i32 = arith.constant 3 : i32
          %true_6 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %27 = arith.addi %c64_i32, %0 : i32
          %true_7 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %22 = arith.addi %c80_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %10 = arith.addi %c96_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c20_i32 = arith.constant 20 : i32
    %12 = arith.addi %c20_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.lane_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c24_i32 = arith.constant 24 : i32
      %18 = arith.addi %c24_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %41 = simt_step.subgroup_id
        %42 = arith.index_cast %41 : index to i32
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        %c4_i32_10 = arith.constant 4 : i32
        %true_11 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %44 = arith.addi %c112_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_10) {fallthrough = true} : (i32) -> ()
      ^bb3(%46: i32):  // no predecessors
        %47 = simt_step.subgroup_id
        %48 = arith.index_cast %47 : index to i32
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %22 = simt_step.subgroup_id
      %23 = arith.index_cast %22 : index to i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %25 = arith.addi %c28_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_4 : i32
      %28 = "simt_step.if"(%27) ({
        %c32_i32 = arith.constant 32 : i32
        %40 = arith.addi %c32_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %42 = "simt_step.switch"(%41, %c3_i32) ({
        ^bb0(%arg3: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %true_11 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %43 = arith.addi %c128_i32, %0 : i32
          %true_12 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %true_13 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %46 = arith.addi %c144_i32, %0 : i32
          %true_14 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          %true_15 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %51 = arith.addi %c160_i32, %0 : i32
          %true_16 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb3(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%42) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %40 = arith.addi %c36_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_10 : i32
        %43 = "simt_step.if"(%42) ({
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %44 = arith.addi %c176_i32, %0 : i32
        %true_11 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %29 = arith.addi %c192_i32, %0 : i32
      %true_5 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %32 = arith.addi %c40_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_6 : i32
      %35 = "simt_step.if"(%34) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_12 : i32
          %42 = arith.addi %41, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %43 = arith.addi %c44_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_13 : i32
          "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %41 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg4, %c1_i32 : i32
          %true_12 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_13 : i32
          %44 = arith.addi %c208_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_14 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%40#0) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %40 = arith.addi %c64_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = simt_step.subgroup_id
        %43 = arith.index_cast %42 : index to i32
        %44 = "simt_step.switch"(%41, %43) ({
        ^bb0(%arg3: i32):
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          %true_10 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %47 = arith.addi %c224_i32, %0 : i32
          %true_11 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          %true_13 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %53 = arith.addi %c240_i32, %0 : i32
          %true_14 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %36 = arith.addi %c256_i32, %0 : i32
      %true_7 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %38 = arith.addi %c272_i32, %0 : i32
      %true_9 = arith.constant true
      %39 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %17:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_4 : i32
      %19 = arith.addi %18, %0 : i32
      %c68_i32 = arith.constant 68 : i32
      %20 = arith.addi %c68_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_5 : i32
      %21 = arith.addi %c288_i32, %20 : i32
      %22 = arith.addi %21, %0 : i32
      %true_6 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

