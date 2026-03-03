module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c3_i32_0 = arith.constant 3 : i32
      %4 = arith.remsi %arg3, %c3_i32_0 : i32
      %5 = "simt_step.switch"(%4, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_11 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_11 = arith.constant 2 : i32
          %22 = arith.addi %arg0, %c2_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.continue"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c3_i32_8 = arith.constant 3 : i32
        %17 = arith.remsi %arg3, %c3_i32_8 : i32
        %c3_i32_9 = arith.constant 3 : i32
        %18 = "simt_step.switch"(%17, %c3_i32_9) ({
        ^bb0(%arg6: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %22 = arith.addi %arg0, %c1_i32_11 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb3(%25: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          %26 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c3_i32_10 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_10) {fallthrough = true} : (i32) -> ()
      ^bb3(%20: i32):  // no predecessors
        %21 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg6: i32):
          %c0_i32_11 = arith.constant 0 : i32
          %22 = arith.addi %arg0, %c0_i32_11 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %c3_i32_1 = arith.constant 3 : i32
      %6 = arith.addi %arg0, %c3_i32_1 : i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %14, %c1_i32 : i32
        %16 = arith.cmpi slt, %arg6, %15 : i32
        "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_8 : i32
          %18 = arith.cmpi slt, %arg8, %17 : i32
          "simt_step.condition"(%18, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c3_i32_8 = arith.constant 3 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %16 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.yield"(%c3_i32_8, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%14#0, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c0_i32_4 = arith.constant 0 : i32
      %9 = arith.addi %arg0, %c0_i32_4 : i32
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %12 = arith.remsi %arg3, %c2_i32 : i32
      %13 = "simt_step.switch"(%12, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_11 : i32
          %21 = arith.cmpi slt, %arg7, %20 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %19 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.continue"(%arg0, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_8 = arith.constant 3 : i32
        %15 = arith.addi %arg0, %c3_i32_8 : i32
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_11 : i32
          %21 = arith.cmpi slt, %arg7, %20 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_11 = arith.constant 3 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %19 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%c3_i32_11, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %arg0 : i32
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
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_3 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = "simt_step.switch"(%9, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %13 = arith.addi %0, %c0_i32_6 : i32
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c32_i32_7 = arith.constant 32 : i32
      %15 = arith.addi %c32_i32_7, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %17 = "simt_step.switch"(%16, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %25 = arith.addi %c36_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_14 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32_16 = arith.constant 3 : i32
          %34 = arith.addi %0, %c3_i32_16 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %30 = arith.addi %c40_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_15 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_14 : i32
        %26 = arith.addi %25, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %27 = arith.addi %c44_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_15 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c64_i32 = arith.constant 64 : i32
        %25 = arith.addi %c64_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_14 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32_15 = arith.constant 1 : i32
          %31 = arith.addi %0, %c1_i32_15 : i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %29 = arith.addi %arg3, %28 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      "simt_step.yield"(%19#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%20: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %21 = arith.addi %c68_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32_12 = arith.constant 3 : i32
      %23 = arith.addi %0, %c3_i32_12 : i32
      %24 = "simt_step.switch"(%22, %23) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %25 = arith.addi %c72_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_14 : i32
        %28 = "simt_step.if"(%27) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %30 = arith.addi %c76_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_15 : i32
        %33 = "simt_step.if"(%32) ({
          %c2_i32 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %35 = arith.addi %c80_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %37 = "simt_step.switch"(%36, %c1_i32) ({
        ^bb0(%arg4: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_18 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          %41 = arith.addi %0, %c1_i32_19 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c0_i32_20 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        %c3_i32_17 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_13 = arith.constant true
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_5 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

