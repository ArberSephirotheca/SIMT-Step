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
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %11, %c1_i32 : i32
        %13 = arith.cmpi slt, %arg6, %12 : i32
        "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %12 = "simt_step.if"(%11) ({
          %c0_i32_5 = arith.constant 0 : i32
          %14 = arith.addi %arg0, %c0_i32_5 : i32
          "simt_step.yield"(%14) : (i32) -> ()
        }, {
          %c1_i32_5 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%12, %13) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32_2 = arith.constant 2 : i32
      "simt_step.yield"(%6#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %9 = "simt_step.if"(%8) ({
        %c0_i32_4 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %12 = "simt_step.if"(%11) ({
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%13) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%12) : (i32) -> ()
      }, {
        "simt_step.yield"(%arg0) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32 = arith.constant 3 : i32
      %10 = arith.addi %arg0, %c3_i32 : i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %5 = arith.addi %0, %c4_i32_0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_5 : i32
      %10 = arith.addi %9, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %11 = arith.addi %c8_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_6 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %9 = arith.addi %c28_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %16 = arith.addi %c32_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %18 = "simt_step.switch"(%17, %c0_i32_6) ({
        ^bb0(%arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %29 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %20 = arith.addi %c36_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_8 : i32
        %23 = "simt_step.if"(%22) ({
          %c0_i32_12 = arith.constant 0 : i32
          %28 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.muli %arg6, %c4_i32_12 : i32
          %29 = arith.addi %28, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %30 = arith.addi %c40_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
          "simt_step.condition"(%32, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %28 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %29 = arith.addi %arg6, %c1_i32_12 : i32
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%25#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %27 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %14 = arith.addi %arg2, %13 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %7 = arith.addi %c16_i32, %0 : i32
    %true_4 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

