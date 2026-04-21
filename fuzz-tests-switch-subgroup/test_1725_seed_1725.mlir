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
      %2 = simt_step.subgroup_id
      %3 = arith.index_cast %2 : index to i32
      %4 = "simt_step.switch"(%1, %3) ({
      ^bb0(%arg6: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %6 = "simt_step.switch"(%arg3, %c0_i32_1) ({
        ^bb0(%arg7: i32):
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %25 = arith.muli %arg5, %c4_i32_9 : i32
          %26 = arith.addi %c0_i32_8, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_10 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %30 = arith.muli %arg5, %c4_i32_11 : i32
          %31 = arith.addi %c16_i32, %30 : i32
          %32 = arith.addi %31, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.muli %arg5, %c4_i32 : i32
        %9 = arith.addi %c32_i32, %8 : i32
        %10 = arith.addi %9, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %true_2 = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_3 = arith.constant 4 : i32
        %13 = arith.muli %arg5, %c4_i32_3 : i32
        %14 = arith.addi %c48_i32, %13 : i32
        %15 = arith.addi %14, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %18 = "simt_step.if"(%17) ({
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg5, %c4_i32_8 : i32
          %26 = arith.addi %c64_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg5, %c4_i32_8 : i32
          %26 = arith.addi %c80_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb3(%19: i32):  // no predecessors
        %true_5 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %21 = arith.muli %arg5, %c4_i32_6 : i32
        %22 = arith.addi %c96_i32, %21 : i32
        %23 = arith.addi %22, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%4, %5) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = "simt_step.switch"(%6, %c0_i32_0) ({
    ^bb0(%arg2: i32):
      %true = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %13 = arith.addi %c112_i32, %0 : i32
      %true_1 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %0, %c1_i32 : i32
      %19 = "simt_step.switch"(%17, %18) ({
      ^bb0(%arg3: i32):
        %22 = simt_step.subgroup_id
        %23 = arith.index_cast %22 : index to i32
        %true_4 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %24 = arith.addi %c128_i32, %0 : i32
        %true_5 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %27 = simt_step.lane_id
        %28 = arith.index_cast %27 : index to i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %20 = arith.addi %c144_i32, %0 : i32
      %true_3 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.lane_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c20_i32 = arith.constant 20 : i32
      %13 = arith.addi %c20_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = "simt_step.switch"(%14, %0) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %22 = arith.addi %c24_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
        %25 = "simt_step.if"(%24) ({
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %c3_i32_16 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32_16 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %26 = arith.addi %c160_i32, %0 : i32
        %true_7 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %29 = arith.addi %c28_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_8 : i32
        %32 = "simt_step.if"(%31) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %47 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %33 = arith.addi %c176_i32, %0 : i32
        %true_9 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %36 = arith.addi %c32_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = simt_step.lane_id
        %39 = arith.index_cast %38 : index to i32
        %40 = "simt_step.switch"(%37, %39) ({
        ^bb0(%arg4: i32):
          %true_16 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %47 = arith.addi %c192_i32, %0 : i32
          %true_17 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) {fallthrough = true} : (i32) -> ()
        ^bb2(%52: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          %53 = arith.addi %0, %c0_i32_18 : i32
          %true_19 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %54 = arith.addi %c208_i32, %0 : i32
          %true_20 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %41 = arith.addi %c224_i32, %0 : i32
        %true_11 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
      ^bb3(%43: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_16 : i32
          %48 = arith.addi %47, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %49 = arith.addi %c36_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_17 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_17 : i32
          %50 = arith.addi %c240_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_18 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %45 = arith.addi %c256_i32, %0 : i32
        %true_15 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %16 = arith.addi %c272_i32, %0 : i32
      %true_1 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_6 : i32
        %23 = arith.addi %22, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %24 = arith.addi %c56_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c76_i32 = arith.constant 76 : i32
        %22 = arith.addi %c76_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %24 = "simt_step.switch"(%23, %c2_i32) ({
        ^bb0(%arg5: i32):
          %31 = simt_step.subgroup_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %true_10 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %35 = arith.addi %c288_i32, %0 : i32
          %true_11 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %25 = arith.addi %arg3, %24 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        %true_6 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_7 : i32
        %28 = arith.addi %c304_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_8 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_4 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %20 = arith.addi %c320_i32, %0 : i32
      %true_5 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    return
  }
}

