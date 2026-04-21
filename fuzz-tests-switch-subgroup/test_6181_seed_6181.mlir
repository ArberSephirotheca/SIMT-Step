module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true_1 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %11 = arith.addi %c0_i32_2, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) : (i32) -> ()
    }, {
      %true_1 = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10) : (i32) -> ()
    }) : (i1) -> i32
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = simt_step.subgroup_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c3_i32_1 = arith.constant 3 : i32
      %10 = arith.remsi %arg3, %c3_i32_1 : i32
      %c2_i32 = arith.constant 2 : i32
      %11 = "simt_step.switch"(%10, %c2_i32) ({
      ^bb0(%arg5: i32):
        %c2_i32_5 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_5 : i32
        %c2_i32_6 = arith.constant 2 : i32
        %18 = arith.addi %arg0, %c2_i32_6 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg6: i32):
          %true_11 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %31 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_12 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %34 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %true_7 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %22 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_11 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %31 = arith.muli %arg7, %c4_i32 : i32
          %32 = arith.addi %c80_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%30, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%25: i32):  // no predecessors
        %c3_i32_10 = arith.constant 3 : i32
        %26 = arith.remsi %arg3, %c3_i32_10 : i32
        %27 = simt_step.subgroup_id
        %28 = arith.index_cast %27 : index to i32
        %29 = "simt_step.switch"(%26, %28) ({
        ^bb0(%arg6: i32):
          %true_11 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %31 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_12 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %34 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %true_13 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %37 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32 : i32
          %20 = arith.cmpi slt, %arg6, %19 : i32
          "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_7 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32 : i32
          %20 = arith.addi %c144_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.continue"(%18, %22) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) : (i32) -> ()
      }, {
        %true_5 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %18 = arith.addi %c160_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %17, %c1_i32 : i32
        %19 = arith.cmpi slt, %arg6, %18 : i32
        "simt_step.condition"(%19, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_5 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_5 : i32
        %18 = "simt_step.switch"(%17, %arg0) ({
        ^bb0(%arg7: i32):
          %true_7 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg6, %c4_i32_8 : i32
          %26 = arith.addi %c176_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_10 : i32
          %31 = arith.addi %c192_i32, %30 : i32
          %32 = arith.addi %31, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %true_11 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg6, %c4_i32_12 : i32
          %36 = arith.addi %c208_i32, %35 : i32
          %37 = arith.addi %36, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %c4_i32 = arith.constant 4 : i32
        %20 = arith.muli %arg6, %c4_i32 : i32
        %21 = arith.addi %c224_i32, %20 : i32
        %22 = arith.addi %21, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%18, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %7 = arith.addi %c240_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %9 = arith.select %8, %1, %5 : i32
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
      %12 = arith.addi %arg2, %arg3 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32_3 : i32
      %true_4 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_5 : i32
      %15 = arith.addi %c256_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_6 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %8 = arith.addi %0, %c1_i32 : i32
    %9 = "simt_step.switch"(%7, %8) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %14 = "simt_step.switch"(%13, %c0_i32_3) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %35 = arith.addi %c36_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %37 = "simt_step.switch"(%36, %c0_i32_14) ({
        ^bb0(%arg4: i32):
          %53 = simt_step.subgroup_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %56 = simt_step.subgroup_id
          %57 = arith.index_cast %56 : index to i32
          %true_21 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %58 = arith.addi %c272_i32, %0 : i32
          %true_22 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb2(%60: i32):  // no predecessors
          %true_23 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %61 = arith.addi %c288_i32, %0 : i32
          %true_24 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%63: i32):  // no predecessors
          %true_25 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %64 = arith.addi %c304_i32, %0 : i32
          %true_26 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %38 = arith.addi %c320_i32, %0 : i32
        %true_16 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_21 : i32
          %54 = arith.addi %53, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %55 = arith.addi %c40_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_22 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32_21 : i32
          %true_22 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_23 : i32
          %56 = arith.addi %c336_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_24 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %42 = arith.addi %c352_i32, %0 : i32
        %true_20 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %45 = arith.addi %c60_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = simt_step.lane_id
        %48 = arith.index_cast %47 : index to i32
        %49 = "simt_step.switch"(%46, %48) ({
        ^bb0(%arg4: i32):
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          %true_21 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %55 = arith.addi %c368_i32, %0 : i32
          %true_22 = arith.constant true
          %56 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        ^bb1(%57: i32):  // no predecessors
          %58 = simt_step.subgroup_id
          %59 = arith.index_cast %58 : index to i32
          %true_23 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %60 = arith.addi %c384_i32, %0 : i32
          %true_24 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          %c0_i32_25 = arith.constant 0 : i32
          %63 = arith.addi %0, %c0_i32_25 : i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      ^bb3(%50: i32):  // no predecessors
        %51 = simt_step.subgroup_id
        %52 = arith.index_cast %51 : index to i32
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %15 = arith.addi %c400_i32, %0 : i32
      %true_5 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %17 = arith.addi %c416_i32, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %20 = arith.addi %c64_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %22 = "simt_step.switch"(%21, %c3_i32) ({
      ^bb0(%arg3: i32):
        %35 = simt_step.lane_id
        %36 = arith.index_cast %35 : index to i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c4_i32_14 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_14) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_21 : i32
          %49 = arith.addi %48, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %50 = arith.addi %c68_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_22 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32_21 : i32
          %true_22 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_23 : i32
          %51 = arith.addi %c432_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_24 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %40 = arith.addi %c448_i32, %0 : i32
        %true_18 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %43 = arith.addi %c88_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = "simt_step.switch"(%44, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32_21 = arith.constant 3 : i32
          %48 = arith.addi %0, %c3_i32_21 : i32
          %true_22 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %49 = arith.addi %c464_i32, %0 : i32
          %true_23 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %c0_i32_24 = arith.constant 0 : i32
          %52 = arith.addi %0, %c0_i32_24 : i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %46 = arith.addi %c480_i32, %0 : i32
        %true_20 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %23 = arith.addi %c496_i32, %0 : i32
      %true_9 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %26 = arith.addi %c92_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = simt_step.subgroup_id
      %29 = arith.index_cast %28 : index to i32
      %30 = "simt_step.switch"(%27, %29) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %35 = arith.addi %c96_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_14 = arith.constant 3 : i32
        %37 = "simt_step.switch"(%36, %c3_i32_14) ({
        ^bb0(%arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_21 : i32
          "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %true_22 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %52 = arith.addi %c512_i32, %0 : i32
          %true_23 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %39 = arith.addi %c100_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_15 = arith.constant 3 : i32
        %41 = "simt_step.switch"(%40, %c3_i32_15) ({
        ^bb0(%arg4: i32):
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          %true_21 = arith.constant true
          %c528_i32 = arith.constant 528 : i32
          %52 = arith.addi %c528_i32, %0 : i32
          %true_22 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c544_i32 = arith.constant 544 : i32
        %42 = arith.addi %c544_i32, %0 : i32
        %true_17 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %45 = arith.addi %c104_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_18 = arith.constant 3 : i32
        %47 = "simt_step.switch"(%46, %c3_i32_18) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          %true_21 = arith.constant true
          %c560_i32 = arith.constant 560 : i32
          %53 = arith.addi %c560_i32, %0 : i32
          %true_22 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c576_i32 = arith.constant 576 : i32
        %48 = arith.addi %c576_i32, %0 : i32
        %true_20 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      %c592_i32 = arith.constant 592 : i32
      %31 = arith.addi %c592_i32, %0 : i32
      %true_11 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c0_i32_12 = arith.constant 0 : i32
      %c0_i32_13 = arith.constant 0 : i32
      %34:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_14 : i32
        %36 = arith.addi %35, %0 : i32
        %c108_i32 = arith.constant 108 : i32
        %37 = arith.addi %c108_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %42 = arith.muli %arg6, %c4_i32_20 : i32
          %43 = arith.addi %42, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %44 = arith.addi %c128_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_21 : i32
          "simt_step.condition"(%46, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %42 = arith.addi %arg5, %arg6 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %43 = arith.addi %arg6, %c1_i32_20 : i32
          %true_21 = arith.constant true
          %c608_i32 = arith.constant 608 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %44 = arith.muli %arg6, %c4_i32_22 : i32
          %45 = arith.addi %c608_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_23 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %36 = arith.addi %arg3, %35#0 : i32
        %c1_i32_16 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_16 : i32
        %true_17 = arith.constant true
        %c624_i32 = arith.constant 624 : i32
        %c4_i32_18 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_18 : i32
        %39 = arith.addi %c624_i32, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_19 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c640_i32 = arith.constant 640 : i32
    %10 = arith.addi %c640_i32, %0 : i32
    %true_2 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

