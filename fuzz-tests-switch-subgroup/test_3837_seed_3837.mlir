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
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_5 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32_8 : i32
          %11 = arith.cmpi slt, %arg9, %10 : i32
          "simt_step.condition"(%11, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true_8 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg9, %c4_i32 : i32
          %11 = arith.addi %c16_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %13 = arith.addi %arg9, %c1_i32_9 : i32
          "simt_step.yield"(%9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_7 = arith.constant 1 : i32
        %8 = arith.addi %arg7, %c1_i32_7 : i32
        "simt_step.yield"(%7#0, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%5#0, %6) : (i32, i32) -> ()
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %23 = arith.addi %c12_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_3 : i32
      %26 = "simt_step.if"(%25) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_12 : i32
          %40 = arith.addi %39, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %41 = arith.addi %c16_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
          "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %39 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg4, %c1_i32 : i32
          %true_12 = arith.constant true
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_13 : i32
          %42 = arith.addi %c32_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_14 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%38#0) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %38 = arith.addi %c36_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = simt_step.lane_id
        %41 = arith.index_cast %40 : index to i32
        %42 = "simt_step.switch"(%39, %41) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %true_10 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %43 = arith.addi %c48_i32, %0 : i32
          %true_11 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%42) : (i32) -> ()
      }) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %27 = arith.addi %c64_i32, %0 : i32
      %true_4 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %30 = arith.addi %c40_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %32 = "simt_step.switch"(%31, %0) ({
      ^bb0(%arg3: i32):
        %c44_i32 = arith.constant 44 : i32
        %38 = arith.addi %c44_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_10 : i32
        %41 = "simt_step.if"(%40) ({
          %c4_i32_16 = arith.constant 4 : i32
          %54 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%54) : (i32) -> ()
        }, {
          %54 = simt_step.lane_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %42 = arith.addi %c80_i32, %0 : i32
        %true_11 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %45 = arith.addi %c48_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = simt_step.lane_id
        %48 = arith.index_cast %47 : index to i32
        %49 = "simt_step.switch"(%46, %48) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          %true_16 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %57 = arith.addi %c96_i32, %0 : i32
          %true_17 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      ^bb2(%50: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %51:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %54 = arith.muli %arg5, %c4_i32_16 : i32
          %55 = arith.addi %54, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %56 = arith.addi %c52_i32, %55 : i32
          %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %58 = arith.cmpi ne, %57, %c0_i32_17 : i32
          "simt_step.condition"(%58, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %54 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %55 = arith.addi %arg5, %c1_i32 : i32
          %true_16 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %56 = arith.muli %arg5, %c4_i32_17 : i32
          %57 = arith.addi %c112_i32, %56 : i32
          %58 = arith.addi %57, %0 : i32
          %true_18 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54, %55) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %52 = arith.addi %c128_i32, %0 : i32
        %true_15 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %33 = arith.addi %c144_i32, %0 : i32
      %true_6 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%35: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %true_8 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %36 = arith.addi %c160_i32, %0 : i32
      %true_9 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c72_i32 = arith.constant 72 : i32
    %10 = arith.addi %c72_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = simt_step.subgroup_id
    %13 = arith.index_cast %12 : index to i32
    %14 = "simt_step.switch"(%11, %13) ({
    ^bb0(%arg2: i32):
      %c4_i32_3 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_3) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %24 = arith.addi %c76_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
      %27 = "simt_step.if"(%26) ({
        %33 = simt_step.lane_id
        %34 = arith.index_cast %33 : index to i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %33 = arith.addi %c80_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
        %36 = "simt_step.if"(%35) ({
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %37 = arith.addi %c176_i32, %0 : i32
        %true_9 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %28 = arith.addi %c192_i32, %0 : i32
      %true_5 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %30 = arith.addi %c208_i32, %0 : i32
      %true_7 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c224_i32 = arith.constant 224 : i32
    %15 = arith.addi %c224_i32, %0 : i32
    %true_0 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c84_i32 = arith.constant 84 : i32
    %17 = arith.addi %c84_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %19 = arith.cmpi ne, %18, %c0_i32_1 : i32
    %20 = "simt_step.if"(%19) ({
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_5 : i32
        %25 = arith.addi %24, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %26 = arith.addi %c88_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
        "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %24 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %26 = arith.muli %arg3, %c4_i32_6 : i32
        %27 = arith.addi %c240_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_7 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) : (i32) -> ()
    }) : (i1) -> i32
    %c256_i32 = arith.constant 256 : i32
    %21 = arith.addi %c256_i32, %0 : i32
    %true_2 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

