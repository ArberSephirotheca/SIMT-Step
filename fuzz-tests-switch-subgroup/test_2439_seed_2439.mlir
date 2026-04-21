module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c2_i32_0 = arith.constant 2 : i32
    %1 = arith.addi %arg0, %c2_i32_0 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %true_1 = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %6 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %9 = "simt_step.if"(%8) ({
        %c2_i32_4 = arith.constant 2 : i32
        %13 = arith.remsi %arg3, %c2_i32_4 : i32
        %14 = "simt_step.switch"(%13, %arg0) ({
        ^bb0(%arg5: i32):
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %16 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %true_6 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %19 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) : (i32) -> ()
      }, {
        %c2_i32_4 = arith.constant 2 : i32
        %13 = arith.remsi %arg3, %c2_i32_4 : i32
        %14 = "simt_step.switch"(%13, %arg0) ({
        ^bb0(%arg5: i32):
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %18 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_7 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %21 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %true_8 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %24 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %16 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %12 = "simt_step.if"(%11) ({
        %c2_i32_4 = arith.constant 2 : i32
        %13 = arith.remsi %arg3, %c2_i32_4 : i32
        %14 = "simt_step.switch"(%13, %arg0) ({
        ^bb0(%arg5: i32):
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %16 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %true_6 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %19 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb2(%20: i32):  // no predecessors
          %true_7 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %22 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32 : i32
          %16 = arith.cmpi slt, %arg6, %15 : i32
          "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.muli %arg6, %c4_i32 : i32
          %16 = arith.addi %c160_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%14, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %4 = arith.addi %c176_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      %17 = "simt_step.switch"(%16, %c4_i32_3) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %32 = arith.addi %c16_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.lane_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_19 : i32
          %true_20 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %51 = arith.addi %c192_i32, %0 : i32
          %true_21 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %54 = simt_step.lane_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        ^bb2(%56: i32):  // no predecessors
          %c4_i32_22 = arith.constant 4 : i32
          %true_23 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %57 = arith.addi %c208_i32, %0 : i32
          %true_24 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %37 = arith.addi %c224_i32, %0 : i32
        %true_12 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %40 = arith.addi %c20_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_13 : i32
        %43 = "simt_step.if"(%42) ({
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) : (i32) -> ()
        }, {
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %44 = arith.addi %c240_i32, %0 : i32
        %true_14 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %46 = arith.addi %c256_i32, %0 : i32
        %true_16 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %49:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_19 : i32
          %51 = arith.addi %50, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %52 = arith.addi %c24_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_20 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          %true_19 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_20 : i32
          %53 = arith.addi %c272_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_21 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%49#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %18 = arith.addi %c288_i32, %0 : i32
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %20 = arith.addi %c304_i32, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c3_i32_8 = arith.constant 3 : i32
      %23 = arith.addi %0, %c3_i32_8 : i32
      %true_9 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %24 = arith.addi %c320_i32, %0 : i32
      %true_10 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %27 = arith.addi %c44_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = simt_step.subgroup_id
      %30 = arith.index_cast %29 : index to i32
      %31 = "simt_step.switch"(%28, %30) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %34 = arith.addi %c48_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.subgroup_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg4: i32):
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          %true_19 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %57 = arith.addi %c336_i32, %0 : i32
          %true_20 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = true} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%60: i32):  // no predecessors
          %61 = simt_step.lane_id
          %62 = arith.index_cast %61 : index to i32
          "simt_step.yield"(%62) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %40 = arith.addi %c52_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_11 : i32
        %43 = "simt_step.if"(%42) ({
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) : (i32) -> ()
        }, {
          %c1_i32_19 = arith.constant 1 : i32
          %52 = arith.addi %0, %c1_i32_19 : i32
          "simt_step.yield"(%52) : (i32) -> ()
        }) : (i1) -> i32
        %c352_i32 = arith.constant 352 : i32
        %44 = arith.addi %c352_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %46 = arith.addi %c368_i32, %0 : i32
        %true_14 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb3(%48: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %49:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_19 : i32
          %53 = arith.addi %52, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %54 = arith.addi %c56_i32, %53 : i32
          %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %56 = arith.cmpi ne, %55, %c0_i32_20 : i32
          "simt_step.condition"(%56, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %52 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %53 = arith.addi %arg5, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %54 = arith.muli %arg5, %c4_i32_21 : i32
          %55 = arith.addi %c384_i32, %54 : i32
          %56 = arith.addi %55, %0 : i32
          %true_22 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52, %53) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %50 = arith.addi %c400_i32, %0 : i32
        %true_18 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c76_i32 = arith.constant 76 : i32
    %8 = arith.addi %c76_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_0 : i32
    %11 = "simt_step.if"(%10) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_5 : i32
        %17 = arith.addi %16, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %18 = arith.addi %c80_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c100_i32 = arith.constant 100 : i32
        %16 = arith.addi %c100_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
        %19 = "simt_step.if"(%18) ({
          %28 = simt_step.subgroup_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %28 = simt_step.subgroup_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %20 = arith.addi %c416_i32, %0 : i32
        %true_6 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %22 = arith.addi %arg2, %19 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg3, %c1_i32 : i32
        %true_7 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_8 : i32
        %25 = arith.addi %c432_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_9 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_5 : i32
        %17 = arith.addi %16, %0 : i32
        %c104_i32 = arith.constant 104 : i32
        %18 = arith.addi %c104_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
        "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %16 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %17 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_6 : i32
        %19 = arith.addi %c448_i32, %18 : i32
        %20 = arith.addi %19, %0 : i32
        %true_7 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%16, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) : (i32) -> ()
    }) : (i1) -> i32
    %c464_i32 = arith.constant 464 : i32
    %12 = arith.addi %c464_i32, %0 : i32
    %true = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_3 : i32
      %16 = arith.addi %15, %0 : i32
      %c124_i32 = arith.constant 124 : i32
      %17 = arith.addi %c124_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %22 = arith.muli %arg5, %c4_i32_8 : i32
        %23 = arith.addi %22, %0 : i32
        %c144_i32 = arith.constant 144 : i32
        %24 = arith.addi %c144_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_9 : i32
        "simt_step.condition"(%26, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %22 = arith.addi %arg4, %0 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %23 = arith.addi %arg5, %c1_i32_8 : i32
        %true_9 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %24 = arith.muli %arg5, %c4_i32_10 : i32
        %25 = arith.addi %c480_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_11 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %16 = arith.addi %arg2, %15#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_6 : i32
      %19 = arith.addi %c496_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

