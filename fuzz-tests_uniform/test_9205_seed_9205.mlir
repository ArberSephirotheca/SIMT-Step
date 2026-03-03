module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %10, %c1_i32 : i32
      %12 = arith.cmpi slt, %arg5, %11 : i32
      "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.addi %arg0, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_2, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %4 = arith.select %3, %c0_i32, %0#0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %10, %c1_i32 : i32
      %12 = arith.cmpi slt, %arg5, %11 : i32
      "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %10 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = "simt_step.switch"(%10, %c1_i32) ({
      ^bb0(%arg6: i32):
        %c3_i32_10 = arith.constant 3 : i32
        %14 = arith.remsi %arg3, %c3_i32_10 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %15 = "simt_step.switch"(%14, %c1_i32_11) ({
        ^bb0(%arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %24 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          %26 = arith.addi %arg0, %c4_i32_16 : i32
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%28: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          %29 = arith.addi %arg0, %c4_i32_17 : i32
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c1_i32_12 = arith.constant 1 : i32
        %16 = arith.addi %arg0, %c1_i32_12 : i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c3_i32_13 = arith.constant 3 : i32
        %18 = arith.remsi %arg3, %c3_i32_13 : i32
        %19 = "simt_step.switch"(%18, %arg0) ({
        ^bb0(%arg7: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          %25 = arith.addi %arg0, %c3_i32_16 : i32
          "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%27: i32):  // no predecessors
          %c1_i32_17 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %20 = arith.addi %arg0, %c0_i32_14 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c3_i32_15 = arith.constant 3 : i32
        %22 = arith.remsi %arg3, %c3_i32_15 : i32
        %c2_i32 = arith.constant 2 : i32
        %23 = "simt_step.switch"(%22, %c2_i32) ({
        ^bb0(%arg7: i32):
          %c2_i32_16 = arith.constant 2 : i32
          %24 = arith.addi %arg0, %c2_i32_16 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%27: i32):  // no predecessors
          %c1_i32_17 = arith.constant 1 : i32
          %28 = arith.addi %arg0, %c1_i32_17 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %12 = arith.addi %arg0, %c0_i32_8 : i32
      %c1_i32_9 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32_9 : i32
      "simt_step.yield"(%11, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_6 = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %7 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_7 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
    %9 = arith.select %8, %4, %5#0 : i32
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
      %c4_i32_9 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_9 : i32
      %19 = arith.addi %18, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %20 = arith.addi %c8_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_10 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %6 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_13 : i32
        %25 = arith.addi %24, %0 : i32
        %c32_i32_14 = arith.constant 32 : i32
        %26 = arith.addi %c32_i32_14, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_15 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %24 = arith.addi %arg3, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      "simt_step.yield"(%18#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %20 = arith.addi %c52_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %22 = arith.addi %0, %c2_i32 : i32
      %23 = "simt_step.switch"(%21, %22) ({
      ^bb0(%arg3: i32):
        %c4_i32_13 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %25 = arith.addi %c56_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_14 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_12 = arith.constant true
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %13 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %c0_i32_6 = arith.constant 0 : i32
    %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_9 : i32
      %19 = arith.addi %18, %0 : i32
      %c60_i32 = arith.constant 60 : i32
      %20 = arith.addi %c60_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_10 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %21 = arith.muli %arg5, %c4_i32_12 : i32
        %22 = arith.addi %21, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %23 = arith.addi %c80_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_13 : i32
        "simt_step.condition"(%25, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c100_i32 = arith.constant 100 : i32
        %21 = arith.addi %c100_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_12 : i32
        %24 = "simt_step.if"(%23) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        %25 = arith.addi %arg4, %24 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %26 = arith.addi %arg5, %c1_i32_13 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      %19 = arith.addi %arg2, %18#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_7 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %16 = arith.addi %c64_i32, %0 : i32
    %true_8 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

