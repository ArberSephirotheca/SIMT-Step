module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c2_i32_0 = arith.constant 2 : i32
      %4 = arith.remsi %arg3, %c2_i32_0 : i32
      %c2_i32_1 = arith.constant 2 : i32
      %5 = arith.addi %arg0, %c2_i32_1 : i32
      %6 = "simt_step.switch"(%4, %5) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %21 = arith.addi %c0_i32_7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %19 = "simt_step.if"(%18) ({
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %21 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %21 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %8 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %10 = arith.remsi %arg3, %c3_i32 : i32
      %c3_i32_3 = arith.constant 3 : i32
      %11 = "simt_step.switch"(%10, %c3_i32_3) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %26 = arith.muli %arg7, %c4_i32 : i32
          %27 = arith.addi %c80_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.break"(%25, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c2_i32_6 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_6 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %18 = arith.addi %arg0, %c0_i32_7 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %26 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %true_11 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %29 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %true_12 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %32 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %21 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %24 = "simt_step.if"(%23) ({
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %26 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %26 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c0_i32 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %14 = "simt_step.if"(%13) ({
        %c4_i32 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %16 = arith.addi %arg0, %c0_i32_4 : i32
        %17 = "simt_step.switch"(%15, %16) ({
        ^bb0(%arg5: i32):
          %true_5 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %19 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_6 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %22 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %25 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %28 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32 : i32
          %18 = arith.addi %c256_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.continue"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c272_i32 = arith.constant 272 : i32
    %3 = arith.addi %c272_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %7 = arith.addi %0, %c4_i32_0 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_7 : i32
        %22 = arith.addi %21, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %23 = arith.addi %c12_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_8 : i32
        "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %21 = arith.addi %c32_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_7 : i32
        %24 = "simt_step.if"(%23) ({
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %25 = arith.addi %c288_i32, %0 : i32
        %true_8 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %27 = arith.addi %arg3, %24 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32_9 : i32
        %true_10 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_11 : i32
        %30 = arith.addi %c304_i32, %29 : i32
        %31 = arith.addi %30, %0 : i32
        %true_12 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %15 = arith.addi %c320_i32, %0 : i32
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %18 = arith.addi %c36_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %20 = "simt_step.switch"(%19, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c40_i32 = arith.constant 40 : i32
        %21 = arith.addi %c40_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_7 : i32
        %24 = "simt_step.if"(%23) ({
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) : (i32) -> ()
        }, {
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %25 = arith.addi %c336_i32, %0 : i32
        %true_8 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %27 = arith.addi %c352_i32, %0 : i32
        %true_10 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %30 = arith.addi %c44_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %32 = "simt_step.switch"(%31, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c0_i32_14 = arith.constant 0 : i32
          %40 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          %true_16 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %42 = arith.addi %c368_i32, %0 : i32
          %true_17 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %34 = arith.addi %c48_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %36 = arith.addi %0, %c0_i32_11 : i32
        %37 = "simt_step.switch"(%35, %36) ({
        ^bb0(%arg4: i32):
          %40 = simt_step.lane_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %true_15 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %43 = arith.addi %c384_i32, %0 : i32
          %true_16 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %38 = arith.addi %c400_i32, %0 : i32
        %true_13 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c416_i32 = arith.constant 416 : i32
    %9 = arith.addi %c416_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %11 = arith.addi %c52_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_2 = arith.constant 4 : i32
    %13 = "simt_step.switch"(%12, %c4_i32_2) ({
    ^bb0(%arg2: i32):
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %true_3 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %16 = arith.addi %c432_i32, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %19 = arith.addi %c56_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_5 : i32
      %22 = "simt_step.if"(%21) ({
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }, {
        %c60_i32 = arith.constant 60 : i32
        %25 = arith.addi %c60_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_7 : i32
        %28 = "simt_step.if"(%27) ({
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.addi %0, %c4_i32_9 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %29 = arith.addi %c448_i32, %0 : i32
        %true_8 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c464_i32 = arith.constant 464 : i32
      %23 = arith.addi %c464_i32, %0 : i32
      %true_6 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

