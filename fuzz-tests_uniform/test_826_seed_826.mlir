module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = "simt_step.switch"(%arg3, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %3 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %4 = "simt_step.if"(%3) ({
        %c0_i32_3 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %9 = "simt_step.if"(%8) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c0_i32_4 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_4) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%9) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %8 = arith.remsi %arg3, %c2_i32 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %9 = "simt_step.switch"(%8, %c0_i32_3) ({
        ^bb0(%arg5: i32):
          %c3_i32_4 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%9) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32 : i32
          %12 = arith.cmpi slt, %arg6, %11 : i32
          "simt_step.condition"(%12, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %arg0, %c1_i32 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %11 = arith.addi %arg6, %c1_i32_5 : i32
          "simt_step.break"(%10, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32 = arith.constant 2 : i32
        %9 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%8#0) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %8 = arith.addi %arg0, %c0_i32_3 : i32
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      "simt_step.yield"(%0) : (i32) -> ()
    }, {
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
      %22 = "simt_step.if"(%21) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %24 = arith.muli %arg3, %c4_i32_11 : i32
          %25 = arith.addi %24, %0 : i32
          %c16_i32_12 = arith.constant 16 : i32
          %26 = arith.addi %c16_i32_12, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_13 : i32
          "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %24 = arith.addi %arg2, %arg3 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %25 = arith.addi %arg3, %c1_i32_11 : i32
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%23#0) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %24 = arith.muli %arg3, %c4_i32_11 : i32
          %25 = arith.addi %24, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %26 = arith.addi %c36_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_12 : i32
          "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %24 = arith.addi %arg2, %arg3 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %25 = arith.addi %arg3, %c1_i32_11 : i32
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%23#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_7 : i32
      %20 = arith.addi %19, %0 : i32
      %c56_i32 = arith.constant 56 : i32
      %21 = arith.addi %c56_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32_7 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32_7 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c76_i32 = arith.constant 76 : i32
    %14 = arith.addi %c76_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %16 = "simt_step.switch"(%15, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c80_i32 = arith.constant 80 : i32
      %19 = arith.addi %c80_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c84_i32 = arith.constant 84 : i32
        %33 = arith.addi %c84_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_14 : i32
        %36 = "simt_step.if"(%35) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %38 = arith.addi %c88_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_15 : i32
        %41 = "simt_step.if"(%40) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %43 = arith.addi %0, %c0_i32_16 : i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %23 = arith.addi %c92_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_8 = arith.constant 4 : i32
      %25 = arith.addi %0, %c4_i32_8 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c0_i32_14 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %34 = arith.addi %c96_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_15 : i32
        %37 = "simt_step.if"(%36) ({
          %c1_i32_16 = arith.constant 1 : i32
          %38 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%38) : (i32) -> ()
        }, {
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_14 : i32
        %34 = arith.addi %33, %0 : i32
        %c100_i32 = arith.constant 100 : i32
        %35 = arith.addi %c100_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_15 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %36 = arith.muli %arg6, %c4_i32_18 : i32
          %37 = arith.addi %36, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %38 = arith.addi %c120_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_19 : i32
          "simt_step.condition"(%40, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %36 = arith.addi %arg5, %arg6 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %37 = arith.addi %arg6, %c1_i32_18 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        %34 = arith.addi %arg3, %33#0 : i32
        %c1_i32_17 = arith.constant 1 : i32
        %35 = arith.addi %arg4, %c1_i32_17 : i32
        "simt_step.yield"(%34, %35) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%28#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c140_i32 = arith.constant 140 : i32
      %30 = arith.addi %c140_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %32 = "simt_step.switch"(%31, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_20 : i32
          %45 = arith.addi %44, %0 : i32
          %c144_i32 = arith.constant 144 : i32
          %46 = arith.addi %c144_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_21 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_20 : i32
          "simt_step.continue"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c1_i32_17 = arith.constant 1 : i32
        %35 = arith.addi %0, %c1_i32_17 : i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %37 = arith.addi %c164_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = "simt_step.switch"(%38, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_18 = arith.constant true
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c168_i32 = arith.constant 168 : i32
        %41 = arith.addi %c168_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %43 = "simt_step.switch"(%42, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c4_i32_20 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_20) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_13 = arith.constant true
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_5 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %17 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

