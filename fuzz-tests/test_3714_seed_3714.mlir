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
      %c4_i32 = arith.constant 4 : i32
      %2 = arith.remsi %arg3, %c4_i32 : i32
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_6 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_5 = arith.constant 1 : i32
          %16 = arith.addi %arg6, %c1_i32_5 : i32
          "simt_step.yield"(%arg0, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c4_i32_2 = arith.constant 4 : i32
        %11 = "simt_step.switch"(%arg3, %c4_i32_2) ({
        ^bb0(%arg5: i32):
          %c1_i32_5 = arith.constant 1 : i32
          %16 = arith.addi %arg0, %c1_i32_5 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_3 = arith.constant 1 : i32
        %12 = arith.addi %arg0, %c1_i32_3 : i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb3(%13: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %15 = "simt_step.if"(%14) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) : (i32) -> ()
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
      %13 = arith.addi %c8_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_3 : i32
      "simt_step.if"(%15) ({
        %c4_i32_4 = arith.constant 4 : i32
        %16 = arith.remsi %0, %c4_i32_4 : i32
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.addi %0, %c2_i32 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg2: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %19 = arith.addi %arg2, %c4_i32_5 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c2_i32_6 = arith.constant 2 : i32
          %21 = arith.addi %20, %c2_i32_6 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %23 = arith.addi %22, %c3_i32 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          %25 = arith.addi %24, %c3_i32_7 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %13 = simt_step.lane_id
      %14 = arith.index_cast %13 : index to i32
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %c16_i32 = arith.constant 16 : i32
      %13 = arith.addi %c16_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %15 = "simt_step.switch"(%14, %c3_i32) ({
      ^bb0(%arg2: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.muli %arg4, %c4_i32_7 : i32
          %25 = arith.addi %24, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %26 = arith.addi %c20_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
          "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %24 = arith.addi %arg3, %arg4 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %25 = arith.addi %arg4, %c1_i32_7 : i32
          %true_8 = arith.constant true
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %18 = arith.addi %c40_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %0, %c1_i32 : i32
        %21 = "simt_step.switch"(%19, %20) ({
        ^bb0(%arg3: i32):
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) {fallthrough = true} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %24 = arith.muli %arg4, %c4_i32_7 : i32
          %25 = arith.addi %24, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %26 = arith.addi %c44_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
          "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %24 = arith.addi %arg3, %arg4 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %25 = arith.addi %arg4, %c1_i32_7 : i32
          %true_8 = arith.constant true
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%15) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %10 = arith.addi %c32_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %12 = arith.addi %0, %c0_i32_2 : i32
    return
  }
}

