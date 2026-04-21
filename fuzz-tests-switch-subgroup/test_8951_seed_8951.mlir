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
      %c0_i32_1 = arith.constant 0 : i32
      %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %2 = "simt_step.if"(%1) ({
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.muli %arg5, %c4_i32 : i32
        %6 = arith.addi %c0_i32_2, %5 : i32
        %7 = arith.addi %6, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_4 : i32
          %7 = arith.cmpi slt, %arg7, %6 : i32
          "simt_step.condition"(%7, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg7, %c4_i32 : i32
          %7 = arith.addi %c16_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_4 = arith.constant 1 : i32
          %9 = arith.addi %arg7, %c1_i32_4 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%2, %3) : (i32, i32) -> ()
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_0 : i32
    %10 = "simt_step.if"(%9) ({
      %c0_i32_1 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_1) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_3 : i32
        %20 = arith.addi %19, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %21 = arith.addi %c12_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
        "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %19 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg3, %c1_i32 : i32
        %true_3 = arith.constant true
        %c32_i32_4 = arith.constant 32 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_5 : i32
        %22 = arith.addi %c32_i32_4, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_6 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %11 = arith.addi %c48_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %15 = simt_step.subgroup_id
    %16 = arith.index_cast %15 : index to i32
    %17 = "simt_step.switch"(%14, %16) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_1) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %19 = arith.addi %c36_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.lane_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_19 : i32
          %54 = arith.addi %53, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %55 = arith.addi %c40_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_20 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_21 : i32
          %56 = arith.addi %c64_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_22 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %40 = arith.addi %c80_i32, %0 : i32
        %true_11 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %43 = arith.addi %c60_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_12 : i32
        %46 = "simt_step.if"(%45) ({
          %c4_i32_19 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_19) : (i32) -> ()
        }, {
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32_13 = arith.constant 96 : i32
        %47 = arith.addi %c96_i32_13, %0 : i32
        %true_14 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %50:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_19 : i32
          %54 = arith.addi %53, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %55 = arith.addi %c64_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_20 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_21 : i32
          %56 = arith.addi %c112_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_22 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %51 = arith.addi %c128_i32, %0 : i32
        %true_18 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %24 = arith.addi %c144_i32, %0 : i32
      %true_3 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %26 = arith.addi %c160_i32, %0 : i32
      %true_5 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %29 = arith.addi %c84_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %31 = "simt_step.switch"(%30, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c88_i32 = arith.constant 88 : i32
        %39 = arith.addi %c88_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = simt_step.subgroup_id
        %42 = arith.index_cast %41 : index to i32
        %43 = "simt_step.switch"(%40, %42) ({
        ^bb0(%arg4: i32):
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %true_14 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %60 = arith.addi %c176_i32, %0 : i32
          %true_15 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %44 = arith.addi %c192_i32, %0 : i32
        %true_9 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %47 = arith.addi %c92_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %49 = simt_step.subgroup_id
        %50 = arith.index_cast %49 : index to i32
        %51 = "simt_step.switch"(%48, %50) ({
        ^bb0(%arg4: i32):
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          %true_14 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %58 = arith.addi %c208_i32, %0 : i32
          %true_15 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          %61 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%61) {fallthrough = true} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          %63 = simt_step.subgroup_id
          %64 = arith.index_cast %63 : index to i32
          %true_17 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %65 = arith.addi %c224_i32, %0 : i32
          %true_18 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %52 = arith.addi %c240_i32, %0 : i32
        %true_11 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %54 = arith.addi %c256_i32, %0 : i32
        %true_13 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %33 = arith.addi %c96_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %35 = arith.cmpi ne, %34, %c0_i32_6 : i32
      %36 = "simt_step.if"(%35) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_10 : i32
          %41 = arith.addi %40, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %42 = arith.addi %c100_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_11 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_12 : i32
          %43 = arith.addi %c272_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_13 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) : (i32) -> ()
      }, {
        %c120_i32 = arith.constant 120 : i32
        %39 = arith.addi %c120_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = simt_step.subgroup_id
        %42 = arith.index_cast %41 : index to i32
        %43 = "simt_step.switch"(%40, %42) ({
        ^bb0(%arg3: i32):
          %c0_i32_8 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_8 : i32
          %true_9 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %45 = arith.addi %c288_i32, %0 : i32
          %true_10 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      %c304_i32 = arith.constant 304 : i32
      %37 = arith.addi %c304_i32, %0 : i32
      %true_7 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

