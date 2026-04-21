module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %c2_i32 = arith.constant 2 : i32
      %3 = arith.addi %arg0, %c2_i32 : i32
      %4 = "simt_step.switch"(%2, %3) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_7 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32 : i32
          %18 = arith.addi %c16_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%5#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%6: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %7 = arith.addi %arg0, %c0_i32_2 : i32
        %8 = "simt_step.switch"(%arg3, %7) ({
        ^bb0(%arg5: i32):
          %true_7 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %17 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %20 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
      ^bb2(%9: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_7 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32 : i32
          %18 = arith.addi %c64_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%11: i32):  // no predecessors
        %c3_i32_5 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32_5 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %13 = "simt_step.switch"(%12, %c0_i32_6) ({
        ^bb0(%arg5: i32):
          %true_7 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %17 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %20 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %23 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %26 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %15 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%4) : (i32) -> ()
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_0 : i32
    %10 = "simt_step.if"(%9) ({
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.addi %0, %c0_i32_3 : i32
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c160_i32 = arith.constant 160 : i32
    %11 = arith.addi %c160_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c12_i32 = arith.constant 12 : i32
    %13 = arith.addi %c12_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_1 : i32
    %16 = "simt_step.if"(%15) ({
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c16_i32 = arith.constant 16 : i32
      %19 = arith.addi %c16_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.lane_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg2: i32):
        %c20_i32 = arith.constant 20 : i32
        %26 = arith.addi %c20_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        %30 = "simt_step.switch"(%27, %29) ({
        ^bb0(%arg3: i32):
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          %true_19 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %52 = arith.addi %c176_i32, %0 : i32
          %true_20 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          %true_21 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %57 = arith.addi %c192_i32, %0 : i32
          %true_22 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = true} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %c0_i32_23 = arith.constant 0 : i32
          %true_24 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %61 = arith.addi %c208_i32, %0 : i32
          %true_25 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %31 = arith.addi %c224_i32, %0 : i32
        %true_6 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_7 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %33 = arith.addi %c240_i32, %0 : i32
        %true_8 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %36 = arith.addi %c24_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_9 : i32
        %39 = "simt_step.if"(%38) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %40 = arith.addi %c256_i32, %0 : i32
        %true_10 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %50 = arith.muli %arg4, %c4_i32_19 : i32
          %51 = arith.addi %50, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %52 = arith.addi %c28_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_20 : i32
          "simt_step.condition"(%54, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %50 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg4, %c1_i32 : i32
          %true_19 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %52 = arith.muli %arg4, %c4_i32_20 : i32
          %53 = arith.addi %c272_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_21 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %44 = arith.addi %c288_i32, %0 : i32
        %true_14 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%46: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %47:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %50 = arith.muli %arg4, %c4_i32_19 : i32
          %51 = arith.addi %50, %0 : i32
          %c48_i32 = arith.constant 48 : i32
          %52 = arith.addi %c48_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_20 : i32
          "simt_step.condition"(%54, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %50 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg4, %c1_i32 : i32
          %true_19 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %52 = arith.muli %arg4, %c4_i32_20 : i32
          %53 = arith.addi %c304_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_21 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %48 = arith.addi %c320_i32, %0 : i32
        %true_18 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %24 = arith.addi %c336_i32, %0 : i32
      %true_4 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c352_i32 = arith.constant 352 : i32
    %17 = arith.addi %c352_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

