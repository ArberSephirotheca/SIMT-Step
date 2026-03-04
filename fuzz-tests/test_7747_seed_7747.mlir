module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32 : i32
          %7 = arith.cmpi slt, %arg5, %6 : i32
          "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c0_i32_3, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = simt_step.subgroup_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %10 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %c3_i32_1 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_1) {fallthrough = false} : (i32) -> ()
        ^bb2(%12: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %9 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg0, %c1_i32 : i32
        %6 = "simt_step.switch"(%4, %5) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %7 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
        ^bb1(%8: i32):  // no predecessors
          %c3_i32_1 = arith.constant 3 : i32
          %9 = arith.addi %arg0, %c3_i32_1 : i32
          "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
        ^bb2(%10: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%11: i32):  // no predecessors
          %c3_i32_2 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_2) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%6) : (i32) -> ()
      }, {
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %5 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }) : (i1) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
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
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.lane_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %18 = arith.addi %c16_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %0, %c1_i32 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg3: i32):
        %c20_i32 = arith.constant 20 : i32
        %31 = arith.addi %c20_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_5 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c4_i32_6 = arith.constant 4 : i32
        %36 = arith.addi %0, %c4_i32_6 : i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %38 = arith.addi %c24_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %40 = "simt_step.switch"(%39, %c4_i32_7) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %44 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %c3_i32_9 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %42 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %23 = arith.addi %c28_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %25 = "simt_step.switch"(%24, %0) ({
      ^bb0(%arg3: i32):
        %c32_i32 = arith.constant 32 : i32
        %31 = arith.addi %c32_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_9 : i32
          %39 = arith.addi %38, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %40 = arith.addi %c36_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_10 : i32
          "simt_step.condition"(%42, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %38 = arith.addi %arg4, %arg5 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %39 = arith.addi %arg5, %c1_i32_9 : i32
          %true_10 = arith.constant true
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_9 : i32
          %39 = arith.addi %38, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %40 = arith.addi %c56_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_10 : i32
          "simt_step.condition"(%42, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %38 = arith.addi %arg4, %arg5 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %39 = arith.addi %arg5, %c1_i32_9 : i32
          %true_10 = arith.constant true
          "simt_step.continue"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %27 = arith.addi %c76_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_4 : i32
      %30 = "simt_step.if"(%29) ({
        %c80_i32 = arith.constant 80 : i32
        %31 = arith.addi %c80_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_5 : i32
        %34 = "simt_step.if"(%33) ({
          %c4_i32_6 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_6 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %c84_i32 = arith.constant 84 : i32
    %11 = arith.addi %c84_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c88_i32 = arith.constant 88 : i32
      %18 = arith.addi %c88_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
      %21 = "simt_step.if"(%20) ({
        %c92_i32 = arith.constant 92 : i32
        %24 = arith.addi %c92_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = "simt_step.switch"(%25, %0) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %27 = arith.addi %c48_i32, %0 : i32
        %true_7 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_8 : i32
          %26 = arith.addi %25, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %27 = arith.addi %c96_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          %true_8 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %27 = arith.muli %arg3, %c4_i32_9 : i32
          %28 = arith.addi %c64_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %22 = arith.addi %c80_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %c116_i32 = arith.constant 116 : i32
      %18 = arith.addi %c116_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
      %21 = "simt_step.if"(%20) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg3, %c4_i32_8 : i32
          %26 = arith.addi %25, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %27 = arith.addi %c120_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
          "simt_step.condition"(%29, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %25 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg3, %c1_i32 : i32
          %true_8 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %27 = arith.muli %arg3, %c4_i32_9 : i32
          %28 = arith.addi %c96_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) : (i32) -> ()
      }, {
        %c140_i32 = arith.constant 140 : i32
        %24 = arith.addi %c140_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        %27 = "simt_step.if"(%26) ({
          %30 = simt_step.lane_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %28 = arith.addi %c112_i32, %0 : i32
        %true_7 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %22 = arith.addi %c128_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c144_i32 = arith.constant 144 : i32
    %15 = arith.addi %c144_i32, %0 : i32
    %true = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %17:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_4 : i32
      %19 = arith.addi %18, %0 : i32
      %c144_i32_5 = arith.constant 144 : i32
      %20 = arith.addi %c144_i32_5, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_5 : i32
      %21 = arith.addi %c160_i32, %20 : i32
      %22 = arith.addi %21, %0 : i32
      %true_6 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

