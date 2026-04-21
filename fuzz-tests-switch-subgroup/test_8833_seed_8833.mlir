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
      %c0_i32_1 = arith.constant 0 : i32
      %2 = arith.addi %arg0, %c0_i32_1 : i32
      %3 = "simt_step.switch"(%1, %2) ({
      ^bb0(%arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %10 = "simt_step.if"(%9) ({
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %24 = arith.muli %arg5, %c4_i32_9 : i32
          %25 = arith.addi %c0_i32_8, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %24 = arith.muli %arg5, %c4_i32_8 : i32
          %25 = arith.addi %c16_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c3_i32_3 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32_3 : i32
        %13 = simt_step.subgroup_id
        %14 = arith.index_cast %13 : index to i32
        %15 = "simt_step.switch"(%12, %14) ({
        ^bb0(%arg7: i32):
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %24 = arith.muli %arg5, %c4_i32_8 : i32
          %25 = arith.addi %c32_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_9 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_10 : i32
          %30 = arith.addi %c48_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_12 : i32
          %35 = arith.addi %c64_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %17 = arith.muli %arg5, %c4_i32_5 : i32
        %18 = arith.addi %c80_i32, %17 : i32
        %19 = arith.addi %18, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %22 = "simt_step.if"(%21) ({
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %24 = arith.muli %arg5, %c4_i32_8 : i32
          %25 = arith.addi %c96_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %24 = arith.muli %arg5, %c4_i32_8 : i32
          %25 = arith.addi %c112_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32 : i32
      %6 = arith.addi %c128_i32, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%3, %8) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = "simt_step.switch"(%17, %0) ({
      ^bb0(%arg2: i32):
        %19 = simt_step.lane_id
        %20 = arith.index_cast %19 : index to i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c16_i32 = arith.constant 16 : i32
        %22 = arith.addi %c16_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_4 : i32
        %25 = "simt_step.if"(%24) ({
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %26 = arith.addi %c144_i32, %0 : i32
        %true_5 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_6 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %28 = arith.addi %c160_i32, %0 : i32
        %true_7 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %31 = arith.addi %c20_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_8 : i32
        %34 = "simt_step.if"(%33) ({
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %c4_i32_16 = arith.constant 4 : i32
          %48 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %35 = arith.addi %c176_i32, %0 : i32
        %true_9 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %37 = arith.addi %c192_i32, %0 : i32
        %true_11 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %40 = arith.addi %c24_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_12 : i32
        %43 = "simt_step.if"(%42) ({
          %c3_i32 = arith.constant 3 : i32
          %48 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %44 = arith.addi %c208_i32, %0 : i32
        %true_13 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %46 = arith.addi %c224_i32, %0 : i32
        %true_15 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %16 = simt_step.lane_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %9 = arith.addi %c240_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %11 = arith.addi %c28_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.addi %0, %c0_i32_1 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %16 = simt_step.lane_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %19 = arith.addi %c32_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_14 : i32
          %43 = arith.addi %42, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %44 = arith.addi %c36_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_15 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          %true_14 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_15 : i32
          %45 = arith.addi %c256_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_16 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %29 = arith.addi %c272_i32, %0 : i32
        %true_11 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %32 = arith.addi %c56_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %34 = "simt_step.switch"(%33, %c2_i32) ({
        ^bb0(%arg4: i32):
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          %true_14 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %44 = arith.addi %c288_i32, %0 : i32
          %true_15 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          %true_16 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %49 = arith.addi %c304_i32, %0 : i32
          %true_17 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb3(%54: i32):  // no predecessors
          %true_18 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %55 = arith.addi %c320_i32, %0 : i32
          %true_19 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %35 = arith.addi %c336_i32, %0 : i32
        %true_13 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %38 = arith.addi %c60_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %40 = arith.addi %0, %c3_i32 : i32
        %41 = "simt_step.switch"(%39, %40) ({
        ^bb0(%arg4: i32):
          %c2_i32_14 = arith.constant 2 : i32
          %42 = arith.addi %0, %c2_i32_14 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %44 = simt_step.lane_id
          %45 = arith.index_cast %44 : index to i32
          %true_15 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %46 = arith.addi %c352_i32, %0 : i32
          %true_16 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %true_17 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %49 = arith.addi %c368_i32, %0 : i32
          %true_18 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_8 : i32
        %29 = arith.addi %28, %0 : i32
        %c64_i32 = arith.constant 64 : i32
        %30 = arith.addi %c64_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_9 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %35 = arith.muli %arg6, %c4_i32_13 : i32
          %36 = arith.addi %35, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %37 = arith.addi %c84_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_14 : i32
          "simt_step.condition"(%39, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %35 = arith.addi %arg5, %arg6 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %36 = arith.addi %arg6, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %37 = arith.muli %arg6, %c4_i32_15 : i32
          %38 = arith.addi %c384_i32, %37 : i32
          %39 = arith.addi %38, %0 : i32
          %true_16 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %29 = arith.addi %arg3, %28#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_11 : i32
        %32 = arith.addi %c400_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_12 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %26 = arith.addi %c416_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %15:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_4 : i32
      %17 = arith.addi %16, %0 : i32
      %c104_i32 = arith.constant 104 : i32
      %18 = arith.addi %c104_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %16 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_5 : i32
      %19 = arith.addi %c432_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_6 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

