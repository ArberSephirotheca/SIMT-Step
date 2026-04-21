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
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg0, %c1_i32 : i32
      %3 = "simt_step.switch"(%arg3, %2) ({
      ^bb0(%arg4: i32):
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = simt_step.lane_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg5: i32):
          %true_0 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %12 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %true_1 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %15 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
        ^bb2(%16: i32):  // no predecessors
          %true_2 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %18 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb3(%19: i32):  // no predecessors
          %true_3 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %21 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %true = arith.constant true
        %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %10 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %16 = arith.addi %c8_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_4 : i32
      "simt_step.if"(%18) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_4 : i32
      %17 = arith.addi %16, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %16 = arith.addi %arg2, %arg3 : i32
      %c1_i32_4 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32_4 : i32
      %true_5 = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_6 : i32
      %19 = arith.addi %c96_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c32_i32 = arith.constant 32 : i32
    %7 = arith.addi %c32_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_3 : i32
    %10 = "simt_step.if"(%9) ({
      %c36_i32 = arith.constant 36 : i32
      %16 = arith.addi %c36_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg2: i32):
        %c40_i32 = arith.constant 40 : i32
        %23 = arith.addi %c40_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
        %26 = "simt_step.if"(%25) ({
          %c0_i32_12 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %27 = arith.addi %c112_i32, %0 : i32
        %true_7 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_8 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %29 = arith.addi %c128_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_12 : i32
          %34 = arith.addi %33, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %35 = arith.addi %c44_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_13 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_14 : i32
          %36 = arith.addi %c144_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_15 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %21 = arith.addi %c160_i32, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %11 = arith.addi %c176_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c64_i32 = arith.constant 64 : i32
    %13 = arith.addi %c64_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %15 = "simt_step.switch"(%14, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c68_i32 = arith.constant 68 : i32
      %16 = arith.addi %c68_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_14 : i32
          %42 = arith.addi %41, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %43 = arith.addi %c72_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_15 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_14 : i32
          %true_15 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_16 : i32
          %44 = arith.addi %c192_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_17 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %30 = arith.addi %c208_i32, %0 : i32
        %true_9 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %33 = arith.addi %c92_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
        %36 = "simt_step.if"(%35) ({
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c0_i32_14 = arith.constant 0 : i32
          %41 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %37 = arith.addi %c224_i32, %0 : i32
        %true_11 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_14 : i32
          %42 = arith.addi %41, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %43 = arith.addi %c96_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_15 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_14 : i32
          %true_15 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_16 : i32
          %44 = arith.addi %c240_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_17 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %21 = arith.addi %c256_i32, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c116_i32 = arith.constant 116 : i32
      %24 = arith.addi %c116_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = simt_step.subgroup_id
      %27 = arith.index_cast %26 : index to i32
      %28 = "simt_step.switch"(%25, %27) ({
      ^bb0(%arg3: i32):
        %c120_i32 = arith.constant 120 : i32
        %29 = arith.addi %c120_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %31 = "simt_step.switch"(%30, %c2_i32) ({
        ^bb0(%arg4: i32):
          %c0_i32_15 = arith.constant 0 : i32
          %true_16 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %44 = arith.addi %c272_i32, %0 : i32
          %true_17 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %32 = arith.addi %c288_i32, %0 : i32
        %true_7 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_15 : i32
          %45 = arith.addi %44, %0 : i32
          %c124_i32 = arith.constant 124 : i32
          %46 = arith.addi %c124_i32, %45 : i32
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
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_17 : i32
          %47 = arith.addi %c304_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_18 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %36 = arith.addi %c320_i32, %0 : i32
        %true_11 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %39 = simt_step.lane_id
        %40 = arith.index_cast %39 : index to i32
        %true_12 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %41 = arith.addi %c336_i32, %0 : i32
        %true_13 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb3(%43: i32):  // no predecessors
        %c2_i32_14 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

