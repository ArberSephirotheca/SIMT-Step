module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %5 = arith.remsi %arg3, %c4_i32_3 : i32
        %c1_i32 = arith.constant 1 : i32
        %6 = arith.addi %5, %c1_i32 : i32
        %7 = arith.cmpi slt, %arg5, %6 : i32
        "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %5 = arith.remsi %arg3, %c4_i32_3 : i32
        %6 = "simt_step.switch"(%5, %arg0) ({
        ^bb0(%arg6: i32):
          %c1_i32_4 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%11: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%12: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %7 = simt_step.subgroup_id
        %8 = arith.index_cast %7 : index to i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%6, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%4#0) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %4 = arith.remsi %arg3, %c2_i32 : i32
      %c3_i32 = arith.constant 3 : i32
      %5 = "simt_step.switch"(%4, %c3_i32) ({
      ^bb0(%arg4: i32):
        %c2_i32_2 = arith.constant 2 : i32
        %6 = arith.remsi %arg3, %c2_i32_2 : i32
        %7 = "simt_step.switch"(%6, %arg0) ({
        ^bb0(%arg5: i32):
          %c3_i32_9 = arith.constant 3 : i32
          %13 = arith.addi %arg0, %c3_i32_9 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          %16 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32_3 = arith.constant 3 : i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c3_i32_9 = arith.constant 3 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%c3_i32_9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%c4_i32, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_8 = arith.constant 3 : i32
        %12 = arith.addi %arg0, %c3_i32_8 : i32
        "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_9 : i32
        %25 = arith.addi %24, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %26 = arith.addi %c12_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_10 : i32
        "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_12 : i32
          %28 = arith.addi %27, %0 : i32
          %c32_i32_13 = arith.constant 32 : i32
          %29 = arith.addi %c32_i32_13, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_14 : i32
          "simt_step.condition"(%31, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %27 = arith.addi %arg4, %arg5 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %28 = arith.addi %arg5, %c1_i32_12 : i32
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %25 = arith.addi %arg2, %24#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%23#0) : (i32) -> ()
    }, {
      %c52_i32 = arith.constant 52 : i32
      %23 = arith.addi %c52_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %25 = "simt_step.switch"(%24, %c0_i32_6) ({
      ^bb0(%arg2: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_14 : i32
          %30 = arith.addi %29, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %31 = arith.addi %c56_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_15 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_14 : i32
          %30 = arith.addi %29, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %31 = arith.addi %c76_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_15 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%25) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c96_i32 = arith.constant 96 : i32
    %11 = arith.addi %c96_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c100_i32 = arith.constant 100 : i32
      %23 = arith.addi %c100_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
      %26 = "simt_step.if"(%25) ({
        %c104_i32 = arith.constant 104 : i32
        %27 = arith.addi %c104_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_7 : i32
        %30 = "simt_step.if"(%29) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) : (i32) -> ()
    }, {
      %c108_i32 = arith.constant 108 : i32
      %23 = arith.addi %c108_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_6 : i32
      %26 = "simt_step.if"(%25) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %28 = arith.muli %arg3, %c4_i32_10 : i32
          %29 = arith.addi %28, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %30 = arith.addi %c112_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_11 : i32
          "simt_step.condition"(%32, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %28 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.continue"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%27#0) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %28 = arith.muli %arg3, %c4_i32_10 : i32
          %29 = arith.addi %28, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %30 = arith.addi %c132_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_11 : i32
          "simt_step.condition"(%32, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %28 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %29 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%27#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c152_i32 = arith.constant 152 : i32
    %17 = arith.addi %c152_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_3 = arith.constant 4 : i32
    %19 = arith.addi %0, %c4_i32_3 : i32
    %20 = "simt_step.switch"(%18, %19) ({
    ^bb0(%arg2: i32):
      %c156_i32 = arith.constant 156 : i32
      %23 = arith.addi %c156_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = "simt_step.switch"(%24, %0) ({
      ^bb0(%arg3: i32):
        %c160_i32 = arith.constant 160 : i32
        %35 = arith.addi %c160_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_9 = arith.constant 4 : i32
        %37 = "simt_step.switch"(%36, %c4_i32_9) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %39 = arith.addi %c164_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %41 = arith.addi %0, %c0_i32_11 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) {fallthrough = true} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          %c3_i32_15 = arith.constant 3 : i32
          %51 = arith.addi %0, %c3_i32_15 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        %c168_i32 = arith.constant 168 : i32
        %44 = arith.addi %c168_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %46 = arith.cmpi ne, %45, %c0_i32_13 : i32
        %47 = "simt_step.if"(%46) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c172_i32 = arith.constant 172 : i32
      %27 = arith.addi %c172_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_7 : i32
      %30 = "simt_step.if"(%29) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_12 : i32
          %37 = arith.addi %36, %0 : i32
          %c176_i32 = arith.constant 176 : i32
          %38 = arith.addi %c176_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%35#0) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_12 : i32
          %37 = arith.addi %36, %0 : i32
          %c196_i32 = arith.constant 196 : i32
          %38 = arith.addi %c196_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%35#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
    ^bb2(%31: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %32 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %34 = arith.addi %0, %c0_i32_8 : i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %21 = arith.addi %c48_i32, %0 : i32
    %true_5 = arith.constant true
    %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

