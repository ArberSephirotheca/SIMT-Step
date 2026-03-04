module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %12 = arith.addi %c0_i32_3, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) : (i32) -> ()
    }, {
      %true = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %12 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %true = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) : (i32) -> ()
    }, {
      %true = arith.constant true
      %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %12 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %1, %3 : i32
    %c2_i32 = arith.constant 2 : i32
    %6 = arith.remsi %arg3, %c2_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %7 = arith.addi %arg0, %c1_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %11 = arith.remsi %arg3, %c3_i32 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12 = "simt_step.switch"(%11, %c0_i32_3) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_13 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_13 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.continue"(%arg0, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c3_i32_9 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_9) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c1_i32_10 = arith.constant 1 : i32
        %22 = arith.addi %arg0, %c1_i32_10 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb3(%23: i32):  // no predecessors
        %c2_i32_11 = arith.constant 2 : i32
        %24 = arith.remsi %arg3, %c2_i32_11 : i32
        %c3_i32_12 = arith.constant 3 : i32
        %25 = arith.addi %arg0, %c3_i32_12 : i32
        %26 = "simt_step.switch"(%24, %25) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c3_i32_4 = arith.constant 3 : i32
      %14 = arith.remsi %arg3, %c3_i32_4 : i32
      %c2_i32_5 = arith.constant 2 : i32
      %15 = arith.addi %arg0, %c2_i32_5 : i32
      %16 = "simt_step.switch"(%14, %15) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_12 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %26 = arith.addi %arg0, %c4_i32 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %23 = "simt_step.if"(%22) ({
          %c0_i32_12 = arith.constant 0 : i32
          %26 = arith.addi %arg0, %c0_i32_12 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %c1_i32_12 = arith.constant 1 : i32
          %26 = arith.addi %arg0, %c1_i32_12 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %26 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %27 = arith.addi %26, %c1_i32_12 : i32
          %28 = arith.cmpi slt, %arg7, %27 : i32
          "simt_step.condition"(%28, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%c4_i32, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c2_i32_6 = arith.constant 2 : i32
      %18 = "simt_step.switch"(%arg3, %c2_i32_6) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c1_i32_9 = arith.constant 1 : i32
          %24 = arith.addi %arg0, %c1_i32_9 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %23 = "simt_step.if"(%22) ({
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %10 = arith.select %9, %5, %8 : i32
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
    %c3_i32 = arith.constant 3 : i32
    %7 = arith.addi %0, %c3_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c3_i32_1 = arith.constant 3 : i32
      %17 = arith.addi %0, %c3_i32_1 : i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb3(%19: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %20 = arith.addi %c12_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_2 : i32
      %23 = "simt_step.if"(%22) ({
        %c16_i32 = arith.constant 16 : i32
        %24 = arith.addi %c16_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_3 = arith.constant 2 : i32
        %26 = arith.addi %0, %c2_i32_3 : i32
        %27 = "simt_step.switch"(%25, %26) ({
        ^bb0(%arg3: i32):
          %c0_i32_5 = arith.constant 0 : i32
          %28 = arith.addi %0, %c0_i32_5 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          %30 = arith.addi %0, %c0_i32_6 : i32
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%32: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c20_i32 = arith.constant 20 : i32
    %9 = arith.addi %c20_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %11 = simt_step.lane_id
    %12 = arith.index_cast %11 : index to i32
    %13 = "simt_step.switch"(%10, %12) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %17 = arith.addi %c24_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_1 = arith.constant 4 : i32
      %19 = "simt_step.switch"(%18, %c4_i32_1) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %21 = arith.addi %c28_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_2 : i32
        %24 = "simt_step.if"(%23) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_3) {fallthrough = true} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %14 = arith.addi %c64_i32, %0 : i32
    %true_0 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

