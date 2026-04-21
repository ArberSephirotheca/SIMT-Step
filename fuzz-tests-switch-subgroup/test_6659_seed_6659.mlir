module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %c2_i32_2 = arith.constant 2 : i32
      %7 = arith.addi %arg0, %c2_i32_2 : i32
      %8 = "simt_step.switch"(%6, %7) ({
      ^bb0(%arg4: i32):
        %c2_i32_3 = arith.constant 2 : i32
        %9 = arith.remsi %arg3, %c2_i32_3 : i32
        %c3_i32 = arith.constant 3 : i32
        %10 = arith.addi %arg0, %c3_i32 : i32
        %11 = "simt_step.switch"(%9, %10) ({
        ^bb0(%arg5: i32):
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %22 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %25 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c3_i32_4 = arith.constant 3 : i32
        %13 = arith.remsi %arg3, %c3_i32_4 : i32
        %c2_i32_5 = arith.constant 2 : i32
        %14 = arith.addi %arg0, %c2_i32_5 : i32
        %15 = "simt_step.switch"(%13, %14) ({
        ^bb0(%arg5: i32):
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %22 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %25 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %true_10 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %28 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %17 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c3_i32_7 = arith.constant 3 : i32
        %19 = arith.remsi %arg3, %c3_i32_7 : i32
        %20 = "simt_step.switch"(%19, %arg0) ({
        ^bb0(%arg5: i32):
          %true_8 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %22 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_9 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %25 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %true_10 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %28 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%8) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %7 = "simt_step.switch"(%6, %arg0) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %9 = "simt_step.if"(%8) ({
          %true_6 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %16 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %16 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %12 = "simt_step.if"(%11) ({
          %true_6 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %16 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %16 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb2(%13: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32 : i32
          %17 = arith.addi %c224_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.continue"(%15, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %14 = arith.remsi %0, %c3_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %0, %c1_i32 : i32
        %16 = "simt_step.switch"(%14, %15) ({
        ^bb0(%arg4: i32):
          %c1_i32_7 = arith.constant 1 : i32
          %18 = arith.addi %arg4, %c1_i32_7 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_8 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %22 = arith.addi %21, %c2_i32 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_6 = arith.constant 1 : i32
        %17 = arith.addi %arg3, %c1_i32_6 : i32
        "simt_step.yield"(%arg2, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_4 : i32
      %16 = "simt_step.if"(%15) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %20 = arith.muli %arg3, %c4_i32_8 : i32
          %21 = arith.addi %20, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %22 = arith.addi %c16_i32, %21 : i32
          %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %24 = arith.cmpi ne, %23, %c0_i32_9 : i32
          "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %20 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg3, %c1_i32 : i32
          %true_8 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg3, %c4_i32_9 : i32
          %23 = arith.addi %c240_i32, %22 : i32
          %24 = arith.addi %23, %0 : i32
          %true_10 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }) : (i1) -> i32
      %c256_i32 = arith.constant 256 : i32
      %17 = arith.addi %c256_i32, %0 : i32
      %true_5 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c272_i32 = arith.constant 272 : i32
    %10 = arith.addi %c272_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_4 : i32
      %14 = arith.addi %13, %0 : i32
      %c36_i32 = arith.constant 36 : i32
      %15 = arith.addi %c36_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_5 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_5 : i32
      %16 = arith.addi %c288_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

