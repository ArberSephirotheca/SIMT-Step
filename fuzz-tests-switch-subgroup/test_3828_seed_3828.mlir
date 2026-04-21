module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %5 = "simt_step.switch"(%4, %c0_i32_1) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_2 = arith.constant 0 : i32
          %7 = arith.addi %c0_i32_2, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
        ^bb1(%8: i32):  // no predecessors
          %true_3 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %10 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) {fallthrough = true} : (i32) -> ()
        ^bb2(%11: i32):  // no predecessors
          %true_4 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %13 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = simt_step.lane_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %9 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %true_1 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %12 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
        ^bb2(%13: i32):  // no predecessors
          %true_2 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %15 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
        ^bb3(%16: i32):  // no predecessors
          %true_3 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %18 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %3 = arith.addi %c112_i32, %arg0 : i32
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
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %11 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %11 = arith.remsi %0, %c3_i32 : i32
        %12 = "simt_step.switch"(%11, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %14 = arith.addi %arg4, %c2_i32 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %c4_i32_4 = arith.constant 4 : i32
          %16 = arith.addi %15, %c4_i32_4 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          %c3_i32_5 = arith.constant 3 : i32
          %18 = arith.addi %17, %c3_i32_5 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_3 = arith.constant 1 : i32
        %13 = arith.addi %arg3, %c1_i32_3 : i32
        "simt_step.yield"(%arg2, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %8 = arith.addi %0, %c1_i32 : i32
    %9 = "simt_step.switch"(%7, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %10 = arith.addi %c12_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %12 = arith.addi %0, %c2_i32 : i32
      %13 = "simt_step.switch"(%11, %12) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %36 = arith.addi %c16_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %true_11 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %44 = arith.addi %c128_i32, %0 : i32
          %true_12 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %true_13 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %50 = arith.addi %c144_i32, %0 : i32
          %true_14 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%52: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %true_15 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %53 = arith.addi %c160_i32, %0 : i32
          %true_16 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %40 = simt_step.subgroup_id
        %41 = arith.index_cast %40 : index to i32
        %true_8 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %42 = arith.addi %c176_i32, %0 : i32
        %true_9 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %15 = arith.addi %c20_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = "simt_step.switch"(%16, %0) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %36 = arith.addi %c24_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_8 = arith.constant 1 : i32
        %38 = "simt_step.switch"(%37, %c1_i32_8) ({
        ^bb0(%arg4: i32):
          %43 = simt_step.subgroup_id
          %44 = arith.index_cast %43 : index to i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          %true_14 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %46 = arith.addi %c192_i32, %0 : i32
          %true_15 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_13) {fallthrough = true} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %c2_i32_16 = arith.constant 2 : i32
          %49 = arith.addi %0, %c2_i32_16 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_13 : i32
          %44 = arith.addi %43, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %45 = arith.addi %c28_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_14 : i32
          "simt_step.condition"(%47, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %43 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %44 = arith.addi %arg5, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_15 : i32
          %46 = arith.addi %c208_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_16 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %41 = arith.addi %c224_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %18 = arith.addi %c240_i32, %0 : i32
      %true_1 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %21 = arith.addi %c48_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_2 : i32
      %24 = "simt_step.if"(%23) ({
        %c52_i32 = arith.constant 52 : i32
        %36 = arith.addi %c52_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_8 : i32
        %39 = "simt_step.if"(%38) ({
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %40 = arith.addi %c256_i32, %0 : i32
        %true_9 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %36 = simt_step.subgroup_id
        %37 = arith.index_cast %36 : index to i32
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %25 = arith.addi %c272_i32, %0 : i32
      %true_3 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %27 = arith.addi %c288_i32, %0 : i32
      %true_5 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %30 = arith.addi %c56_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
      %33 = "simt_step.if"(%32) ({
        %c60_i32 = arith.constant 60 : i32
        %36 = arith.addi %c60_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_8 = arith.constant 2 : i32
        %38 = arith.addi %0, %c2_i32_8 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg3: i32):
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          %true_9 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %42 = arith.addi %c304_i32, %0 : i32
          %true_10 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %36 = arith.addi %c64_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_8 = arith.constant 4 : i32
        %38 = arith.addi %0, %c4_i32_8 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg3: i32):
          %c0_i32_9 = arith.constant 0 : i32
          %40 = arith.addi %0, %c0_i32_9 : i32
          %true_10 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %41 = arith.addi %c320_i32, %0 : i32
          %true_11 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %44 = simt_step.lane_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%39) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %34 = arith.addi %c336_i32, %0 : i32
      %true_7 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

