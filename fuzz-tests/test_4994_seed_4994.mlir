module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_4 : i32
          %16 = arith.cmpi slt, %arg6, %15 : i32
          "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.addi %arg0, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %15 = arith.addi %arg6, %c1_i32_4 : i32
          "simt_step.yield"(%14, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%13#0) : (i32) -> ()
      }, {
        %c1_i32_2 = arith.constant 1 : i32
        %13 = arith.addi %arg0, %c1_i32_2 : i32
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %9 = arith.remsi %arg3, %c2_i32 : i32
      %10 = "simt_step.switch"(%9, %arg0) ({
      ^bb0(%arg5: i32):
        %c3_i32_2 = arith.constant 3 : i32
        %13 = arith.remsi %arg3, %c3_i32_2 : i32
        %14 = "simt_step.switch"(%13, %arg0) ({
        ^bb0(%arg6: i32):
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          %21 = arith.addi %arg0, %c3_i32_7 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          %23 = arith.addi %arg0, %c1_i32_8 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_6 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_6 = arith.constant 3 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %20 = arith.addi %arg7, %c1_i32_7 : i32
          "simt_step.yield"(%c3_i32_6, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%17: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %19 = "simt_step.if"(%18) ({
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }, {
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c1_i32_1 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32_1) {fallthrough = false} : (i32) -> ()
    ^bb3(%12: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %13 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %13 = arith.remsi %0, %c3_i32 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %14 = "simt_step.switch"(%13, %c0_i32_4) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %16 = arith.addi %arg4, %c2_i32 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c1_i32_5 = arith.constant 1 : i32
          %18 = arith.addi %17, %c1_i32_5 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          %20 = arith.addi %19, %c0_i32_6 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb3(%21: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %22 = arith.addi %21, %c4_i32_7 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %15) : (i32, i32) -> ()
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
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %13 = arith.muli %arg3, %c4_i32_4 : i32
        %14 = arith.addi %13, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %15 = arith.addi %c12_i32, %14 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_5 : i32
        "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32_9 : i32
          %21 = arith.addi %20, %0 : i32
          %c32_i32_10 = arith.constant 32 : i32
          %22 = arith.addi %c32_i32_10, %21 : i32
          %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %24 = arith.cmpi ne, %23, %c0_i32_11 : i32
          "simt_step.condition"(%24, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %20 = arith.addi %arg4, %arg5 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %21 = arith.addi %arg5, %c1_i32_9 : i32
          %true_10 = arith.constant true
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %22 = arith.muli %arg5, %c4_i32_11 : i32
          %23 = arith.addi %c16_i32, %22 : i32
          %24 = arith.addi %23, %0 : i32
          %true_12 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %14 = arith.addi %arg2, %13#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg3, %c1_i32 : i32
        %true_6 = arith.constant true
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %16 = arith.muli %arg3, %c4_i32_7 : i32
        %17 = arith.addi %c32_i32, %16 : i32
        %18 = arith.addi %17, %0 : i32
        %true_8 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%14, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %13 = arith.muli %arg3, %c4_i32_4 : i32
        %14 = arith.addi %13, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %15 = arith.addi %c52_i32, %14 : i32
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
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %15 = arith.muli %arg3, %c4_i32_5 : i32
        %16 = arith.addi %c48_i32, %15 : i32
        %17 = arith.addi %16, %0 : i32
        %true_6 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) : (i32) -> ()
    }) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %10 = arith.addi %c64_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

