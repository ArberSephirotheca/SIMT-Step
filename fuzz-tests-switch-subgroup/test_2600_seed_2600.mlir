module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_1 = arith.constant 0 : i32
        %5 = arith.addi %c0_i32_1, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }, {
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %5 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
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
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg7, %c4_i32 : i32
          %7 = arith.addi %c32_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_4 = arith.constant 1 : i32
          %9 = arith.addi %arg7, %c1_i32_4 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }) : (i1) -> i32
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
      %19 = arith.addi %c8_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_2 : i32
      "simt_step.if"(%21) ({
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
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %19 = arith.addi %c16_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c20_i32 = arith.constant 20 : i32
        %45 = arith.addi %c20_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_11 : i32
        %48 = "simt_step.if"(%47) ({
          %69 = simt_step.subgroup_id
          %70 = arith.index_cast %69 : index to i32
          "simt_step.yield"(%70) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %49 = arith.addi %c48_i32, %0 : i32
        %true_12 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb1(%51: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %69 = arith.muli %arg5, %c4_i32_23 : i32
          %70 = arith.addi %69, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %71 = arith.addi %c24_i32, %70 : i32
          %72 = "simt_step.buffer.load"(%arg1, %71) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %73 = arith.cmpi ne, %72, %c0_i32_24 : i32
          "simt_step.condition"(%73, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %69 = arith.addi %arg4, %arg5 : i32
          %c1_i32_23 = arith.constant 1 : i32
          %70 = arith.addi %arg5, %c1_i32_23 : i32
          %true_24 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_25 = arith.constant 4 : i32
          %71 = arith.muli %arg5, %c4_i32_25 : i32
          %72 = arith.addi %c64_i32, %71 : i32
          %73 = arith.addi %72, %0 : i32
          %true_26 = arith.constant true
          %74 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %73, %74) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%69, %70) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %53 = arith.addi %c80_i32, %0 : i32
        %true_16 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%55: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %56 = arith.addi %c44_i32, %0 : i32
        %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %58 = arith.cmpi ne, %57, %c0_i32_17 : i32
        %59 = "simt_step.if"(%58) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %69 = simt_step.subgroup_id
          %70 = arith.index_cast %69 : index to i32
          "simt_step.yield"(%70) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32_18 = arith.constant 96 : i32
        %60 = arith.addi %c96_i32_18, %0 : i32
        %true_19 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%59) {fallthrough = true} : (i32) -> ()
      ^bb3(%62: i32):  // no predecessors
        %c48_i32_20 = arith.constant 48 : i32
        %63 = arith.addi %c48_i32_20, %0 : i32
        %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %65 = arith.cmpi ne, %64, %c0_i32_21 : i32
        %66 = "simt_step.if"(%65) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %69 = simt_step.subgroup_id
          %70 = arith.index_cast %69 : index to i32
          "simt_step.yield"(%70) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %67 = arith.addi %c112_i32, %0 : i32
        %true_22 = arith.constant true
        %68 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %23 = arith.addi %c52_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_2 = arith.constant 1 : i32
      %25 = arith.addi %0, %c1_i32_2 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        %true_11 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %47 = arith.addi %c128_i32, %0 : i32
        %true_12 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb1(%49: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %50 = arith.addi %0, %c0_i32_13 : i32
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %27 = arith.addi %c144_i32, %0 : i32
      %true_4 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %30 = arith.addi %c56_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_5 : i32
      %33 = "simt_step.if"(%32) ({
        %c60_i32 = arith.constant 60 : i32
        %45 = arith.addi %c60_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = simt_step.lane_id
        %48 = arith.index_cast %47 : index to i32
        %49 = "simt_step.switch"(%46, %48) ({
        ^bb0(%arg3: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_11 : i32
          %true_12 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %51 = arith.addi %c160_i32, %0 : i32
          %true_13 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          %true_15 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %54 = arith.addi %c176_i32, %0 : i32
          %true_16 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %57 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb3(%58: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%49) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %45 = arith.addi %c64_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_11 : i32
        %48 = "simt_step.if"(%47) ({
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }, {
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %49 = arith.addi %c192_i32, %0 : i32
        %true_12 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %34 = arith.addi %c208_i32, %0 : i32
      %true_6 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %37 = arith.addi %c68_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %39 = arith.cmpi ne, %38, %c0_i32_7 : i32
      %40 = "simt_step.if"(%39) ({
        %c72_i32 = arith.constant 72 : i32
        %45 = arith.addi %c72_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = simt_step.subgroup_id
        %48 = arith.index_cast %47 : index to i32
        %49 = "simt_step.switch"(%46, %48) ({
        ^bb0(%arg3: i32):
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %53 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb2(%54: i32):  // no predecessors
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb3(%57: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %58 = arith.addi %0, %c3_i32 : i32
          %true_12 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %59 = arith.addi %c224_i32, %0 : i32
          %true_13 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%49) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_13 : i32
          %47 = arith.addi %46, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %48 = arith.addi %c76_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_14 : i32
          "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %46 = arith.addi %arg3, %arg4 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %47 = arith.addi %arg4, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_15 : i32
          %49 = arith.addi %c240_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_16 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %41 = arith.addi %c256_i32, %0 : i32
      %true_8 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %43 = arith.addi %c272_i32, %0 : i32
      %true_10 = arith.constant true
      %44 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c96_i32 = arith.constant 96 : i32
    %9 = arith.addi %c96_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
    %12 = "simt_step.if"(%11) ({
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %20 = arith.muli %arg3, %c4_i32_4 : i32
        %21 = arith.addi %20, %0 : i32
        %c100_i32 = arith.constant 100 : i32
        %22 = arith.addi %c100_i32, %21 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
        "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_10 : i32
          %28 = arith.addi %27, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %29 = arith.addi %c120_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_11 : i32
          "simt_step.condition"(%31, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %27 = arith.addi %arg4, %arg5 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %28 = arith.addi %arg5, %c1_i32_10 : i32
          %true_11 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_12 : i32
          %30 = arith.addi %c288_i32, %29 : i32
          %31 = arith.addi %30, %0 : i32
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %21 = arith.addi %arg2, %20#0 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32_6 : i32
        %true_7 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_8 : i32
        %24 = arith.addi %c304_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_9 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) : (i32) -> ()
    }, {
      %c140_i32 = arith.constant 140 : i32
      %19 = arith.addi %c140_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_2 = arith.constant 1 : i32
      %21 = "simt_step.switch"(%20, %c1_i32_2) ({
      ^bb0(%arg2: i32):
        %c144_i32 = arith.constant 144 : i32
        %24 = arith.addi %c144_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg3: i32):
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c3_i32_11 = arith.constant 3 : i32
          %true_12 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %51 = arith.addi %c320_i32, %0 : i32
          %true_13 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = true} : (i32) -> ()
        ^bb3(%56: i32):  // no predecessors
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %29 = arith.addi %c336_i32, %0 : i32
        %true_6 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c148_i32 = arith.constant 148 : i32
        %33 = arith.addi %c148_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = simt_step.lane_id
        %36 = arith.index_cast %35 : index to i32
        %37 = "simt_step.switch"(%34, %36) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %true_11 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %49 = arith.addi %c352_i32, %0 : i32
          %true_12 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %38 = arith.addi %c368_i32, %0 : i32
        %true_8 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c152_i32 = arith.constant 152 : i32
        %41 = arith.addi %c152_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = simt_step.lane_id
        %44 = arith.index_cast %43 : index to i32
        %45 = "simt_step.switch"(%42, %44) ({
        ^bb0(%arg3: i32):
          %true_11 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %48 = arith.addi %c384_i32, %0 : i32
          %true_12 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %46 = arith.addi %c400_i32, %0 : i32
        %true_10 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %22 = arith.addi %c416_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c432_i32 = arith.constant 432 : i32
    %13 = arith.addi %c432_i32, %0 : i32
    %true = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c156_i32 = arith.constant 156 : i32
    %15 = arith.addi %c156_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %17 = arith.addi %0, %c1_i32 : i32
    %18 = "simt_step.switch"(%16, %17) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_12 : i32
        %37 = arith.addi %36, %0 : i32
        %c160_i32 = arith.constant 160 : i32
        %38 = arith.addi %c160_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c180_i32 = arith.constant 180 : i32
        %36 = arith.addi %c180_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_12 : i32
        %39 = "simt_step.if"(%38) ({
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %40 = arith.addi %c448_i32, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %42 = arith.addi %arg3, %39 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %43 = arith.addi %arg4, %c1_i32_14 : i32
        %true_15 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %44 = arith.muli %arg4, %c4_i32_16 : i32
        %45 = arith.addi %c464_i32, %44 : i32
        %46 = arith.addi %45, %0 : i32
        %true_17 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%42, %43) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c184_i32 = arith.constant 184 : i32
      %21 = arith.addi %c184_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      %24 = "simt_step.if"(%23) ({
        %c188_i32 = arith.constant 188 : i32
        %36 = arith.addi %c188_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_12 : i32
        %39 = "simt_step.if"(%38) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c480_i32 = arith.constant 480 : i32
        %40 = arith.addi %c480_i32, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %36 = simt_step.subgroup_id
        %37 = arith.index_cast %36 : index to i32
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      %c496_i32 = arith.constant 496 : i32
      %25 = arith.addi %c496_i32, %0 : i32
      %true_5 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c512_i32 = arith.constant 512 : i32
      %27 = arith.addi %c512_i32, %0 : i32
      %true_7 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %30:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_12 : i32
        %37 = arith.addi %36, %0 : i32
        %c192_i32 = arith.constant 192 : i32
        %38 = arith.addi %c192_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %36 = arith.addi %arg3, %arg4 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_14 : i32
        %39 = arith.addi %c528_i32, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_15 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      %c544_i32 = arith.constant 544 : i32
      %31 = arith.addi %c544_i32, %0 : i32
      %true_11 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %34 = simt_step.subgroup_id
      %35 = arith.index_cast %34 : index to i32
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

