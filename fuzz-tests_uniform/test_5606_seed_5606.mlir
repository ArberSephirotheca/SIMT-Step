module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32 : i32
          %11 = arith.cmpi slt, %arg5, %10 : i32
          "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %9 = simt_step.subgroup_id
          %10 = arith.index_cast %9 : index to i32
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%10, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%8#0) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %9 = "simt_step.if"(%8) ({
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %10 = simt_step.lane_id
          %11 = arith.index_cast %10 : index to i32
          "simt_step.yield"(%11) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%9) : (i32) -> ()
      }) : (i1) -> i32
      %6 = simt_step.lane_id
      %7 = arith.index_cast %6 : index to i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %4 = simt_step.lane_id
      %5 = arith.index_cast %4 : index to i32
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_3 : i32
      %19 = "simt_step.if"(%18) ({
        %c16_i32_5 = arith.constant 16 : i32
        %27 = arith.addi %c16_i32_5, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_6 : i32
        %30 = "simt_step.if"(%29) ({
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }, {
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %27 = arith.addi %c20_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = "simt_step.switch"(%28, %0) ({
        ^bb0(%arg3: i32):
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) {fallthrough = true} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %21 = arith.addi %c24_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      %24 = "simt_step.if"(%23) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %28 = arith.muli %arg4, %c4_i32_8 : i32
          %29 = arith.addi %28, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %30 = arith.addi %c28_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_9 : i32
          "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %28 = arith.addi %arg3, %arg4 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %29 = arith.addi %arg4, %c1_i32_8 : i32
          "simt_step.break"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        "simt_step.yield"(%27#0) : (i32) -> ()
      }, {
        %c48_i32 = arith.constant 48 : i32
        %27 = arith.addi %c48_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_5 = arith.constant 4 : i32
        %29 = arith.addi %0, %c4_i32_5 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %26 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %10 = arith.addi %c52_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %12 = arith.addi %0, %c2_i32 : i32
    %13 = "simt_step.switch"(%11, %12) ({
    ^bb0(%arg2: i32):
      %c3_i32 = arith.constant 3 : i32
      %16 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_9 : i32
        %22 = arith.addi %21, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %23 = arith.addi %c56_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_10 : i32
        "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %21 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %21 = arith.muli %arg4, %c4_i32_9 : i32
        %22 = arith.addi %21, %0 : i32
        %c76_i32 = arith.constant 76 : i32
        %23 = arith.addi %c76_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_10 : i32
        "simt_step.condition"(%25, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %21 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %22 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%21, %22) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

