module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %3 = arith.addi %arg0, %c1_i32 : i32
    %4 = "simt_step.switch"(%2, %3) ({
    ^bb0(%arg4: i32):
      %true_3 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %16 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %20 = arith.addi %19, %c1_i32_7 : i32
        %21 = arith.cmpi slt, %arg6, %20 : i32
        "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_6 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %20 = arith.muli %arg6, %c4_i32_7 : i32
        %21 = arith.addi %c32_i32, %20 : i32
        %22 = arith.addi %21, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_8 = arith.constant 1 : i32
        %23 = arith.addi %arg6, %c1_i32_8 : i32
        "simt_step.yield"(%19, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %6 = arith.select %5, %0, %4 : i32
    %c4_i32 = arith.constant 4 : i32
    %7 = arith.remsi %arg3, %c4_i32 : i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg4: i32):
      %true_3 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %16 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %24 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %25 = arith.addi %24, %c1_i32_10 : i32
        %26 = arith.cmpi slt, %arg6, %25 : i32
        "simt_step.condition"(%26, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_9 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %25 = arith.muli %arg6, %c4_i32_10 : i32
        %26 = arith.addi %c64_i32, %25 : i32
        %27 = arith.addi %26, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_11 = arith.constant 1 : i32
        %28 = arith.addi %arg6, %c1_i32_11 : i32
        "simt_step.yield"(%24, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %21 = "simt_step.if"(%20) ({
        %c0_i32_9 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %25 = "simt_step.if"(%24) ({
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %27 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %27 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %true_9 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %25 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %24 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %25 = arith.addi %24, %c1_i32_10 : i32
        %26 = arith.cmpi slt, %arg6, %25 : i32
        "simt_step.condition"(%26, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_13 : i32
          %28 = arith.cmpi slt, %arg8, %27 : i32
          "simt_step.condition"(%28, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_12 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %27 = arith.muli %arg8, %c4_i32_13 : i32
          %28 = arith.addi %c128_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_14 = arith.constant 1 : i32
          %30 = arith.addi %arg8, %c1_i32_14 : i32
          "simt_step.yield"(%26, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_11 = arith.constant 1 : i32
        %25 = arith.addi %arg6, %c1_i32_11 : i32
        "simt_step.yield"(%24#0, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    %c144_i32 = arith.constant 144 : i32
    %12 = arith.addi %c144_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %14 = arith.select %13, %6, %10 : i32
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %10 = simt_step.subgroup_id
      %11 = arith.index_cast %10 : index to i32
      %true_1 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %12 = arith.addi %c160_i32, %0 : i32
      %true_2 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %0, %c1_i32 : i32
      %true_3 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %16 = arith.addi %c176_i32, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_10 : i32
        %27 = arith.addi %26, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %28 = arith.addi %c12_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_11 : i32
        "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %26 = arith.addi %arg3, %arg4 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %27 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_12 : i32
        %29 = arith.addi %c192_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_13 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %20 = arith.addi %c208_i32, %0 : i32
      %true_8 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %23 = arith.addi %c32_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %25 = "simt_step.switch"(%24, %c0_i32_9) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %26 = arith.addi %c36_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = "simt_step.switch"(%27, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_18 = arith.constant 1 : i32
          %53 = arith.addi %0, %c1_i32_18 : i32
          %true_19 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %54 = arith.addi %c224_i32, %0 : i32
          %true_20 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %57 = arith.addi %0, %c2_i32 : i32
          %true_21 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %58 = arith.addi %c240_i32, %0 : i32
          %true_22 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb2(%60: i32):  // no predecessors
          %c2_i32_23 = arith.constant 2 : i32
          %61 = arith.addi %0, %c2_i32_23 : i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb3(%62: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %30 = arith.addi %c40_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_10 : i32
        %33 = "simt_step.if"(%32) ({
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %34 = arith.addi %c256_i32, %0 : i32
        %true_11 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %37 = arith.addi %c44_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_12 : i32
        %40 = "simt_step.if"(%39) ({
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }, {
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %41 = arith.addi %c272_i32, %0 : i32
        %true_13 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb3(%43: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %44 = arith.addi %c48_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %46 = simt_step.subgroup_id
        %47 = arith.index_cast %46 : index to i32
        %48 = "simt_step.switch"(%45, %47) ({
        ^bb0(%arg4: i32):
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          %true_18 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %58 = arith.addi %c288_i32, %0 : i32
          %true_19 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %49 = arith.addi %c304_i32, %0 : i32
        %true_15 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %51 = arith.addi %c320_i32, %0 : i32
        %true_17 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c336_i32 = arith.constant 336 : i32
    %8 = arith.addi %c336_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

