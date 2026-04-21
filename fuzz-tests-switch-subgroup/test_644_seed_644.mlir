module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %true_4 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) : (i32) -> ()
    }, {
      %true_4 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %11 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %7 = "simt_step.if"(%6) ({
      %true_4 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %11 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %11 = "simt_step.if"(%10) ({
        %12 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg4: i32):
          %true_6 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %16 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %true_7 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %19 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %14 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg5, %14 : i32
          "simt_step.condition"(%15, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true_7 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg5, %c4_i32 : i32
          %15 = arith.addi %c112_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%13, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %9 = arith.select %8, %5, %7 : i32
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
      %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32_6 = arith.constant 1 : i32
        %15 = arith.cmpi slt, %arg3, %c1_i32_6 : i32
        "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %15 = arith.remsi %0, %c3_i32 : i32
        %c3_i32_6 = arith.constant 3 : i32
        %16 = "simt_step.switch"(%15, %c3_i32_6) ({
        ^bb0(%arg4: i32):
          %c0_i32_8 = arith.constant 0 : i32
          %18 = arith.addi %arg4, %c0_i32_8 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_9 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          %22 = arith.addi %21, %c3_i32_10 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_7 = arith.constant 1 : i32
        %17 = arith.addi %arg3, %c1_i32_7 : i32
        "simt_step.yield"(%arg2, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %8 = "simt_step.switch"(%7, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %14 = arith.addi %c12_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %16 = arith.addi %0, %c3_i32 : i32
      %17 = "simt_step.switch"(%15, %16) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %35 = arith.addi %c16_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = simt_step.lane_id
        %38 = arith.index_cast %37 : index to i32
        %39 = "simt_step.switch"(%36, %38) ({
        ^bb0(%arg4: i32):
          %c3_i32_25 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_25) {fallthrough = false} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %c3_i32_26 = arith.constant 3 : i32
          %true_27 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %61 = arith.addi %c128_i32, %0 : i32
          %true_28 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_28) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_26) {fallthrough = false} : (i32) -> ()
        ^bb2(%63: i32):  // no predecessors
          %c3_i32_29 = arith.constant 3 : i32
          %true_30 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %64 = arith.addi %c144_i32, %0 : i32
          %true_31 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_31) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %40 = arith.addi %c160_i32, %0 : i32
        %true_14 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %43 = arith.addi %c20_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_15 = arith.constant 4 : i32
        %45 = "simt_step.switch"(%44, %c4_i32_15) ({
        ^bb0(%arg4: i32):
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          %true_25 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %62 = arith.addi %c176_i32, %0 : i32
          %true_26 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %65 = simt_step.lane_id
          %66 = arith.index_cast %65 : index to i32
          %true_27 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %67 = arith.addi %c192_i32, %0 : i32
          %true_28 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_28) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
        ^bb2(%69: i32):  // no predecessors
          %true_29 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %70 = arith.addi %c208_i32, %0 : i32
          %true_30 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_30) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%72: i32):  // no predecessors
          %c1_i32_31 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %46 = arith.addi %c224_i32, %0 : i32
        %true_17 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_18 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %48 = arith.addi %c240_i32, %0 : i32
        %true_19 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%50: i32):  // no predecessors
        %c4_i32_20 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_20) {fallthrough = false} : (i32) -> ()
      ^bb3(%51: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %52 = arith.addi %c24_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %54 = arith.cmpi ne, %53, %c0_i32_21 : i32
        %55 = "simt_step.if"(%54) ({
          %c4_i32_25 = arith.constant 4 : i32
          %60 = arith.addi %0, %c4_i32_25 : i32
          "simt_step.yield"(%60) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %60 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%60) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %56 = arith.addi %c256_i32, %0 : i32
        %true_22 = arith.constant true
        %57 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_23 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %58 = arith.addi %c272_i32, %0 : i32
        %true_24 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %18 = arith.addi %c288_i32, %0 : i32
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %20 = arith.addi %c304_i32, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %24 = simt_step.subgroup_id
      %25 = arith.index_cast %24 : index to i32
      %true_8 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %26 = arith.addi %c320_i32, %0 : i32
      %true_9 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %29 = arith.addi %c28_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_10 = arith.constant 4 : i32
      %31 = arith.addi %0, %c4_i32_10 : i32
      %32 = "simt_step.switch"(%30, %31) ({
      ^bb0(%arg3: i32):
        %35 = simt_step.subgroup_id
        %36 = arith.index_cast %35 : index to i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %38 = arith.addi %c32_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
        %41 = "simt_step.if"(%40) ({
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }, {
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %42 = arith.addi %c336_i32, %0 : i32
        %true_14 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %45 = arith.addi %c36_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = simt_step.subgroup_id
        %48 = arith.index_cast %47 : index to i32
        %49 = "simt_step.switch"(%46, %48) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %true_19 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %54 = arith.addi %c352_i32, %0 : i32
          %true_20 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %58 = simt_step.subgroup_id
          %59 = arith.index_cast %58 : index to i32
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %50 = arith.addi %c368_i32, %0 : i32
        %true_16 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      ^bb3(%52: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %53:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %54 = arith.muli %arg5, %c4_i32_19 : i32
          %55 = arith.addi %54, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %56 = arith.addi %c40_i32, %55 : i32
          %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %58 = arith.cmpi ne, %57, %c0_i32_20 : i32
          "simt_step.condition"(%58, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %54 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %55 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %56 = arith.muli %arg5, %c4_i32_21 : i32
          %57 = arith.addi %c384_i32, %56 : i32
          %58 = arith.addi %57, %0 : i32
          %true_22 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%54, %55) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%53#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_11 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %33 = arith.addi %c400_i32, %0 : i32
      %true_12 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c416_i32 = arith.constant 416 : i32
    %9 = arith.addi %c416_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_4 : i32
      %15 = arith.addi %14, %0 : i32
      %c60_i32 = arith.constant 60 : i32
      %16 = arith.addi %c60_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32_4 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32_4 : i32
      %true_5 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_6 : i32
      %17 = arith.addi %c432_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_7 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %12 = simt_step.lane_id
    %13 = arith.index_cast %12 : index to i32
    return
  }
}

