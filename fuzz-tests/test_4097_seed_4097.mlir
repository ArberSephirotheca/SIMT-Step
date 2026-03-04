module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c1_i32 = arith.constant 1 : i32
    %2 = "simt_step.switch"(%arg3, %c1_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %6 = "simt_step.if"(%5) ({
        %c3_i32 = arith.constant 3 : i32
        %9 = arith.remsi %arg3, %c3_i32 : i32
        %c3_i32_4 = arith.constant 3 : i32
        %10 = arith.addi %arg0, %c3_i32_4 : i32
        %11 = "simt_step.switch"(%9, %10) ({
        ^bb0(%arg5: i32):
          %c1_i32_5 = arith.constant 1 : i32
          %12 = arith.addi %arg0, %c1_i32_5 : i32
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%14: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          %15 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
        ^bb3(%16: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%11) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %10 = "simt_step.if"(%9) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_4 = arith.constant 1 : i32
        %10 = arith.addi %9, %c1_i32_4 : i32
        %11 = arith.cmpi slt, %arg6, %10 : i32
        "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32_7 : i32
          %13 = arith.cmpi slt, %arg8, %12 : i32
          "simt_step.condition"(%13, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c1_i32_7 = arith.constant 1 : i32
          %11 = arith.addi %arg0, %c1_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %12 = arith.addi %arg8, %c1_i32_8 : i32
          "simt_step.yield"(%11, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_6 = arith.constant 1 : i32
        %10 = arith.addi %arg6, %c1_i32_6 : i32
        "simt_step.break"(%9#0, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %4 = arith.select %3, %0, %2 : i32
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
    %c0_i32_2 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_3 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_4 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_3 : i32
      %14 = arith.addi %c16_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_4 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_8 : i32
        %24 = arith.addi %23, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %25 = arith.addi %c32_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %23 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_8 : i32
        %24 = arith.addi %23, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %25 = arith.addi %c52_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %23 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        %true = arith.constant true
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %15 = arith.addi %c72_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = "simt_step.switch"(%16, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_14 : i32
          %33 = arith.addi %32, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %34 = arith.addi %c76_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_15 : i32
          "simt_step.condition"(%36, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %32 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg5, %c1_i32 : i32
          %true = arith.constant true
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_14 : i32
          %33 = arith.addi %32, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %34 = arith.addi %c96_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_15 : i32
          "simt_step.condition"(%36, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %32 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg5, %c1_i32 : i32
          %true = arith.constant true
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %27 = arith.addi %c116_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = "simt_step.switch"(%28, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb3(%30: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %32 = arith.muli %arg5, %c4_i32_14 : i32
          %33 = arith.addi %32, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %34 = arith.addi %c120_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_15 : i32
          "simt_step.condition"(%36, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %32 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg5, %c1_i32 : i32
          %true = arith.constant true
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb3(%18: i32):  // no predecessors
      %c140_i32 = arith.constant 140 : i32
      %19 = arith.addi %c140_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
      %22 = "simt_step.if"(%21) ({
        %c3_i32 = arith.constant 3 : i32
        %23 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c4_i32_8 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_8) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

