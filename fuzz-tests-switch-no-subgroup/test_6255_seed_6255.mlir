module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %6 = arith.remsi %arg3, %c3_i32 : i32
      %7 = "simt_step.switch"(%6, %arg0) ({
      ^bb0(%arg5: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_3 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          %32 = arith.addi %arg0, %c4_i32_8 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          %34 = arith.addi %arg0, %c4_i32_9 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %22 = "simt_step.if"(%21) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c4_i32_5 = arith.constant 4 : i32
        %24 = arith.remsi %arg3, %c4_i32_5 : i32
        %c3_i32_6 = arith.constant 3 : i32
        %25 = "simt_step.switch"(%24, %c3_i32_6) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %31 = arith.addi %arg0, %c2_i32_8 : i32
          "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_9) {fallthrough = true} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %26 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %29 = "simt_step.if"(%28) ({
          %c4_i32_8 = arith.constant 4 : i32
          %30 = arith.addi %arg0, %c4_i32_8 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %c4_i32_8 = arith.constant 4 : i32
          %30 = arith.addi %arg0, %c4_i32_8 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %10 = "simt_step.if"(%9) ({
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32 : i32
        %18 = "simt_step.switch"(%17, %arg0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32_3 = arith.constant 3 : i32
        %19 = arith.addi %arg0, %c3_i32_3 : i32
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %18 = "simt_step.if"(%17) ({
          %c0_i32_4 = arith.constant 0 : i32
          %19 = arith.addi %arg0, %c0_i32_4 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
    ^bb2(%11: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_3 = arith.constant 0 : i32
        %17 = arith.addi %arg0, %c0_i32_3 : i32
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %c4_i32_3 = arith.constant 4 : i32
        %17 = arith.remsi %arg3, %c4_i32_3 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg5: i32):
          %c1_i32_4 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %21 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          %23 = arith.addi %arg0, %c4_i32_5 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          %25 = arith.addi %arg0, %c0_i32_6 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb3(%14: i32):  // no predecessors
      %c3_i32_2 = arith.constant 3 : i32
      %15 = arith.remsi %arg3, %c3_i32_2 : i32
      %16 = "simt_step.switch"(%15, %arg0) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %19 = "simt_step.if"(%18) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %26 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %22 = "simt_step.if"(%21) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb3(%23: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %25 = "simt_step.if"(%24) ({
          %c4_i32_6 = arith.constant 4 : i32
          %26 = arith.addi %arg0, %c4_i32_6 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }, {
          %c4_i32_6 = arith.constant 4 : i32
          %26 = arith.addi %arg0, %c4_i32_6 : i32
          "simt_step.yield"(%26) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_4 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_5 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %12 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_4 : i32
      %15 = arith.addi %c16_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_5 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_4 : i32
      %13 = arith.addi %12, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %14 = arith.addi %c28_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_5 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_8 : i32
        %20 = arith.addi %19, %0 : i32
        %c48_i32_9 = arith.constant 48 : i32
        %21 = arith.addi %c48_i32_9, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_10 : i32
        "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %19 = arith.addi %arg4, %arg5 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %20 = arith.addi %arg5, %c1_i32_8 : i32
        %true_9 = arith.constant true
        %c32_i32 = arith.constant 32 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %21 = arith.muli %arg5, %c4_i32_10 : i32
        %22 = arith.addi %c32_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_11 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %13 = arith.addi %arg2, %12#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c48_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c68_i32 = arith.constant 68 : i32
    %7 = arith.addi %c68_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = simt_step.subgroup_id
    %10 = arith.index_cast %9 : index to i32
    %11 = "simt_step.switch"(%8, %10) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_4) {fallthrough = true} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %14 = arith.muli %arg4, %c4_i32_7 : i32
        %15 = arith.addi %14, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %16 = arith.addi %c72_i32, %15 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_8 : i32
        "simt_step.condition"(%18, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c92_i32 = arith.constant 92 : i32
        %14 = arith.addi %c92_i32, %0 : i32
        %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %15, %c0_i32_7 : i32
        %17 = "simt_step.if"(%16) ({
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %20 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        %18 = arith.addi %arg3, %17 : i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.break"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

