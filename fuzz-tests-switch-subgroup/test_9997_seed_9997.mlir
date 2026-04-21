module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %2 = simt_step.lane_id
      %3 = arith.index_cast %2 : index to i32
      %4 = "simt_step.switch"(%arg3, %3) ({
      ^bb0(%arg4: i32):
        %c2_i32 = arith.constant 2 : i32
        %7 = arith.remsi %arg3, %c2_i32 : i32
        %8 = simt_step.subgroup_id
        %9 = arith.index_cast %8 : index to i32
        %10 = "simt_step.switch"(%7, %9) ({
        ^bb0(%arg5: i32):
          %true_2 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %14 = arith.addi %c0_i32_3, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb1(%15: i32):  // no predecessors
          %true_4 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %17 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_2 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32 : i32
          %15 = arith.addi %c32_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%13, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %6 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) : (i32) -> ()
    }, {
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %3 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
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
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %20 = arith.muli %arg3, %c4_i32_6 : i32
        %21 = arith.addi %20, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %22 = arith.addi %c12_i32, %21 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
        "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %20 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg3, %c4_i32_7 : i32
        %23 = arith.addi %c80_i32, %22 : i32
        %24 = arith.addi %23, %0 : i32
        %true_8 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%19#0) : (i32) -> ()
    }, {
      %c32_i32 = arith.constant 32 : i32
      %19 = arith.addi %c32_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
      %22 = "simt_step.if"(%21) ({
        %c36_i32 = arith.constant 36 : i32
        %25 = arith.addi %c36_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_6 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %29 = arith.addi %c96_i32, %0 : i32
        %true_7 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_8 : i32
          %27 = arith.addi %26, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %28 = arith.addi %c40_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_9 : i32
          "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %26 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg3, %c1_i32 : i32
          %true_8 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %28 = arith.muli %arg3, %c4_i32_9 : i32
          %29 = arith.addi %c112_i32, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_10 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %23 = arith.addi %c128_i32, %0 : i32
      %true_5 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c144_i32 = arith.constant 144 : i32
    %10 = arith.addi %c144_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %12 = arith.addi %c60_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c64_i32 = arith.constant 64 : i32
      %19 = arith.addi %c64_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
      %22 = "simt_step.if"(%21) ({
        %c68_i32 = arith.constant 68 : i32
        %48 = arith.addi %c68_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_14 = arith.constant 4 : i32
        %50 = "simt_step.switch"(%49, %c4_i32_14) ({
        ^bb0(%arg3: i32):
          %51 = simt_step.subgroup_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) {fallthrough = true} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%54: i32):  // no predecessors
          %true_15 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %55 = arith.addi %c160_i32, %0 : i32
          %true_16 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%50) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        %48 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%48) : (i32) -> ()
      }) : (i1) -> i32
      %c176_i32 = arith.constant 176 : i32
      %23 = arith.addi %c176_i32, %0 : i32
      %true_5 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %26 = arith.addi %c72_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
      %29 = "simt_step.if"(%28) ({
        %c76_i32 = arith.constant 76 : i32
        %48 = arith.addi %c76_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %50 = arith.addi %0, %c0_i32_14 : i32
        %51 = "simt_step.switch"(%49, %50) ({
        ^bb0(%arg3: i32):
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          %true_15 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %54 = arith.addi %c192_i32, %0 : i32
          %true_16 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = true} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%51) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %48 = arith.addi %c80_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %50 = simt_step.lane_id
        %51 = arith.index_cast %50 : index to i32
        %52 = "simt_step.switch"(%49, %51) ({
        ^bb0(%arg3: i32):
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %54 = simt_step.lane_id
          %55 = arith.index_cast %54 : index to i32
          %true_15 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %56 = arith.addi %c208_i32, %0 : i32
          %true_16 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%52) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %30 = arith.addi %c224_i32, %0 : i32
      %true_7 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %33 = arith.addi %c84_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
      %36 = "simt_step.if"(%35) ({
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }, {
        %c88_i32 = arith.constant 88 : i32
        %48 = arith.addi %c88_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_14 : i32
        %51 = "simt_step.if"(%50) ({
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }, {
          %54 = simt_step.lane_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %52 = arith.addi %c240_i32, %0 : i32
        %true_15 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %37 = arith.addi %c256_i32, %0 : i32
      %true_9 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %39 = arith.addi %c272_i32, %0 : i32
      %true_11 = arith.constant true
      %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
    ^bb3(%41: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %42 = arith.addi %c92_i32, %0 : i32
      %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %44 = arith.addi %0, %c3_i32 : i32
      %45 = "simt_step.switch"(%43, %44) ({
      ^bb0(%arg3: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %48:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_22 : i32
          %60 = arith.addi %59, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %61 = arith.addi %c96_i32, %60 : i32
          %62 = "simt_step.buffer.load"(%arg1, %61) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %63 = arith.cmpi ne, %62, %c0_i32_23 : i32
          "simt_step.condition"(%63, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %59 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %60 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %61 = arith.muli %arg5, %c4_i32_23 : i32
          %62 = arith.addi %c288_i32, %61 : i32
          %63 = arith.addi %62, %0 : i32
          %true_24 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%59, %60) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %49 = arith.addi %c304_i32, %0 : i32
        %true_17 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%51: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_22 : i32
          %60 = arith.addi %59, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %61 = arith.addi %c116_i32, %60 : i32
          %62 = "simt_step.buffer.load"(%arg1, %61) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %63 = arith.cmpi ne, %62, %c0_i32_23 : i32
          "simt_step.condition"(%63, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %59 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %60 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %61 = arith.muli %arg5, %c4_i32_23 : i32
          %62 = arith.addi %c320_i32, %61 : i32
          %63 = arith.addi %62, %0 : i32
          %true_24 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%59, %60) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_20 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %53 = arith.addi %c336_i32, %0 : i32
        %true_21 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%55: i32):  // no predecessors
        %c136_i32 = arith.constant 136 : i32
        %56 = arith.addi %c136_i32, %0 : i32
        %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
        %58 = "simt_step.switch"(%57, %0) ({
        ^bb0(%arg4: i32):
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb1(%61: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_22 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %62 = arith.addi %c352_i32, %0 : i32
          %true_23 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_12 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %46 = arith.addi %c368_i32, %0 : i32
      %true_13 = arith.constant true
      %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c384_i32 = arith.constant 384 : i32
    %17 = arith.addi %c384_i32, %0 : i32
    %true_3 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

