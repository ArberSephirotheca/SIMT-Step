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
      %c2_i32 = arith.constant 2 : i32
      %1 = arith.remsi %arg3, %c2_i32 : i32
      %2 = simt_step.subgroup_id
      %3 = arith.index_cast %2 : index to i32
      %4 = "simt_step.switch"(%1, %3) ({
      ^bb0(%arg6: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %7 = "simt_step.if"(%6) ({
          %true_3 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %17 = arith.muli %arg5, %c4_i32_5 : i32
          %18 = arith.addi %c0_i32_4, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %true_3 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %17 = arith.muli %arg5, %c4_i32_4 : i32
          %18 = arith.addi %c16_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %true = arith.constant true
        %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %c4_i32 = arith.constant 4 : i32
        %10 = arith.muli %arg5, %c4_i32 : i32
        %11 = arith.addi %c32_i32, %10 : i32
        %12 = arith.addi %11, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %15 = "simt_step.if"(%14) ({
          %true_3 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %17 = arith.muli %arg5, %c4_i32_4 : i32
          %18 = arith.addi %c48_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %true_3 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %17 = arith.muli %arg5, %c4_i32_4 : i32
          %18 = arith.addi %c64_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = simt_step.subgroup_id
      %21 = arith.index_cast %20 : index to i32
      %22 = "simt_step.switch"(%19, %21) ({
      ^bb0(%arg2: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_16 : i32
          %43 = arith.addi %42, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %44 = arith.addi %c16_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_17 : i32
          "simt_step.condition"(%46, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %42 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_17 : i32
          %45 = arith.addi %c80_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_18 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c96_i32_8 = arith.constant 96 : i32
        %24 = arith.addi %c96_i32_8, %0 : i32
        %true_9 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %27 = arith.addi %c36_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_10 : i32
        %30 = "simt_step.if"(%29) ({
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) : (i32) -> ()
        }, {
          %42 = simt_step.lane_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %31 = arith.addi %c112_i32, %0 : i32
        %true_11 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %33 = arith.addi %c128_i32, %0 : i32
        %true_13 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %36 = arith.addi %c40_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_14 : i32
        %39 = "simt_step.if"(%38) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %42 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %40 = arith.addi %c144_i32, %0 : i32
        %true_15 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) : (i32) -> ()
    }, {
      %c44_i32 = arith.constant 44 : i32
      %18 = arith.addi %c44_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = simt_step.subgroup_id
      %21 = arith.index_cast %20 : index to i32
      %22 = "simt_step.switch"(%19, %21) ({
      ^bb0(%arg2: i32):
        %c48_i32 = arith.constant 48 : i32
        %23 = arith.addi %c48_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%24, %26) ({
        ^bb0(%arg3: i32):
          %38 = simt_step.lane_id
          %39 = arith.index_cast %38 : index to i32
          %true_11 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %40 = arith.addi %c160_i32, %0 : i32
          %true_12 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          %43 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %true_14 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %45 = arith.addi %c176_i32, %0 : i32
          %true_15 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %28 = arith.addi %c192_i32, %0 : i32
        %true_6 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %31 = arith.addi %c52_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %true_11 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %38 = arith.addi %c208_i32, %0 : i32
          %true_12 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          %true_13 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %43 = arith.addi %c224_i32, %0 : i32
          %true_14 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %34 = arith.addi %c240_i32, %0 : i32
        %true_8 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_11 : i32
          %39 = arith.addi %38, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %40 = arith.addi %c56_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_12 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_12 : i32
          %41 = arith.addi %c256_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_13 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c272_i32 = arith.constant 272 : i32
    %9 = arith.addi %c272_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_5 : i32
      %19 = arith.addi %18, %0 : i32
      %c76_i32 = arith.constant 76 : i32
      %20 = arith.addi %c76_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_6 : i32
      %21 = arith.addi %c288_i32, %20 : i32
      %22 = arith.addi %21, %0 : i32
      %true_7 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c96_i32 = arith.constant 96 : i32
    %12 = arith.addi %c96_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
    %15 = "simt_step.if"(%14) ({
      %c100_i32 = arith.constant 100 : i32
      %18 = arith.addi %c100_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
      %21 = "simt_step.if"(%20) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_9 : i32
          %26 = arith.addi %25, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %27 = arith.addi %c104_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_10 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          %true_9 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %27 = arith.muli %arg3, %c4_i32_10 : i32
          %28 = arith.addi %c304_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_11 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) : (i32) -> ()
      }, {
        %c124_i32 = arith.constant 124 : i32
        %24 = arith.addi %c124_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
        %27 = "simt_step.if"(%26) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %30 = simt_step.lane_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %28 = arith.addi %c320_i32, %0 : i32
        %true_8 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %22 = arith.addi %c336_i32, %0 : i32
      %true_6 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_7 : i32
        %20 = arith.addi %19, %0 : i32
        %c128_i32 = arith.constant 128 : i32
        %21 = arith.addi %c128_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
        "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg2, %c1_i32 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %20 = arith.addi %arg3, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_9 : i32
        %22 = arith.addi %c352_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_10 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) : (i32) -> ()
    }) : (i1) -> i32
    %c368_i32 = arith.constant 368 : i32
    %16 = arith.addi %c368_i32, %0 : i32
    %true_4 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

