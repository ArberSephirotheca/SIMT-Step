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
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg0, %c1_i32 : i32
      %3 = "simt_step.switch"(%1, %2) ({
      ^bb0(%arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %10 = "simt_step.if"(%9) ({
          %true_9 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_11 : i32
          %23 = arith.addi %c0_i32_10, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_10 : i32
          %23 = arith.addi %c16_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %13 = "simt_step.if"(%12) ({
          %true_9 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_10 : i32
          %23 = arith.addi %c32_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_10 : i32
          %23 = arith.addi %c48_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %true_5 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %16 = arith.muli %arg5, %c4_i32_6 : i32
        %17 = arith.addi %c64_i32, %16 : i32
        %18 = arith.addi %17, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb3(%19: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %21 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32_10 : i32
          %23 = arith.cmpi slt, %arg8, %22 : i32
          "simt_step.condition"(%23, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_9 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %22 = arith.muli %arg8, %c4_i32_10 : i32
          %23 = arith.addi %c80_i32, %22 : i32
          %24 = arith.addi %23, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_11 = arith.constant 1 : i32
          %25 = arith.addi %arg8, %c1_i32_11 : i32
          "simt_step.yield"(%21, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %c4_i32_1 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32_1 : i32
      %6 = arith.addi %c96_i32, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32_2 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32_2 : i32
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
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_1 : i32
      %19 = "simt_step.if"(%18) ({
        %c16_i32 = arith.constant 16 : i32
        %43 = arith.addi %c16_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.subgroup_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %50 = arith.addi %0, %c2_i32 : i32
          %true_11 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %51 = arith.addi %c112_i32, %0 : i32
          %true_12 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%54: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %48 = arith.addi %c128_i32, %0 : i32
        %true_10 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_11 : i32
          %45 = arith.addi %44, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %46 = arith.addi %c20_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_12 : i32
          "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %44 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_12 : i32
          %47 = arith.addi %c144_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_13 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) : (i32) -> ()
      }) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %20 = arith.addi %c160_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %22 = arith.addi %c176_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %25 = arith.addi %c40_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = simt_step.lane_id
      %28 = arith.index_cast %27 : index to i32
      %29 = "simt_step.switch"(%26, %28) ({
      ^bb0(%arg3: i32):
        %c44_i32 = arith.constant 44 : i32
        %43 = arith.addi %c44_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_9 : i32
        %46 = "simt_step.if"(%45) ({
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) : (i32) -> ()
        }, {
          %c0_i32_13 = arith.constant 0 : i32
          %52 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%52) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %47 = arith.addi %c192_i32, %0 : i32
        %true_10 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %49 = arith.addi %c208_i32, %0 : i32
        %true_12 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb1(%51: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %30 = arith.addi %c224_i32, %0 : i32
      %true_6 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %33 = arith.addi %c48_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %35 = simt_step.subgroup_id
      %36 = arith.index_cast %35 : index to i32
      %37 = "simt_step.switch"(%34, %36) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %67 = arith.muli %arg5, %c4_i32_17 : i32
          %68 = arith.addi %67, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %69 = arith.addi %c52_i32, %68 : i32
          %70 = "simt_step.buffer.load"(%arg1, %69) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %71 = arith.cmpi ne, %70, %c0_i32_18 : i32
          "simt_step.condition"(%71, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %67 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %68 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %69 = arith.muli %arg5, %c4_i32_18 : i32
          %70 = arith.addi %c240_i32, %69 : i32
          %71 = arith.addi %70, %0 : i32
          %true_19 = arith.constant true
          %72 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%67, %68) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %44 = arith.addi %c256_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %47 = arith.addi %c72_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_13 : i32
        %50 = "simt_step.if"(%49) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %51 = arith.addi %c272_i32, %0 : i32
        %true_14 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
      ^bb2(%53: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %54 = arith.addi %c76_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %56 = simt_step.subgroup_id
        %57 = arith.index_cast %56 : index to i32
        %58 = "simt_step.switch"(%55, %57) ({
        ^bb0(%arg4: i32):
          %c0_i32_17 = arith.constant 0 : i32
          %true_18 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %67 = arith.addi %c288_i32, %0 : i32
          %true_19 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb1(%69: i32):  // no predecessors
          %70 = simt_step.subgroup_id
          %71 = arith.index_cast %70 : index to i32
          %true_20 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %72 = arith.addi %c304_i32, %0 : i32
          %true_21 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%71) {fallthrough = true} : (i32) -> ()
        ^bb2(%74: i32):  // no predecessors
          %75 = simt_step.lane_id
          %76 = arith.index_cast %75 : index to i32
          "simt_step.yield"(%76) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %59 = arith.addi %c320_i32, %0 : i32
        %true_16 = arith.constant true
        %60 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
      ^bb3(%61: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %62 = arith.addi %c80_i32, %0 : i32
        %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
        %64 = simt_step.lane_id
        %65 = arith.index_cast %64 : index to i32
        %66 = "simt_step.switch"(%63, %65) ({
        ^bb0(%arg4: i32):
          %c0_i32_17 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_17) {fallthrough = true} : (i32) -> ()
        ^bb1(%67: i32):  // no predecessors
          %c4_i32_18 = arith.constant 4 : i32
          %true_19 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %68 = arith.addi %c336_i32, %0 : i32
          %true_20 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_18) {fallthrough = true} : (i32) -> ()
        ^bb2(%70: i32):  // no predecessors
          %71 = simt_step.lane_id
          %72 = arith.index_cast %71 : index to i32
          %true_21 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %73 = arith.addi %c352_i32, %0 : i32
          %true_22 = arith.constant true
          %74 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %73, %74) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%72) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %39 = simt_step.subgroup_id
      %40 = arith.index_cast %39 : index to i32
      %true_7 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %41 = arith.addi %c368_i32, %0 : i32
      %true_8 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c384_i32 = arith.constant 384 : i32
    %10 = arith.addi %c384_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %12 = simt_step.subgroup_id
    %13 = arith.index_cast %12 : index to i32
    %14 = simt_step.lane_id
    %15 = arith.index_cast %14 : index to i32
    return
  }
}

