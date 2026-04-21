module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %5 = simt_step.lane_id
      %6 = arith.index_cast %5 : index to i32
      %7 = "simt_step.switch"(%4, %6) ({
      ^bb0(%arg5: i32):
        %c2_i32_2 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_2 : i32
        %16 = simt_step.lane_id
        %17 = arith.index_cast %16 : index to i32
        %18 = "simt_step.switch"(%15, %17) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %31 = arith.addi %c0_i32_7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %34 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %37 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c2_i32_3 = arith.constant 2 : i32
        %20 = arith.remsi %arg3, %c2_i32_3 : i32
        %21 = simt_step.subgroup_id
        %22 = arith.index_cast %21 : index to i32
        %23 = "simt_step.switch"(%20, %22) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %31 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_7 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %34 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %true_4 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %26 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %true_5 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %29 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %9 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %12 = "simt_step.if"(%11) ({
        %15 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %19 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_4 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %22 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %17 = arith.addi %c160_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %true_2 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %16 = arith.addi %c176_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) {fallthrough = true} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_4 : i32
          %19 = arith.cmpi slt, %arg8, %18 : i32
          "simt_step.condition"(%19, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_4 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg8, %c4_i32 : i32
          %19 = arith.addi %c192_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_5 = arith.constant 1 : i32
          %21 = arith.addi %arg8, %c1_i32_5 : i32
          "simt_step.break"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%15#0, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %15 = simt_step.subgroup_id
      %16 = arith.index_cast %15 : index to i32
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_1 : i32
      %18 = "simt_step.if"(%17) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %21 = arith.addi %c16_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_3 : i32
        %24 = "simt_step.if"(%23) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %25 = arith.addi %c208_i32, %0 : i32
        %true_4 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %19 = arith.addi %c224_i32, %0 : i32
      %true_2 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %9 = arith.addi %c240_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    %11 = arith.addi %0, %c2_i32 : i32
    %c20_i32 = arith.constant 20 : i32
    %12 = arith.addi %c20_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = "simt_step.switch"(%13, %0) ({
    ^bb0(%arg2: i32):
      %c24_i32 = arith.constant 24 : i32
      %15 = arith.addi %c24_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_1 : i32
      %18 = "simt_step.if"(%17) ({
        %c28_i32 = arith.constant 28 : i32
        %25 = arith.addi %c28_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %27 = "simt_step.switch"(%26, %c4_i32_7) ({
        ^bb0(%arg3: i32):
          %true_10 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %30 = arith.addi %c256_i32, %0 : i32
          %true_11 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %36 = simt_step.subgroup_id
          %37 = arith.index_cast %36 : index to i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %28 = arith.addi %c272_i32, %0 : i32
        %true_9 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %19 = arith.addi %c288_i32, %0 : i32
      %true_2 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %21 = arith.addi %c304_i32, %0 : i32
      %true_4 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_7 : i32
        %26 = arith.addi %25, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %27 = arith.addi %c32_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c52_i32 = arith.constant 52 : i32
        %25 = arith.addi %c52_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %0, %c1_i32 : i32
        %28 = "simt_step.switch"(%26, %27) ({
        ^bb0(%arg5: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32_11 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %true_13 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %37 = arith.addi %c320_i32, %0 : i32
          %true_14 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          %true_15 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %42 = arith.addi %c336_i32, %0 : i32
          %true_16 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %29 = arith.addi %arg3, %28 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_9 : i32
        %32 = arith.addi %c352_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_10 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

