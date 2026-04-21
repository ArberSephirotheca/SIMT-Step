module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %3 = "simt_step.switch"(%2, %c2_i32) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.remsi %arg3, %c4_i32 : i32
      %7 = simt_step.lane_id
      %8 = arith.index_cast %7 : index to i32
      %9 = "simt_step.switch"(%6, %8) ({
      ^bb0(%arg5: i32):
        %15 = simt_step.lane_id
        %16 = arith.index_cast %15 : index to i32
        %17 = "simt_step.switch"(%arg3, %16) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %27 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_11 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %30 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg7, %c4_i32_11 : i32
          %28 = arith.addi %c48_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%26, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c3_i32_6 = arith.constant 3 : i32
        %21 = arith.remsi %arg3, %c3_i32_6 : i32
        %c3_i32_7 = arith.constant 3 : i32
        %22 = arith.addi %arg0, %c3_i32_7 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %27 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %true_11 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %30 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_12 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %33 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%34: i32):  // no predecessors
          %true_13 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %36 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %27 = arith.muli %arg7, %c4_i32_11 : i32
          %28 = arith.addi %c128_i32, %27 : i32
          %29 = arith.addi %28, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%26, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %12 = "simt_step.if"(%11) ({
        %c3_i32_4 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32_4 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.addi %arg0, %c4_i32_5 : i32
        %17 = "simt_step.switch"(%15, %16) ({
        ^bb0(%arg5: i32):
          %true_6 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %19 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_7 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %22 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %true_8 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %25 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %true_9 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %28 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32_7 : i32
          %18 = arith.addi %c208_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true_4 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.muli %arg6, %c4_i32_5 : i32
        %17 = arith.addi %c224_i32, %16 : i32
        %18 = arith.addi %17, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%15, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %5 = arith.select %4, %0, %3 : i32
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
    %c1_i32 = arith.constant 1 : i32
    %5 = arith.addi %0, %c1_i32 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_0 : i32
    %9 = "simt_step.if"(%8) ({
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %17 = arith.addi %c16_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_1 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_1 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c240_i32 = arith.constant 240 : i32
        %21 = arith.addi %c240_i32, %0 : i32
        %true_2 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %27 = arith.muli %arg4, %c4_i32_7 : i32
          %28 = arith.addi %27, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %29 = arith.addi %c20_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_8 : i32
          "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %27 = arith.addi %arg3, %arg4 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %28 = arith.addi %arg4, %c1_i32_7 : i32
          %true_8 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_9 : i32
          %30 = arith.addi %c256_i32, %29 : i32
          %31 = arith.addi %30, %0 : i32
          %true_10 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_5 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %25 = arith.addi %c272_i32, %0 : i32
        %true_6 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c288_i32 = arith.constant 288 : i32
    %10 = arith.addi %c288_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

