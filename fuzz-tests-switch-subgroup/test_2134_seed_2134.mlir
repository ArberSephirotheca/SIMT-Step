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
      %c2_i32 = arith.constant 2 : i32
      %5 = arith.remsi %arg3, %c2_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = "simt_step.switch"(%5, %c1_i32) ({
      ^bb0(%arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %9 = "simt_step.if"(%8) ({
          %true_7 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32 : i32
          %14 = arith.addi %c16_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32 : i32
          %14 = arith.addi %c32_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32_7 : i32
          %14 = arith.cmpi slt, %arg8, %13 : i32
          "simt_step.condition"(%14, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_7 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.muli %arg8, %c4_i32 : i32
          %14 = arith.addi %c48_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_8 = arith.constant 1 : i32
          %16 = arith.addi %arg8, %c1_i32_8 : i32
          "simt_step.yield"(%12, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32_3 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32_3 : i32
      "simt_step.break"(%6, %7) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %true_3 = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %19 = arith.addi %c64_i32, %0 : i32
      %true_4 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c80_i32 = arith.constant 80 : i32
    %9 = arith.addi %c80_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c12_i32 = arith.constant 12 : i32
    %11 = arith.addi %c12_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_2 = arith.constant 4 : i32
    %13 = "simt_step.switch"(%12, %c4_i32_2) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %14 = arith.addi %c16_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      %16 = arith.addi %0, %c4_i32_3 : i32
      %17 = "simt_step.switch"(%15, %16) ({
      ^bb0(%arg3: i32):
        %c20_i32 = arith.constant 20 : i32
        %30 = arith.addi %c20_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_9 : i32
        %33 = "simt_step.if"(%32) ({
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %34 = arith.addi %c96_i32, %0 : i32
        %true_10 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %37 = arith.addi %c24_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        %40 = "simt_step.if"(%39) ({
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %c0_i32_15 = arith.constant 0 : i32
          %45 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %41 = arith.addi %c112_i32, %0 : i32
        %true_12 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %43 = arith.addi %c128_i32, %0 : i32
        %true_14 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %true_5 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %19 = arith.addi %c144_i32, %0 : i32
      %true_6 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c0_i32_4) {fallthrough = true} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %23 = arith.addi %c28_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = simt_step.lane_id
      %26 = arith.index_cast %25 : index to i32
      %27 = "simt_step.switch"(%24, %26) ({
      ^bb0(%arg3: i32):
        %c32_i32 = arith.constant 32 : i32
        %30 = arith.addi %c32_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %53 = arith.addi %0, %c3_i32 : i32
          %true_19 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %54 = arith.addi %c160_i32, %0 : i32
          %true_20 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          %true_21 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %62 = arith.addi %c176_i32, %0 : i32
          %true_22 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb3(%64: i32):  // no predecessors
          %c1_i32_23 = arith.constant 1 : i32
          %65 = arith.addi %0, %c1_i32_23 : i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %33 = arith.addi %c192_i32, %0 : i32
        %true_10 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %35 = arith.addi %c208_i32, %0 : i32
        %true_12 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %38 = arith.addi %c36_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %0, %c1_i32 : i32
        %41 = "simt_step.switch"(%39, %40) ({
        ^bb0(%arg4: i32):
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          %true_20 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %56 = arith.addi %c224_i32, %0 : i32
          %true_21 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %43 = arith.addi %c40_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_13 : i32
        %46 = "simt_step.if"(%45) ({
          %c0_i32_19 = arith.constant 0 : i32
          %53 = arith.addi %0, %c0_i32_19 : i32
          "simt_step.yield"(%53) : (i32) -> ()
        }, {
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %47 = arith.addi %c240_i32, %0 : i32
        %true_14 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %49 = arith.addi %c256_i32, %0 : i32
        %true_16 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb3(%51: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_19 : i32
          %54 = arith.addi %53, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %55 = arith.addi %c44_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_20 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_21 : i32
          %56 = arith.addi %c272_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_22 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%52#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %28 = arith.addi %c288_i32, %0 : i32
      %true_8 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

