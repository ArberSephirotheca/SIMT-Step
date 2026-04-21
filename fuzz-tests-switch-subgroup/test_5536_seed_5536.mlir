module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %1 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg0, %c1_i32 : i32
      %3 = "simt_step.switch"(%1, %2) ({
      ^bb0(%arg6: i32):
        %c2_i32 = arith.constant 2 : i32
        %9 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32_2 = arith.constant 1 : i32
        %10 = "simt_step.switch"(%9, %c1_i32_2) ({
        ^bb0(%arg7: i32):
          %true_5 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32_7 : i32
          %21 = arith.addi %c0_i32_6, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_8 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %25 = arith.muli %arg5, %c4_i32_9 : i32
          %26 = arith.addi %c16_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %13 = "simt_step.if"(%12) ({
          %true_5 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32_6 : i32
          %21 = arith.addi %c32_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32_6 : i32
          %21 = arith.addi %c48_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c2_i32_4 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_4 : i32
        %16 = simt_step.lane_id
        %17 = arith.index_cast %16 : index to i32
        %18 = "simt_step.switch"(%15, %17) ({
        ^bb0(%arg7: i32):
          %true_5 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32_6 : i32
          %21 = arith.addi %c64_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg5, %c4_i32_8 : i32
          %26 = arith.addi %c80_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32 : i32
      %6 = arith.addi %c96_i32, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32_1 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32_1 : i32
      "simt_step.yield"(%3, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
    %c1_i32 = arith.constant 1 : i32
    %7 = "simt_step.switch"(%6, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_10 : i32
        %26 = arith.addi %25, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %27 = arith.addi %c12_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_11 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_12 : i32
        %28 = arith.addi %c112_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_13 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_10 : i32
        %26 = arith.addi %25, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %27 = arith.addi %c32_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_11 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c52_i32 = arith.constant 52 : i32
        %25 = arith.addi %c52_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %27 = "simt_step.switch"(%26, %0) ({
        ^bb0(%arg5: i32):
          %34 = simt_step.subgroup_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %true_14 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %37 = arith.addi %c128_i32, %0 : i32
          %true_15 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %28 = arith.addi %arg3, %27 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_12 : i32
        %31 = arith.addi %c144_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_13 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %19 = arith.addi %c160_i32, %0 : i32
      %true_8 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %22 = simt_step.lane_id
      %23 = arith.index_cast %22 : index to i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c4_i32_9 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c56_i32 = arith.constant 56 : i32
    %8 = arith.addi %c56_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c60_i32 = arith.constant 60 : i32
      %16 = arith.addi %c60_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg3: i32):
        %true_11 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %40 = arith.addi %c176_i32, %0 : i32
        %true_12 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %21 = arith.addi %c192_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %24 = arith.addi %c64_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = simt_step.subgroup_id
      %27 = arith.index_cast %26 : index to i32
      %28 = "simt_step.switch"(%25, %27) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %41 = arith.addi %c68_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_11 : i32
        %44 = "simt_step.if"(%43) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %57 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %45 = arith.addi %c208_i32, %0 : i32
        %true_12 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %48 = arith.addi %c72_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %50 = simt_step.lane_id
        %51 = arith.index_cast %50 : index to i32
        %52 = "simt_step.switch"(%49, %51) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%60: i32):  // no predecessors
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          %true_17 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %63 = arith.addi %c224_i32, %0 : i32
          %true_18 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb3(%65: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          %true_20 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %66 = arith.addi %c240_i32, %0 : i32
          %true_21 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %53 = arith.addi %c256_i32, %0 : i32
        %true_14 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %55 = arith.addi %c272_i32, %0 : i32
        %true_16 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %29 = arith.addi %c288_i32, %0 : i32
      %true_6 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %31 = arith.addi %c304_i32, %0 : i32
      %true_8 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %34 = arith.addi %c76_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %36 = arith.cmpi ne, %35, %c0_i32_9 : i32
      %37 = "simt_step.if"(%36) ({
        %c80_i32 = arith.constant 80 : i32
        %40 = arith.addi %c80_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_11 : i32
        %43 = "simt_step.if"(%42) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          %46 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %44 = arith.addi %c320_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) : (i32) -> ()
      }, {
        %c84_i32 = arith.constant 84 : i32
        %40 = arith.addi %c84_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_11 : i32
        %43 = "simt_step.if"(%42) ({
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %44 = arith.addi %c336_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      %c352_i32 = arith.constant 352 : i32
      %38 = arith.addi %c352_i32, %0 : i32
      %true_10 = arith.constant true
      %39 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c368_i32 = arith.constant 368 : i32
    %13 = arith.addi %c368_i32, %0 : i32
    %true_0 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %15:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_3 : i32
      %17 = arith.addi %16, %0 : i32
      %c88_i32 = arith.constant 88 : i32
      %18 = arith.addi %c88_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %16 = simt_step.lane_id
      %17 = arith.index_cast %16 : index to i32
      %18 = arith.addi %arg2, %17 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32_3 : i32
      %true_4 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_5 : i32
      %21 = arith.addi %c384_i32, %20 : i32
      %22 = arith.addi %21, %0 : i32
      %true_6 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

