module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = arith.addi %arg0, %c1_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %6 = "simt_step.switch"(%5, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_13 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %22 = arith.addi %arg0, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c4_i32_6 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_6 : i32
        %c2_i32 = arith.constant 2 : i32
        %15 = "simt_step.switch"(%14, %c2_i32) ({
        ^bb0(%arg6: i32):
          %c2_i32_12 = arith.constant 2 : i32
          %22 = arith.addi %arg0, %c2_i32_12 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          %24 = arith.addi %arg0, %c2_i32_13 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %27 = arith.addi %arg0, %c3_i32_14 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c4_i32_7 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_7 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %18 = arith.addi %arg0, %c4_i32_8 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg6: i32):
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c3_i32_9 = arith.constant 3 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_13 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_12 = arith.constant 3 : i32
          %22 = arith.addi %arg0, %c3_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c3_i32_0 = arith.constant 3 : i32
      %8 = arith.remsi %arg3, %c3_i32_0 : i32
      %c1_i32_1 = arith.constant 1 : i32
      %9 = "simt_step.switch"(%8, %c1_i32_1) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_9 : i32
          %20 = arith.cmpi slt, %arg7, %19 : i32
          "simt_step.condition"(%20, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_8 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %19 = arith.addi %arg7, %c1_i32_9 : i32
          "simt_step.yield"(%18, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c3_i32_6 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32_6 : i32
        %c3_i32_7 = arith.constant 3 : i32
        %16 = arith.addi %arg0, %c3_i32_7 : i32
        %17 = "simt_step.switch"(%15, %16) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%20: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32_5 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c1_i32_4 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32_4 : i32
        "simt_step.yield"(%arg0, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
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
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %8, %c0_i32_0 : i32
    %10 = "simt_step.if"(%9) ({
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_1 : i32
      %16 = "simt_step.if"(%15) ({
        %c16_i32 = arith.constant 16 : i32
        %19 = arith.addi %c16_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
        %22 = "simt_step.if"(%21) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %25 = simt_step.subgroup_id
          %26 = arith.index_cast %25 : index to i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        %c16_i32_4 = arith.constant 16 : i32
        %23 = arith.addi %c16_i32_4, %0 : i32
        %true_5 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %20 = arith.muli %arg3, %c4_i32_5 : i32
          %21 = arith.addi %20, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %22 = arith.addi %c20_i32, %21 : i32
          %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
          "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %20 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg3, %c1_i32 : i32
          %true_5 = arith.constant true
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %22 = arith.muli %arg3, %c4_i32_6 : i32
          %23 = arith.addi %c32_i32, %22 : i32
          %24 = arith.addi %23, %0 : i32
          %true_7 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %17 = arith.addi %c48_i32, %0 : i32
      %true_2 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) : (i32) -> ()
    }, {
      %c40_i32 = arith.constant 40 : i32
      %13 = arith.addi %c40_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_1 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %20 = arith.muli %arg3, %c4_i32_5 : i32
          %21 = arith.addi %20, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %22 = arith.addi %c44_i32, %21 : i32
          %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
          "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %20 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg3, %c1_i32 : i32
          %true_5 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %22 = arith.muli %arg3, %c4_i32_6 : i32
          %23 = arith.addi %c64_i32, %22 : i32
          %24 = arith.addi %23, %0 : i32
          %true_7 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %19 = arith.addi %c64_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %21 = "simt_step.switch"(%20, %0) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %c4_i32_3 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_3) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %17 = arith.addi %c80_i32, %0 : i32
      %true_2 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %11 = arith.addi %c96_i32, %0 : i32
    %true = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

