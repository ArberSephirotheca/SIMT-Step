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
      %c0_i32_2 = arith.constant 0 : i32
      %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32_3 : i32
        %5 = arith.cmpi slt, %arg7, %4 : i32
        "simt_step.condition"(%5, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %4 = simt_step.subgroup_id
        %5 = arith.index_cast %4 : index to i32
        %6 = "simt_step.switch"(%3, %5) ({
        ^bb0(%arg8: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %9 = arith.muli %arg7, %c4_i32_5 : i32
          %10 = arith.addi %c0_i32_4, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %true_6 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %14 = arith.muli %arg7, %c4_i32_7 : i32
          %15 = arith.addi %c16_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          %true_8 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %19 = arith.muli %arg7, %c4_i32_9 : i32
          %20 = arith.addi %c32_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb3(%22: i32):  // no predecessors
          %true_10 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %24 = arith.muli %arg7, %c4_i32_11 : i32
          %25 = arith.addi %c48_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_3 = arith.constant 1 : i32
        %7 = arith.addi %arg7, %c1_i32_3 : i32
        "simt_step.continue"(%6, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%1#0, %2) : (i32, i32) -> ()
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
      %21 = arith.addi %c8_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      "simt_step.if"(%23) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_12 : i32
        %44 = arith.addi %43, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %45 = arith.addi %c16_i32, %44 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_13 : i32
        "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %43 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %44 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %45 = arith.muli %arg4, %c4_i32_13 : i32
        %46 = arith.addi %c64_i32, %45 : i32
        %47 = arith.addi %46, %0 : i32
        %true_14 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43, %44) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %23 = arith.addi %c36_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %25 = "simt_step.switch"(%24, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %43 = arith.addi %0, %c0_i32_12 : i32
        %true_13 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %44 = arith.addi %c80_i32, %0 : i32
        %true_14 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %47 = arith.addi %c40_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %49 = simt_step.subgroup_id
        %50 = arith.index_cast %49 : index to i32
        %51 = "simt_step.switch"(%48, %50) ({
        ^bb0(%arg4: i32):
          %61 = simt_step.subgroup_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb1(%63: i32):  // no predecessors
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb2(%66: i32):  // no predecessors
          %67 = simt_step.subgroup_id
          %68 = arith.index_cast %67 : index to i32
          %true_19 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %69 = arith.addi %c96_i32, %0 : i32
          %true_20 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb3(%71: i32):  // no predecessors
          %c3_i32_21 = arith.constant 3 : i32
          %true_22 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %72 = arith.addi %c112_i32, %0 : i32
          %true_23 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb2(%52: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %53 = arith.addi %c44_i32, %0 : i32
        %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %55 = arith.cmpi ne, %54, %c0_i32_15 : i32
        %56 = "simt_step.if"(%55) ({
          %c0_i32_19 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_19) : (i32) -> ()
        }, {
          %61 = simt_step.subgroup_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %57 = arith.addi %c128_i32, %0 : i32
        %true_16 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %59 = arith.addi %c144_i32, %0 : i32
        %true_18 = arith.constant true
        %60 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %27 = arith.addi %c48_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = simt_step.lane_id
      %30 = arith.index_cast %29 : index to i32
      %31 = "simt_step.switch"(%28, %30) ({
      ^bb0(%arg3: i32):
        %c52_i32 = arith.constant 52 : i32
        %43 = arith.addi %c52_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %45 = "simt_step.switch"(%44, %c2_i32) ({
        ^bb0(%arg4: i32):
          %c3_i32_18 = arith.constant 3 : i32
          %true_19 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %61 = arith.addi %c160_i32, %0 : i32
          %true_20 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_18) {fallthrough = true} : (i32) -> ()
        ^bb1(%63: i32):  // no predecessors
          %c2_i32_21 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %47 = arith.addi %c56_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_12 : i32
        %50 = "simt_step.if"(%49) ({
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) : (i32) -> ()
        }, {
          %61 = simt_step.subgroup_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %51 = arith.addi %c176_i32, %0 : i32
        %true_13 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
      ^bb2(%53: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %54 = arith.addi %c60_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %56 = "simt_step.switch"(%55, %0) ({
        ^bb0(%arg4: i32):
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          %true_18 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %63 = arith.addi %c192_i32, %0 : i32
          %true_19 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        ^bb1(%65: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%66: i32):  // no predecessors
          %c3_i32_20 = arith.constant 3 : i32
          %true_21 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %67 = arith.addi %c208_i32, %0 : i32
          %true_22 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_20) {fallthrough = false} : (i32) -> ()
        ^bb3(%69: i32):  // no predecessors
          %70 = simt_step.lane_id
          %71 = arith.index_cast %70 : index to i32
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %57 = arith.addi %c224_i32, %0 : i32
        %true_15 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) {fallthrough = true} : (i32) -> ()
      ^bb3(%59: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %60:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %61 = arith.muli %arg5, %c4_i32_18 : i32
          %62 = arith.addi %61, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %63 = arith.addi %c64_i32, %62 : i32
          %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %65 = arith.cmpi ne, %64, %c0_i32_19 : i32
          "simt_step.condition"(%65, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %61 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %62 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %63 = arith.muli %arg5, %c4_i32_19 : i32
          %64 = arith.addi %c240_i32, %63 : i32
          %65 = arith.addi %64, %0 : i32
          %true_20 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61, %62) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%60#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %32 = arith.addi %c256_i32, %0 : i32
      %true_7 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %35 = arith.addi %c84_i32, %0 : i32
      %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
      %38 = "simt_step.if"(%37) ({
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_14 : i32
          %45 = arith.addi %44, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %46 = arith.addi %c88_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_15 : i32
          "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %44 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_15 : i32
          %47 = arith.addi %c272_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_16 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %39 = arith.addi %c288_i32, %0 : i32
      %true_9 = arith.constant true
      %40 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %41 = arith.addi %c304_i32, %0 : i32
      %true_11 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c320_i32 = arith.constant 320 : i32
    %11 = arith.addi %c320_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %c108_i32 = arith.constant 108 : i32
    %15 = arith.addi %c108_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %17 = arith.cmpi ne, %16, %c0_i32_2 : i32
    %18 = "simt_step.if"(%17) ({
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      %21 = simt_step.lane_id
      %22 = arith.index_cast %21 : index to i32
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c336_i32 = arith.constant 336 : i32
    %19 = arith.addi %c336_i32, %0 : i32
    %true_3 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

