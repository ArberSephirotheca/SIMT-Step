module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = simt_step.lane_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg4: i32):
          %true_1 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c0_i32_2 = arith.constant 0 : i32
          %11 = arith.addi %c0_i32_2, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %true_3 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %14 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %17 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
        ^bb3(%18: i32):  // no predecessors
          %true_5 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %20 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %9 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32 : i32
          %7 = arith.cmpi slt, %arg5, %6 : i32
          "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c80_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
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
        %true = arith.constant true
        %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %c4_i32 = arith.constant 4 : i32
        %4 = arith.muli %arg5, %c4_i32 : i32
        %5 = arith.addi %c96_i32, %4 : i32
        %6 = arith.addi %5, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %6, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.break"(%3, %7) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %7 = "simt_step.switch"(%6, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %20 = arith.addi %c12_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.subgroup_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%49: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %50:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_23 : i32
          %61 = arith.addi %60, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %62 = arith.addi %c16_i32, %61 : i32
          %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %64 = arith.cmpi ne, %63, %c0_i32_24 : i32
          "simt_step.condition"(%64, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %60 = arith.addi %arg4, %arg5 : i32
          %c1_i32_23 = arith.constant 1 : i32
          %61 = arith.addi %arg5, %c1_i32_23 : i32
          %true_24 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_25 = arith.constant 4 : i32
          %62 = arith.muli %arg5, %c4_i32_25 : i32
          %63 = arith.addi %c112_i32, %62 : i32
          %64 = arith.addi %63, %0 : i32
          %true_26 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60, %61) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %51 = arith.addi %c128_i32, %0 : i32
        %true_16 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%50#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%53: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %true_17 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %54 = arith.addi %c144_i32, %0 : i32
        %true_18 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
      ^bb3(%56: i32):  // no predecessors
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %57:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %60 = arith.muli %arg5, %c4_i32_23 : i32
          %61 = arith.addi %60, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %62 = arith.addi %c36_i32, %61 : i32
          %63 = "simt_step.buffer.load"(%arg1, %62) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %64 = arith.cmpi ne, %63, %c0_i32_24 : i32
          "simt_step.condition"(%64, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %60 = arith.addi %arg4, %arg5 : i32
          %c1_i32_23 = arith.constant 1 : i32
          %61 = arith.addi %arg5, %c1_i32_23 : i32
          %true_24 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_25 = arith.constant 4 : i32
          %62 = arith.muli %arg5, %c4_i32_25 : i32
          %63 = arith.addi %c160_i32, %62 : i32
          %64 = arith.addi %63, %0 : i32
          %true_26 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60, %61) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_21 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %58 = arith.addi %c176_i32, %0 : i32
        %true_22 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %25 = arith.addi %c192_i32, %0 : i32
      %true_4 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %28 = arith.addi %c56_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_5 : i32
      %31 = "simt_step.if"(%30) ({
        %c60_i32 = arith.constant 60 : i32
        %49 = arith.addi %c60_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %51 = simt_step.lane_id
        %52 = arith.index_cast %51 : index to i32
        %53 = "simt_step.switch"(%50, %52) ({
        ^bb0(%arg3: i32):
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %true_15 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %59 = arith.addi %c208_i32, %0 : i32
          %true_16 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          %62 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %54 = arith.addi %c224_i32, %0 : i32
        %true_14 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %49 = arith.addi %c64_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %51 = arith.cmpi ne, %50, %c0_i32_13 : i32
        %52 = "simt_step.if"(%51) ({
          %c4_i32_15 = arith.constant 4 : i32
          %55 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%55) : (i32) -> ()
        }, {
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %53 = arith.addi %c240_i32, %0 : i32
        %true_14 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %32 = arith.addi %c256_i32, %0 : i32
      %true_6 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %34 = arith.addi %c272_i32, %0 : i32
      %true_8 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%36: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %37 = arith.addi %c68_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %39 = "simt_step.switch"(%38, %0) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %49 = arith.addi %c72_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %51 = "simt_step.switch"(%50, %0) ({
        ^bb0(%arg4: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %73 = arith.addi %0, %c4_i32_23 : i32
          %true_24 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %74 = arith.addi %c288_i32, %0 : i32
          %true_25 = arith.constant true
          %75 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %74, %75) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%73) {fallthrough = false} : (i32) -> ()
        ^bb1(%76: i32):  // no predecessors
          %77 = simt_step.lane_id
          %78 = arith.index_cast %77 : index to i32
          %true_26 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %79 = arith.addi %c304_i32, %0 : i32
          %true_27 = arith.constant true
          %80 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %79, %80) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%78) {fallthrough = false} : (i32) -> ()
        ^bb2(%81: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb1(%52: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %53 = arith.addi %c76_i32, %0 : i32
        %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %55 = arith.cmpi ne, %54, %c0_i32_13 : i32
        %56 = "simt_step.if"(%55) ({
          %c2_i32_23 = arith.constant 2 : i32
          %73 = arith.addi %0, %c2_i32_23 : i32
          "simt_step.yield"(%73) : (i32) -> ()
        }, {
          %73 = simt_step.subgroup_id
          %74 = arith.index_cast %73 : index to i32
          "simt_step.yield"(%74) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %57 = arith.addi %c320_i32, %0 : i32
        %true_14 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      ^bb2(%59: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %60:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %73 = arith.muli %arg5, %c4_i32_23 : i32
          %74 = arith.addi %73, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %75 = arith.addi %c80_i32, %74 : i32
          %76 = "simt_step.buffer.load"(%arg1, %75) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %77 = arith.cmpi ne, %76, %c0_i32_24 : i32
          "simt_step.condition"(%77, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %73 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %74 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %75 = arith.muli %arg5, %c4_i32_24 : i32
          %76 = arith.addi %c336_i32, %75 : i32
          %77 = arith.addi %76, %0 : i32
          %true_25 = arith.constant true
          %78 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %77, %78) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%73, %74) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %61 = arith.addi %c352_i32, %0 : i32
        %true_18 = arith.constant true
        %62 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%60#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%63: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %64 = arith.addi %c100_i32, %0 : i32
        %65 = "simt_step.buffer.load"(%arg1, %64) : (!simt_step.resource<Global, i32>, i32) -> i32
        %66 = simt_step.subgroup_id
        %67 = arith.index_cast %66 : index to i32
        %68 = "simt_step.switch"(%65, %67) ({
        ^bb0(%arg4: i32):
          %73 = simt_step.subgroup_id
          %74 = arith.index_cast %73 : index to i32
          "simt_step.yield"(%74) {fallthrough = false} : (i32) -> ()
        ^bb1(%75: i32):  // no predecessors
          %true_23 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %76 = arith.addi %c368_i32, %0 : i32
          %true_24 = arith.constant true
          %77 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %76, %77) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %69 = arith.addi %c384_i32, %0 : i32
        %true_20 = arith.constant true
        %70 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_21 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %71 = arith.addi %c400_i32, %0 : i32
        %true_22 = arith.constant true
        %72 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
    ^bb3(%40: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %41 = arith.addi %c104_i32, %0 : i32
      %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %43 = arith.cmpi ne, %42, %c0_i32_9 : i32
      %44 = "simt_step.if"(%43) ({
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %49:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %50 = arith.muli %arg4, %c4_i32_15 : i32
          %51 = arith.addi %50, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %52 = arith.addi %c108_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_16 : i32
          "simt_step.condition"(%54, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %50 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %52 = arith.muli %arg4, %c4_i32_16 : i32
          %53 = arith.addi %c416_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_17 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%49#0) : (i32) -> ()
      }, {
        %c128_i32 = arith.constant 128 : i32
        %49 = arith.addi %c128_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %51 = simt_step.lane_id
        %52 = arith.index_cast %51 : index to i32
        %53 = "simt_step.switch"(%50, %52) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          %true_13 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %54 = arith.addi %c432_i32, %0 : i32
          %true_14 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          %58 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb3(%59: i32):  // no predecessors
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%53) : (i32) -> ()
      }) : (i1) -> i32
      %c448_i32 = arith.constant 448 : i32
      %45 = arith.addi %c448_i32, %0 : i32
      %true_10 = arith.constant true
      %46 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_11 = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %47 = arith.addi %c464_i32, %0 : i32
      %true_12 = arith.constant true
      %48 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c132_i32 = arith.constant 132 : i32
    %8 = arith.addi %c132_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_0 : i32
    %11 = "simt_step.if"(%10) ({
      %c136_i32 = arith.constant 136 : i32
      %20 = arith.addi %c136_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.subgroup_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg2: i32):
        %c140_i32 = arith.constant 140 : i32
        %25 = arith.addi %c140_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %27 = simt_step.subgroup_id
        %28 = arith.index_cast %27 : index to i32
        %29 = "simt_step.switch"(%26, %28) ({
        ^bb0(%arg3: i32):
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_8 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %50 = arith.addi %c480_i32, %0 : i32
          %true_9 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %31 = simt_step.lane_id
        %32 = arith.index_cast %31 : index to i32
        %true_3 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %33 = arith.addi %c496_i32, %0 : i32
        %true_4 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c144_i32 = arith.constant 144 : i32
        %36 = arith.addi %c144_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_5 : i32
        %39 = "simt_step.if"(%38) ({
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) : (i32) -> ()
        }, {
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c512_i32 = arith.constant 512 : i32
        %40 = arith.addi %c512_i32, %0 : i32
        %true_6 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c148_i32 = arith.constant 148 : i32
        %43 = arith.addi %c148_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = "simt_step.switch"(%44, %0) ({
        ^bb0(%arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %true_9 = arith.constant true
          %c528_i32 = arith.constant 528 : i32
          %47 = arith.addi %c528_i32, %0 : i32
          %true_10 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c0_i32_11 = arith.constant 0 : i32
          %50 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c544_i32 = arith.constant 544 : i32
    %12 = arith.addi %c544_i32, %0 : i32
    %true = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c152_i32 = arith.constant 152 : i32
    %14 = arith.addi %c152_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
    %17 = "simt_step.if"(%16) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_5 : i32
        %22 = arith.addi %21, %0 : i32
        %c156_i32 = arith.constant 156 : i32
        %23 = arith.addi %c156_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %21 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c560_i32 = arith.constant 560 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_6 : i32
        %24 = arith.addi %c560_i32, %23 : i32
        %25 = arith.addi %24, %0 : i32
        %true_7 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) : (i32) -> ()
    }, {
      %c176_i32 = arith.constant 176 : i32
      %20 = arith.addi %c176_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c180_i32 = arith.constant 180 : i32
        %26 = arith.addi %c180_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = "simt_step.switch"(%27, %0) ({
        ^bb0(%arg2: i32):
          %true_5 = arith.constant true
          %c576_i32 = arith.constant 576 : i32
          %29 = arith.addi %c576_i32, %0 : i32
          %true_6 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32_7 : i32
          %true_8 = arith.constant true
          %c592_i32 = arith.constant 592 : i32
          %33 = arith.addi %c592_i32, %0 : i32
          %true_9 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %true_10 = arith.constant true
          %c608_i32 = arith.constant 608 : i32
          %36 = arith.addi %c608_i32, %0 : i32
          %true_11 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %27 = arith.muli %arg3, %c4_i32_7 : i32
          %28 = arith.addi %27, %0 : i32
          %c184_i32 = arith.constant 184 : i32
          %29 = arith.addi %c184_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_8 : i32
          "simt_step.condition"(%31, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %27 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c624_i32 = arith.constant 624 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %29 = arith.muli %arg3, %c4_i32_8 : i32
          %30 = arith.addi %c624_i32, %29 : i32
          %31 = arith.addi %30, %0 : i32
          %true_9 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) : (i32) -> ()
      }) : (i1) -> i32
      %c640_i32 = arith.constant 640 : i32
      %24 = arith.addi %c640_i32, %0 : i32
      %true_4 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c656_i32 = arith.constant 656 : i32
    %18 = arith.addi %c656_i32, %0 : i32
    %true_2 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

