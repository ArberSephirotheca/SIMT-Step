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
      %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %6 = "simt_step.if"(%5) ({
        %c0_i32_4 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %9 = "simt_step.if"(%8) ({
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c16_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c32_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %9 = "simt_step.if"(%8) ({
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c48_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c64_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %7) : (i32, i32) -> ()
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_0 : i32
      %16 = "simt_step.if"(%15) ({
        %c16_i32 = arith.constant 16 : i32
        %30 = arith.addi %c16_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_8 : i32
        %33 = "simt_step.if"(%32) ({
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %34 = arith.addi %c80_i32, %0 : i32
        %true_9 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %30 = arith.addi %c20_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.lane_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32_8 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          %true_9 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %40 = arith.addi %c96_i32, %0 : i32
          %true_10 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %17 = arith.addi %c112_i32, %0 : i32
      %true = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %true_1 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %20 = arith.addi %c128_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %23 = arith.addi %c24_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %25 = "simt_step.switch"(%24, %c0_i32_3) ({
      ^bb0(%arg3: i32):
        %c28_i32 = arith.constant 28 : i32
        %30 = arith.addi %c28_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.lane_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg4: i32):
          %true_10 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %41 = arith.addi %c144_i32, %0 : i32
          %true_11 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %35 = arith.addi %c160_i32, %0 : i32
        %true_9 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %38 = arith.addi %c32_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = "simt_step.switch"(%39, %0) ({
        ^bb0(%arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %true_11 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %41 = arith.addi %c176_i32, %0 : i32
          %true_12 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %26 = arith.addi %c192_i32, %0 : i32
      %true_5 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %28 = arith.addi %c208_i32, %0 : i32
      %true_7 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %c36_i32 = arith.constant 36 : i32
    %8 = arith.addi %c36_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.lane_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c40_i32 = arith.constant 40 : i32
      %13 = arith.addi %c40_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = simt_step.lane_id
      %16 = arith.index_cast %15 : index to i32
      %17 = "simt_step.switch"(%14, %16) ({
      ^bb0(%arg3: i32):
        %c44_i32 = arith.constant 44 : i32
        %43 = arith.addi %c44_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_7 : i32
        %46 = "simt_step.if"(%45) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %67 = simt_step.subgroup_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %47 = arith.addi %c224_i32, %0 : i32
        %true_8 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %49 = arith.addi %c240_i32, %0 : i32
        %true_10 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb1(%51: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %52 = arith.addi %c48_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %54 = simt_step.lane_id
        %55 = arith.index_cast %54 : index to i32
        %56 = "simt_step.switch"(%53, %55) ({
        ^bb0(%arg4: i32):
          %true_15 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %67 = arith.addi %c256_i32, %0 : i32
          %true_16 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%69: i32):  // no predecessors
          %70 = simt_step.lane_id
          %71 = arith.index_cast %70 : index to i32
          "simt_step.yield"(%71) {fallthrough = true} : (i32) -> ()
        ^bb2(%72: i32):  // no predecessors
          %73 = simt_step.subgroup_id
          %74 = arith.index_cast %73 : index to i32
          %true_17 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %75 = arith.addi %c272_i32, %0 : i32
          %true_18 = arith.constant true
          %76 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %75, %76) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%74) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      ^bb2(%57: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %58:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %67 = arith.muli %arg5, %c4_i32_15 : i32
          %68 = arith.addi %67, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %69 = arith.addi %c52_i32, %68 : i32
          %70 = "simt_step.buffer.load"(%arg1, %69) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %71 = arith.cmpi ne, %70, %c0_i32_16 : i32
          "simt_step.condition"(%71, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %67 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %68 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %69 = arith.muli %arg5, %c4_i32_16 : i32
          %70 = arith.addi %c288_i32, %69 : i32
          %71 = arith.addi %70, %0 : i32
          %true_17 = arith.constant true
          %72 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%67, %68) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%58#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%59: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %60 = arith.addi %c72_i32, %0 : i32
        %61 = "simt_step.buffer.load"(%arg1, %60) : (!simt_step.resource<Global, i32>, i32) -> i32
        %62 = simt_step.subgroup_id
        %63 = arith.index_cast %62 : index to i32
        %64 = "simt_step.switch"(%61, %63) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %67 = arith.addi %0, %c2_i32 : i32
          %true_15 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %68 = arith.addi %c304_i32, %0 : i32
          %true_16 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        ^bb1(%70: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          %71 = arith.addi %0, %c4_i32_17 : i32
          %true_18 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %72 = arith.addi %c320_i32, %0 : i32
          %true_19 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        ^bb2(%74: i32):  // no predecessors
          %75 = simt_step.subgroup_id
          %76 = arith.index_cast %75 : index to i32
          "simt_step.yield"(%76) {fallthrough = false} : (i32) -> ()
        ^bb3(%77: i32):  // no predecessors
          %78 = simt_step.subgroup_id
          %79 = arith.index_cast %78 : index to i32
          "simt_step.yield"(%79) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %65 = arith.addi %c336_i32, %0 : i32
        %true_14 = arith.constant true
        %66 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %18 = arith.addi %c352_i32, %0 : i32
      %true_0 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %21 = arith.addi %c76_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      %25 = "simt_step.switch"(%22, %24) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_15 : i32
          %56 = arith.addi %55, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %57 = arith.addi %c80_i32, %56 : i32
          %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %59 = arith.cmpi ne, %58, %c0_i32_16 : i32
          "simt_step.condition"(%59, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %55 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %56 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_16 : i32
          %58 = arith.addi %c368_i32, %57 : i32
          %59 = arith.addi %58, %0 : i32
          %true_17 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55, %56) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_15 : i32
          %56 = arith.addi %55, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %57 = arith.addi %c100_i32, %56 : i32
          %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %59 = arith.cmpi ne, %58, %c0_i32_16 : i32
          "simt_step.condition"(%59, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %55 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %56 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_16 : i32
          %58 = arith.addi %c384_i32, %57 : i32
          %59 = arith.addi %58, %0 : i32
          %true_17 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55, %56) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %46 = arith.addi %c400_i32, %0 : i32
        %true_12 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %49 = arith.addi %c120_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %51 = "simt_step.switch"(%50, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_15 = arith.constant 0 : i32
          %55 = arith.addi %0, %c0_i32_15 : i32
          %true_16 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %56 = arith.addi %c416_i32, %0 : i32
          %true_17 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          %59 = arith.addi %0, %c0_i32_18 : i32
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb3(%52: i32):  // no predecessors
        %true_13 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %53 = arith.addi %c432_i32, %0 : i32
        %true_14 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %26 = arith.addi %c448_i32, %0 : i32
      %true_2 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c124_i32 = arith.constant 124 : i32
      %29 = arith.addi %c124_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_3 : i32
      %32 = "simt_step.if"(%31) ({
        %c128_i32 = arith.constant 128 : i32
        %43 = arith.addi %c128_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %45 = arith.addi %0, %c4_i32_7 : i32
        %46 = "simt_step.switch"(%44, %45) ({
        ^bb0(%arg3: i32):
          %true_8 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %47 = arith.addi %c464_i32, %0 : i32
          %true_9 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%46) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_9 : i32
          %45 = arith.addi %44, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %46 = arith.addi %c132_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_10 : i32
          "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %44 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_10 : i32
          %47 = arith.addi %c480_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_11 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) : (i32) -> ()
      }) : (i1) -> i32
      %c496_i32 = arith.constant 496 : i32
      %33 = arith.addi %c496_i32, %0 : i32
      %true_4 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb3(%35: i32):  // no predecessors
      %c152_i32 = arith.constant 152 : i32
      %36 = arith.addi %c152_i32, %0 : i32
      %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
      %38 = simt_step.subgroup_id
      %39 = arith.index_cast %38 : index to i32
      %40 = "simt_step.switch"(%37, %39) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c156_i32 = arith.constant 156 : i32
        %44 = arith.addi %c156_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_7 : i32
        %47 = "simt_step.if"(%46) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %48 = arith.addi %c512_i32, %0 : i32
        %true_8 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %50 = arith.addi %c528_i32, %0 : i32
        %true_10 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c544_i32 = arith.constant 544 : i32
      %41 = arith.addi %c544_i32, %0 : i32
      %true_6 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

