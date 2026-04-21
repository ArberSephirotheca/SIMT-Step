module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c3_i32_0 = arith.constant 3 : i32
    %1 = arith.addi %arg0, %c3_i32_0 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %5 = arith.remsi %arg3, %c2_i32 : i32
      %6 = simt_step.lane_id
      %7 = arith.index_cast %6 : index to i32
      %8 = "simt_step.switch"(%5, %7) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %26 = arith.muli %arg7, %c4_i32 : i32
          %27 = arith.addi %c0_i32_11, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %true_7 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %26 = arith.muli %arg7, %c4_i32 : i32
          %27 = arith.addi %c32_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %10 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c0_i32 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_7 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32 : i32
          %22 = arith.addi %c64_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%20, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %20 = "simt_step.if"(%19) ({
          %true_6 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %22 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %22 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %true_2 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %16 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %19, %c1_i32 : i32
        %21 = arith.cmpi slt, %arg6, %20 : i32
        "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %19 = simt_step.subgroup_id
        %20 = arith.index_cast %19 : index to i32
        %21 = "simt_step.switch"(%arg3, %20) ({
        ^bb0(%arg7: i32):
          %true_5 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32 : i32
          %25 = arith.addi %c128_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_6 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_7 : i32
          %30 = arith.addi %c144_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c160_i32 = arith.constant 160 : i32
    %4 = arith.addi %c160_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c3_i32 = arith.constant 3 : i32
    %7 = "simt_step.switch"(%6, %c3_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_1 : i32
      %20 = "simt_step.if"(%19) ({
        %c16_i32 = arith.constant 16 : i32
        %39 = arith.addi %c16_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %41 = arith.addi %0, %c2_i32 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg3: i32):
          %43 = simt_step.subgroup_id
          %44 = arith.index_cast %43 : index to i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          %true_10 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %48 = arith.addi %c176_i32, %0 : i32
          %true_11 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          %true_12 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %53 = arith.addi %c192_i32, %0 : i32
          %true_13 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%42) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %39 = arith.addi %c20_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = "simt_step.switch"(%40, %0) ({
        ^bb0(%arg3: i32):
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          %true_10 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %44 = arith.addi %c208_i32, %0 : i32
          %true_11 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_12 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %47 = arith.addi %c224_i32, %0 : i32
          %true_13 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%41) : (i32) -> ()
      }) : (i1) -> i32
      %c240_i32 = arith.constant 240 : i32
      %21 = arith.addi %c240_i32, %0 : i32
      %true_2 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c4_i32_3 = arith.constant 4 : i32
      %true_4 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %24 = arith.addi %c256_i32, %0 : i32
      %true_5 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c4_i32_3) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %27 = arith.addi %c24_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = "simt_step.switch"(%28, %0) ({
      ^bb0(%arg3: i32):
        %c28_i32 = arith.constant 28 : i32
        %39 = arith.addi %c28_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %41 = "simt_step.switch"(%40, %c2_i32) ({
        ^bb0(%arg4: i32):
          %c3_i32_19 = arith.constant 3 : i32
          %true_20 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %59 = arith.addi %c272_i32, %0 : i32
          %true_21 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_19) {fallthrough = true} : (i32) -> ()
        ^bb1(%61: i32):  // no predecessors
          %62 = simt_step.subgroup_id
          %63 = arith.index_cast %62 : index to i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %43 = arith.addi %c32_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %45 = "simt_step.switch"(%44, %c0_i32_10) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          %60 = arith.addi %0, %c0_i32_19 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %c0_i32_20 = arith.constant 0 : i32
          %62 = arith.addi %0, %c0_i32_20 : i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb3(%63: i32):  // no predecessors
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          %true_21 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %66 = arith.addi %c288_i32, %0 : i32
          %true_22 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %46 = arith.addi %c304_i32, %0 : i32
        %true_12 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %48 = arith.addi %c320_i32, %0 : i32
        %true_14 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%50: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %51 = arith.addi %c36_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %53 = arith.cmpi ne, %52, %c0_i32_15 : i32
        %54 = "simt_step.if"(%53) ({
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) : (i32) -> ()
        }, {
          %c3_i32_19 = arith.constant 3 : i32
          %59 = arith.addi %0, %c3_i32_19 : i32
          "simt_step.yield"(%59) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %55 = arith.addi %c336_i32, %0 : i32
        %true_16 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %57 = arith.addi %c352_i32, %0 : i32
        %true_18 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %30 = arith.addi %c368_i32, %0 : i32
      %true_7 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %33 = arith.addi %c40_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
      %36 = "simt_step.if"(%35) ({
        %c3_i32_10 = arith.constant 3 : i32
        %39 = arith.addi %0, %c3_i32_10 : i32
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %c3_i32_10 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_10) : (i32) -> ()
      }) : (i1) -> i32
      %c384_i32 = arith.constant 384 : i32
      %37 = arith.addi %c384_i32, %0 : i32
      %true_9 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c44_i32 = arith.constant 44 : i32
    %8 = arith.addi %c44_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.lane_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %true_1 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %17 = arith.addi %c400_i32, %0 : i32
      %true_2 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %20 = simt_step.lane_id
      %21 = arith.index_cast %20 : index to i32
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %23 = arith.addi %c48_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = simt_step.subgroup_id
      %26 = arith.index_cast %25 : index to i32
      %27 = "simt_step.switch"(%24, %26) ({
      ^bb0(%arg3: i32):
        %c52_i32 = arith.constant 52 : i32
        %37 = arith.addi %c52_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %39 = "simt_step.switch"(%38, %c2_i32) ({
        ^bb0(%arg4: i32):
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          %true_15 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %61 = arith.addi %c416_i32, %0 : i32
          %true_16 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb1(%63: i32):  // no predecessors
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb2(%66: i32):  // no predecessors
          %c2_i32_17 = arith.constant 2 : i32
          %67 = arith.addi %0, %c2_i32_17 : i32
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %40 = arith.addi %c432_i32, %0 : i32
        %true_8 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %43 = arith.addi %c56_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_9 : i32
        %46 = "simt_step.if"(%45) ({
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) : (i32) -> ()
        }, {
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %47 = arith.addi %c448_i32, %0 : i32
        %true_10 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %50 = simt_step.subgroup_id
        %51 = arith.index_cast %50 : index to i32
        %true_11 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %52 = arith.addi %c464_i32, %0 : i32
        %true_12 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb3(%54: i32):  // no predecessors
        %55 = simt_step.lane_id
        %56 = arith.index_cast %55 : index to i32
        %true_13 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %57 = arith.addi %c480_i32, %0 : i32
        %true_14 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %28 = arith.addi %c496_i32, %0 : i32
      %true_4 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %31 = arith.addi %c60_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_5 : i32
      %34 = "simt_step.if"(%33) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_9 : i32
          %39 = arith.addi %38, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %40 = arith.addi %c64_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_10 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_10 : i32
          %41 = arith.addi %c512_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_11 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) : (i32) -> ()
      }, {
        %c84_i32 = arith.constant 84 : i32
        %37 = arith.addi %c84_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %39 = "simt_step.switch"(%38, %c1_i32) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %43 = simt_step.lane_id
          %44 = arith.index_cast %43 : index to i32
          %true_9 = arith.constant true
          %c528_i32 = arith.constant 528 : i32
          %45 = arith.addi %c528_i32, %0 : i32
          %true_10 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c544_i32 = arith.constant 544 : i32
        %40 = arith.addi %c544_i32, %0 : i32
        %true_8 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) : (i32) -> ()
      }) : (i1) -> i32
      %c560_i32 = arith.constant 560 : i32
      %35 = arith.addi %c560_i32, %0 : i32
      %true_6 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c576_i32 = arith.constant 576 : i32
    %13 = arith.addi %c576_i32, %0 : i32
    %true_0 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %15 = simt_step.subgroup_id
    %16 = arith.index_cast %15 : index to i32
    return
  }
}

