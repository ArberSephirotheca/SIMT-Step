module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
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
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %5 = "simt_step.if"(%4) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %7 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %7 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg2: i32):
        %23 = simt_step.subgroup_id
        %24 = arith.index_cast %23 : index to i32
        %true_3 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %25 = arith.addi %c80_i32, %0 : i32
        %true_4 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_9 : i32
          %38 = arith.addi %37, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %39 = arith.addi %c16_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_10 : i32
          "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %37 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_10 : i32
          %40 = arith.addi %c96_i32, %39 : i32
          %41 = arith.addi %40, %0 : i32
          %true_11 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %30 = arith.addi %c36_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.lane_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg3: i32):
          %true_9 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %37 = arith.addi %c112_i32, %0 : i32
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %35 = arith.addi %c128_i32, %0 : i32
        %true_8 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %21 = arith.addi %c144_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %17 = arith.muli %arg3, %c4_i32_3 : i32
        %18 = arith.addi %17, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %19 = arith.addi %c40_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %17 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg3, %c1_i32 : i32
        %true_3 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_4 : i32
        %20 = arith.addi %c160_i32, %19 : i32
        %21 = arith.addi %20, %0 : i32
        %true_5 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) : (i32) -> ()
    }) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %9 = arith.addi %c176_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %11 = arith.addi %c60_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.subgroup_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c64_i32 = arith.constant 64 : i32
      %16 = arith.addi %c64_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg3: i32):
        %c68_i32 = arith.constant 68 : i32
        %37 = arith.addi %c68_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = "simt_step.switch"(%38, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_16 = arith.constant 0 : i32
          %true_17 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %56 = arith.addi %c192_i32, %0 : i32
          %true_18 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_16) {fallthrough = true} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %40 = arith.addi %c208_i32, %0 : i32
        %true_10 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %42 = arith.addi %c224_i32, %0 : i32
        %true_12 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_13) {fallthrough = true} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %46 = simt_step.lane_id
        %47 = arith.index_cast %46 : index to i32
        "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
      ^bb3(%48: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %49 = arith.addi %c72_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %51 = simt_step.subgroup_id
        %52 = arith.index_cast %51 : index to i32
        %53 = "simt_step.switch"(%50, %52) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          %true_16 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %59 = arith.addi %c240_i32, %0 : i32
          %true_17 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %62 = arith.addi %0, %c3_i32 : i32
          %true_18 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %63 = arith.addi %c256_i32, %0 : i32
          %true_19 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = true} : (i32) -> ()
        ^bb3(%65: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_20 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %66 = arith.addi %c272_i32, %0 : i32
          %true_21 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %54 = arith.addi %c288_i32, %0 : i32
        %true_15 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %21 = arith.addi %c304_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %24 = arith.addi %c76_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = simt_step.lane_id
      %27 = arith.index_cast %26 : index to i32
      %28 = "simt_step.switch"(%25, %27) ({
      ^bb0(%arg3: i32):
        %c80_i32 = arith.constant 80 : i32
        %37 = arith.addi %c80_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.subgroup_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg4: i32):
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          %true_15 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %58 = arith.addi %c320_i32, %0 : i32
          %true_16 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %61 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          %63 = simt_step.subgroup_id
          %64 = arith.index_cast %63 : index to i32
          %true_17 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %65 = arith.addi %c336_i32, %0 : i32
          %true_18 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %42 = arith.addi %c352_i32, %0 : i32
        %true_10 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %44 = arith.addi %c368_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %47 = simt_step.subgroup_id
        %48 = arith.index_cast %47 : index to i32
        "simt_step.yield"(%48) {fallthrough = true} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %50 = arith.addi %c84_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %52 = arith.cmpi ne, %51, %c0_i32_13 : i32
        %53 = "simt_step.if"(%52) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) : (i32) -> ()
        }) : (i1) -> i32
        %c384_i32 = arith.constant 384 : i32
        %54 = arith.addi %c384_i32, %0 : i32
        %true_14 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %29 = arith.addi %c400_i32, %0 : i32
      %true_4 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %32 = arith.addi %0, %c1_i32 : i32
      %true_5 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %33 = arith.addi %c416_i32, %0 : i32
      %true_6 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
    ^bb3(%35: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %36:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_9 : i32
        %38 = arith.addi %37, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %39 = arith.addi %c88_i32, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_10 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c108_i32 = arith.constant 108 : i32
        %37 = arith.addi %c108_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.subgroup_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg5: i32):
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          %true_13 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %50 = arith.addi %c432_i32, %0 : i32
          %true_14 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = true} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %42 = arith.addi %arg3, %41 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %43 = arith.addi %arg4, %c1_i32_9 : i32
        %true_10 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %44 = arith.muli %arg4, %c4_i32_11 : i32
        %45 = arith.addi %c448_i32, %44 : i32
        %46 = arith.addi %45, %0 : i32
        %true_12 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%42, %43) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

