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
      %c2_i32 = arith.constant 2 : i32
      %3 = "simt_step.switch"(%2, %c2_i32) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_0) {fallthrough = true} : (i32) -> ()
      ^bb1(%4: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %5:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32 : i32
          %16 = arith.cmpi slt, %arg6, %15 : i32
          "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%arg0, %14) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%5#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%6: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %7 = arith.remsi %arg3, %c3_i32 : i32
        %8 = "simt_step.switch"(%7, %arg0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          %15 = arith.addi %arg0, %c4_i32_6 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb2(%16: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%17: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          %18 = arith.addi %arg0, %c3_i32_7 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb3(%9: i32):  // no predecessors
        %c2_i32_3 = arith.constant 2 : i32
        %10 = arith.remsi %arg3, %c2_i32_3 : i32
        %c2_i32_4 = arith.constant 2 : i32
        %11 = arith.addi %arg0, %c2_i32_4 : i32
        %12 = "simt_step.switch"(%10, %11) ({
        ^bb0(%arg5: i32):
          %c3_i32_6 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_6) {fallthrough = true} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          %15 = arith.addi %arg0, %c2_i32_7 : i32
          "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
        ^bb2(%16: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32_5 = arith.constant 3 : i32
        %13 = arith.addi %arg0, %c3_i32_5 : i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
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
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_0 : i32
      %14 = "simt_step.if"(%13) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_4 = arith.constant 4 : i32
          %23 = arith.muli %arg4, %c4_i32_4 : i32
          %24 = arith.addi %23, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %25 = arith.addi %c16_i32, %24 : i32
          %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_5 = arith.constant 0 : i32
          %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
          "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %23 = arith.addi %arg3, %arg4 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %24 = arith.addi %arg4, %c1_i32_4 : i32
          %true = arith.constant true
          "simt_step.yield"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) : (i32) -> ()
      }, {
        %c4_i32_2 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_2) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %18 = arith.addi %c36_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_1 : i32
      %21 = "simt_step.if"(%20) ({
        %c40_i32 = arith.constant 40 : i32
        %22 = arith.addi %c40_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_2 : i32
        %25 = "simt_step.if"(%24) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32_3 = arith.constant 2 : i32
          %26 = arith.addi %0, %c2_i32_3 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c44_i32 = arith.constant 44 : i32
        %22 = arith.addi %c44_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_2 = arith.constant 2 : i32
        %24 = "simt_step.switch"(%23, %c2_i32_2) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

