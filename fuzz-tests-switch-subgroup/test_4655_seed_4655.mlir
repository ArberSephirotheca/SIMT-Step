module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c1_i32 = arith.constant 1 : i32
    %2 = "simt_step.switch"(%arg3, %c1_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %9 = arith.addi %8, %c1_i32_5 : i32
        %10 = arith.cmpi slt, %arg6, %9 : i32
        "simt_step.condition"(%10, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %9 = "simt_step.if"(%8) ({
          %true_7 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg6, %c4_i32 : i32
          %13 = arith.addi %c16_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg6, %c4_i32 : i32
          %13 = arith.addi %c32_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %10 = arith.addi %arg6, %c1_i32_6 : i32
        "simt_step.yield"(%9, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %9 = arith.addi %8, %c1_i32_5 : i32
        %10 = arith.cmpi slt, %arg6, %9 : i32
        "simt_step.condition"(%10, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %9 = "simt_step.if"(%8) ({
          %true_7 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg6, %c4_i32 : i32
          %13 = arith.addi %c48_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg6, %c4_i32 : i32
          %13 = arith.addi %c64_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %10 = arith.addi %arg6, %c1_i32_6 : i32
        "simt_step.yield"(%9, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %4 = arith.select %3, %0, %2 : i32
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
      %23 = arith.addi %c8_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_2 : i32
      "simt_step.if"(%25) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_10 : i32
        %37 = arith.addi %36, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %38 = arith.addi %c16_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_11 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c36_i32 = arith.constant 36 : i32
        %36 = arith.addi %c36_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = simt_step.lane_id
        %39 = arith.index_cast %38 : index to i32
        %40 = "simt_step.switch"(%37, %39) ({
        ^bb0(%arg5: i32):
          %c1_i32_13 = arith.constant 1 : i32
          %47 = arith.addi %0, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %48 = arith.addi %c80_i32, %0 : i32
          %true_15 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %41 = arith.addi %arg3, %40 : i32
        %c1_i32 = arith.constant 1 : i32
        %42 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_11 : i32
        %44 = arith.addi %c96_i32, %43 : i32
        %45 = arith.addi %44, %0 : i32
        %true_12 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41, %42) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_4 = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %24 = arith.addi %c112_i32, %0 : i32
      %true_5 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %27 = arith.addi %c40_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = simt_step.subgroup_id
      %30 = arith.index_cast %29 : index to i32
      %31 = "simt_step.switch"(%28, %30) ({
      ^bb0(%arg3: i32):
        %true_10 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %36 = arith.addi %c128_i32, %0 : i32
        %true_11 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %40 = arith.addi %c44_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %42 = arith.addi %0, %c0_i32_12 : i32
        %43 = "simt_step.switch"(%41, %42) ({
        ^bb0(%arg4: i32):
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = true} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %true_17 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %51 = arith.addi %c144_i32, %0 : i32
          %true_18 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %44 = arith.addi %c160_i32, %0 : i32
        %true_14 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %46 = arith.addi %c176_i32, %0 : i32
        %true_16 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %33:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_10 : i32
        %37 = arith.addi %36, %0 : i32
        %c48_i32 = arith.constant 48 : i32
        %38 = arith.addi %c48_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_11 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %36 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_11 : i32
        %39 = arith.addi %c192_i32, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_12 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %34 = arith.addi %c208_i32, %0 : i32
      %true_9 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c224_i32 = arith.constant 224 : i32
    %11 = arith.addi %c224_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %13 = arith.addi %c68_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %15 = simt_step.subgroup_id
    %16 = arith.index_cast %15 : index to i32
    %17 = "simt_step.switch"(%14, %16) ({
    ^bb0(%arg2: i32):
      %true_2 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %23 = arith.addi %c240_i32, %0 : i32
      %true_3 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %26 = arith.addi %c72_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_4 : i32
      %29 = "simt_step.if"(%28) ({
        %c76_i32 = arith.constant 76 : i32
        %34 = arith.addi %c76_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.subgroup_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_8 : i32
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          %true_9 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %43 = arith.addi %c256_i32, %0 : i32
          %true_10 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %34 = arith.addi %c80_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.lane_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg3: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %true_11 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %41 = arith.addi %c272_i32, %0 : i32
          %true_12 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %44 = simt_step.lane_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %49 = arith.addi %0, %c2_i32 : i32
          %true_13 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %50 = arith.addi %c288_i32, %0 : i32
          %true_14 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %39 = arith.addi %c304_i32, %0 : i32
        %true_9 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %30 = arith.addi %c320_i32, %0 : i32
      %true_5 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %33:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_8 : i32
        %35 = arith.addi %34, %0 : i32
        %c84_i32 = arith.constant 84 : i32
        %36 = arith.addi %c84_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_9 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %34 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %35 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_9 : i32
        %37 = arith.addi %c336_i32, %36 : i32
        %38 = arith.addi %37, %0 : i32
        %true_10 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34, %35) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c104_i32 = arith.constant 104 : i32
    %18 = arith.addi %c104_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %20 = simt_step.subgroup_id
    %21 = arith.index_cast %20 : index to i32
    %22 = "simt_step.switch"(%19, %21) ({
    ^bb0(%arg2: i32):
      %c108_i32 = arith.constant 108 : i32
      %23 = arith.addi %c108_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_2 : i32
      %26 = "simt_step.if"(%25) ({
        %c0_i32_13 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_13) : (i32) -> ()
      }, {
        %c112_i32 = arith.constant 112 : i32
        %52 = arith.addi %c112_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %54 = arith.cmpi ne, %53, %c0_i32_13 : i32
        %55 = "simt_step.if"(%54) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %58 = simt_step.lane_id
          %59 = arith.index_cast %58 : index to i32
          "simt_step.yield"(%59) : (i32) -> ()
        }) : (i1) -> i32
        %c352_i32 = arith.constant 352 : i32
        %56 = arith.addi %c352_i32, %0 : i32
        %true_14 = arith.constant true
        %57 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%55) : (i32) -> ()
      }) : (i1) -> i32
      %c368_i32 = arith.constant 368 : i32
      %27 = arith.addi %c368_i32, %0 : i32
      %true_3 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %29 = arith.addi %c384_i32, %0 : i32
      %true_5 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb1(%31: i32):  // no predecessors
      %c116_i32 = arith.constant 116 : i32
      %32 = arith.addi %c116_i32, %0 : i32
      %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
      %34 = simt_step.lane_id
      %35 = arith.index_cast %34 : index to i32
      %36 = "simt_step.switch"(%33, %35) ({
      ^bb0(%arg3: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %52 = arith.addi %0, %c4_i32_13 : i32
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      ^bb1(%53: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %54 = arith.addi %c120_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %56 = simt_step.lane_id
        %57 = arith.index_cast %56 : index to i32
        %58 = "simt_step.switch"(%55, %57) ({
        ^bb0(%arg4: i32):
          %68 = simt_step.lane_id
          %69 = arith.index_cast %68 : index to i32
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        ^bb1(%70: i32):  // no predecessors
          %true_18 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %71 = arith.addi %c400_i32, %0 : i32
          %true_19 = arith.constant true
          %72 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%73: i32):  // no predecessors
          %74 = simt_step.lane_id
          %75 = arith.index_cast %74 : index to i32
          "simt_step.yield"(%75) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
      ^bb2(%59: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %60 = arith.addi %c124_i32, %0 : i32
        %61 = "simt_step.buffer.load"(%arg1, %60) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %62 = arith.cmpi ne, %61, %c0_i32_14 : i32
        %63 = "simt_step.if"(%62) ({
          %c1_i32 = arith.constant 1 : i32
          %68 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%68) : (i32) -> ()
        }, {
          %68 = simt_step.lane_id
          %69 = arith.index_cast %68 : index to i32
          "simt_step.yield"(%69) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %64 = arith.addi %c416_i32, %0 : i32
        %true_15 = arith.constant true
        %65 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %66 = arith.addi %c432_i32, %0 : i32
        %true_17 = arith.constant true
        %67 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %37 = arith.addi %c448_i32, %0 : i32
      %true_7 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    ^bb2(%39: i32):  // no predecessors
      %c128_i32 = arith.constant 128 : i32
      %40 = arith.addi %c128_i32, %0 : i32
      %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %42 = arith.cmpi ne, %41, %c0_i32_8 : i32
      %43 = "simt_step.if"(%42) ({
        %c132_i32 = arith.constant 132 : i32
        %52 = arith.addi %c132_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %54 = simt_step.lane_id
        %55 = arith.index_cast %54 : index to i32
        %56 = "simt_step.switch"(%53, %55) ({
        ^bb0(%arg3: i32):
          %true_13 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %57 = arith.addi %c464_i32, %0 : i32
          %true_14 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %true_15 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %60 = arith.addi %c480_i32, %0 : i32
          %true_16 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%56) : (i32) -> ()
      }, {
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %53 = arith.muli %arg4, %c4_i32_15 : i32
          %54 = arith.addi %53, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %55 = arith.addi %c136_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_16 : i32
          "simt_step.condition"(%57, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %53 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %54 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %55 = arith.muli %arg4, %c4_i32_16 : i32
          %56 = arith.addi %c496_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_17 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%52#0) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %44 = arith.addi %c512_i32, %0 : i32
      %true_9 = arith.constant true
      %45 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c528_i32 = arith.constant 528 : i32
      %46 = arith.addi %c528_i32, %0 : i32
      %true_11 = arith.constant true
      %47 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
    ^bb3(%48: i32):  // no predecessors
      %c156_i32 = arith.constant 156 : i32
      %49 = arith.addi %c156_i32, %0 : i32
      %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_12 = arith.constant 4 : i32
      %51 = "simt_step.switch"(%50, %c4_i32_12) ({
      ^bb0(%arg3: i32):
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %63 = arith.muli %arg5, %c4_i32_19 : i32
          %64 = arith.addi %63, %0 : i32
          %c160_i32 = arith.constant 160 : i32
          %65 = arith.addi %c160_i32, %64 : i32
          %66 = "simt_step.buffer.load"(%arg1, %65) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %67 = arith.cmpi ne, %66, %c0_i32_20 : i32
          "simt_step.condition"(%67, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %63 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %64 = arith.addi %arg5, %c1_i32 : i32
          %true_19 = arith.constant true
          %c544_i32 = arith.constant 544 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %65 = arith.muli %arg5, %c4_i32_20 : i32
          %66 = arith.addi %c544_i32, %65 : i32
          %67 = arith.addi %66, %0 : i32
          %true_21 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63, %64) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%52#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%53: i32):  // no predecessors
        %c180_i32 = arith.constant 180 : i32
        %54 = arith.addi %c180_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %56 = arith.cmpi ne, %55, %c0_i32_15 : i32
        %57 = "simt_step.if"(%56) ({
          %63 = simt_step.subgroup_id
          %64 = arith.index_cast %63 : index to i32
          "simt_step.yield"(%64) : (i32) -> ()
        }, {
          %63 = simt_step.subgroup_id
          %64 = arith.index_cast %63 : index to i32
          "simt_step.yield"(%64) : (i32) -> ()
        }) : (i1) -> i32
        %c560_i32 = arith.constant 560 : i32
        %58 = arith.addi %c560_i32, %0 : i32
        %true_16 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c576_i32 = arith.constant 576 : i32
        %60 = arith.addi %c576_i32, %0 : i32
        %true_18 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = true} : (i32) -> ()
      ^bb2(%62: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

