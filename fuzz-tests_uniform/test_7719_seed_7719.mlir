module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %3 = "simt_step.if"(%2) ({
      %c3_i32_4 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32_4) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %7 = arith.select %6, %1, %3 : i32
    %c4_i32 = arith.constant 4 : i32
    %8 = arith.remsi %arg3, %c4_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %9 = arith.addi %arg0, %c3_i32 : i32
    %10 = "simt_step.switch"(%8, %9) ({
    ^bb0(%arg4: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %16 = "simt_step.if"(%15) ({
        %c0_i32_12 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %29 = "simt_step.if"(%28) ({
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          %30 = arith.addi %arg0, %c4_i32_13 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c0_i32_12 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %29 = "simt_step.if"(%28) ({
          %c0_i32_13 = arith.constant 0 : i32
          %31 = arith.addi %arg0, %c0_i32_13 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c0_i32_13 = arith.constant 0 : i32
          %31 = arith.addi %arg0, %c0_i32_13 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32 = arith.constant 2 : i32
        %30 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %17 = arith.addi %arg0, %c0_i32_5 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c3_i32_6 = arith.constant 3 : i32
      %19 = arith.remsi %arg3, %c3_i32_6 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %20 = "simt_step.switch"(%19, %c0_i32_7) ({
      ^bb0(%arg5: i32):
        %c3_i32_12 = arith.constant 3 : i32
        %28 = arith.addi %arg0, %c3_i32_12 : i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %arg2, %c0_i32_13 : i32
        %32 = "simt_step.if"(%31) ({
          %c2_i32_14 = arith.constant 2 : i32
          %34 = arith.addi %arg0, %c2_i32_14 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c2_i32 = arith.constant 2 : i32
        %33 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %21 = arith.addi %arg0, %c0_i32_8 : i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c4_i32_9 = arith.constant 4 : i32
      %23 = arith.addi %arg0, %c4_i32_9 : i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
      %26 = "simt_step.if"(%25) ({
        %c4_i32_12 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_12) : (i32) -> ()
      }, {
        %c0_i32_12 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %29 = "simt_step.if"(%28) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_13 = arith.constant 3 : i32
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %27 = arith.addi %arg0, %c0_i32_11 : i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %12 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %14 = arith.select %13, %7, %10 : i32
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
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
      %15 = "simt_step.if"(%14) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %26 = arith.muli %arg4, %c4_i32_10 : i32
          %27 = arith.addi %26, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %28 = arith.addi %c16_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_11 : i32
          "simt_step.condition"(%30, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %26 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%25#0) : (i32) -> ()
      }, {
        %c4_i32_7 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_7) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %17 = arith.addi %0, %c0_i32_2 : i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_7 : i32
        %26 = arith.addi %25, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %27 = arith.addi %c36_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c56_i32 = arith.constant 56 : i32
        %25 = arith.addi %c56_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %27 = arith.addi %0, %c3_i32 : i32
        %28 = "simt_step.switch"(%26, %27) ({
        ^bb0(%arg5: i32):
          %c3_i32_8 = arith.constant 3 : i32
          %31 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c3_i32_9 = arith.constant 3 : i32
          %33 = arith.addi %0, %c3_i32_9 : i32
          "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %29 = arith.addi %arg3, %28 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%20: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %21 = arith.addi %c60_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_6 : i32
      %24 = "simt_step.if"(%23) ({
        %c64_i32 = arith.constant 64 : i32
        %25 = arith.addi %c64_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_7 : i32
        %28 = "simt_step.if"(%27) ({
          %c0_i32_8 = arith.constant 0 : i32
          %29 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %10 = arith.addi %c32_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

