module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32 : i32
      %c2_i32 = arith.constant 2 : i32
      %5 = "simt_step.switch"(%4, %c2_i32) ({
      ^bb0(%arg4: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %8 = arith.addi %arg0, %c0_i32_1 : i32
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32) {fallthrough = true} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %11 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %12 = "simt_step.if"(%11) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32_3 = arith.constant 3 : i32
        %13 = arith.addi %arg0, %c3_i32_3 : i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb3(%14: i32):  // no predecessors
        %c2_i32_4 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_4 : i32
        %16 = "simt_step.switch"(%15, %arg0) ({
        ^bb0(%arg5: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %19 = arith.addi %arg0, %c0_i32_7 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32_5 = arith.constant 4 : i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %6 = simt_step.lane_id
      %7 = arith.index_cast %6 : index to i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %7 = "simt_step.switch"(%6, %c0_i32_2) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%8: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%9: i32):  // no predecessors
          %c0_i32_4 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb3(%10: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_3 = arith.constant 3 : i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %6 = simt_step.subgroup_id
        %7 = arith.index_cast %6 : index to i32
        %8 = "simt_step.switch"(%arg3, %7) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%9: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32 = arith.constant 3 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %5 = arith.addi %0, %c4_i32_0 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %13 = arith.addi %c12_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %15 = "simt_step.switch"(%14, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_11 : i32
          %32 = arith.addi %31, %0 : i32
          %c16_i32_12 = arith.constant 16 : i32
          %33 = arith.addi %c16_i32_12, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
          "simt_step.condition"(%35, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %31 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %32 = arith.addi %arg5, %c1_i32_11 : i32
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%24#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %27 = arith.addi %c36_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_10 : i32
        %30 = "simt_step.if"(%29) ({
          %c2_i32_11 = arith.constant 2 : i32
          %31 = arith.addi %0, %c2_i32_11 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c2_i32_11 = arith.constant 2 : i32
          %31 = arith.addi %0, %c2_i32_11 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %18 = arith.addi %c40_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
      %21 = "simt_step.if"(%20) ({
        %c44_i32 = arith.constant 44 : i32
        %24 = arith.addi %c44_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = "simt_step.switch"(%25, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          %28 = arith.addi %0, %c1_i32_8 : i32
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%26) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %25 = arith.muli %arg4, %c4_i32_10 : i32
          %26 = arith.addi %25, %0 : i32
          %c48_i32 = arith.constant 48 : i32
          %27 = arith.addi %c48_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_11 : i32
          "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %25 = arith.addi %arg3, %arg4 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %26 = arith.addi %arg4, %c1_i32_10 : i32
          "simt_step.continue"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_7 : i32
        %25 = arith.addi %24, %0 : i32
        %c68_i32 = arith.constant 68 : i32
        %26 = arith.addi %c68_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %24 = arith.addi %arg3, %arg4 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32_7 : i32
        "simt_step.break"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %11 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

