module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %2 = arith.remsi %arg3, %c2_i32 : i32
      %c4_i32 = arith.constant 4 : i32
      %3 = "simt_step.switch"(%2, %c4_i32) ({
      ^bb0(%arg4: i32):
        %c4_i32_0 = arith.constant 4 : i32
        %4 = arith.remsi %arg3, %c4_i32_0 : i32
        %c4_i32_1 = arith.constant 4 : i32
        %5 = arith.addi %arg0, %c4_i32_1 : i32
        %6 = "simt_step.switch"(%4, %5) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %c0_i32_4 = arith.constant 0 : i32
          %13 = arith.addi %arg0, %c0_i32_4 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb2(%14: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb3(%16: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %9 = "simt_step.if"(%8) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %11 = arith.addi %arg0, %c0_i32_3 : i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }) : (i1) -> i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %7 = "simt_step.switch"(%6, %c4_i32_0) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.addi %0, %c0_i32_2 : i32
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %16 = arith.addi %0, %c0_i32_3 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %c12_i32 = arith.constant 12 : i32
    %8 = arith.addi %c12_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_1 : i32
    %11 = "simt_step.if"(%10) ({
      %c16_i32 = arith.constant 16 : i32
      %14 = arith.addi %c16_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %0, %c1_i32 : i32
      %17 = "simt_step.switch"(%15, %16) ({
      ^bb0(%arg2: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_10 : i32
          %33 = arith.addi %32, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %34 = arith.addi %c20_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_11 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %22 = arith.addi %c40_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %24 = "simt_step.switch"(%23, %c2_i32) ({
        ^bb0(%arg3: i32):
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %26 = arith.addi %c44_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %28 = arith.addi %0, %c3_i32 : i32
        %29 = "simt_step.switch"(%27, %28) ({
        ^bb0(%arg3: i32):
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c0_i32_11 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb3(%30: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_10 : i32
          %33 = arith.addi %32, %0 : i32
          %c48_i32_11 = arith.constant 48 : i32
          %34 = arith.addi %c48_i32_11, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_12 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32_10 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c16_i32_3 = arith.constant 16 : i32
      %18 = arith.addi %c16_i32_3, %0 : i32
      %true_4 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) : (i32) -> ()
    }, {
      %c68_i32 = arith.constant 68 : i32
      %14 = arith.addi %c68_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_2 : i32
      %17 = "simt_step.if"(%16) ({
        %c72_i32 = arith.constant 72 : i32
        %20 = arith.addi %c72_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = "simt_step.switch"(%21, %0) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }, {
        %c76_i32 = arith.constant 76 : i32
        %20 = arith.addi %c76_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = simt_step.lane_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %18 = arith.addi %c32_i32, %0 : i32
      %true_3 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %12 = arith.addi %c48_i32, %0 : i32
    %true = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

