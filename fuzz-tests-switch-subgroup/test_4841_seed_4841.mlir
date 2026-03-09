module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32 : i32
      %6 = arith.addi %c0_i32_4, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%4, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %c2_i32 = arith.constant 2 : i32
      %5 = arith.addi %arg0, %c2_i32 : i32
      %6 = "simt_step.switch"(%4, %5) ({
      ^bb0(%arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %21 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32_11 : i32
          %23 = arith.cmpi slt, %arg8, %22 : i32
          "simt_step.condition"(%23, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_10 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.muli %arg8, %c4_i32_11 : i32
          %23 = arith.addi %c16_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %25 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.yield"(%21, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c1_i32_6 = arith.constant 1 : i32
        %10 = arith.addi %arg0, %c1_i32_6 : i32
        %11 = "simt_step.switch"(%arg3, %10) ({
        ^bb0(%arg7: i32):
          %true_10 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_11 : i32
          %23 = arith.addi %c32_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_12 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_13 : i32
          %28 = arith.addi %c48_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %c4_i32 = arith.constant 4 : i32
        %13 = arith.muli %arg5, %c4_i32 : i32
        %14 = arith.addi %c64_i32, %13 : i32
        %15 = arith.addi %14, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %21 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32_11 : i32
          %23 = arith.cmpi slt, %arg8, %22 : i32
          "simt_step.condition"(%23, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_10 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.muli %arg8, %c4_i32_11 : i32
          %23 = arith.addi %c80_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_12 = arith.constant 1 : i32
          %25 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.yield"(%21, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%18: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %20 = "simt_step.if"(%19) ({
          %true_10 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_11 : i32
          %23 = arith.addi %c96_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_11 : i32
          %23 = arith.addi %c112_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %3 = arith.select %2, %0#0, %1#0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_5 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_6 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %12 = arith.addi %arg2, %c0_i32_5 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_7 : i32
      %15 = arith.addi %c128_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_8 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %6 = arith.addi %0, %c0_i32_2 : i32
    %c28_i32 = arith.constant 28 : i32
    %7 = arith.addi %c28_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %9 = "simt_step.switch"(%8, %c0_i32_3) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.addi %0, %c3_i32 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %56 = arith.muli %arg5, %c4_i32_23 : i32
          %57 = arith.addi %56, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %58 = arith.addi %c36_i32, %57 : i32
          %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %60 = arith.cmpi ne, %59, %c0_i32_24 : i32
          "simt_step.condition"(%60, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %56 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %57 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %58 = arith.muli %arg5, %c4_i32_24 : i32
          %59 = arith.addi %c144_i32, %58 : i32
          %60 = arith.addi %59, %0 : i32
          %true_25 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56, %57) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%36#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %38 = simt_step.lane_id
        %39 = arith.index_cast %38 : index to i32
        %true_14 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %40 = arith.addi %c160_i32, %0 : i32
        %true_15 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %43 = arith.addi %c56_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_16 = arith.constant 3 : i32
        %45 = arith.addi %0, %c3_i32_16 : i32
        %46 = "simt_step.switch"(%44, %45) ({
        ^bb0(%arg4: i32):
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          %true_23 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %58 = arith.addi %c176_i32, %0 : i32
          %true_24 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb1(%60: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %47 = arith.addi %c192_i32, %0 : i32
        %true_18 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %49 = arith.addi %c208_i32, %0 : i32
        %true_20 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb3(%51: i32):  // no predecessors
        %52 = simt_step.lane_id
        %53 = arith.index_cast %52 : index to i32
        %true_21 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %54 = arith.addi %c224_i32, %0 : i32
        %true_22 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %true_5 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %19 = arith.addi %c240_i32, %0 : i32
      %true_6 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %22 = arith.addi %c60_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %24 = arith.addi %0, %c0_i32_7 : i32
      %25 = "simt_step.switch"(%23, %24) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_20 : i32
          %50 = arith.addi %49, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %51 = arith.addi %c64_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_21 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_21 : i32
          %52 = arith.addi %c256_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_22 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %38 = simt_step.lane_id
        %39 = arith.index_cast %38 : index to i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %41 = simt_step.lane_id
        %42 = arith.index_cast %41 : index to i32
        %true_14 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %43 = arith.addi %c272_i32, %0 : i32
        %true_15 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %46:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_20 : i32
          %50 = arith.addi %49, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %51 = arith.addi %c84_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_21 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_21 : i32
          %52 = arith.addi %c288_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_22 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %47 = arith.addi %c304_i32, %0 : i32
        %true_19 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %26 = arith.addi %c320_i32, %0 : i32
      %true_9 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %29 = arith.addi %c104_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = simt_step.lane_id
      %32 = arith.index_cast %31 : index to i32
      %33 = "simt_step.switch"(%30, %32) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_25 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_25 : i32
          %58 = arith.addi %57, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %59 = arith.addi %c108_i32, %58 : i32
          %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_26 = arith.constant 0 : i32
          %61 = arith.cmpi ne, %60, %c0_i32_26 : i32
          "simt_step.condition"(%61, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %57 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %58 = arith.addi %arg5, %c1_i32 : i32
          %true_25 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_26 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_26 : i32
          %60 = arith.addi %c336_i32, %59 : i32
          %61 = arith.addi %60, %0 : i32
          %true_27 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57, %58) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %37 = arith.addi %c352_i32, %0 : i32
        %true_15 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c128_i32 = arith.constant 128 : i32
        %40 = arith.addi %c128_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_16 = arith.constant 4 : i32
        %42 = arith.addi %0, %c4_i32_16 : i32
        %43 = "simt_step.switch"(%41, %42) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %60 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %c1_i32_25 = arith.constant 1 : i32
          %62 = arith.addi %0, %c1_i32_25 : i32
          %true_26 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %63 = arith.addi %c368_i32, %0 : i32
          %true_27 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %44 = arith.addi %c384_i32, %0 : i32
        %true_18 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c132_i32 = arith.constant 132 : i32
        %47 = arith.addi %c132_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_19 : i32
        %50 = "simt_step.if"(%49) ({
          %c0_i32_25 = arith.constant 0 : i32
          %57 = arith.addi %0, %c0_i32_25 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) : (i32) -> ()
        }) : (i1) -> i32
        %c400_i32 = arith.constant 400 : i32
        %51 = arith.addi %c400_i32, %0 : i32
        %true_20 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_21 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %53 = arith.addi %c416_i32, %0 : i32
        %true_22 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
      ^bb3(%55: i32):  // no predecessors
        %c0_i32_23 = arith.constant 0 : i32
        %c0_i32_24 = arith.constant 0 : i32
        %56:2 = "simt_step.loop"(%c0_i32_23, %c0_i32_24) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_25 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_25 : i32
          %58 = arith.addi %57, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %59 = arith.addi %c136_i32, %58 : i32
          %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_26 = arith.constant 0 : i32
          %61 = arith.cmpi ne, %60, %c0_i32_26 : i32
          "simt_step.condition"(%61, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %57 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %58 = arith.addi %arg5, %c1_i32 : i32
          %true_25 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %c4_i32_26 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_26 : i32
          %60 = arith.addi %c432_i32, %59 : i32
          %61 = arith.addi %60, %0 : i32
          %true_27 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%57, %58) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%56#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %34 = arith.addi %c448_i32, %0 : i32
      %true_11 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c464_i32 = arith.constant 464 : i32
    %10 = arith.addi %c464_i32, %0 : i32
    %true_4 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

