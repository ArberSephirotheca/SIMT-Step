module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.addi %arg0, %c2_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %5 = arith.remsi %arg3, %c3_i32 : i32
      %6 = "simt_step.switch"(%5, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %14 = "simt_step.if"(%13) ({
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %17 = "simt_step.if"(%16) ({
          %c2_i32_8 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_8) : (i32) -> ()
        }, {
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %20 = "simt_step.if"(%19) ({
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%24) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb3(%21: i32):  // no predecessors
        %c3_i32_7 = arith.constant 3 : i32
        %22 = arith.remsi %arg3, %c3_i32_7 : i32
        %23 = "simt_step.switch"(%22, %arg0) ({
        ^bb0(%arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) {fallthrough = true} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32 : i32
        %15 = arith.cmpi slt, %arg6, %14 : i32
        "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %14 = "simt_step.if"(%13) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c3_i32_5 = arith.constant 3 : i32
          %16 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%14, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb3(%10: i32):  // no predecessors
      %c3_i32_2 = arith.constant 3 : i32
      %11 = arith.remsi %arg3, %c3_i32_2 : i32
      %c3_i32_3 = arith.constant 3 : i32
      %12 = "simt_step.switch"(%11, %c3_i32_3) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %14 = "simt_step.if"(%13) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c3_i32_5 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_5) {fallthrough = true} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %18 = "simt_step.if"(%17) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %11 = simt_step.lane_id
      %12 = arith.index_cast %11 : index to i32
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = "simt_step.switch"(%12, %0) ({
      ^bb0(%arg2: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_4 = arith.constant 4 : i32
          %20 = arith.muli %arg4, %c4_i32_4 : i32
          %21 = arith.addi %20, %0 : i32
          %c16_i32_5 = arith.constant 16 : i32
          %22 = arith.addi %c16_i32_5, %21 : i32
          %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
          "simt_step.condition"(%24, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %20 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %arg4, %c1_i32 : i32
          %true_4 = arith.constant true
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %16 = arith.addi %c36_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_3 : i32
        %19 = "simt_step.if"(%18) ({
          %c3_i32 = arith.constant 3 : i32
          %20 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %c4_i32_4 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_4) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

