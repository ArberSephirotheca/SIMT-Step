module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32_2 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32_3 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32_6 : i32
        %9 = arith.cmpi slt, %arg7, %8 : i32
        "simt_step.condition"(%9, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %8 = arith.muli %arg7, %c4_i32_6 : i32
        %9 = arith.addi %c0_i32_5, %8 : i32
        %10 = arith.addi %9, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_7 = arith.constant 1 : i32
        %11 = arith.addi %arg7, %c1_i32_7 : i32
        "simt_step.break"(%7, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32_4 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32_4 : i32
      "simt_step.yield"(%5#0, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.remsi %arg3, %c4_i32 : i32
    %c1_i32 = arith.constant 1 : i32
    %2 = "simt_step.switch"(%1, %c1_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32_10 : i32
        %15 = arith.cmpi slt, %arg6, %14 : i32
        "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %13 = arith.remsi %arg3, %c3_i32 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %14 = arith.addi %arg0, %c0_i32_9 : i32
        %15 = "simt_step.switch"(%13, %14) ({
        ^bb0(%arg7: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %17 = arith.addi %arg0, %c1_i32_11 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %19 = arith.addi %arg0, %c4_i32_12 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb2(%20: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          %21 = arith.addi %arg0, %c3_i32_13 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32_10 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32_10 : i32
        "simt_step.yield"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32_10 : i32
        %15 = arith.cmpi slt, %arg6, %14 : i32
        "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_9 : i32
        %c2_i32 = arith.constant 2 : i32
        %14 = "simt_step.switch"(%13, %c2_i32) ({
        ^bb0(%arg7: i32):
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%17: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          %18 = arith.addi %arg0, %c2_i32_12 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb3(%19: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c1_i32_10 = arith.constant 1 : i32
        %15 = arith.addi %arg6, %c1_i32_10 : i32
        "simt_step.yield"(%14, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_9 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32_10 : i32
        %15 = arith.cmpi slt, %arg6, %14 : i32
        "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_13 : i32
          %17 = arith.cmpi slt, %arg8, %16 : i32
          "simt_step.condition"(%17, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c2_i32 = arith.constant 2 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %15 = arith.addi %arg8, %c1_i32_12 : i32
          "simt_step.yield"(%c2_i32, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_11 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32_11 : i32
        "simt_step.yield"(%13#0, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%10: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
      %12 = "simt_step.if"(%11) ({
        %c2_i32 = arith.constant 2 : i32
        %13 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %14 = arith.addi %arg0, %c1_i32_9 : i32
        %15 = "simt_step.switch"(%13, %14) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %17 = arith.addi %arg0, %c4_i32_10 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %14 = "simt_step.if"(%13) ({
          %c1_i32_10 = arith.constant 1 : i32
          %15 = arith.addi %arg0, %c1_i32_10 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %4 = arith.select %3, %0#0, %2 : i32
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
      %c12_i32 = arith.constant 12 : i32
      %14 = arith.addi %c12_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
      %17 = "simt_step.if"(%16) ({
        %c2_i32_3 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_3) : (i32) -> ()
      }, {
        %c16_i32 = arith.constant 16 : i32
        %29 = arith.addi %c16_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = "simt_step.switch"(%30, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c0_i32_3 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_3) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%31) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %20 = arith.addi %c20_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_2 : i32
      %23 = "simt_step.if"(%22) ({
        %c2_i32_3 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_3) : (i32) -> ()
      }, {
        %c24_i32 = arith.constant 24 : i32
        %29 = arith.addi %c24_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_3 : i32
        %32 = "simt_step.if"(%31) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_4 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_4) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %25 = arith.addi %c28_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %27 = arith.addi %0, %c3_i32 : i32
      %28 = "simt_step.switch"(%26, %27) ({
      ^bb0(%arg3: i32):
        %c32_i32 = arith.constant 32 : i32
        %29 = arith.addi %c32_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_3 : i32
        %32 = "simt_step.if"(%31) ({
          %c4_i32_7 = arith.constant 4 : i32
          %42 = arith.addi %0, %c4_i32_7 : i32
          "simt_step.yield"(%42) : (i32) -> ()
        }, {
          %c3_i32_7 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_7) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c2_i32_4 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_4) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %35 = arith.addi %c36_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %42 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %44 = arith.addi %0, %c2_i32_8 : i32
          "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          %46 = arith.addi %0, %c2_i32_9 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          %48 = arith.addi %0, %c0_i32_10 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %39 = arith.addi %c40_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_5 = arith.constant 2 : i32
        %41 = "simt_step.switch"(%40, %c2_i32_5) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %c44_i32 = arith.constant 44 : i32
    %10 = arith.addi %c44_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %12 = arith.addi %0, %c2_i32 : i32
    %13 = "simt_step.switch"(%11, %12) ({
    ^bb0(%arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %15 = arith.addi %0, %c0_i32_1 : i32
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %17 = arith.addi %c48_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_2 = arith.constant 2 : i32
      %19 = "simt_step.switch"(%18, %c2_i32_2) ({
      ^bb0(%arg3: i32):
        %c52_i32 = arith.constant 52 : i32
        %24 = arith.addi %c52_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
        %27 = "simt_step.if"(%26) ({
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) : (i32) -> ()
        }, {
          %c0_i32_8 = arith.constant 0 : i32
          %43 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %29 = arith.addi %c56_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_5 : i32
        %32 = "simt_step.if"(%31) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %34 = arith.addi %c60_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_6 : i32
        %37 = "simt_step.if"(%36) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %39 = arith.addi %c64_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_7 : i32
        %42 = "simt_step.if"(%41) ({
          %c3_i32 = arith.constant 3 : i32
          %43 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb3(%20: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %21 = arith.addi %c68_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_3 = arith.constant 2 : i32
      %23 = "simt_step.switch"(%22, %c2_i32_3) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_7 : i32
          %32 = arith.addi %31, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %33 = arith.addi %c72_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
          "simt_step.condition"(%35, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %31 = arith.addi %arg4, %arg5 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %32 = arith.addi %arg5, %c1_i32_7 : i32
          %true_8 = arith.constant true
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %27 = arith.addi %c92_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %29 = arith.addi %0, %c0_i32_6 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg4: i32):
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    return
  }
}

