module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %true_2 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %13 = arith.remsi %arg3, %c2_i32 : i32
      %c4_i32 = arith.constant 4 : i32
      %14 = arith.addi %arg0, %c4_i32 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg5: i32):
        %c3_i32_6 = arith.constant 3 : i32
        %24 = arith.remsi %arg3, %c3_i32_6 : i32
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%24, %26) ({
        ^bb0(%arg6: i32):
          %true_8 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %32 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %true_9 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %35 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %true_10 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %38 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %30 = "simt_step.if"(%29) ({
          %true_8 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %32 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %32 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %17 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c2_i32_4 = arith.constant 2 : i32
      %19 = arith.remsi %arg3, %c2_i32_4 : i32
      %20 = "simt_step.switch"(%19, %arg0) ({
      ^bb0(%arg5: i32):
        %true_6 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %25 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %true_7 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %28 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %31 = "simt_step.if"(%30) ({
          %true_9 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %33 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %33 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %23 = "simt_step.if"(%22) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg6, %26 : i32
          "simt_step.condition"(%27, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_8 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_9 : i32
          %27 = arith.addi %c192_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %25 = "simt_step.if"(%24) ({
          %true_7 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %27 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %27 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_0 = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %7 = arith.addi %c240_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %9 = arith.select %8, %0, %5 : i32
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
      %12 = arith.addi %c8_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
      "simt_step.if"(%14) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %6 = arith.addi %0, %c0_i32_1 : i32
    %c12_i32 = arith.constant 12 : i32
    %7 = arith.addi %c12_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = "simt_step.switch"(%8, %0) ({
    ^bb0(%arg2: i32):
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c16_i32 = arith.constant 16 : i32
      %13 = arith.addi %c16_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %23 = arith.muli %arg4, %c4_i32_9 : i32
          %24 = arith.addi %23, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %25 = arith.addi %c20_i32, %24 : i32
          %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %27 = arith.cmpi ne, %26, %c0_i32_10 : i32
          "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %23 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %25 = arith.muli %arg4, %c4_i32_10 : i32
          %26 = arith.addi %c256_i32, %25 : i32
          %27 = arith.addi %26, %0 : i32
          %true_11 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) : (i32) -> ()
      }, {
        %c40_i32 = arith.constant 40 : i32
        %22 = arith.addi %c40_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
        %25 = "simt_step.if"(%24) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_9 = arith.constant 0 : i32
          %28 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %26 = arith.addi %c272_i32, %0 : i32
        %true_8 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %17 = arith.addi %c288_i32, %0 : i32
      %true_4 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %19 = arith.addi %c304_i32, %0 : i32
      %true_6 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c320_i32 = arith.constant 320 : i32
    %10 = arith.addi %c320_i32, %0 : i32
    %true_2 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

