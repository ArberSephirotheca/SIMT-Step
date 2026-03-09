module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c1_i32 = arith.constant 1 : i32
      %2 = "simt_step.switch"(%arg3, %c1_i32) ({
      ^bb0(%arg4: i32):
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.addi %arg0, %c4_i32 : i32
        "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
      ^bb1(%6: i32):  // no predecessors
        %c4_i32_1 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32_1 : i32
        %c4_i32_2 = arith.constant 4 : i32
        %8 = "simt_step.switch"(%7, %c4_i32_2) ({
        ^bb0(%arg5: i32):
          %c4_i32_3 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_3) {fallthrough = false} : (i32) -> ()
        ^bb1(%9: i32):  // no predecessors
          %c4_i32_4 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb2(%10: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          %11 = arith.addi %arg0, %c4_i32_5 : i32
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        ^bb3(%12: i32):  // no predecessors
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %4 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%2) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32 : i32
          %7 = arith.cmpi slt, %arg5, %6 : i32
          "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c16_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %4 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32 = arith.constant 3 : i32
        %5 = "simt_step.switch"(%4, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c3_i32_1 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_1) {fallthrough = false} : (i32) -> ()
        ^bb1(%6: i32):  // no predecessors
          %c3_i32_2 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_2) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }) : (i1) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %11 = arith.addi %c8_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
      "simt_step.if"(%13) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_4 : i32
        %23 = arith.addi %22, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %24 = arith.addi %c16_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg6, %c4_i32_8 : i32
          %26 = arith.addi %25, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %27 = arith.addi %c36_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %25 = arith.addi %arg5, %arg6 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %26 = arith.addi %arg6, %c1_i32_8 : i32
          %true_9 = arith.constant true
          "simt_step.break"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %23 = arith.addi %arg3, %22#0 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32_6 : i32
        %true_7 = arith.constant true
        "simt_step.continue"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %13 = arith.addi %c56_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %15 = "simt_step.switch"(%14, %c1_i32) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %17 = arith.addi %c60_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %19 = arith.addi %0, %c0_i32_3 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %c64_i32 = arith.constant 64 : i32
        %22 = arith.addi %c64_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_4 : i32
        %25 = "simt_step.if"(%24) ({
          %c4_i32_7 = arith.constant 4 : i32
          %29 = arith.addi %0, %c4_i32_7 : i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_7 : i32
          %30 = arith.addi %29, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %31 = arith.addi %c68_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_8 : i32
          "simt_step.condition"(%33, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %29 = arith.addi %arg4, %arg5 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %30 = arith.addi %arg5, %c1_i32_7 : i32
          %true_8 = arith.constant true
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

