module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = simt_step.lane_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_3 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32 : i32
          %15 = arith.addi %c0_i32_4, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%13, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %9 = "simt_step.if"(%8) ({
          %true_3 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %14 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }, {
          %true_3 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %14 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %true = arith.constant true
        %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %12 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %arg0, %c0_i32_0 : i32
      %4 = "simt_step.switch"(%2, %3) ({
      ^bb0(%arg4: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %6 = "simt_step.if"(%5) ({
          %true_3 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %16 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true_3 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %16 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %9 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %12 = "simt_step.if"(%11) ({
          %true_3 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %16 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true_3 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %16 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb3(%13: i32):  // no predecessors
        %14 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %16 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %19 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %9 = arith.addi %c8_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
      "simt_step.if"(%11) ({
        "simt_step.yield"() : () -> ()
      }, {
        %12 = simt_step.lane_id
        %13 = arith.index_cast %12 : index to i32
        %14 = "simt_step.switch"(%0, %13) ({
        ^bb0(%arg2: i32):
          %c3_i32 = arith.constant 3 : i32
          %15 = arith.addi %arg2, %c3_i32 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c3_i32_2 = arith.constant 3 : i32
          %17 = arith.addi %16, %c3_i32_2 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %9 = arith.addi %0, %c0_i32_1 : i32
      "simt_step.yield"(%9) {fallthrough = true} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c16_i32 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %c20_i32 = arith.constant 20 : i32
        %25 = arith.addi %c20_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %27 = "simt_step.switch"(%26, %c1_i32) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c1_i32_5 = arith.constant 1 : i32
          %29 = arith.addi %0, %c1_i32_5 : i32
          %true_6 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %30 = arith.addi %c176_i32, %0 : i32
          %true_7 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %c24_i32 = arith.constant 24 : i32
        %25 = arith.addi %c24_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %31 = simt_step.subgroup_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %29 = arith.addi %c192_i32, %0 : i32
        %true_6 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %15 = arith.addi %c208_i32, %0 : i32
      %true = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %17 = arith.addi %c224_i32, %0 : i32
      %true_4 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %20 = arith.addi %c28_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.lane_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg3: i32):
        %c32_i32 = arith.constant 32 : i32
        %25 = arith.addi %c32_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
        %28 = "simt_step.if"(%27) ({
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %29 = arith.addi %c240_i32, %0 : i32
        %true_6 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_13 : i32
          %47 = arith.addi %46, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %48 = arith.addi %c36_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_14 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_14 : i32
          %49 = arith.addi %c256_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_15 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %34 = simt_step.subgroup_id
        %35 = arith.index_cast %34 : index to i32
        %true_9 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %36 = arith.addi %c272_i32, %0 : i32
        %true_10 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %39 = arith.addi %c56_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = simt_step.lane_id
        %42 = arith.index_cast %41 : index to i32
        %43 = "simt_step.switch"(%40, %42) ({
        ^bb0(%arg4: i32):
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %52 = arith.addi %0, %c4_i32_13 : i32
          %true_14 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %53 = arith.addi %c288_i32, %0 : i32
          %true_15 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb3(%55: i32):  // no predecessors
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          %true_16 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %58 = arith.addi %c304_i32, %0 : i32
          %true_17 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %44 = arith.addi %c320_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

