module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %5 = simt_step.lane_id
      %6 = arith.index_cast %5 : index to i32
      %7 = "simt_step.switch"(%arg3, %6) ({
      ^bb0(%arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %14 = "simt_step.if"(%13) ({
          %true_7 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_8 : i32
          %22 = arith.addi %c16_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_8 : i32
          %22 = arith.addi %c32_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %true_5 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %17 = arith.muli %arg5, %c4_i32_6 : i32
        %18 = arith.addi %c48_i32, %17 : i32
        %19 = arith.addi %18, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.muli %arg5, %c4_i32 : i32
      %10 = arith.addi %c64_i32, %9 : i32
      %11 = arith.addi %10, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%7, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %7 = arith.addi %0, %c4_i32_0 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_8 : i32
        %26 = arith.addi %25, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %27 = arith.addi %c12_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_9 : i32
        %28 = arith.addi %c80_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_10 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_8 : i32
        %26 = arith.addi %25, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %27 = arith.addi %c32_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        %c96_i32 = arith.constant 96 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_9 : i32
        %28 = arith.addi %c96_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_10 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %12 = arith.addi %c112_i32, %0 : i32
      %true_5 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %15 = arith.addi %c52_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      %18 = "simt_step.if"(%17) ({
        %c56_i32 = arith.constant 56 : i32
        %25 = arith.addi %c56_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %27 = "simt_step.switch"(%26, %c2_i32) ({
        ^bb0(%arg3: i32):
          %28 = simt_step.subgroup_id
          %29 = arith.index_cast %28 : index to i32
          %true_8 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %30 = arith.addi %c128_i32, %0 : i32
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          %true_10 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %35 = arith.addi %c144_i32, %0 : i32
          %true_11 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %25 = arith.addi %c60_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %27 = arith.addi %0, %c2_i32 : i32
        %28 = "simt_step.switch"(%26, %27) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %32 = simt_step.subgroup_id
          %33 = arith.index_cast %32 : index to i32
          %true_10 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %34 = arith.addi %c160_i32, %0 : i32
          %true_11 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %29 = arith.addi %c176_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %19 = arith.addi %c192_i32, %0 : i32
      %true_7 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %22 = arith.addi %c64_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %24 = "simt_step.switch"(%23, %0) ({
      ^bb0(%arg3: i32):
        %c68_i32 = arith.constant 68 : i32
        %25 = arith.addi %c68_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_8 : i32
        %28 = "simt_step.if"(%27) ({
          %c0_i32_20 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_20) : (i32) -> ()
        }, {
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %29 = arith.addi %c208_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %32 = arith.addi %c72_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.lane_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg4: i32):
          %c1_i32_20 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_20) {fallthrough = false} : (i32) -> ()
        ^bb1(%57: i32):  // no predecessors
          %58 = simt_step.subgroup_id
          %59 = arith.index_cast %58 : index to i32
          %true_21 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %60 = arith.addi %c224_i32, %0 : i32
          %true_22 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %37 = arith.addi %c240_i32, %0 : i32
        %true_11 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %39 = arith.addi %c256_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%41: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %42 = arith.addi %c76_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_14 : i32
        %45 = "simt_step.if"(%44) ({
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) : (i32) -> ()
        }, {
          %c0_i32_20 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_20) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %46 = arith.addi %c272_i32, %0 : i32
        %true_15 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %48 = arith.addi %c288_i32, %0 : i32
        %true_17 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb3(%50: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %51 = arith.addi %c80_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %53 = arith.addi %0, %c1_i32 : i32
        %54 = "simt_step.switch"(%52, %53) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %57 = arith.addi %0, %c3_i32 : i32
          %true_20 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %58 = arith.addi %c304_i32, %0 : i32
          %true_21 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %61 = simt_step.subgroup_id
          %62 = arith.index_cast %61 : index to i32
          %true_22 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %63 = arith.addi %c320_i32, %0 : i32
          %true_23 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb2(%65: i32):  // no predecessors
          %66 = simt_step.lane_id
          %67 = arith.index_cast %66 : index to i32
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        ^bb3(%68: i32):  // no predecessors
          %69 = simt_step.subgroup_id
          %70 = arith.index_cast %69 : index to i32
          "simt_step.yield"(%70) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_18 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %55 = arith.addi %c336_i32, %0 : i32
        %true_19 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

