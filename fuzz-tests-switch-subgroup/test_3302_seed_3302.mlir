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
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c16_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
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
    %c2_i32 = arith.constant 2 : i32
    %7 = "simt_step.switch"(%6, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = "simt_step.switch"(%17, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %29 = arith.addi %c16_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = simt_step.subgroup_id
        %32 = arith.index_cast %31 : index to i32
        %33 = "simt_step.switch"(%30, %32) ({
        ^bb0(%arg4: i32):
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          %c0_i32_23 = arith.constant 0 : i32
          %54 = arith.addi %0, %c0_i32_23 : i32
          %true_24 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %55 = arith.addi %c48_i32, %0 : i32
          %true_25 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %34 = arith.addi %c64_i32, %0 : i32
        %true_16 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %36 = arith.addi %c80_i32, %0 : i32
        %true_18 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %39 = simt_step.lane_id
        %40 = arith.index_cast %39 : index to i32
        %true_19 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %41 = arith.addi %c96_i32, %0 : i32
        %true_20 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %44 = arith.addi %c20_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_21 : i32
        %47 = "simt_step.if"(%46) ({
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) : (i32) -> ()
        }, {
          %c4_i32_23 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_23 : i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %48 = arith.addi %c112_i32, %0 : i32
        %true_22 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %19 = arith.addi %c128_i32, %0 : i32
      %true_6 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %21 = arith.addi %c144_i32, %0 : i32
      %true_8 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_15 : i32
        %30 = arith.addi %29, %0 : i32
        %c24_i32 = arith.constant 24 : i32
        %31 = arith.addi %c24_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_16 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c44_i32 = arith.constant 44 : i32
        %29 = arith.addi %c44_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_15 : i32
        %32 = "simt_step.if"(%31) ({
          %c0_i32_20 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_20) : (i32) -> ()
        }, {
          %c2_i32_20 = arith.constant 2 : i32
          %41 = arith.addi %0, %c2_i32_20 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %33 = arith.addi %c160_i32, %0 : i32
        %true_16 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %35 = arith.addi %arg3, %32 : i32
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32 : i32
        %true_17 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_18 : i32
        %38 = arith.addi %c176_i32, %37 : i32
        %39 = arith.addi %38, %0 : i32
        %true_19 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_15 : i32
        %30 = arith.addi %29, %0 : i32
        %c48_i32 = arith.constant 48 : i32
        %31 = arith.addi %c48_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_16 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c68_i32 = arith.constant 68 : i32
        %29 = arith.addi %c68_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_15 : i32
        %32 = "simt_step.if"(%31) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c1_i32_20 = arith.constant 1 : i32
          %41 = arith.addi %0, %c1_i32_20 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %33 = arith.addi %c192_i32, %0 : i32
        %true_16 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %35 = arith.addi %arg3, %32 : i32
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32 : i32
        %true_17 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_18 : i32
        %38 = arith.addi %c208_i32, %37 : i32
        %39 = arith.addi %38, %0 : i32
        %true_19 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %27 = arith.addi %c224_i32, %0 : i32
      %true_14 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c240_i32 = arith.constant 240 : i32
    %8 = arith.addi %c240_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_5 : i32
      %17 = arith.addi %16, %0 : i32
      %c72_i32 = arith.constant 72 : i32
      %18 = arith.addi %c72_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %16 = arith.addi %arg2, %0 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_6 : i32
      %19 = arith.addi %c256_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c92_i32 = arith.constant 92 : i32
    %11 = arith.addi %c92_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = "simt_step.switch"(%12, %0) ({
    ^bb0(%arg2: i32):
      %c96_i32 = arith.constant 96 : i32
      %16 = arith.addi %c96_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
      %19 = "simt_step.if"(%18) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %31 = arith.addi %c100_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = simt_step.lane_id
        %34 = arith.index_cast %33 : index to i32
        %35 = "simt_step.switch"(%32, %34) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          %true_13 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %42 = arith.addi %c272_i32, %0 : i32
          %true_14 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c1_i32_15 = arith.constant 1 : i32
          %45 = arith.addi %0, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %46 = arith.addi %c288_i32, %0 : i32
          %true_17 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %c1_i32_18 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %36 = arith.addi %c304_i32, %0 : i32
        %true_12 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %20 = arith.addi %c320_i32, %0 : i32
      %true_6 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %23 = arith.addi %c104_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
      %26 = "simt_step.if"(%25) ({
        %c108_i32 = arith.constant 108 : i32
        %31 = arith.addi %c108_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg3: i32):
          %c2_i32_11 = arith.constant 2 : i32
          %34 = arith.addi %0, %c2_i32_11 : i32
          %true_12 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %35 = arith.addi %c336_i32, %0 : i32
          %true_13 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c2_i32_11 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_11) : (i32) -> ()
      }) : (i1) -> i32
      %c352_i32 = arith.constant 352 : i32
      %27 = arith.addi %c352_i32, %0 : i32
      %true_8 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %29 = arith.addi %c368_i32, %0 : i32
      %true_10 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c384_i32 = arith.constant 384 : i32
    %14 = arith.addi %c384_i32, %0 : i32
    %true_4 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

