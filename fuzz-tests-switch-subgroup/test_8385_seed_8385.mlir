module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%arg3, %4) ({
      ^bb0(%arg5: i32):
        %c2_i32 = arith.constant 2 : i32
        %13 = arith.remsi %arg3, %c2_i32 : i32
        %14 = simt_step.lane_id
        %15 = arith.index_cast %14 : index to i32
        %16 = "simt_step.switch"(%13, %15) ({
        ^bb0(%arg6: i32):
          %true_0 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
          %c0_i32_1 = arith.constant 0 : i32
          %21 = arith.addi %c0_i32_1, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_2 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %24 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %true_3 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %27 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c0_i32 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32 : i32
        %19 = "simt_step.if"(%18) ({
          %true_0 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %21 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_0 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %21 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %7 = arith.addi %c80_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %9 = arith.remsi %arg3, %c3_i32 : i32
      %10 = simt_step.lane_id
      %11 = arith.index_cast %10 : index to i32
      %12 = "simt_step.switch"(%9, %11) ({
      ^bb0(%arg5: i32):
        %true_0 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %14 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32 : i32
        %17 = simt_step.subgroup_id
        %18 = arith.index_cast %17 : index to i32
        %19 = "simt_step.switch"(%16, %18) ({
        ^bb0(%arg6: i32):
          %true_1 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %24 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_2 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %27 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_3 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %30 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %true_4 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %33 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c0_i32 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32 : i32
        %22 = "simt_step.if"(%21) ({
          %true_1 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %24 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }, {
          %true_1 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %24 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %7 = "simt_step.switch"(%6, %c4_i32_0) ({
    ^bb0(%arg2: i32):
      %10 = simt_step.subgroup_id
      %11 = arith.index_cast %10 : index to i32
      %true_2 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %12 = arith.addi %c208_i32, %0 : i32
      %true_3 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_4 : i32
      %18 = "simt_step.if"(%17) ({
        %c16_i32 = arith.constant 16 : i32
        %25 = arith.addi %c16_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %27 = simt_step.lane_id
        %28 = arith.index_cast %27 : index to i32
        %29 = "simt_step.switch"(%26, %28) ({
        ^bb0(%arg3: i32):
          %true_9 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %30 = arith.addi %c224_i32, %0 : i32
          %true_10 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          %true_11 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %35 = arith.addi %c240_i32, %0 : i32
          %true_12 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          %38 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %26 = arith.muli %arg4, %c4_i32_11 : i32
          %27 = arith.addi %26, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %28 = arith.addi %c20_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_12 : i32
          "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %26 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.muli %arg4, %c4_i32_12 : i32
          %29 = arith.addi %c256_i32, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_13 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %19 = arith.addi %c272_i32, %0 : i32
      %true_5 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %21 = arith.addi %c288_i32, %0 : i32
      %true_7 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c4_i32_8 = arith.constant 4 : i32
      %24 = arith.addi %0, %c4_i32_8 : i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c304_i32 = arith.constant 304 : i32
    %8 = arith.addi %c304_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

