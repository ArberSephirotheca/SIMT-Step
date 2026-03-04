module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c3_i32 = arith.constant 3 : i32
      %1 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg0, %c1_i32 : i32
      %3 = "simt_step.switch"(%1, %2) ({
      ^bb0(%arg6: i32):
        %c2_i32 = arith.constant 2 : i32
        %9 = arith.remsi %arg3, %c2_i32 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %10 = arith.addi %arg0, %c0_i32_3 : i32
        %11 = "simt_step.switch"(%9, %10) ({
        ^bb0(%arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %12 = arith.addi %arg0, %c0_i32_4 : i32
        "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c2_i32_5 = arith.constant 2 : i32
        %14 = arith.remsi %arg3, %c2_i32_5 : i32
        %c2_i32_6 = arith.constant 2 : i32
        %15 = "simt_step.switch"(%14, %c2_i32_6) ({
        ^bb0(%arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c2_i32_7 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_7 : i32
        %18 = "simt_step.switch"(%17, %arg0) ({
        ^bb0(%arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %22 = arith.addi %arg0, %c4_i32_10 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %c1_i32_11 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb3(%19: i32):  // no predecessors
        %c2_i32_8 = arith.constant 2 : i32
        %20 = arith.remsi %arg3, %c2_i32_8 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %21 = "simt_step.switch"(%20, %c1_i32_9) ({
        ^bb0(%arg7: i32):
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %c2_i32_11 = arith.constant 2 : i32
          %23 = arith.addi %arg0, %c2_i32_11 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32 : i32
      %6 = arith.addi %c0_i32_1, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32_2 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32_2 : i32
      "simt_step.continue"(%3, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
      "simt_step.if"(%20) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_8 : i32
        %24 = arith.addi %23, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %25 = arith.addi %c16_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %23 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %20 = arith.addi %c36_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_6 = arith.constant 4 : i32
      %22 = "simt_step.switch"(%21, %c4_i32_6) ({
      ^bb0(%arg3: i32):
        %c40_i32 = arith.constant 40 : i32
        %23 = arith.addi %c40_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_8 : i32
        %26 = "simt_step.if"(%25) ({
          %c2_i32_13 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32_13 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %39 = arith.muli %arg5, %c4_i32_13 : i32
          %40 = arith.addi %39, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %41 = arith.addi %c44_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_14 : i32
          "simt_step.condition"(%43, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %39 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          "simt_step.break"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %30 = arith.addi %c64_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_11 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb3(%34: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %35 = arith.addi %c68_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_4 : i32
      %19 = arith.addi %18, %0 : i32
      %c72_i32 = arith.constant 72 : i32
      %20 = arith.addi %c72_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c92_i32 = arith.constant 92 : i32
      %18 = arith.addi %c92_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg4: i32):
        %c96_i32 = arith.constant 96 : i32
        %27 = arith.addi %c96_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = "simt_step.switch"(%28, %0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c3_i32_7 = arith.constant 3 : i32
          %33 = arith.addi %0, %c3_i32_7 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %21 = arith.addi %arg2, %20 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %23 = arith.muli %arg3, %c4_i32_5 : i32
      %24 = arith.addi %c16_i32, %23 : i32
      %25 = arith.addi %24, %0 : i32
      %true_6 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c100_i32 = arith.constant 100 : i32
    %12 = arith.addi %c100_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %14 = arith.addi %0, %c2_i32 : i32
    %15 = "simt_step.switch"(%13, %14) ({
    ^bb0(%arg2: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %18 = arith.addi %0, %c4_i32_4 : i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %20 = arith.addi %c104_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_5 : i32
      %23 = "simt_step.if"(%22) ({
        %c108_i32 = arith.constant 108 : i32
        %30 = arith.addi %c108_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_7 = arith.constant 2 : i32
        %32 = "simt_step.switch"(%31, %c2_i32_7) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %34 = arith.addi %0, %c2_i32_8 : i32
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_7) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c112_i32 = arith.constant 112 : i32
      %25 = arith.addi %c112_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = "simt_step.switch"(%26, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_10 : i32
          %37 = arith.addi %36, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %38 = arith.addi %c116_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_11 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          %true_10 = arith.constant true
          "simt_step.continue"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c136_i32 = arith.constant 136 : i32
        %32 = arith.addi %c136_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_9 : i32
        %35 = "simt_step.if"(%34) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %36 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c4_i32_6 = arith.constant 4 : i32
      %29 = arith.addi %0, %c4_i32_6 : i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

