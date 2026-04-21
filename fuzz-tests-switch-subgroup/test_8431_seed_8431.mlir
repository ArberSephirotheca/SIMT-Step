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
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_6 = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.muli %arg5, %c4_i32 : i32
      %10 = arith.addi %c16_i32, %9 : i32
      %11 = arith.addi %10, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%8, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %9 = simt_step.lane_id
      %10 = arith.index_cast %9 : index to i32
      %11 = "simt_step.switch"(%8, %10) ({
      ^bb0(%arg6: i32):
        %true_6 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %14 = arith.muli %arg5, %c4_i32_7 : i32
        %15 = arith.addi %c32_i32, %14 : i32
        %16 = arith.addi %15, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %true_8 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_9 : i32
        %20 = arith.addi %c48_i32, %19 : i32
        %21 = arith.addi %20, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %23 = arith.remsi %arg3, %c2_i32 : i32
        %24 = simt_step.subgroup_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%23, %25) ({
        ^bb0(%arg7: i32):
          %true_13 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_14 : i32
          %37 = arith.addi %c64_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %true_15 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_16 : i32
          %42 = arith.addi %c80_i32, %41 : i32
          %43 = arith.addi %42, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %true_17 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_18 : i32
          %47 = arith.addi %c96_i32, %46 : i32
          %48 = arith.addi %47, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %48, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %28 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %29 = arith.addi %arg0, %c1_i32_10 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg7: i32):
          %true_13 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_14 : i32
          %37 = arith.addi %c112_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %true_15 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_16 : i32
          %42 = arith.addi %c128_i32, %41 : i32
          %43 = arith.addi %42, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %true_17 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_18 : i32
          %47 = arith.addi %c144_i32, %46 : i32
          %48 = arith.addi %47, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %48, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb3(%49: i32):  // no predecessors
          %true_19 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_20 : i32
          %52 = arith.addi %c160_i32, %51 : i32
          %53 = arith.addi %52, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %53, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %32 = arith.muli %arg5, %c4_i32_12 : i32
        %33 = arith.addi %c176_i32, %32 : i32
        %34 = arith.addi %33, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_5 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %7 = arith.select %6, %4, %5#0 : i32
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_0 : i32
    %10 = "simt_step.if"(%9) ({
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
      %22 = "simt_step.if"(%21) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_7 : i32
          %27 = arith.addi %26, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %28 = arith.addi %c16_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
          "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %26 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %28 = arith.muli %arg3, %c4_i32_8 : i32
          %29 = arith.addi %c192_i32, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %23 = arith.addi %c208_i32, %0 : i32
      %true_4 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c224_i32 = arith.constant 224 : i32
    %11 = arith.addi %c224_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c36_i32 = arith.constant 36 : i32
    %13 = arith.addi %c36_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_1 : i32
    %16 = "simt_step.if"(%15) ({
      %c40_i32 = arith.constant 40 : i32
      %19 = arith.addi %c40_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
      %22 = "simt_step.if"(%21) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_7 : i32
          %27 = arith.addi %26, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %28 = arith.addi %c44_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
          "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %26 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %28 = arith.muli %arg3, %c4_i32_8 : i32
          %29 = arith.addi %c240_i32, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_7 : i32
          %27 = arith.addi %26, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %28 = arith.addi %c64_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
          "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %26 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %28 = arith.muli %arg3, %c4_i32_8 : i32
          %29 = arith.addi %c256_i32, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %23 = arith.addi %c272_i32, %0 : i32
      %true_4 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      %c84_i32 = arith.constant 84 : i32
      %19 = arith.addi %c84_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.lane_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg2: i32):
        %c88_i32 = arith.constant 88 : i32
        %24 = arith.addi %c88_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg3: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          %true_8 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %37 = arith.addi %c288_i32, %0 : i32
          %true_9 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %29 = arith.addi %c304_i32, %0 : i32
        %true_4 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_7 : i32
          %34 = arith.addi %33, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %35 = arith.addi %c92_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32 : i32
          %true_7 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_8 : i32
          %36 = arith.addi %c320_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_9 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c336_i32 = arith.constant 336 : i32
    %17 = arith.addi %c336_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

