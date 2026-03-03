module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = "simt_step.switch"(%arg3, %arg0) ({
    ^bb0(%arg4: i32):
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %12 = arith.addi %arg0, %c0_i32_2 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32 = arith.constant 4 : i32
    %3 = arith.remsi %arg3, %c4_i32 : i32
    %4 = simt_step.subgroup_id
    %5 = arith.index_cast %4 : index to i32
    %6 = "simt_step.switch"(%3, %5) ({
    ^bb0(%arg4: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %11 = arith.remsi %arg3, %c4_i32_2 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12 = arith.addi %arg0, %c0_i32_3 : i32
      %13 = "simt_step.switch"(%11, %12) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %24 = "simt_step.if"(%23) ({
          %c1_i32_12 = arith.constant 1 : i32
          %28 = arith.addi %arg0, %c1_i32_12 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %29 = arith.addi %28, %c1_i32_13 : i32
          %30 = arith.cmpi slt, %arg7, %29 : i32
          "simt_step.condition"(%30, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_12 = arith.constant 2 : i32
          %28 = arith.addi %arg0, %c2_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %29 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c4_i32_4 = arith.constant 4 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %22 = arith.remsi %arg3, %c4_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %23 = arith.addi %22, %c1_i32_9 : i32
        %24 = arith.cmpi slt, %arg6, %23 : i32
        "simt_step.condition"(%24, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.addi %arg0, %c0_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %23 = arith.addi %arg6, %c1_i32_9 : i32
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%18: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.addi %arg0, %c0_i32_8 : i32
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        "simt_step.yield"(%arg0) : (i32) -> ()
      }) : (i1) -> i32
      %c2_i32 = arith.constant 2 : i32
      %21 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_0 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %10 = arith.select %9, %0, %6 : i32
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
      %8 = arith.muli %arg3, %c4_i32_3 : i32
      %9 = arith.addi %8, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %10 = arith.addi %c8_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_4 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %8 = arith.addi %c28_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %10 = "simt_step.switch"(%9, %c1_i32) ({
      ^bb0(%arg4: i32):
        %c32_i32_5 = arith.constant 32 : i32
        %13 = arith.addi %c32_i32_5, %0 : i32
        %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %15 = "simt_step.switch"(%14, %c0_i32_6) ({
        ^bb0(%arg5: i32):
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %22 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %17 = arith.addi %c36_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_8 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32_9 = arith.constant 1 : i32
          %21 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%21) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %11 = arith.addi %arg2, %10 : i32
      %c1_i32_4 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32_4 : i32
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %6 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

