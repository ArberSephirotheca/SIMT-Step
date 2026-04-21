module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg5, %8 : i32
        "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c2_i32 = arith.constant 2 : i32
        %7 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32 = arith.constant 3 : i32
        %8 = "simt_step.switch"(%7, %c3_i32) ({
        ^bb0(%arg6: i32):
          %true_4 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.muli %arg5, %c4_i32 : i32
          %12 = arith.addi %c16_i32, %11 : i32
          %13 = arith.addi %12, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %16 = arith.muli %arg5, %c4_i32_6 : i32
          %17 = arith.addi %c32_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.continue"(%8, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) : (i32) -> ()
    }, {
      %true_2 = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %7 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
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
      %c8_i32 = arith.constant 8 : i32
      %9 = arith.addi %c8_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_2 : i32
      "simt_step.if"(%11) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = "simt_step.switch"(%7, %c0_i32_1) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %9 = arith.addi %c16_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.addi %0, %c0_i32_2 : i32
      %12 = "simt_step.switch"(%10, %11) ({
      ^bb0(%arg3: i32):
        %27 = simt_step.subgroup_id
        %28 = arith.index_cast %27 : index to i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %30 = simt_step.lane_id
        %31 = arith.index_cast %30 : index to i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_10 : i32
          %37 = arith.addi %36, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %38 = arith.addi %c20_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_11 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          %true_10 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_11 : i32
          %39 = arith.addi %c64_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_12 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %34 = arith.addi %c80_i32, %0 : i32
        %true_9 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %13 = arith.addi %c96_i32, %0 : i32
      %true_3 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %17 = arith.addi %c40_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg3: i32):
        %c44_i32 = arith.constant 44 : i32
        %27 = arith.addi %c44_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %0, %c3_i32 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg4: i32):
          %56 = simt_step.lane_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) {fallthrough = true} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %60 = simt_step.subgroup_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb3(%62: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_15 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %63 = arith.addi %c112_i32, %0 : i32
          %true_16 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %32 = arith.addi %c48_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.subgroup_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_15 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %57 = arith.addi %c128_i32, %0 : i32
          %true_16 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %37 = arith.addi %c144_i32, %0 : i32
        %true_7 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %40 = arith.addi %c52_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = simt_step.subgroup_id
        %43 = arith.index_cast %42 : index to i32
        %44 = "simt_step.switch"(%41, %43) ({
        ^bb0(%arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          %true_17 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %57 = arith.addi %c160_i32, %0 : i32
          %true_18 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %61 = simt_step.subgroup_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %45 = arith.addi %c176_i32, %0 : i32
        %true_9 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %47 = arith.addi %c192_i32, %0 : i32
        %true_11 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb3(%49: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %50 = arith.addi %c56_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        %52 = arith.addi %0, %c4_i32_12 : i32
        %53 = "simt_step.switch"(%51, %52) ({
        ^bb0(%arg4: i32):
          %c0_i32_15 = arith.constant 0 : i32
          %56 = arith.addi %0, %c0_i32_15 : i32
          %true_16 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %57 = arith.addi %c208_i32, %0 : i32
          %true_17 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = true} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_18) {fallthrough = true} : (i32) -> ()
        ^bb2(%60: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %61 = arith.addi %0, %c1_i32 : i32
          %true_19 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %62 = arith.addi %c224_i32, %0 : i32
          %true_20 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = true} : (i32) -> ()
        ^bb3(%64: i32):  // no predecessors
          %65 = simt_step.lane_id
          %66 = arith.index_cast %65 : index to i32
          "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %54 = arith.addi %c240_i32, %0 : i32
        %true_14 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %22 = arith.addi %c256_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %25 = simt_step.lane_id
      %26 = arith.index_cast %25 : index to i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

