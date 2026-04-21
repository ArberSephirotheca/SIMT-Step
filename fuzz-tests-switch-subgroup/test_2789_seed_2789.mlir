module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %4 = "simt_step.if"(%3) ({
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c0_i32_3, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }, {
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c16_i32, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%4, %5) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c4_i32 = arith.constant 4 : i32
        %4 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg0, %c1_i32 : i32
        %6 = "simt_step.switch"(%4, %5) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %8 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
        ^bb1(%9: i32):  // no predecessors
          %true_1 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %11 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb2(%12: i32):  // no predecessors
          %true_2 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %14 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb3(%15: i32):  // no predecessors
          %true_3 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %17 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%6) : (i32) -> ()
      }, {
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %5 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_5 : i32
      %17 = arith.addi %16, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %17 : i32
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
      %c112_i32 = arith.constant 112 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_6 : i32
      %19 = arith.addi %c112_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_12 : i32
        %32 = arith.addi %31, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %33 = arith.addi %c32_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c52_i32 = arith.constant 52 : i32
        %31 = arith.addi %c52_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_12 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %43 = simt_step.lane_id
          %44 = arith.index_cast %43 : index to i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %35 = arith.addi %c128_i32, %0 : i32
        %true_13 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %37 = arith.addi %arg3, %34 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_15 : i32
        %40 = arith.addi %c144_i32, %39 : i32
        %41 = arith.addi %40, %0 : i32
        %true_16 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %17 = arith.addi %c160_i32, %0 : i32
      %true_8 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %20 = arith.addi %c56_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %22 = arith.addi %0, %c0_i32_9 : i32
      %23 = "simt_step.switch"(%21, %22) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %32 = arith.addi %c60_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        %34 = arith.addi %0, %c4_i32_12 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %38 = arith.addi %0, %c4_i32_15 : i32
          %true_16 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %39 = arith.addi %c176_i32, %0 : i32
          %true_17 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %43 = simt_step.subgroup_id
          %44 = arith.index_cast %43 : index to i32
          %true_18 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %45 = arith.addi %c192_i32, %0 : i32
          %true_19 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %36 = arith.addi %c208_i32, %0 : i32
        %true_14 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %24 = arith.addi %c224_i32, %0 : i32
      %true_11 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %27 = arith.addi %c64_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %29 = arith.addi %0, %c2_i32 : i32
      %30 = "simt_step.switch"(%28, %29) ({
      ^bb0(%arg3: i32):
        %c68_i32 = arith.constant 68 : i32
        %31 = arith.addi %c68_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %33 = arith.addi %0, %c3_i32 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg4: i32):
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          %true_16 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %43 = arith.addi %c240_i32, %0 : i32
          %true_17 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb3(%45: i32):  // no predecessors
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %35 = arith.addi %c256_i32, %0 : i32
        %true_13 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c3_i32_14 = arith.constant 3 : i32
        %38 = arith.addi %0, %c3_i32_14 : i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c272_i32 = arith.constant 272 : i32
    %9 = arith.addi %c272_i32, %0 : i32
    %true_2 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c72_i32 = arith.constant 72 : i32
    %11 = arith.addi %c72_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = "simt_step.switch"(%12, %0) ({
    ^bb0(%arg2: i32):
      %c76_i32 = arith.constant 76 : i32
      %16 = arith.addi %c76_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
      %19 = "simt_step.if"(%18) ({
        %44 = simt_step.lane_id
        %45 = arith.index_cast %44 : index to i32
        "simt_step.yield"(%45) : (i32) -> ()
      }, {
        %44 = simt_step.subgroup_id
        %45 = arith.index_cast %44 : index to i32
        "simt_step.yield"(%45) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %20 = arith.addi %c288_i32, %0 : i32
      %true_6 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %22 = arith.addi %c304_i32, %0 : i32
      %true_8 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_19 = arith.constant 4 : i32
        %44 = arith.muli %arg4, %c4_i32_19 : i32
        %45 = arith.addi %44, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %46 = arith.addi %c80_i32, %45 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_20 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_20 : i32
        "simt_step.condition"(%48, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c100_i32 = arith.constant 100 : i32
        %44 = arith.addi %c100_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %46 = simt_step.lane_id
        %47 = arith.index_cast %46 : index to i32
        %48 = "simt_step.switch"(%45, %47) ({
        ^bb0(%arg5: i32):
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          %true_22 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %57 = arith.addi %c320_i32, %0 : i32
          %true_23 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c1_i32_24 = arith.constant 1 : i32
          %60 = arith.addi %0, %c1_i32_24 : i32
          "simt_step.yield"(%60) {fallthrough = true} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %49 = arith.addi %arg3, %48 : i32
        %c1_i32 = arith.constant 1 : i32
        %50 = arith.addi %arg4, %c1_i32 : i32
        %true_19 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_20 = arith.constant 4 : i32
        %51 = arith.muli %arg4, %c4_i32_20 : i32
        %52 = arith.addi %c336_i32, %51 : i32
        %53 = arith.addi %52, %0 : i32
        %true_21 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49, %50) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %26 = arith.addi %c352_i32, %0 : i32
      %true_12 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %29 = arith.addi %c104_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_13 : i32
      %32 = "simt_step.if"(%31) ({
        %c108_i32 = arith.constant 108 : i32
        %44 = arith.addi %c108_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_19 : i32
        %47 = "simt_step.if"(%46) ({
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) : (i32) -> ()
        }, {
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) : (i32) -> ()
        }) : (i1) -> i32
        %c368_i32 = arith.constant 368 : i32
        %48 = arith.addi %c368_i32, %0 : i32
        %true_20 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) : (i32) -> ()
      }, {
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_21 : i32
          %46 = arith.addi %45, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %47 = arith.addi %c112_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_22 : i32
          "simt_step.condition"(%49, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %45 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %46 = arith.addi %arg4, %c1_i32 : i32
          %true_21 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %47 = arith.muli %arg4, %c4_i32_22 : i32
          %48 = arith.addi %c384_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_23 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%44#0) : (i32) -> ()
      }) : (i1) -> i32
      %c400_i32 = arith.constant 400 : i32
      %33 = arith.addi %c400_i32, %0 : i32
      %true_14 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_15 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %35 = arith.addi %c416_i32, %0 : i32
      %true_16 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb3(%37: i32):  // no predecessors
      %c132_i32 = arith.constant 132 : i32
      %38 = arith.addi %c132_i32, %0 : i32
      %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_17 = arith.constant 0 : i32
      %40 = arith.cmpi ne, %39, %c0_i32_17 : i32
      %41 = "simt_step.if"(%40) ({
        %c136_i32 = arith.constant 136 : i32
        %44 = arith.addi %c136_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %46 = simt_step.lane_id
        %47 = arith.index_cast %46 : index to i32
        %48 = "simt_step.switch"(%45, %47) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb2(%52: i32):  // no predecessors
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          %true_19 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %55 = arith.addi %c432_i32, %0 : i32
          %true_20 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        ^bb3(%57: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %58 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%48) : (i32) -> ()
      }, {
        %44 = simt_step.subgroup_id
        %45 = arith.index_cast %44 : index to i32
        "simt_step.yield"(%45) : (i32) -> ()
      }) : (i1) -> i32
      %c448_i32 = arith.constant 448 : i32
      %42 = arith.addi %c448_i32, %0 : i32
      %true_18 = arith.constant true
      %43 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c464_i32 = arith.constant 464 : i32
    %14 = arith.addi %c464_i32, %0 : i32
    %true_4 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

