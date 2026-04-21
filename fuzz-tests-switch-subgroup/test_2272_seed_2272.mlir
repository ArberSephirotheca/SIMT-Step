module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = "simt_step.switch"(%0, %c4_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %3 = "simt_step.if"(%2) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_4 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_4 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_5 : i32
          %20 = arith.cmpi slt, %arg6, %19 : i32
          "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32_5 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32_5 : i32
          %20 = arith.addi %c0_i32_4, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_6 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32_6 : i32
          "simt_step.yield"(%18, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) : (i32) -> ()
      }, {
        %c3_i32_2 = arith.constant 3 : i32
        %17 = arith.remsi %arg3, %c3_i32_2 : i32
        %c2_i32_3 = arith.constant 2 : i32
        %18 = arith.addi %arg0, %c2_i32_3 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg5: i32):
          %true = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_4 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %24 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %true_5 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %27 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) {fallthrough = false} : (i32) -> ()
    ^bb1(%4: i32):  // no predecessors
      %c3_i32_0 = arith.constant 3 : i32
      %5 = arith.remsi %arg3, %c3_i32_0 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = "simt_step.switch"(%5, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %18 = "simt_step.if"(%17) ({
          %true_7 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %32 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %32 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c3_i32_3 = arith.constant 3 : i32
        %20 = arith.remsi %arg3, %c3_i32_3 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.addi %arg0, %c0_i32_4 : i32
        %22 = "simt_step.switch"(%20, %21) ({
        ^bb0(%arg6: i32):
          %true_7 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %32 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %true_8 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %35 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %true_9 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %38 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %true_7 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %32 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %32 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c3_i32_6 = arith.constant 3 : i32
        %27 = arith.remsi %arg3, %c3_i32_6 : i32
        %28 = "simt_step.switch"(%27, %arg0) ({
        ^bb0(%arg6: i32):
          %true_7 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %32 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %true_8 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %35 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %true_9 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %38 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %30 = arith.addi %c224_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb2(%7: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %8 = arith.remsi %arg3, %c2_i32 : i32
      %9 = simt_step.subgroup_id
      %10 = arith.index_cast %9 : index to i32
      %11 = "simt_step.switch"(%8, %10) ({
      ^bb0(%arg5: i32):
        %true = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %18 = arith.addi %c240_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_6 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_5 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %27 = arith.muli %arg7, %c4_i32_6 : i32
          %28 = arith.addi %c256_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32_7 : i32
          "simt_step.continue"(%26, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c2_i32_4 = arith.constant 2 : i32
        %22 = arith.remsi %arg3, %c2_i32_4 : i32
        %23 = simt_step.lane_id
        %24 = arith.index_cast %23 : index to i32
        %25 = "simt_step.switch"(%22, %24) ({
        ^bb0(%arg6: i32):
          %true_5 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %27 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_6 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %30 = arith.addi %c288_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb3(%12: i32):  // no predecessors
      %c4_i32_1 = arith.constant 4 : i32
      %13 = arith.remsi %arg3, %c4_i32_1 : i32
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %29 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %30 = arith.addi %29, %c1_i32_7 : i32
          %31 = arith.cmpi slt, %arg7, %30 : i32
          "simt_step.condition"(%31, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_6 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %30 = arith.muli %arg7, %c4_i32_7 : i32
          %31 = arith.addi %c304_i32, %30 : i32
          %32 = arith.addi %31, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_8 = arith.constant 1 : i32
          %33 = arith.addi %arg7, %c1_i32_8 : i32
          "simt_step.yield"(%29, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c2_i32_4 = arith.constant 2 : i32
        %19 = arith.remsi %arg3, %c2_i32_4 : i32
        %20 = simt_step.subgroup_id
        %21 = arith.index_cast %20 : index to i32
        %22 = "simt_step.switch"(%19, %21) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c320_i32 = arith.constant 320 : i32
          %30 = arith.addi %c320_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %true_7 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c336_i32 = arith.constant 336 : i32
          %33 = arith.addi %c336_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %true_8 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c352_i32 = arith.constant 352 : i32
          %36 = arith.addi %c352_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %true = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c368_i32 = arith.constant 368 : i32
        %25 = arith.addi %c368_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %28 = "simt_step.if"(%27) ({
          %true_6 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c384_i32 = arith.constant 384 : i32
          %30 = arith.addi %c384_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c400_i32 = arith.constant 400 : i32
          %30 = arith.addi %c400_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
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
      %c4_i32_3 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_3 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %12 = arith.addi %c28_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
      %15 = "simt_step.if"(%14) ({
        %c32_i32 = arith.constant 32 : i32
        %24 = arith.addi %c32_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %26 = arith.addi %0, %c3_i32 : i32
        %27 = "simt_step.switch"(%25, %26) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %28 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %30 = simt_step.subgroup_id
          %31 = arith.index_cast %30 : index to i32
          %true_8 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %32 = arith.addi %c416_i32, %0 : i32
          %true_9 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c432_i32 = arith.constant 432 : i32
      %16 = arith.addi %c432_i32, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %18 = arith.addi %arg2, %15 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_6 : i32
      %21 = arith.addi %c448_i32, %20 : i32
      %22 = arith.addi %21, %0 : i32
      %true_7 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c36_i32 = arith.constant 36 : i32
    %6 = arith.addi %c36_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
    %9 = "simt_step.if"(%8) ({
      %c40_i32 = arith.constant 40 : i32
      %12 = arith.addi %c40_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
      %15 = "simt_step.if"(%14) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.muli %arg3, %c4_i32_7 : i32
          %20 = arith.addi %19, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %21 = arith.addi %c44_i32, %20 : i32
          %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
          "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %19 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg3, %c1_i32 : i32
          %true_7 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %21 = arith.muli %arg3, %c4_i32_8 : i32
          %22 = arith.addi %c464_i32, %21 : i32
          %23 = arith.addi %22, %0 : i32
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %18 = arith.addi %c64_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_5 : i32
        %21 = "simt_step.if"(%20) ({
          %24 = simt_step.subgroup_id
          %25 = arith.index_cast %24 : index to i32
          "simt_step.yield"(%25) : (i32) -> ()
        }, {
          %c0_i32_7 = arith.constant 0 : i32
          %24 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        %c480_i32 = arith.constant 480 : i32
        %22 = arith.addi %c480_i32, %0 : i32
        %true_6 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      %c496_i32 = arith.constant 496 : i32
      %16 = arith.addi %c496_i32, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c512_i32 = arith.constant 512 : i32
    %10 = arith.addi %c512_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

