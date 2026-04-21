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
        %c2_i32 = arith.constant 2 : i32
        %4 = arith.remsi %arg3, %c2_i32 : i32
        %5 = "simt_step.switch"(%4, %arg0) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %7 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
        ^bb1(%8: i32):  // no predecessors
          %true_1 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %10 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
        ^bb2(%11: i32):  // no predecessors
          %true_2 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %13 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }, {
        %4 = simt_step.subgroup_id
        %5 = arith.index_cast %4 : index to i32
        %6 = "simt_step.switch"(%arg3, %5) ({
        ^bb0(%arg4: i32):
          %true_1 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %10 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %true_2 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %13 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %8 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%6) : (i32) -> ()
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
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_5 : i32
      %22 = "simt_step.if"(%21) ({
        %c0_i32_11 = arith.constant 0 : i32
        %35 = arith.addi %0, %c0_i32_11 : i32
        "simt_step.yield"(%35) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %35 = arith.addi %c16_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_11 : i32
        %38 = "simt_step.if"(%37) ({
          %c0_i32_13 = arith.constant 0 : i32
          %41 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }, {
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %39 = arith.addi %c112_i32, %0 : i32
        %true_12 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %23 = arith.addi %c128_i32, %0 : i32
      %true_6 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %26 = arith.addi %c20_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = simt_step.lane_id
      %29 = arith.index_cast %28 : index to i32
      %30 = "simt_step.switch"(%27, %29) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %35 = arith.addi %c24_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_11 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %39 = arith.addi %c144_i32, %0 : i32
        %true_12 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %41 = arith.addi %c160_i32, %0 : i32
        %true_14 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %44 = arith.addi %c28_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_15 : i32
        %47 = "simt_step.if"(%46) ({
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %48 = arith.addi %c176_i32, %0 : i32
        %true_16 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %31 = arith.addi %c192_i32, %0 : i32
      %true_8 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %33 = arith.addi %c208_i32, %0 : i32
      %true_10 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c224_i32 = arith.constant 224 : i32
    %10 = arith.addi %c224_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.addi %0, %c0_i32_1 : i32
    %15 = "simt_step.switch"(%13, %14) ({
    ^bb0(%arg2: i32):
      %c36_i32 = arith.constant 36 : i32
      %19 = arith.addi %c36_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_5 : i32
      %22 = "simt_step.if"(%21) ({
        %c40_i32 = arith.constant 40 : i32
        %42 = arith.addi %c40_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %44 = "simt_step.switch"(%43, %0) ({
        ^bb0(%arg3: i32):
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %0, %c1_i32 : i32
          %true_15 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %49 = arith.addi %c240_i32, %0 : i32
          %true_16 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = true} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          %true_17 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %54 = arith.addi %c256_i32, %0 : i32
          %true_18 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_17 : i32
          %44 = arith.addi %43, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %45 = arith.addi %c44_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_18 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_18 : i32
          %46 = arith.addi %c272_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_19 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %23 = arith.addi %c288_i32, %0 : i32
      %true_6 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %25 = arith.addi %c304_i32, %0 : i32
      %true_8 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %28 = arith.addi %c64_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %30 = "simt_step.switch"(%29, %0) ({
      ^bb0(%arg3: i32):
        %c68_i32 = arith.constant 68 : i32
        %42 = arith.addi %c68_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_15 : i32
        %45 = "simt_step.if"(%44) ({
          %c0_i32_21 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_21) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %57 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %46 = arith.addi %c320_i32, %0 : i32
        %true_16 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %48 = arith.addi %c336_i32, %0 : i32
        %true_18 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb1(%50: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %51 = arith.addi %c72_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %53 = arith.cmpi ne, %52, %c0_i32_19 : i32
        %54 = "simt_step.if"(%53) ({
          %c3_i32 = arith.constant 3 : i32
          %57 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c352_i32 = arith.constant 352 : i32
        %55 = arith.addi %c352_i32, %0 : i32
        %true_20 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %32 = arith.addi %c76_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
      %35 = "simt_step.if"(%34) ({
        %c80_i32 = arith.constant 80 : i32
        %42 = arith.addi %c80_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_15 : i32
        %45 = "simt_step.if"(%44) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c368_i32 = arith.constant 368 : i32
        %46 = arith.addi %c368_i32, %0 : i32
        %true_16 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) : (i32) -> ()
      }, {
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_17 : i32
          %44 = arith.addi %43, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %45 = arith.addi %c84_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_18 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_17 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_18 : i32
          %46 = arith.addi %c384_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_19 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) : (i32) -> ()
      }) : (i1) -> i32
      %c400_i32 = arith.constant 400 : i32
      %36 = arith.addi %c400_i32, %0 : i32
      %true_10 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %39:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_15 : i32
        %43 = arith.addi %42, %0 : i32
        %c104_i32 = arith.constant 104 : i32
        %44 = arith.addi %c104_i32, %43 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_16 : i32
        "simt_step.condition"(%46, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %42 = arith.addi %arg3, %c4_i32_15 : i32
        %c1_i32 = arith.constant 1 : i32
        %43 = arith.addi %arg4, %c1_i32 : i32
        %true_16 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %c4_i32_17 = arith.constant 4 : i32
        %44 = arith.muli %arg4, %c4_i32_17 : i32
        %45 = arith.addi %c416_i32, %44 : i32
        %46 = arith.addi %45, %0 : i32
        %true_18 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42, %43) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %40 = arith.addi %c432_i32, %0 : i32
      %true_14 = arith.constant true
      %41 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c448_i32 = arith.constant 448 : i32
    %16 = arith.addi %c448_i32, %0 : i32
    %true_3 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %18 = arith.addi %0, %c0_i32_4 : i32
    return
  }
}

