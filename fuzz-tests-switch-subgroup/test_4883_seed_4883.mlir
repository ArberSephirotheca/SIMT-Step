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
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c32_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%4, %5) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %20 = arith.addi %c12_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      %22 = "simt_step.switch"(%21, %c4_i32_3) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %23 = arith.addi %c16_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%24, %26) ({
        ^bb0(%arg3: i32):
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %50 = arith.addi %0, %c3_i32 : i32
          %true_10 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %51 = arith.addi %c48_i32, %0 : i32
          %true_11 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb3(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          %true_12 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %56 = arith.addi %c64_i32, %0 : i32
          %true_13 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %29 = arith.addi %c20_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_4 : i32
        %32 = "simt_step.if"(%31) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %33 = arith.addi %c80_i32, %0 : i32
        %true_5 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %36 = arith.addi %c24_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_6 : i32
        %39 = "simt_step.if"(%38) ({
          %c3_i32 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %40 = arith.addi %c96_i32, %0 : i32
        %true_7 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_8 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %42 = arith.addi %c112_i32, %0 : i32
        %true_9 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      %20 = simt_step.subgroup_id
      %21 = arith.index_cast %20 : index to i32
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c128_i32 = arith.constant 128 : i32
    %9 = arith.addi %c128_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %11 = arith.addi %c28_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c32_i32 = arith.constant 32 : i32
      %20 = arith.addi %c32_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c36_i32 = arith.constant 36 : i32
        %26 = arith.addi %c36_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_5 : i32
        %29 = "simt_step.if"(%28) ({
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %30 = arith.addi %c144_i32, %0 : i32
        %true_6 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %26 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %24 = arith.addi %c160_i32, %0 : i32
      %true_4 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) : (i32) -> ()
    }) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %15 = arith.addi %c176_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c40_i32 = arith.constant 40 : i32
    %17 = arith.addi %c40_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %19 = "simt_step.switch"(%18, %0) ({
    ^bb0(%arg2: i32):
      %c44_i32 = arith.constant 44 : i32
      %20 = arith.addi %c44_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c48_i32 = arith.constant 48 : i32
        %44 = arith.addi %c48_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %46 = simt_step.subgroup_id
        %47 = arith.index_cast %46 : index to i32
        %48 = "simt_step.switch"(%45, %47) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %true_13 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %52 = arith.addi %c192_i32, %0 : i32
          %true_14 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %49 = arith.addi %c208_i32, %0 : i32
        %true_12 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) : (i32) -> ()
      }, {
        %c52_i32 = arith.constant 52 : i32
        %44 = arith.addi %c52_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %46 = simt_step.lane_id
        %47 = arith.index_cast %46 : index to i32
        %48 = "simt_step.switch"(%45, %47) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          %true_14 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %52 = arith.addi %c224_i32, %0 : i32
          %true_15 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb2(%54: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          %55 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %49 = arith.addi %c240_i32, %0 : i32
        %true_12 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %24 = arith.addi %c256_i32, %0 : i32
      %true_4 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %26 = arith.addi %c272_i32, %0 : i32
      %true_6 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %29 = arith.addi %c56_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = simt_step.lane_id
      %32 = arith.index_cast %31 : index to i32
      %33 = "simt_step.switch"(%30, %32) ({
      ^bb0(%arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %44 = arith.addi %c60_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %46 = simt_step.subgroup_id
        %47 = arith.index_cast %46 : index to i32
        %48 = "simt_step.switch"(%45, %47) ({
        ^bb0(%arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %65 = arith.addi %0, %c4_i32_21 : i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %67 = simt_step.lane_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb2(%69: i32):  // no predecessors
          %c4_i32_22 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_22) {fallthrough = false} : (i32) -> ()
        ^bb3(%70: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %71 = arith.addi %0, %c3_i32 : i32
          %true_23 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %72 = arith.addi %c288_i32, %0 : i32
          %true_24 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %49 = arith.addi %c304_i32, %0 : i32
        %true_12 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb1(%51: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %65 = arith.muli %arg5, %c4_i32_21 : i32
          %66 = arith.addi %65, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %67 = arith.addi %c64_i32, %66 : i32
          %68 = "simt_step.buffer.load"(%arg1, %67) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %69 = arith.cmpi ne, %68, %c0_i32_22 : i32
          "simt_step.condition"(%69, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %65 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %66 = arith.addi %arg5, %c1_i32 : i32
          %true_21 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %67 = arith.muli %arg5, %c4_i32_22 : i32
          %68 = arith.addi %c320_i32, %67 : i32
          %69 = arith.addi %68, %0 : i32
          %true_23 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65, %66) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %53 = arith.addi %c336_i32, %0 : i32
        %true_16 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%55: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %56 = arith.addi %c84_i32, %0 : i32
        %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
        %58 = simt_step.lane_id
        %59 = arith.index_cast %58 : index to i32
        %60 = "simt_step.switch"(%57, %59) ({
        ^bb0(%arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %65 = arith.addi %0, %c4_i32_21 : i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %67 = simt_step.subgroup_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) {fallthrough = true} : (i32) -> ()
        ^bb2(%69: i32):  // no predecessors
          %70 = simt_step.subgroup_id
          %71 = arith.index_cast %70 : index to i32
          %true_22 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %72 = arith.addi %c352_i32, %0 : i32
          %true_23 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        ^bb3(%74: i32):  // no predecessors
          %true_24 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %75 = arith.addi %c368_i32, %0 : i32
          %true_25 = arith.constant true
          %76 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %75, %76) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %61 = arith.addi %c384_i32, %0 : i32
        %true_18 = arith.constant true
        %62 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
      ^bb3(%63: i32):  // no predecessors
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %64:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %65 = arith.muli %arg5, %c4_i32_21 : i32
          %66 = arith.addi %65, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %67 = arith.addi %c88_i32, %66 : i32
          %68 = "simt_step.buffer.load"(%arg1, %67) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %69 = arith.cmpi ne, %68, %c0_i32_22 : i32
          "simt_step.condition"(%69, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %65 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %66 = arith.addi %arg5, %c1_i32 : i32
          %true_21 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %67 = arith.muli %arg5, %c4_i32_22 : i32
          %68 = arith.addi %c400_i32, %67 : i32
          %69 = arith.addi %68, %0 : i32
          %true_23 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65, %66) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%64#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %34 = arith.addi %c416_i32, %0 : i32
      %true_8 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb2(%36: i32):  // no predecessors
      %c108_i32 = arith.constant 108 : i32
      %37 = arith.addi %c108_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %39 = simt_step.lane_id
      %40 = arith.index_cast %39 : index to i32
      %41 = "simt_step.switch"(%38, %40) ({
      ^bb0(%arg3: i32):
        %c112_i32 = arith.constant 112 : i32
        %44 = arith.addi %c112_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %46 = "simt_step.switch"(%45, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %63 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb2(%65: i32):  // no predecessors
          %66 = simt_step.subgroup_id
          %67 = arith.index_cast %66 : index to i32
          %true_16 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %68 = arith.addi %c432_i32, %0 : i32
          %true_17 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %47 = arith.addi %c448_i32, %0 : i32
        %true_12 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb1(%49: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %50 = arith.addi %c116_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %52 = simt_step.subgroup_id
        %53 = arith.index_cast %52 : index to i32
        %54 = "simt_step.switch"(%51, %53) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%63: i32):  // no predecessors
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb2(%66: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_15 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %67 = arith.addi %c464_i32, %0 : i32
          %true_16 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %55 = arith.addi %c480_i32, %0 : i32
        %true_14 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = true} : (i32) -> ()
      ^bb2(%57: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %58 = arith.addi %c120_i32, %0 : i32
        %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
        %60 = simt_step.subgroup_id
        %61 = arith.index_cast %60 : index to i32
        %62 = "simt_step.switch"(%59, %61) ({
        ^bb0(%arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %true_16 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %63 = arith.addi %c496_i32, %0 : i32
          %true_17 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%65: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%66: i32):  // no predecessors
          %67 = simt_step.subgroup_id
          %68 = arith.index_cast %67 : index to i32
          %true_18 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %69 = arith.addi %c512_i32, %0 : i32
          %true_19 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
    ^bb3(%42: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %43:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %44 = arith.muli %arg4, %c4_i32_11 : i32
        %45 = arith.addi %44, %0 : i32
        %c124_i32 = arith.constant 124 : i32
        %46 = arith.addi %c124_i32, %45 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_12 : i32
        "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %44 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %45 = arith.addi %arg4, %c1_i32 : i32
        %true_11 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %46 = arith.muli %arg4, %c4_i32_12 : i32
        %47 = arith.addi %c528_i32, %46 : i32
        %48 = arith.addi %47, %0 : i32
        %true_13 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44, %45) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

