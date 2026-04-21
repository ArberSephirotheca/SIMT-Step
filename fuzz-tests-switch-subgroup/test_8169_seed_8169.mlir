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
      %2 = simt_step.lane_id
      %3 = arith.index_cast %2 : index to i32
      %4 = "simt_step.switch"(%1, %3) ({
      ^bb0(%arg6: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_6 : i32
          %19 = arith.cmpi slt, %arg8, %18 : i32
          "simt_step.condition"(%19, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_5 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %18 = arith.muli %arg8, %c4_i32_7 : i32
          %19 = arith.addi %c0_i32_6, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_8 = arith.constant 1 : i32
          %21 = arith.addi %arg8, %c1_i32_8 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.muli %arg5, %c4_i32 : i32
        %10 = arith.addi %c16_i32, %9 : i32
        %11 = arith.addi %10, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %true_3 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %14 = arith.muli %arg5, %c4_i32_4 : i32
        %15 = arith.addi %c32_i32, %14 : i32
        %16 = arith.addi %15, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %5) : (i32, i32) -> ()
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
    %c3_i32 = arith.constant 3 : i32
    %7 = arith.addi %0, %c3_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
      %15 = "simt_step.if"(%14) ({
        %c16_i32 = arith.constant 16 : i32
        %28 = arith.addi %c16_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_6 : i32
        %31 = "simt_step.if"(%30) ({
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %32 = arith.addi %c48_i32, %0 : i32
        %true_7 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_6) : (i32) -> ()
      }) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %16 = arith.addi %c64_i32, %0 : i32
      %true = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %18 = arith.addi %c80_i32, %0 : i32
      %true_4 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %21 = arith.addi %c20_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32_5 = arith.constant 3 : i32
      %23 = arith.addi %0, %c3_i32_5 : i32
      %24 = "simt_step.switch"(%22, %23) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_22 : i32
          %52 = arith.addi %51, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %53 = arith.addi %c24_i32, %52 : i32
          %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %55 = arith.cmpi ne, %54, %c0_i32_23 : i32
          "simt_step.condition"(%55, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %51 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_23 : i32
          %54 = arith.addi %c96_i32, %53 : i32
          %55 = arith.addi %54, %0 : i32
          %true_24 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51, %52) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %29 = arith.addi %c112_i32, %0 : i32
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_22 : i32
          %52 = arith.addi %51, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %53 = arith.addi %c44_i32, %52 : i32
          %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %55 = arith.cmpi ne, %54, %c0_i32_23 : i32
          "simt_step.condition"(%55, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %51 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %52 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_23 : i32
          %54 = arith.addi %c128_i32, %53 : i32
          %55 = arith.addi %54, %0 : i32
          %true_24 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%51, %52) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %33 = arith.addi %c144_i32, %0 : i32
        %true_13 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c64_i32_14 = arith.constant 64 : i32
        %36 = arith.addi %c64_i32_14, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_15 = arith.constant 3 : i32
        %38 = arith.addi %0, %c3_i32_15 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg4: i32):
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = true} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          %true_22 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %59 = arith.addi %c160_i32, %0 : i32
          %true_23 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
        ^bb3(%61: i32):  // no predecessors
          %62 = simt_step.lane_id
          %63 = arith.index_cast %62 : index to i32
          %true_24 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %64 = arith.addi %c176_i32, %0 : i32
          %true_25 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %40 = arith.addi %c192_i32, %0 : i32
        %true_17 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %43 = arith.addi %c68_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_18 : i32
        %46 = "simt_step.if"(%45) ({
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %47 = arith.addi %c208_i32, %0 : i32
        %true_19 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_20 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %49 = arith.addi %c224_i32, %0 : i32
        %true_21 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %26 = simt_step.lane_id
      %27 = arith.index_cast %26 : index to i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %9 = simt_step.subgroup_id
    %10 = arith.index_cast %9 : index to i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_2 : i32
      %13 = arith.addi %12, %0 : i32
      %c72_i32 = arith.constant 72 : i32
      %14 = arith.addi %c72_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_3 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c92_i32 = arith.constant 92 : i32
      %12 = arith.addi %c92_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = "simt_step.switch"(%13, %0) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %24 = arith.addi %c96_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_6 = arith.constant 1 : i32
        %26 = "simt_step.switch"(%25, %c1_i32_6) ({
        ^bb0(%arg5: i32):
          %true_11 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %37 = arith.addi %c240_i32, %0 : i32
          %true_12 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          %true_14 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %41 = arith.addi %c256_i32, %0 : i32
          %true_15 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %27 = arith.addi %c272_i32, %0 : i32
        %true_8 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %29 = arith.addi %c288_i32, %0 : i32
        %true_10 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %32 = simt_step.subgroup_id
        %33 = arith.index_cast %32 : index to i32
        "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
      ^bb3(%34: i32):  // no predecessors
        %35 = simt_step.lane_id
        %36 = arith.index_cast %35 : index to i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %15 = arith.addi %c304_i32, %0 : i32
      %true_2 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %17 = arith.addi %arg2, %14 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg3, %c1_i32 : i32
      %true_3 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_4 : i32
      %20 = arith.addi %c320_i32, %19 : i32
      %21 = arith.addi %20, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

