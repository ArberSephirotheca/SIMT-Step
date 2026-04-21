module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.addi %arg0, %c2_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %6 = "simt_step.if"(%5) ({
        %true_3 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %19 = arith.addi %c0_i32_4, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c2_i32_3 = arith.constant 2 : i32
        %18 = arith.remsi %arg3, %c2_i32_3 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %19 = "simt_step.switch"(%18, %c4_i32_4) ({
        ^bb0(%arg5: i32):
          %true_5 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %21 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %24 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %true_7 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %27 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %true_0 = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %9 = arith.addi %c64_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c2_i32_1 = arith.constant 2 : i32
      %11 = arith.remsi %arg3, %c2_i32_1 : i32
      %c4_i32 = arith.constant 4 : i32
      %12 = "simt_step.switch"(%11, %c4_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.muli %arg7, %c4_i32_7 : i32
          %25 = arith.addi %c80_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%23, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %20 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg6: i32):
          %true_6 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %24 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_7 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %27 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %22 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb3(%13: i32):  // no predecessors
      %c3_i32_2 = arith.constant 3 : i32
      %14 = arith.remsi %arg3, %c3_i32_2 : i32
      %15 = simt_step.subgroup_id
      %16 = arith.index_cast %15 : index to i32
      %17 = "simt_step.switch"(%14, %16) ({
      ^bb0(%arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %19 = "simt_step.if"(%18) ({
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %29 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %29 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %22 = "simt_step.if"(%21) ({
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %29 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %29 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %true_5 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %25 = arith.addi %c208_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %28 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %28, %c1_i32 : i32
          %30 = arith.cmpi slt, %arg7, %29 : i32
          "simt_step.condition"(%30, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_8 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %29 = arith.muli %arg7, %c4_i32_9 : i32
          %30 = arith.addi %c224_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%28, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %4 = arith.addi %c240_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %13 = arith.addi %0, %c2_i32 : i32
      %14 = "simt_step.switch"(%12, %13) ({
      ^bb0(%arg2: i32):
        %c16_i32 = arith.constant 16 : i32
        %15 = arith.addi %c16_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_1 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_1 : i32
        %18 = "simt_step.if"(%17) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %19 = arith.addi %c256_i32, %0 : i32
        %true_2 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        %true_3 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %24 = arith.addi %c272_i32, %0 : i32
        %true_4 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %12 = arith.muli %arg3, %c4_i32_3 : i32
        %13 = arith.addi %12, %0 : i32
        %c20_i32 = arith.constant 20 : i32
        %14 = arith.addi %c20_i32, %13 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
        "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %12 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %arg3, %c1_i32 : i32
        %true_3 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %14 = arith.muli %arg3, %c4_i32_4 : i32
        %15 = arith.addi %c288_i32, %14 : i32
        %16 = arith.addi %15, %0 : i32
        %true_5 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) : (i32) -> ()
    }) : (i1) -> i32
    %c304_i32 = arith.constant 304 : i32
    %9 = arith.addi %c304_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

