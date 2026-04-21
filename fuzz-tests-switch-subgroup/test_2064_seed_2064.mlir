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
      %2 = "simt_step.switch"(%1, %arg0) ({
      ^bb0(%arg6: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_8 : i32
          %19 = arith.cmpi slt, %arg8, %18 : i32
          "simt_step.condition"(%19, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_7 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %18 = arith.muli %arg8, %c4_i32_9 : i32
          %19 = arith.addi %c0_i32_8, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %21 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%5: i32):  // no predecessors
        %true = arith.constant true
        %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.muli %arg5, %c4_i32 : i32
        %8 = arith.addi %c16_i32, %7 : i32
        %9 = arith.addi %8, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c4_i32_3 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32_3 : i32
        %c3_i32_4 = arith.constant 3 : i32
        %12 = "simt_step.switch"(%11, %c3_i32_4) ({
        ^bb0(%arg7: i32):
          %true_7 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %18 = arith.muli %arg5, %c4_i32_8 : i32
          %19 = arith.addi %c32_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_10 : i32
          %24 = arith.addi %c48_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %true_11 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_12 : i32
          %29 = arith.addi %c64_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %33 = arith.muli %arg5, %c4_i32_14 : i32
          %34 = arith.addi %c80_i32, %33 : i32
          %35 = arith.addi %34, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %14 = arith.muli %arg5, %c4_i32_6 : i32
        %15 = arith.addi %c96_i32, %14 : i32
        %16 = arith.addi %15, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%2, %3) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_2 : i32
      "simt_step.if"(%20) ({
        %c3_i32 = arith.constant 3 : i32
        %21 = arith.remsi %0, %c3_i32 : i32
        %22 = "simt_step.switch"(%21, %0) ({
        ^bb0(%arg2: i32):
          %c3_i32_3 = arith.constant 3 : i32
          %23 = arith.addi %arg2, %c3_i32_3 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c3_i32_4 = arith.constant 3 : i32
          %25 = arith.addi %24, %c3_i32_4 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c3_i32_5 = arith.constant 3 : i32
          %27 = arith.addi %26, %c3_i32_5 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          %29 = arith.addi %28, %c4_i32_6 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c1_i32 = arith.constant 1 : i32
    %6 = arith.addi %0, %c1_i32 : i32
    %c12_i32 = arith.constant 12 : i32
    %7 = arith.addi %c12_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    %11 = "simt_step.switch"(%8, %10) ({
    ^bb0(%arg2: i32):
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      %true_2 = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %20 = arith.addi %c112_i32, %0 : i32
      %true_3 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c16_i32 = arith.constant 16 : i32
      %23 = arith.addi %c16_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = simt_step.subgroup_id
      %26 = arith.index_cast %25 : index to i32
      %27 = "simt_step.switch"(%24, %26) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_17 : i32
          %54 = arith.addi %53, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %55 = arith.addi %c20_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_18 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32_17 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32_17 : i32
          %true_18 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_19 : i32
          %56 = arith.addi %c128_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_20 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %43 = arith.addi %c144_i32, %0 : i32
        %true_13 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %46 = arith.addi %c40_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %48 = "simt_step.switch"(%47, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_17 = arith.constant 0 : i32
          %true_18 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %53 = arith.addi %c160_i32, %0 : i32
          %true_19 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_17) {fallthrough = true} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_20 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %56 = arith.addi %c176_i32, %0 : i32
          %true_21 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%58: i32):  // no predecessors
          %59 = simt_step.subgroup_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) {fallthrough = true} : (i32) -> ()
        ^bb3(%61: i32):  // no predecessors
          %62 = simt_step.subgroup_id
          %63 = arith.index_cast %62 : index to i32
          %true_22 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %64 = arith.addi %c192_i32, %0 : i32
          %true_23 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb3(%50: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %true_15 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %51 = arith.addi %c208_i32, %0 : i32
        %true_16 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %28 = arith.addi %c224_i32, %0 : i32
      %true_5 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %31 = arith.addi %c44_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_6 : i32
      %34 = "simt_step.if"(%33) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_12 : i32
          %44 = arith.addi %43, %0 : i32
          %c48_i32 = arith.constant 48 : i32
          %45 = arith.addi %c48_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_13 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_14 : i32
          %46 = arith.addi %c240_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_15 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_12 : i32
          %44 = arith.addi %43, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %45 = arith.addi %c68_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_13 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_14 : i32
          %46 = arith.addi %c256_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_15 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %35 = arith.addi %c272_i32, %0 : i32
      %true_7 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %37 = arith.addi %c288_i32, %0 : i32
      %true_9 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    ^bb3(%39: i32):  // no predecessors
      %40 = simt_step.lane_id
      %41 = arith.index_cast %40 : index to i32
      "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c88_i32 = arith.constant 88 : i32
    %12 = arith.addi %c88_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
    %15 = "simt_step.if"(%14) ({
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c92_i32 = arith.constant 92 : i32
      %18 = arith.addi %c92_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_2 : i32
      %21 = "simt_step.if"(%20) ({
        %c96_i32 = arith.constant 96 : i32
        %24 = arith.addi %c96_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %26 = arith.addi %0, %c3_i32 : i32
        %27 = "simt_step.switch"(%25, %26) ({
        ^bb0(%arg2: i32):
          %c2_i32 = arith.constant 2 : i32
          %true_6 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %30 = arith.addi %c304_i32, %0 : i32
          %true_7 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          %true_8 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %35 = arith.addi %c320_i32, %0 : i32
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %true_10 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %38 = arith.addi %c336_i32, %0 : i32
          %true_11 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %28 = arith.addi %c352_i32, %0 : i32
        %true_5 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %24 = arith.addi %c100_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
        %27 = "simt_step.if"(%26) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %30 = simt_step.lane_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %c368_i32 = arith.constant 368 : i32
        %28 = arith.addi %c368_i32, %0 : i32
        %true_5 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      %c384_i32 = arith.constant 384 : i32
      %22 = arith.addi %c384_i32, %0 : i32
      %true_3 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c400_i32 = arith.constant 400 : i32
    %16 = arith.addi %c400_i32, %0 : i32
    %true = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

