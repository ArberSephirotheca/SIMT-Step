module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32_5 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %15 = "simt_step.if"(%14) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.addi %arg0, %c4_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_6 : i32
        "simt_step.yield"(%15, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %9 = "simt_step.if"(%8) ({
        %c0_i32_4 = arith.constant 0 : i32
        %14 = arith.addi %arg0, %c0_i32_4 : i32
        "simt_step.yield"(%14) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %15 = "simt_step.if"(%14) ({
          %c3_i32_5 = arith.constant 3 : i32
          %16 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %c0_i32_5 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      %11 = arith.remsi %arg3, %c3_i32_3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg0, %c1_i32 : i32
      %13 = "simt_step.switch"(%11, %12) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_13 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_12 = arith.constant 2 : i32
          %25 = arith.addi %arg0, %c2_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32_13 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c0_i32_12 = arith.constant 0 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %25 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%c0_i32_12, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%17: i32):  // no predecessors
        %c4_i32_8 = arith.constant 4 : i32
        %18 = arith.remsi %arg3, %c4_i32_8 : i32
        %c3_i32_9 = arith.constant 3 : i32
        %19 = arith.addi %arg0, %c3_i32_9 : i32
        %20 = "simt_step.switch"(%18, %19) ({
        ^bb0(%arg6: i32):
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          %27 = arith.addi %arg0, %c0_i32_13 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c2_i32_10 = arith.constant 2 : i32
        %21 = arith.addi %arg0, %c2_i32_10 : i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb3(%22: i32):  // no predecessors
        %c4_i32_11 = arith.constant 4 : i32
        %23 = arith.remsi %arg3, %c4_i32_11 : i32
        %24 = "simt_step.switch"(%23, %arg0) ({
        ^bb0(%arg6: i32):
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c2_i32_13 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          %27 = arith.addi %arg0, %c4_i32_14 : i32
          "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) : (i32) -> ()
    }, {
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_1 = arith.constant 4 : i32
      %13 = "simt_step.switch"(%12, %c4_i32_1) ({
      ^bb0(%arg2: i32):
        %c16_i32_3 = arith.constant 16 : i32
        %14 = arith.addi %c16_i32_3, %0 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %16 = "simt_step.switch"(%15, %c0_i32_4) ({
        ^bb0(%arg3: i32):
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c3_i32_9 = arith.constant 3 : i32
          %30 = arith.addi %0, %c3_i32_9 : i32
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %32 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %18 = arith.addi %c20_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
        %21 = "simt_step.if"(%20) ({
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }, {
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %23 = arith.addi %c24_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
        %26 = "simt_step.if"(%25) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

