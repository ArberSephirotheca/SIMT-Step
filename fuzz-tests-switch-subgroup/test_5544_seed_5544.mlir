module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %18 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %18, %c1_i32 : i32
        %20 = arith.cmpi slt, %arg6, %19 : i32
        "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_7 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %c4_i32 = arith.constant 4 : i32
        %19 = arith.muli %arg6, %c4_i32 : i32
        %20 = arith.addi %c16_i32, %19 : i32
        %21 = arith.addi %20, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%18, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %17 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_0 = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %7 = arith.addi %c48_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %9 = arith.select %8, %0, %5 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %11 = "simt_step.if"(%10) ({
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.remsi %arg3, %c3_i32 : i32
      %15 = simt_step.lane_id
      %16 = arith.index_cast %15 : index to i32
      %17 = "simt_step.switch"(%14, %16) ({
      ^bb0(%arg4: i32):
        %c3_i32_5 = arith.constant 3 : i32
        %20 = arith.remsi %arg3, %c3_i32_5 : i32
        %21 = simt_step.lane_id
        %22 = arith.index_cast %21 : index to i32
        %23 = "simt_step.switch"(%20, %22) ({
        ^bb0(%arg5: i32):
          %true_11 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %32 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %true_12 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %35 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %true_13 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %38 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          %true_14 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %41 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %41, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %31 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %31, %c1_i32 : i32
          %33 = arith.cmpi slt, %arg6, %32 : i32
          "simt_step.condition"(%33, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_11 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32 : i32
          %33 = arith.addi %c128_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%31, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %31 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %31, %c1_i32 : i32
          %33 = arith.cmpi slt, %arg6, %32 : i32
          "simt_step.condition"(%33, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_11 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32 : i32
          %33 = arith.addi %c144_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%31, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        %true_10 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %30 = arith.addi %c160_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c176_i32 = arith.constant 176 : i32
      %19 = arith.addi %c176_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) : (i32) -> ()
    }, {
      %c0_i32_4 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %15 = "simt_step.if"(%14) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg5, %18 : i32
          "simt_step.condition"(%19, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true_7 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg5, %c4_i32 : i32
          %19 = arith.addi %c192_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) : (i32) -> ()
      }, {
        %true_5 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %17 = arith.addi %c208_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %13 = arith.select %12, %9, %11 : i32
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
    %7 = "simt_step.switch"(%6, %c3_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_5 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_19 : i32
          %44 = arith.addi %43, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %45 = arith.addi %c16_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_20 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_19 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_20 : i32
          %46 = arith.addi %c224_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_21 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %42 = arith.addi %c36_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_17 = arith.constant 4 : i32
        %44 = arith.addi %0, %c4_i32_17 : i32
        %45 = "simt_step.switch"(%43, %44) ({
        ^bb0(%arg3: i32):
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          %true_20 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %50 = arith.addi %c240_i32, %0 : i32
          %true_21 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_18 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %46 = arith.addi %c256_i32, %0 : i32
        %true_19 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %21 = arith.addi %c272_i32, %0 : i32
      %true_6 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %24 = arith.addi %c40_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
      %27 = "simt_step.if"(%26) ({
        %c44_i32 = arith.constant 44 : i32
        %42 = arith.addi %c44_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %44 = "simt_step.switch"(%43, %0) ({
        ^bb0(%arg3: i32):
          %c3_i32_19 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32_19 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          %true_20 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %51 = arith.addi %c288_i32, %0 : i32
          %true_21 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          %c0_i32_22 = arith.constant 0 : i32
          %54 = arith.addi %0, %c0_i32_22 : i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %45 = arith.addi %c304_i32, %0 : i32
        %true_18 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %28 = arith.addi %c320_i32, %0 : i32
      %true_8 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %30 = arith.addi %c336_i32, %0 : i32
      %true_10 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %33:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_17 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_17 : i32
        %43 = arith.addi %42, %0 : i32
        %c48_i32 = arith.constant 48 : i32
        %44 = arith.addi %c48_i32, %43 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_18 : i32
        "simt_step.condition"(%46, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c68_i32 = arith.constant 68 : i32
        %42 = arith.addi %c68_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_17 = arith.constant 3 : i32
        %44 = arith.addi %0, %c3_i32_17 : i32
        %45 = "simt_step.switch"(%43, %44) ({
        ^bb0(%arg5: i32):
          %c1_i32_21 = arith.constant 1 : i32
          %52 = arith.addi %0, %c1_i32_21 : i32
          %true_22 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %53 = arith.addi %c352_i32, %0 : i32
          %true_23 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          %true_24 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %58 = arith.addi %c368_i32, %0 : i32
          %true_25 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = true} : (i32) -> ()
        ^bb2(%60: i32):  // no predecessors
          %c1_i32_26 = arith.constant 1 : i32
          %61 = arith.addi %0, %c1_i32_26 : i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb3(%62: i32):  // no predecessors
          %63 = simt_step.subgroup_id
          %64 = arith.index_cast %63 : index to i32
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %46 = arith.addi %arg3, %45 : i32
        %c1_i32 = arith.constant 1 : i32
        %47 = arith.addi %arg4, %c1_i32 : i32
        %true_18 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %c4_i32_19 = arith.constant 4 : i32
        %48 = arith.muli %arg4, %c4_i32_19 : i32
        %49 = arith.addi %c384_i32, %48 : i32
        %50 = arith.addi %49, %0 : i32
        %true_20 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46, %47) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %34 = arith.addi %c400_i32, %0 : i32
      %true_14 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %37 = arith.addi %c72_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %39 = "simt_step.switch"(%38, %0) ({
      ^bb0(%arg3: i32):
        %c76_i32 = arith.constant 76 : i32
        %42 = arith.addi %c76_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %44 = "simt_step.switch"(%43, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%67: i32):  // no predecessors
          %68 = simt_step.subgroup_id
          %69 = arith.index_cast %68 : index to i32
          %true_29 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %70 = arith.addi %c416_i32, %0 : i32
          %true_30 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_30) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        ^bb2(%72: i32):  // no predecessors
          %73 = simt_step.subgroup_id
          %74 = arith.index_cast %73 : index to i32
          "simt_step.yield"(%74) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %45 = arith.addi %c432_i32, %0 : i32
        %true_18 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %47 = arith.addi %c448_i32, %0 : i32
        %true_20 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
      ^bb1(%49: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %50 = arith.addi %c80_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %52 = arith.cmpi ne, %51, %c0_i32_21 : i32
        %53 = "simt_step.if"(%52) ({
          %67 = simt_step.subgroup_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) : (i32) -> ()
        }, {
          %67 = simt_step.lane_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) : (i32) -> ()
        }) : (i1) -> i32
        %c464_i32 = arith.constant 464 : i32
        %54 = arith.addi %c464_i32, %0 : i32
        %true_22 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_23 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %56 = arith.addi %c480_i32, %0 : i32
        %true_24 = arith.constant true
        %57 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      ^bb2(%58: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %59 = arith.addi %c84_i32, %0 : i32
        %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_25 = arith.constant 0 : i32
        %61 = arith.cmpi ne, %60, %c0_i32_25 : i32
        %62 = "simt_step.if"(%61) ({
          %67 = simt_step.lane_id
          %68 = arith.index_cast %67 : index to i32
          "simt_step.yield"(%68) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c496_i32 = arith.constant 496 : i32
        %63 = arith.addi %c496_i32, %0 : i32
        %true_26 = arith.constant true
        %64 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%62) {fallthrough = true} : (i32) -> ()
      ^bb3(%65: i32):  // no predecessors
        %c0_i32_27 = arith.constant 0 : i32
        %c0_i32_28 = arith.constant 0 : i32
        %66:2 = "simt_step.loop"(%c0_i32_27, %c0_i32_28) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_29 = arith.constant 4 : i32
          %67 = arith.muli %arg5, %c4_i32_29 : i32
          %68 = arith.addi %67, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %69 = arith.addi %c88_i32, %68 : i32
          %70 = "simt_step.buffer.load"(%arg1, %69) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_30 = arith.constant 0 : i32
          %71 = arith.cmpi ne, %70, %c0_i32_30 : i32
          "simt_step.condition"(%71, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %67 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %68 = arith.addi %arg5, %c1_i32 : i32
          %true_29 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c4_i32_30 = arith.constant 4 : i32
          %69 = arith.muli %arg5, %c4_i32_30 : i32
          %70 = arith.addi %c512_i32, %69 : i32
          %71 = arith.addi %70, %0 : i32
          %true_31 = arith.constant true
          %72 = "simt_step.wave_count_bits"(%true_31) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %71, %72) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67, %68) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%66#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_15 = arith.constant true
      %c528_i32 = arith.constant 528 : i32
      %40 = arith.addi %c528_i32, %0 : i32
      %true_16 = arith.constant true
      %41 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c544_i32 = arith.constant 544 : i32
    %8 = arith.addi %c544_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c108_i32 = arith.constant 108 : i32
    %10 = arith.addi %c108_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_1 = arith.constant 4 : i32
    %12 = arith.addi %0, %c4_i32_1 : i32
    %13 = "simt_step.switch"(%11, %12) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_17 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_17 : i32
        %35 = arith.addi %34, %0 : i32
        %c112_i32 = arith.constant 112 : i32
        %36 = arith.addi %c112_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_18 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %0, %c1_i32 : i32
        %35 = arith.addi %arg3, %34 : i32
        %c1_i32_17 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32_17 : i32
        %true_18 = arith.constant true
        %c560_i32 = arith.constant 560 : i32
        %c4_i32_19 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_19 : i32
        %38 = arith.addi %c560_i32, %37 : i32
        %39 = arith.addi %38, %0 : i32
        %true_20 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %c576_i32 = arith.constant 576 : i32
      %18 = arith.addi %c576_i32, %0 : i32
      %true_8 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_17 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_17 : i32
        %35 = arith.addi %34, %0 : i32
        %c132_i32 = arith.constant 132 : i32
        %36 = arith.addi %c132_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_18 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c152_i32 = arith.constant 152 : i32
        %34 = arith.addi %c152_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.subgroup_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg5: i32):
          %true_20 = arith.constant true
          %c592_i32 = arith.constant 592 : i32
          %45 = arith.addi %c592_i32, %0 : i32
          %true_21 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c1_i32_22 = arith.constant 1 : i32
          %48 = arith.addi %0, %c1_i32_22 : i32
          %true_23 = arith.constant true
          %c608_i32 = arith.constant 608 : i32
          %49 = arith.addi %c608_i32, %0 : i32
          %true_24 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %39 = arith.addi %arg3, %38 : i32
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %arg4, %c1_i32 : i32
        %true_17 = arith.constant true
        %c624_i32 = arith.constant 624 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %41 = arith.muli %arg4, %c4_i32_18 : i32
        %42 = arith.addi %c624_i32, %41 : i32
        %43 = arith.addi %42, %0 : i32
        %true_19 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%39, %40) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      %c640_i32 = arith.constant 640 : i32
      %22 = arith.addi %c640_i32, %0 : i32
      %true_12 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c156_i32 = arith.constant 156 : i32
      %25 = arith.addi %c156_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = simt_step.subgroup_id
      %28 = arith.index_cast %27 : index to i32
      %29 = "simt_step.switch"(%26, %28) ({
      ^bb0(%arg3: i32):
        %c160_i32 = arith.constant 160 : i32
        %34 = arith.addi %c160_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.lane_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg4: i32):
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          %true_22 = arith.constant true
          %c656_i32 = arith.constant 656 : i32
          %51 = arith.addi %c656_i32, %0 : i32
          %true_23 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %54 = simt_step.lane_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c672_i32 = arith.constant 672 : i32
        %39 = arith.addi %c672_i32, %0 : i32
        %true_18 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %43 = arith.addi %c164_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %45 = arith.addi %0, %c0_i32_19 : i32
        %46 = "simt_step.switch"(%44, %45) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          %true_22 = arith.constant true
          %c688_i32 = arith.constant 688 : i32
          %52 = arith.addi %c688_i32, %0 : i32
          %true_23 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_20 = arith.constant true
        %c704_i32 = arith.constant 704 : i32
        %47 = arith.addi %c704_i32, %0 : i32
        %true_21 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c0_i32_13 = arith.constant 0 : i32
      %c0_i32_14 = arith.constant 0 : i32
      %31:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_17 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_17 : i32
        %35 = arith.addi %34, %0 : i32
        %c168_i32 = arith.constant 168 : i32
        %36 = arith.addi %c168_i32, %35 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_18 : i32
        "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %41 = arith.muli %arg6, %c4_i32_22 : i32
          %42 = arith.addi %41, %0 : i32
          %c188_i32 = arith.constant 188 : i32
          %43 = arith.addi %c188_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_23 : i32
          "simt_step.condition"(%45, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %41 = arith.addi %arg5, %arg6 : i32
          %c1_i32_22 = arith.constant 1 : i32
          %42 = arith.addi %arg6, %c1_i32_22 : i32
          %true_23 = arith.constant true
          %c720_i32 = arith.constant 720 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %43 = arith.muli %arg6, %c4_i32_24 : i32
          %44 = arith.addi %c720_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_25 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %35 = arith.addi %arg3, %34#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32 : i32
        %true_19 = arith.constant true
        %c736_i32 = arith.constant 736 : i32
        %c4_i32_20 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_20 : i32
        %38 = arith.addi %c736_i32, %37 : i32
        %39 = arith.addi %38, %0 : i32
        %true_21 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_15 = arith.constant true
      %c752_i32 = arith.constant 752 : i32
      %32 = arith.addi %c752_i32, %0 : i32
      %true_16 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c768_i32 = arith.constant 768 : i32
    %14 = arith.addi %c768_i32, %0 : i32
    %true_3 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32_4 = arith.constant 4 : i32
    %16 = arith.addi %0, %c4_i32_4 : i32
    return
  }
}

