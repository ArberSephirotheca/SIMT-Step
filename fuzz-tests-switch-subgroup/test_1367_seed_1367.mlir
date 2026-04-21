module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %c2_i32_0 = arith.constant 2 : i32
    %3 = arith.addi %arg0, %c2_i32_0 : i32
    %4 = "simt_step.switch"(%2, %3) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %8 = "simt_step.switch"(%7, %c0_i32_2) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %17 = "simt_step.if"(%16) ({
          %true_11 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %28 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %true_11 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %28 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %true_8 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %20 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %true_9 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %23 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %true_10 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %26 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %10 = arith.addi %c96_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_10 : i32
          %20 = arith.cmpi slt, %arg8, %19 : i32
          "simt_step.condition"(%20, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_9 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.muli %arg8, %c4_i32_10 : i32
          %20 = arith.addi %c112_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_11 = arith.constant 1 : i32
          %22 = arith.addi %arg8, %c1_i32_11 : i32
          "simt_step.yield"(%18, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%16#0, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.remsi %arg3, %c3_i32 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = "simt_step.switch"(%14, %c4_i32_6) ({
      ^bb0(%arg5: i32):
        %c2_i32_7 = arith.constant 2 : i32
        %16 = arith.remsi %arg3, %c2_i32_7 : i32
        %17 = "simt_step.switch"(%16, %arg0) ({
        ^bb0(%arg6: i32):
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %26 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_12 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %29 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %true_13 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %32 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg7, %c4_i32_12 : i32
          %27 = arith.addi %c176_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c2_i32_10 = arith.constant 2 : i32
        %21 = arith.remsi %arg3, %c2_i32_10 : i32
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg6: i32):
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %26 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_12 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %29 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %6 = arith.select %5, %0, %4 : i32
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
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %20 = arith.addi %0, %c4_i32_3 : i32
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %22 = arith.addi %c12_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %24 = arith.addi %0, %c1_i32 : i32
      %25 = "simt_step.switch"(%23, %24) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %37 = arith.addi %c16_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %39 = arith.addi %0, %c3_i32 : i32
        %40 = "simt_step.switch"(%38, %39) ({
        ^bb0(%arg4: i32):
          %true_18 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %56 = arith.addi %c224_i32, %0 : i32
          %true_19 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %true_20 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %59 = arith.addi %c240_i32, %0 : i32
          %true_21 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %c1_i32_22 = arith.constant 1 : i32
          %62 = arith.addi %0, %c1_i32_22 : i32
          "simt_step.yield"(%62) {fallthrough = true} : (i32) -> ()
        ^bb3(%63: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %41 = arith.addi %c256_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %44 = arith.addi %c20_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_13 : i32
        %47 = "simt_step.if"(%46) ({
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          %c1_i32_18 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %48 = arith.addi %c272_i32, %0 : i32
        %true_14 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %50 = arith.addi %c288_i32, %0 : i32
        %true_16 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      ^bb2(%52: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %53 = arith.addi %c24_i32, %0 : i32
        %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_17 = arith.constant 1 : i32
        %55 = "simt_step.switch"(%54, %c1_i32_17) ({
        ^bb0(%arg4: i32):
          %c1_i32_18 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          %true_19 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %59 = arith.addi %c304_i32, %0 : i32
          %true_20 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %26 = arith.addi %c320_i32, %0 : i32
      %true_5 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %29 = arith.addi %c28_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %31 = arith.addi %0, %c0_i32_6 : i32
      %32 = "simt_step.switch"(%30, %31) ({
      ^bb0(%arg3: i32):
        %c32_i32 = arith.constant 32 : i32
        %37 = arith.addi %c32_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        %40 = "simt_step.if"(%39) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %41 = arith.addi %c336_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %43 = arith.addi %c352_i32, %0 : i32
        %true_14 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c4_i32_15 = arith.constant 4 : i32
        %true_16 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %46 = arith.addi %c368_i32, %0 : i32
        %true_17 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %49:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_20 : i32
          %51 = arith.addi %50, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %52 = arith.addi %c36_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_21 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32_20 : i32
          %true_21 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_22 : i32
          %53 = arith.addi %c384_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_23 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%49#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_11 : i32
        %38 = arith.addi %37, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %39 = arith.addi %c56_i32, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_12 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c76_i32 = arith.constant 76 : i32
        %37 = arith.addi %c76_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_11 = arith.constant 1 : i32
        %39 = arith.addi %0, %c1_i32_11 : i32
        %40 = "simt_step.switch"(%38, %39) ({
        ^bb0(%arg5: i32):
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_16 : i32
          %true_17 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %51 = arith.addi %c400_i32, %0 : i32
          %true_18 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %41 = arith.addi %arg3, %40 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %42 = arith.addi %arg4, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_14 : i32
        %44 = arith.addi %c416_i32, %43 : i32
        %45 = arith.addi %44, %0 : i32
        %true_15 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41, %42) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %35 = arith.addi %c432_i32, %0 : i32
      %true_10 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c80_i32 = arith.constant 80 : i32
    %11 = arith.addi %c80_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_1 = arith.constant 4 : i32
    %13 = "simt_step.switch"(%12, %c4_i32_1) ({
    ^bb0(%arg2: i32):
      %c84_i32 = arith.constant 84 : i32
      %20 = arith.addi %c84_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.subgroup_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_17 : i32
          %54 = arith.addi %53, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %55 = arith.addi %c88_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_18 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_18 : i32
          %56 = arith.addi %c448_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_19 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c108_i32 = arith.constant 108 : i32
        %45 = arith.addi %c108_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_13 : i32
        %48 = "simt_step.if"(%47) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          %53 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%53) : (i32) -> ()
        }) : (i1) -> i32
        %c464_i32 = arith.constant 464 : i32
        %49 = arith.addi %c464_i32, %0 : i32
        %true_14 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %51 = arith.addi %c480_i32, %0 : i32
        %true_16 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %25 = arith.addi %c496_i32, %0 : i32
      %true_4 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c512_i32 = arith.constant 512 : i32
      %27 = arith.addi %c512_i32, %0 : i32
      %true_6 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %c112_i32 = arith.constant 112 : i32
      %30 = arith.addi %c112_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %32 = "simt_step.switch"(%31, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c116_i32 = arith.constant 116 : i32
        %43 = arith.addi %c116_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %45 = "simt_step.switch"(%44, %c2_i32) ({
        ^bb0(%arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          %55 = arith.addi %0, %c4_i32_17 : i32
          %true_18 = arith.constant true
          %c528_i32 = arith.constant 528 : i32
          %56 = arith.addi %c528_i32, %0 : i32
          %true_19 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c544_i32 = arith.constant 544 : i32
        %46 = arith.addi %c544_i32, %0 : i32
        %true_12 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb1(%48: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %49 = arith.addi %c120_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %51 = "simt_step.switch"(%50, %c0_i32_13) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %true_16 = arith.constant true
          %c560_i32 = arith.constant 560 : i32
          %55 = arith.addi %c560_i32, %0 : i32
          %true_17 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %58 = simt_step.subgroup_id
          %59 = arith.index_cast %58 : index to i32
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c576_i32 = arith.constant 576 : i32
        %52 = arith.addi %c576_i32, %0 : i32
        %true_15 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      %true_7 = arith.constant true
      %c592_i32 = arith.constant 592 : i32
      %34 = arith.addi %c592_i32, %0 : i32
      %true_8 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c124_i32 = arith.constant 124 : i32
      %37 = arith.addi %c124_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %39 = arith.cmpi ne, %38, %c0_i32_9 : i32
      %40 = "simt_step.if"(%39) ({
        %c128_i32 = arith.constant 128 : i32
        %43 = arith.addi %c128_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_11 : i32
        %46 = "simt_step.if"(%45) ({
          %c2_i32 = arith.constant 2 : i32
          %49 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c608_i32 = arith.constant 608 : i32
        %47 = arith.addi %c608_i32, %0 : i32
        %true_12 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_13 : i32
          %45 = arith.addi %44, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %46 = arith.addi %c132_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_14 : i32
          "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %44 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg4, %c1_i32 : i32
          %true_13 = arith.constant true
          %c624_i32 = arith.constant 624 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_14 : i32
          %47 = arith.addi %c624_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_15 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) : (i32) -> ()
      }) : (i1) -> i32
      %c640_i32 = arith.constant 640 : i32
      %41 = arith.addi %c640_i32, %0 : i32
      %true_10 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c152_i32 = arith.constant 152 : i32
    %14 = arith.addi %c152_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %16 = arith.cmpi ne, %15, %c0_i32_2 : i32
    %17 = "simt_step.if"(%16) ({
      %c156_i32 = arith.constant 156 : i32
      %20 = arith.addi %c156_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c160_i32 = arith.constant 160 : i32
        %26 = arith.addi %c160_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        %30 = "simt_step.switch"(%27, %29) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %0, %c1_i32 : i32
          %true_5 = arith.constant true
          %c656_i32 = arith.constant 656 : i32
          %32 = arith.addi %c656_i32, %0 : i32
          %true_6 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_7 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb3(%37: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c164_i32 = arith.constant 164 : i32
        %26 = arith.addi %c164_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_5 : i32
        %29 = "simt_step.if"(%28) ({
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c672_i32 = arith.constant 672 : i32
        %30 = arith.addi %c672_i32, %0 : i32
        %true_6 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      %c688_i32 = arith.constant 688 : i32
      %24 = arith.addi %c688_i32, %0 : i32
      %true_4 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_5 : i32
        %22 = arith.addi %21, %0 : i32
        %c168_i32 = arith.constant 168 : i32
        %23 = arith.addi %c168_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %21 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c704_i32 = arith.constant 704 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_6 : i32
        %24 = arith.addi %c704_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_7 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) : (i32) -> ()
    }) : (i1) -> i32
    %c720_i32 = arith.constant 720 : i32
    %18 = arith.addi %c720_i32, %0 : i32
    %true = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

