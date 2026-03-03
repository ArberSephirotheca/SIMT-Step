module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.addi %arg0, %c3_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %6 = "simt_step.if"(%5) ({
        "simt_step.yield"(%arg0) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_9 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c2_i32 = arith.constant 2 : i32
          %15 = arith.addi %arg0, %c2_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %16 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.yield"(%15, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32_1 = arith.constant 3 : i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c3_i32_2 = arith.constant 3 : i32
      %8 = arith.addi %arg0, %c3_i32_2 : i32
      %9 = "simt_step.switch"(%arg3, %8) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %15 = "simt_step.if"(%14) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_11 : i32
          %21 = arith.cmpi slt, %arg7, %20 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32 = arith.constant 2 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %19 = arith.addi %arg7, %c1_i32_10 : i32
          "simt_step.yield"(%c2_i32, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32_9 = arith.constant 4 : i32
        %18 = arith.addi %arg0, %c4_i32_9 : i32
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_6 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32_7 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %15 = "simt_step.if"(%14) ({
          %c0_i32_8 = arith.constant 0 : i32
          %17 = arith.addi %arg0, %c0_i32_8 : i32
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_7 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32_7 : i32
        "simt_step.continue"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%12: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %13 = arith.addi %arg0, %c0_i32_5 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
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
    %c2_i32 = arith.constant 2 : i32
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %18 = arith.muli %arg3, %c4_i32_7 : i32
        %19 = arith.addi %18, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %20 = arith.addi %c12_i32, %19 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_8 : i32
        "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %18 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      "simt_step.yield"(%17#0) : (i32) -> ()
    }, {
      %c32_i32_4 = arith.constant 32 : i32
      %17 = arith.addi %c32_i32_4, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_5 : i32
      %20 = "simt_step.if"(%19) ({
        %c36_i32 = arith.constant 36 : i32
        %21 = arith.addi %c36_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %23 = "simt_step.switch"(%22, %0) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %22 = arith.muli %arg3, %c4_i32_9 : i32
          %23 = arith.addi %22, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %24 = arith.addi %c40_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_10 : i32
          "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %22 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%21#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %11 = arith.addi %c60_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32_1 = arith.constant 2 : i32
    %13 = arith.addi %0, %c2_i32_1 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %19 = arith.addi %c64_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
      %22 = "simt_step.if"(%21) ({
        %c68_i32 = arith.constant 68 : i32
        %23 = arith.addi %c68_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_5 = arith.constant 1 : i32
        %25 = "simt_step.switch"(%24, %c1_i32_5) ({
        ^bb0(%arg3: i32):
          %c3_i32_7 = arith.constant 3 : i32
          %26 = arith.addi %0, %c3_i32_7 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_9) {fallthrough = true} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c72_i32 = arith.constant 72 : i32
        %23 = arith.addi %c72_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = "simt_step.switch"(%24, %0) ({
        ^bb0(%arg3: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %26 = arith.addi %0, %c4_i32_6 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        "simt_step.yield"(%25) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

