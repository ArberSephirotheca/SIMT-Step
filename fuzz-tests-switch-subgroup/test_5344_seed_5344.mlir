module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = "simt_step.switch"(%0, %c2_i32) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %2 = "simt_step.switch"(%arg3, %c4_i32) ({
      ^bb0(%arg5: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %12 = "simt_step.switch"(%arg3, %c4_i32_4) ({
        ^bb0(%arg6: i32):
          %true_8 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %18 = arith.addi %c0_i32_9, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_10 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %14 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %17 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32 : i32
          %19 = arith.cmpi slt, %arg7, %18 : i32
          "simt_step.condition"(%19, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_8 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %18 = arith.muli %arg7, %c4_i32_9 : i32
          %19 = arith.addi %c48_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%17, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %4 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %13 = "simt_step.if"(%12) ({
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32_6 : i32
          %17 = arith.addi %c80_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32_6 : i32
          %17 = arith.addi %c96_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%7: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_7 : i32
          %16 = arith.cmpi slt, %arg8, %15 : i32
          "simt_step.condition"(%16, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_6 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %15 = arith.muli %arg8, %c4_i32_7 : i32
          %16 = arith.addi %c112_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_8 = arith.constant 1 : i32
          %18 = arith.addi %arg8, %c1_i32_8 : i32
          "simt_step.yield"(%14, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%12#0, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%9: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %11 = "simt_step.if"(%10) ({
        %c4_i32_4 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_4 : i32
        %13 = simt_step.lane_id
        %14 = arith.index_cast %13 : index to i32
        %15 = "simt_step.switch"(%12, %14) ({
        ^bb0(%arg5: i32):
          %true_5 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %17 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %true_6 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %20 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %true_7 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %23 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          %true_8 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %26 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %13 = "simt_step.if"(%12) ({
          %true_5 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %15 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }, {
          %true_5 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %15 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
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
      %22 = simt_step.subgroup_id
      %23 = arith.index_cast %22 : index to i32
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_8 : i32
        %24 = arith.addi %23, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %25 = arith.addi %c12_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
        "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c32_i32 = arith.constant 32 : i32
        %23 = arith.addi %c32_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_8 : i32
        %26 = "simt_step.if"(%25) ({
          %c3_i32 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %27 = arith.addi %c224_i32, %0 : i32
        %true_9 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %29 = arith.addi %arg2, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg3, %c1_i32 : i32
        %true_10 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %31 = arith.muli %arg3, %c4_i32_11 : i32
        %32 = arith.addi %c240_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_12 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) : (i32) -> ()
    }) : (i1) -> i32
    %c256_i32 = arith.constant 256 : i32
    %9 = arith.addi %c256_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c36_i32 = arith.constant 36 : i32
    %11 = arith.addi %c36_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c40_i32 = arith.constant 40 : i32
      %22 = arith.addi %c40_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
      %25 = "simt_step.if"(%24) ({
        %c0_i32_8 = arith.constant 0 : i32
        %28 = arith.addi %0, %c0_i32_8 : i32
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c44_i32 = arith.constant 44 : i32
        %28 = arith.addi %c44_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
        %31 = "simt_step.if"(%30) ({
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c4_i32_10 = arith.constant 4 : i32
          %34 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %c272_i32 = arith.constant 272 : i32
        %32 = arith.addi %c272_i32, %0 : i32
        %true_9 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) : (i32) -> ()
      }) : (i1) -> i32
      %c288_i32 = arith.constant 288 : i32
      %26 = arith.addi %c288_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) : (i32) -> ()
    }, {
      %c48_i32 = arith.constant 48 : i32
      %22 = arith.addi %c48_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
      %25 = "simt_step.if"(%24) ({
        %c52_i32 = arith.constant 52 : i32
        %28 = arith.addi %c52_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
        %31 = "simt_step.if"(%30) ({
          %34 = simt_step.subgroup_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %32 = arith.addi %c304_i32, %0 : i32
        %true_9 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c56_i32 = arith.constant 56 : i32
        %28 = arith.addi %c56_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
        %31 = "simt_step.if"(%30) ({
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %34 = simt_step.subgroup_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %32 = arith.addi %c320_i32, %0 : i32
        %true_9 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %26 = arith.addi %c336_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) : (i32) -> ()
    }) : (i1) -> i32
    %c352_i32 = arith.constant 352 : i32
    %15 = arith.addi %c352_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %17 = arith.addi %c60_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_3 = arith.constant 4 : i32
    %19 = "simt_step.switch"(%18, %c4_i32_3) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_13 : i32
        %34 = arith.addi %33, %0 : i32
        %c64_i32 = arith.constant 64 : i32
        %35 = arith.addi %c64_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_14 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %33 = arith.addi %arg3, %arg4 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32_13 : i32
        %true_14 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_15 : i32
        %36 = arith.addi %c368_i32, %35 : i32
        %37 = arith.addi %36, %0 : i32
        %true_16 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %24 = arith.addi %c84_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %26 = "simt_step.switch"(%25, %c0_i32_8) ({
      ^bb0(%arg3: i32):
        %c88_i32 = arith.constant 88 : i32
        %33 = arith.addi %c88_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %35 = arith.addi %0, %c4_i32_13 : i32
        %36 = "simt_step.switch"(%34, %35) ({
        ^bb0(%arg4: i32):
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          %true_22 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %54 = arith.addi %c384_i32, %0 : i32
          %true_23 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %c4_i32_24 = arith.constant 4 : i32
          %true_25 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %57 = arith.addi %c400_i32, %0 : i32
          %true_26 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_24) {fallthrough = true} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = true} : (i32) -> ()
        ^bb3(%62: i32):  // no predecessors
          %63 = simt_step.subgroup_id
          %64 = arith.index_cast %63 : index to i32
          %true_27 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %65 = arith.addi %c416_i32, %0 : i32
          %true_28 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_28) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %37 = arith.addi %c432_i32, %0 : i32
        %true_15 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %40 = arith.addi %c92_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = simt_step.subgroup_id
        %43 = arith.index_cast %42 : index to i32
        %44 = "simt_step.switch"(%41, %43) ({
        ^bb0(%arg4: i32):
          %true_22 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %52 = arith.addi %c448_i32, %0 : i32
          %true_23 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %55 = arith.addi %0, %c2_i32 : i32
          %true_24 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %56 = arith.addi %c464_i32, %0 : i32
          %true_25 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        ^bb2(%58: i32):  // no predecessors
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb3(%61: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %45 = arith.addi %c480_i32, %0 : i32
        %true_17 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_18 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %47 = arith.addi %c496_i32, %0 : i32
        %true_19 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %true_20 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %50 = arith.addi %c512_i32, %0 : i32
        %true_21 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      %c528_i32 = arith.constant 528 : i32
      %27 = arith.addi %c528_i32, %0 : i32
      %true_10 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_11 = arith.constant true
      %c544_i32 = arith.constant 544 : i32
      %29 = arith.addi %c544_i32, %0 : i32
      %true_12 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %32 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c560_i32 = arith.constant 560 : i32
    %20 = arith.addi %c560_i32, %0 : i32
    %true_5 = arith.constant true
    %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

