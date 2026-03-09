module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c2_i32_0 = arith.constant 2 : i32
    %1 = "simt_step.switch"(%0, %c2_i32_0) ({
    ^bb0(%arg4: i32):
      %true_5 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %12 = arith.addi %c0_i32_6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %true_7 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %15 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %11 = arith.remsi %arg3, %c4_i32_5 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %11, %c1_i32 : i32
      %13 = arith.cmpi slt, %arg5, %12 : i32
      "simt_step.condition"(%13, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_5 = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %12 = arith.muli %arg5, %c4_i32_6 : i32
      %13 = arith.addi %c32_i32, %12 : i32
      %14 = arith.addi %13, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%11, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %1, %2#0 : i32
    %c4_i32 = arith.constant 4 : i32
    %5 = arith.remsi %arg3, %c4_i32 : i32
    %c2_i32_3 = arith.constant 2 : i32
    %6 = "simt_step.switch"(%5, %c2_i32_3) ({
    ^bb0(%arg4: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %22 = arith.remsi %arg3, %c4_i32_11 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %22, %c1_i32 : i32
        %24 = arith.cmpi slt, %arg6, %23 : i32
        "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %22 = arith.remsi %arg3, %c3_i32 : i32
        %23 = "simt_step.switch"(%22, %arg0) ({
        ^bb0(%arg7: i32):
          %true_13 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_14 : i32
          %31 = arith.addi %c48_i32, %30 : i32
          %32 = arith.addi %31, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %true_15 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %35 = arith.muli %arg6, %c4_i32_16 : i32
          %36 = arith.addi %c64_i32, %35 : i32
          %37 = arith.addi %36, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %true_17 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %40 = arith.muli %arg6, %c4_i32_18 : i32
          %41 = arith.addi %c80_i32, %40 : i32
          %42 = arith.addi %41, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb3(%43: i32):  // no predecessors
          %true_19 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %45 = arith.muli %arg6, %c4_i32_20 : i32
          %46 = arith.addi %c96_i32, %45 : i32
          %47 = arith.addi %46, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %47, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %25 = arith.muli %arg6, %c4_i32_12 : i32
        %26 = arith.addi %c112_i32, %25 : i32
        %27 = arith.addi %26, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%23, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
      %14 = "simt_step.if"(%13) ({
        %c3_i32 = arith.constant 3 : i32
        %22 = arith.remsi %arg3, %c3_i32 : i32
        %23 = simt_step.lane_id
        %24 = arith.index_cast %23 : index to i32
        %25 = "simt_step.switch"(%22, %24) ({
        ^bb0(%arg5: i32):
          %true_11 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %27 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_12 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %30 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %33 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%34: i32):  // no predecessors
          %true_14 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %36 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %true_11 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %23 = arith.addi %c192_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c4_i32_8 = arith.constant 4 : i32
      %16 = arith.remsi %arg3, %c4_i32_8 : i32
      %17 = simt_step.lane_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg5: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_18 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_18 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %31 = arith.muli %arg7, %c4_i32_19 : i32
          %32 = arith.addi %c208_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.break"(%30, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_18 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_18 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %31 = arith.muli %arg7, %c4_i32_19 : i32
          %32 = arith.addi %c224_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.continue"(%30, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_15 : i32
        %27 = "simt_step.if"(%26) ({
          %true_18 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %31 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %true_18 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %31 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb3(%28: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32_18 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32 : i32
          %32 = arith.cmpi slt, %arg7, %31 : i32
          "simt_step.condition"(%32, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_18 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %31 = arith.muli %arg7, %c4_i32_19 : i32
          %32 = arith.addi %c272_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%30, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb3(%20: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %22 = arith.remsi %arg3, %c4_i32_11 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %22, %c1_i32 : i32
        %24 = arith.cmpi slt, %arg6, %23 : i32
        "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_11 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %23 = arith.muli %arg6, %c4_i32_12 : i32
        %24 = arith.addi %c288_i32, %23 : i32
        %25 = arith.addi %24, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%22, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c304_i32 = arith.constant 304 : i32
    %8 = arith.addi %c304_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %10 = arith.select %9, %4, %6 : i32
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
    %c2_i32 = arith.constant 2 : i32
    %7 = arith.addi %0, %c2_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_14 : i32
        %36 = arith.addi %35, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %37 = arith.addi %c12_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %35 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_15 : i32
        %38 = arith.addi %c320_i32, %37 : i32
        %39 = arith.addi %38, %0 : i32
        %true_16 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %15 = arith.addi %c336_i32, %0 : i32
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %18 = arith.addi %c32_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_7 : i32
      %21 = "simt_step.if"(%20) ({
        %c36_i32 = arith.constant 36 : i32
        %35 = arith.addi %c36_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = simt_step.subgroup_id
        %38 = arith.index_cast %37 : index to i32
        %39 = "simt_step.switch"(%36, %38) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          %true_14 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %43 = arith.addi %c352_i32, %0 : i32
          %true_15 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_16 : i32
          %37 = arith.addi %36, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %38 = arith.addi %c40_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_17 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_17 : i32
          %39 = arith.addi %c368_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_18 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) : (i32) -> ()
      }) : (i1) -> i32
      %c384_i32 = arith.constant 384 : i32
      %22 = arith.addi %c384_i32, %0 : i32
      %true_8 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %24 = arith.addi %c400_i32, %0 : i32
      %true_10 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %27 = arith.addi %c60_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_11 : i32
      %30 = "simt_step.if"(%29) ({
        %c64_i32 = arith.constant 64 : i32
        %35 = arith.addi %c64_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_14 = arith.constant 2 : i32
        %37 = "simt_step.switch"(%36, %c2_i32_14) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %true_17 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %41 = arith.addi %c416_i32, %0 : i32
          %true_18 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_19 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb3(%45: i32):  // no predecessors
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          %true_20 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %48 = arith.addi %c432_i32, %0 : i32
          %true_21 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %38 = arith.addi %c448_i32, %0 : i32
        %true_16 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c464_i32 = arith.constant 464 : i32
      %31 = arith.addi %c464_i32, %0 : i32
      %true_12 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c0_i32_13 = arith.constant 0 : i32
      %34 = arith.addi %0, %c0_i32_13 : i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c480_i32 = arith.constant 480 : i32
    %9 = arith.addi %c480_i32, %0 : i32
    %true_0 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c68_i32 = arith.constant 68 : i32
    %11 = arith.addi %c68_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %13 = "simt_step.switch"(%12, %c0_i32_2) ({
    ^bb0(%arg2: i32):
      %c72_i32 = arith.constant 72 : i32
      %14 = arith.addi %c72_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_3 : i32
      %17 = "simt_step.if"(%16) ({
        %c76_i32 = arith.constant 76 : i32
        %24 = arith.addi %c76_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg3: i32):
          %29 = simt_step.subgroup_id
          %30 = arith.index_cast %29 : index to i32
          %true_9 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %31 = arith.addi %c496_i32, %0 : i32
          %true_10 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %24 = arith.addi %c80_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = simt_step.subgroup_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg3: i32):
          %true_9 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %29 = arith.addi %c512_i32, %0 : i32
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %32 = simt_step.lane_id
          %33 = arith.index_cast %32 : index to i32
          %true_11 = arith.constant true
          %c528_i32 = arith.constant 528 : i32
          %34 = arith.addi %c528_i32, %0 : i32
          %true_12 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          %37 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c544_i32 = arith.constant 544 : i32
      %18 = arith.addi %c544_i32, %0 : i32
      %true_4 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c560_i32 = arith.constant 560 : i32
      %20 = arith.addi %c560_i32, %0 : i32
      %true_6 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_9 : i32
        %25 = arith.addi %24, %0 : i32
        %c84_i32 = arith.constant 84 : i32
        %26 = arith.addi %c84_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_10 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %24 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32 : i32
        %true_9 = arith.constant true
        %c576_i32 = arith.constant 576 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_10 : i32
        %27 = arith.addi %c576_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_11 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

