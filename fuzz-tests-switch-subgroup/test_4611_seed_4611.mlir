module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %10, %c1_i32 : i32
        %12 = arith.cmpi slt, %arg6, %11 : i32
        "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32_4 : i32
          %14 = arith.cmpi slt, %arg8, %13 : i32
          "simt_step.condition"(%14, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_4 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg8, %c4_i32 : i32
          %14 = arith.addi %c0_i32_5, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_6 = arith.constant 1 : i32
          %16 = arith.addi %arg8, %c1_i32_6 : i32
          "simt_step.continue"(%12, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%10#0, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %true_1 = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %9 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %5 = arith.addi %c32_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %10 = arith.addi %c12_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %0, %c1_i32 : i32
      %13 = "simt_step.switch"(%11, %12) ({
      ^bb0(%arg3: i32):
        %39 = simt_step.lane_id
        %40 = arith.index_cast %39 : index to i32
        %true_11 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %41 = arith.addi %c48_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c16_i32 = arith.constant 16 : i32
        %44 = arith.addi %c16_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_13 : i32
        %47 = "simt_step.if"(%46) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_15 = arith.constant 0 : i32
          %50 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %48 = arith.addi %c64_i32, %0 : i32
        %true_14 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %14 = arith.addi %c80_i32, %0 : i32
      %true_0 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_1 = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %16 = arith.addi %c96_i32, %0 : i32
      %true_2 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %19 = arith.addi %c20_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
      %22 = "simt_step.if"(%21) ({
        %c24_i32 = arith.constant 24 : i32
        %39 = arith.addi %c24_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = simt_step.lane_id
        %42 = arith.index_cast %41 : index to i32
        %43 = "simt_step.switch"(%40, %42) ({
        ^bb0(%arg3: i32):
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          %true_13 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %48 = arith.addi %c112_i32, %0 : i32
          %true_14 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %44 = arith.addi %c128_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) : (i32) -> ()
      }, {
        %c28_i32 = arith.constant 28 : i32
        %39 = arith.addi %c28_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %41 = "simt_step.switch"(%40, %c0_i32_11) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_14 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %45 = arith.addi %c144_i32, %0 : i32
          %true_15 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %c2_i32_16 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %42 = arith.addi %c160_i32, %0 : i32
        %true_13 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) : (i32) -> ()
      }) : (i1) -> i32
      %c176_i32 = arith.constant 176 : i32
      %23 = arith.addi %c176_i32, %0 : i32
      %true_4 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %26 = arith.addi %c32_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_5 : i32
      %29 = "simt_step.if"(%28) ({
        %c36_i32 = arith.constant 36 : i32
        %39 = arith.addi %c36_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = "simt_step.switch"(%40, %0) ({
        ^bb0(%arg3: i32):
          %true_11 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %42 = arith.addi %c192_i32, %0 : i32
          %true_12 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c40_i32 = arith.constant 40 : i32
        %39 = arith.addi %c40_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_11 : i32
        %42 = "simt_step.if"(%41) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %43 = arith.addi %c208_i32, %0 : i32
        %true_12 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %30 = arith.addi %c224_i32, %0 : i32
      %true_6 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %32 = arith.addi %c240_i32, %0 : i32
      %true_8 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %35 = simt_step.lane_id
      %36 = arith.index_cast %35 : index to i32
      %true_9 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %37 = arith.addi %c256_i32, %0 : i32
      %true_10 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

