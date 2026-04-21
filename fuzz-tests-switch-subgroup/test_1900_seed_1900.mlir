module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %true_3 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %13 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %true_3 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %13 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
    %c2_i32 = arith.constant 2 : i32
    %6 = arith.remsi %arg3, %c2_i32 : i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg4: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %13 = "simt_step.if"(%12) ({
        %c3_i32 = arith.constant 3 : i32
        %17 = arith.remsi %arg3, %c3_i32 : i32
        %c3_i32_6 = arith.constant 3 : i32
        %18 = "simt_step.switch"(%17, %c3_i32_6) ({
        ^bb0(%arg5: i32):
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %22 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %25 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %true_10 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %28 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %20 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c4_i32 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg5: i32):
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %21 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_7 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %24 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %true_8 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %27 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %30 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c2_i32_4 = arith.constant 2 : i32
      %15 = arith.remsi %arg3, %c2_i32_4 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %16 = "simt_step.switch"(%15, %c0_i32_5) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %18 = "simt_step.if"(%17) ({
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %23 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %23 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %21 = "simt_step.if"(%20) ({
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %23 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %23 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %11 = arith.select %10, %5, %9 : i32
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = "simt_step.switch"(%16, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_13 : i32
          %40 = arith.addi %39, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %41 = arith.addi %c16_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_14 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_14 : i32
          %42 = arith.addi %c240_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_15 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %23 = arith.addi %c256_i32, %0 : i32
        %true_8 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %26 = arith.addi %c36_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_9 : i32
        %29 = "simt_step.if"(%28) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %30 = arith.addi %c272_i32, %0 : i32
        %true_10 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %33 = arith.addi %c40_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_11 : i32
        %36 = "simt_step.if"(%35) ({
          %39 = simt_step.subgroup_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %37 = arith.addi %c288_i32, %0 : i32
        %true_12 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_5 : i32
        %23 = arith.addi %22, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %24 = arith.addi %c44_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32 : i32
        %true_5 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_6 : i32
        %25 = arith.addi %c304_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_7 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_3 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %20 = arith.addi %c320_i32, %0 : i32
      %true_4 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c64_i32 = arith.constant 64 : i32
    %8 = arith.addi %c64_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_0 : i32
    %11 = "simt_step.if"(%10) ({
      %c68_i32 = arith.constant 68 : i32
      %14 = arith.addi %c68_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
      %17 = "simt_step.if"(%16) ({
        %c72_i32 = arith.constant 72 : i32
        %20 = arith.addi %c72_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg2: i32):
          %c2_i32 = arith.constant 2 : i32
          %25 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %27 = simt_step.subgroup_id
          %28 = arith.index_cast %27 : index to i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %0, %c1_i32 : i32
          %true_3 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %31 = arith.addi %c336_i32, %0 : i32
          %true_4 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c352_i32 = arith.constant 352 : i32
      %18 = arith.addi %c352_i32, %0 : i32
      %true_2 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) : (i32) -> ()
    }, {
      %c76_i32 = arith.constant 76 : i32
      %14 = arith.addi %c76_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
      %17 = "simt_step.if"(%16) ({
        %c80_i32 = arith.constant 80 : i32
        %20 = arith.addi %c80_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = "simt_step.switch"(%21, %0) ({
        ^bb0(%arg2: i32):
          %25 = simt_step.lane_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c0_i32_5 = arith.constant 0 : i32
          %true_6 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %28 = arith.addi %c368_i32, %0 : i32
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_5) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %23 = arith.addi %c384_i32, %0 : i32
        %true_4 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c84_i32 = arith.constant 84 : i32
        %20 = arith.addi %c84_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %22 = "simt_step.switch"(%21, %c0_i32_3) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %0, %c1_i32 : i32
          %true_4 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %25 = arith.addi %c400_i32, %0 : i32
          %true_5 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %true_6 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %28 = arith.addi %c416_i32, %0 : i32
          %true_7 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%30: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      %c432_i32 = arith.constant 432 : i32
      %18 = arith.addi %c432_i32, %0 : i32
      %true_2 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %c448_i32 = arith.constant 448 : i32
    %12 = arith.addi %c448_i32, %0 : i32
    %true = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

