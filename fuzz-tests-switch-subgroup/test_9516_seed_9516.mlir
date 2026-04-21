module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32 : i32
      %7 = simt_step.lane_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg5: i32):
        %c2_i32_0 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_0 : i32
        %18 = simt_step.lane_id
        %19 = arith.index_cast %18 : index to i32
        %20 = "simt_step.switch"(%17, %19) ({
        ^bb0(%arg6: i32):
          %true_3 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %28 = arith.addi %c0_i32_4, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %true_5 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %31 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %true_1 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %23 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %true_2 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %26 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %12 = "simt_step.if"(%11) ({
        %c0_i32_0 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
        %18 = "simt_step.if"(%17) ({
          %true_1 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %20 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %true_1 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %20 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %true_0 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %18 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%arg3, %15) ({
      ^bb0(%arg5: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
        %18 = "simt_step.if"(%17) ({
          %true_2 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %23 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_2 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %23 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %21 = "simt_step.if"(%20) ({
          %true_2 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %23 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_2 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %23 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c176_i32 = arith.constant 176 : i32
    %5 = arith.addi %c176_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_7 : i32
        %23 = arith.addi %22, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %24 = arith.addi %c12_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %22 = arith.addi %c32_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
        %25 = "simt_step.if"(%24) ({
          %34 = simt_step.subgroup_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %34 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %26 = arith.addi %c192_i32, %0 : i32
        %true_8 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %28 = arith.addi %arg3, %25 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        %true_9 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_10 : i32
        %31 = arith.addi %c208_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_11 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %12 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%12) {fallthrough = true} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %14 = arith.addi %c36_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_3 : i32
      %17 = "simt_step.if"(%16) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %23 = arith.muli %arg4, %c4_i32_9 : i32
          %24 = arith.addi %23, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %25 = arith.addi %c40_i32, %24 : i32
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
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %25 = arith.muli %arg4, %c4_i32_10 : i32
          %26 = arith.addi %c224_i32, %25 : i32
          %27 = arith.addi %26, %0 : i32
          %true_11 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %22 = arith.addi %c60_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %24 = simt_step.subgroup_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%23, %25) ({
        ^bb0(%arg3: i32):
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %28 = simt_step.lane_id
          %29 = arith.index_cast %28 : index to i32
          %true_8 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %30 = arith.addi %c240_i32, %0 : i32
          %true_9 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %18 = arith.addi %c256_i32, %0 : i32
      %true_4 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %20 = arith.addi %c272_i32, %0 : i32
      %true_6 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c288_i32 = arith.constant 288 : i32
    %8 = arith.addi %c288_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

