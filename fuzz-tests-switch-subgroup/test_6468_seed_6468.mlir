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
      %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %2 = "simt_step.if"(%1) ({
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.muli %arg5, %c4_i32 : i32
        %6 = arith.addi %c0_i32_2, %5 : i32
        %7 = arith.addi %6, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
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
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg7, %c4_i32 : i32
          %7 = arith.addi %c16_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_4 = arith.constant 1 : i32
          %9 = arith.addi %arg7, %c1_i32_4 : i32
          "simt_step.continue"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%2, %3) : (i32, i32) -> ()
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
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %22 = arith.addi %c8_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_2 : i32
      "simt_step.if"(%24) ({
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
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_4 : i32
        %24 = arith.addi %23, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %25 = arith.addi %c16_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
        "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %23 = arith.addi %c36_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
        %26 = "simt_step.if"(%25) ({
          %c3_i32 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %27 = arith.addi %c32_i32, %0 : i32
        %true_5 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %29 = arith.addi %arg2, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %31 = arith.muli %arg3, %c4_i32_7 : i32
        %32 = arith.addi %c48_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_8 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_4 : i32
        %24 = arith.addi %23, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %25 = arith.addi %c40_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
        "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %23 = arith.addi %c60_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
        %26 = "simt_step.if"(%25) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32_5 = arith.constant 64 : i32
        %27 = arith.addi %c64_i32_5, %0 : i32
        %true_6 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %29 = arith.addi %arg2, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %31 = arith.muli %arg3, %c4_i32_8 : i32
        %32 = arith.addi %c80_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_9 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %10 = arith.addi %c96_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c64_i32 = arith.constant 64 : i32
    %12 = arith.addi %c64_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %23 = arith.addi %c68_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %25 = arith.addi %0, %c1_i32 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %39 = arith.addi %c72_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = "simt_step.switch"(%40, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32 : i32
          %true_12 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %46 = arith.addi %c112_i32, %0 : i32
          %true_13 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          %true_15 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %49 = arith.addi %c128_i32, %0 : i32
          %true_16 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%52: i32):  // no predecessors
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %42 = arith.addi %c144_i32, %0 : i32
        %true_10 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_11) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %28 = arith.addi %c76_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_2 : i32
      %31 = "simt_step.if"(%30) ({
        %c80_i32 = arith.constant 80 : i32
        %39 = arith.addi %c80_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_9 : i32
        %42 = "simt_step.if"(%41) ({
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %43 = arith.addi %c160_i32, %0 : i32
        %true_10 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) : (i32) -> ()
      }, {
        %c84_i32 = arith.constant 84 : i32
        %39 = arith.addi %c84_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_9 = arith.constant 1 : i32
        %41 = arith.addi %0, %c1_i32_9 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32 : i32
          %true_12 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %46 = arith.addi %c176_i32, %0 : i32
          %true_13 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %43 = arith.addi %c192_i32, %0 : i32
        %true_11 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %32 = arith.addi %c208_i32, %0 : i32
      %true_3 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %34 = arith.addi %c224_i32, %0 : i32
      %true_5 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c4_i32_6 = arith.constant 4 : i32
      %true_7 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %37 = arith.addi %c240_i32, %0 : i32
      %true_8 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c4_i32_6) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c88_i32 = arith.constant 88 : i32
    %17 = arith.addi %c88_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %19 = simt_step.subgroup_id
    %20 = arith.index_cast %19 : index to i32
    %21 = "simt_step.switch"(%18, %20) ({
    ^bb0(%arg2: i32):
      %c92_i32 = arith.constant 92 : i32
      %22 = arith.addi %c92_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_2 : i32
      %25 = "simt_step.if"(%24) ({
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_14 : i32
          %45 = arith.addi %44, %0 : i32
          %c96_i32_15 = arith.constant 96 : i32
          %46 = arith.addi %c96_i32_15, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_16 : i32
          "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %44 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_15 : i32
          %47 = arith.addi %c256_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_16 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) : (i32) -> ()
      }, {
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_14 : i32
          %45 = arith.addi %44, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %46 = arith.addi %c116_i32, %45 : i32
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
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %26 = arith.addi %c288_i32, %0 : i32
      %true_3 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %28 = arith.addi %c304_i32, %0 : i32
      %true_5 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%30: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %31:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_12 : i32
        %44 = arith.addi %43, %0 : i32
        %c136_i32 = arith.constant 136 : i32
        %45 = arith.addi %c136_i32, %44 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_13 : i32
        "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c3_i32 = arith.constant 3 : i32
        %43 = arith.addi %0, %c3_i32 : i32
        %44 = arith.addi %arg3, %43 : i32
        %c1_i32 = arith.constant 1 : i32
        %45 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %46 = arith.muli %arg4, %c4_i32_13 : i32
        %47 = arith.addi %c320_i32, %46 : i32
        %48 = arith.addi %47, %0 : i32
        %true_14 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44, %45) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %32 = arith.addi %c336_i32, %0 : i32
      %true_9 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%34: i32):  // no predecessors
      %35 = simt_step.lane_id
      %36 = arith.index_cast %35 : index to i32
      %true_10 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %37 = arith.addi %c352_i32, %0 : i32
      %true_11 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    ^bb3(%39: i32):  // no predecessors
      %c156_i32 = arith.constant 156 : i32
      %40 = arith.addi %c156_i32, %0 : i32
      %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
      %42 = "simt_step.switch"(%41, %0) ({
      ^bb0(%arg3: i32):
        %c160_i32 = arith.constant 160 : i32
        %43 = arith.addi %c160_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = "simt_step.switch"(%44, %0) ({
        ^bb0(%arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %64 = arith.addi %0, %c4_i32_19 : i32
          %true_20 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %65 = arith.addi %c368_i32, %0 : i32
          %true_21 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        ^bb1(%67: i32):  // no predecessors
          %68 = simt_step.lane_id
          %69 = arith.index_cast %68 : index to i32
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %46 = arith.addi %c384_i32, %0 : i32
        %true_13 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb1(%48: i32):  // no predecessors
        %c4_i32_14 = arith.constant 4 : i32
        %true_15 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %49 = arith.addi %c400_i32, %0 : i32
        %true_16 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_14) {fallthrough = false} : (i32) -> ()
      ^bb2(%51: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %52 = arith.addi %c164_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %54 = arith.addi %0, %c1_i32 : i32
        %55 = "simt_step.switch"(%53, %54) ({
        ^bb0(%arg4: i32):
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          %true_19 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %66 = arith.addi %c416_i32, %0 : i32
          %true_20 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb1(%68: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %69 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
      ^bb3(%56: i32):  // no predecessors
        %c168_i32 = arith.constant 168 : i32
        %57 = arith.addi %c168_i32, %0 : i32
        %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
        %59 = simt_step.subgroup_id
        %60 = arith.index_cast %59 : index to i32
        %61 = "simt_step.switch"(%58, %60) ({
        ^bb0(%arg4: i32):
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %67 = simt_step.subgroup_id
          %68 = arith.index_cast %67 : index to i32
          %true_19 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %69 = arith.addi %c432_i32, %0 : i32
          %true_20 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb2(%71: i32):  // no predecessors
          %c0_i32_21 = arith.constant 0 : i32
          %true_22 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %72 = arith.addi %c448_i32, %0 : i32
          %true_23 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %62 = arith.addi %c464_i32, %0 : i32
        %true_18 = arith.constant true
        %63 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

