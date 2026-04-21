module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c1_i32 = arith.constant 1 : i32
      %2 = "simt_step.switch"(%arg3, %c1_i32) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_2 = arith.constant 1 : i32
          %8 = arith.addi %7, %c1_i32_2 : i32
          %9 = arith.cmpi slt, %arg6, %8 : i32
          "simt_step.condition"(%9, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_2 = arith.constant true
          %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.muli %arg6, %c4_i32 : i32
          %9 = arith.addi %c0_i32_3, %8 : i32
          %10 = arith.addi %9, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_4 = arith.constant 1 : i32
          %11 = arith.addi %arg6, %c1_i32_4 : i32
          "simt_step.yield"(%7, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%3#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%4: i32):  // no predecessors
        %true = arith.constant true
        %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %6 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%2) : (i32) -> ()
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_0 : i32
      %16 = "simt_step.if"(%15) ({
        %c2_i32_8 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_8) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %31 = arith.addi %c16_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %0, %c1_i32 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg3: i32):
          %c2_i32_8 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32_8 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %37 = simt_step.lane_id
          %38 = arith.index_cast %37 : index to i32
          %true_9 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %39 = arith.addi %c48_i32, %0 : i32
          %true_10 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %17 = arith.addi %c64_i32, %0 : i32
      %true = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_1 = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %19 = arith.addi %c80_i32, %0 : i32
      %true_2 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %23 = arith.addi %c20_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %25 = "simt_step.switch"(%24, %c0_i32_3) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_14 : i32
          %47 = arith.addi %46, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %48 = arith.addi %c24_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_15 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          %true_14 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_15 : i32
          %49 = arith.addi %c96_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_16 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %33 = arith.addi %c44_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = simt_step.lane_id
        %36 = arith.index_cast %35 : index to i32
        %37 = "simt_step.switch"(%34, %36) ({
        ^bb0(%arg4: i32):
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          %true_14 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %48 = arith.addi %c112_i32, %0 : i32
          %true_15 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        ^bb3(%56: i32):  // no predecessors
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          %true_16 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %59 = arith.addi %c128_i32, %0 : i32
          %true_17 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %38 = arith.addi %c144_i32, %0 : i32
        %true_11 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %40 = arith.addi %c160_i32, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %43 = arith.addi %c48_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = "simt_step.switch"(%44, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          %true_14 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %49 = arith.addi %c176_i32, %0 : i32
          %true_15 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %26 = arith.addi %c192_i32, %0 : i32
      %true_5 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %true_6 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %29 = arith.addi %c208_i32, %0 : i32
      %true_7 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c52_i32 = arith.constant 52 : i32
    %10 = arith.addi %c52_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %12 = "simt_step.switch"(%11, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %0, %c1_i32 : i32
      %true = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %14 = arith.addi %c224_i32, %0 : i32
      %true_0 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %17 = arith.addi %c56_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg3: i32):
        %c1_i32_8 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_8) {fallthrough = true} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_15 : i32
          %45 = arith.addi %44, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %46 = arith.addi %c60_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_16 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_17 : i32
          %47 = arith.addi %c240_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_18 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %36 = arith.addi %c80_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_11 : i32
        %39 = "simt_step.if"(%38) ({
          %44 = simt_step.lane_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) : (i32) -> ()
        }, {
          %44 = simt_step.lane_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %40 = arith.addi %c256_i32, %0 : i32
        %true_12 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %42 = arith.addi %c272_i32, %0 : i32
        %true_14 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %22 = arith.addi %c288_i32, %0 : i32
      %true_2 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %25 = arith.addi %c84_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %27 = arith.addi %0, %c0_i32_3 : i32
      %28 = "simt_step.switch"(%26, %27) ({
      ^bb0(%arg3: i32):
        %33 = simt_step.subgroup_id
        %34 = arith.index_cast %33 : index to i32
        %true_8 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %35 = arith.addi %c304_i32, %0 : i32
        %true_9 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %38 = arith.addi %c88_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_10 : i32
        %41 = "simt_step.if"(%40) ({
          %c1_i32_12 = arith.constant 1 : i32
          %44 = arith.addi %0, %c1_i32_12 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %42 = arith.addi %c320_i32, %0 : i32
        %true_11 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %29 = arith.addi %c336_i32, %0 : i32
      %true_5 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %32:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_8 : i32
        %34 = arith.addi %33, %0 : i32
        %c92_i32 = arith.constant 92 : i32
        %35 = arith.addi %c92_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_9 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %33 = arith.addi %arg3, %arg4 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32_8 : i32
        %true_9 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_10 : i32
        %36 = arith.addi %c352_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_11 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

