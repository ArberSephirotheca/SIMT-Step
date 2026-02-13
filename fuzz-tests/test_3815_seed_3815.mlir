module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %c0_i32_2 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_3 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %9 = "simt_step.if"(%8) ({
          %true_4 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %11 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %11 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %9 = "simt_step.if"(%8) ({
          %true_4 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %11 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %11 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %c3_i32 = arith.constant 3 : i32
      %7 = arith.addi %arg0, %c3_i32 : i32
      %8 = "simt_step.switch"(%6, %7) ({
      ^bb0(%arg4: i32):
        %9 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %14 = arith.addi %arg0, %c2_i32_4 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c2_i32_2 = arith.constant 2 : i32
        %11 = arith.remsi %arg3, %c2_i32_2 : i32
        %c2_i32_3 = arith.constant 2 : i32
        %12 = "simt_step.switch"(%11, %c2_i32_3) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_4) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%8) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
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
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %15 = arith.muli %arg3, %c4_i32_3 : i32
        %16 = arith.addi %15, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %17 = arith.addi %c12_i32, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
        "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %15 = arith.addi %arg2, %c4_i32_3 : i32
        %c1_i32_4 = arith.constant 1 : i32
        %16 = arith.addi %arg3, %c1_i32_4 : i32
        %true_5 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %17 = arith.muli %arg3, %c4_i32_6 : i32
        %18 = arith.addi %c80_i32, %17 : i32
        %19 = arith.addi %18, %0 : i32
        %true_7 = arith.constant true
        %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) : (i32) -> ()
    }, {
      %c32_i32 = arith.constant 32 : i32
      %14 = arith.addi %c32_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %16 = "simt_step.switch"(%15, %c3_i32) ({
      ^bb0(%arg2: i32):
        %c36_i32 = arith.constant 36 : i32
        %17 = arith.addi %c36_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_1 = arith.constant 4 : i32
        %19 = arith.addi %0, %c4_i32_1 : i32
        %20 = "simt_step.switch"(%18, %19) ({
        ^bb0(%arg3: i32):
          %c1_i32_4 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%21: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb2(%22: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %23 = arith.addi %c40_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_3 = arith.constant 4 : i32
        %25 = "simt_step.switch"(%24, %c4_i32_3) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c1_i32_4 = arith.constant 1 : i32
          %27 = arith.addi %0, %c1_i32_4 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %c0_i32_5 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_5) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %9 = arith.addi %c96_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c44_i32 = arith.constant 44 : i32
    %11 = arith.addi %c44_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %13 = "simt_step.switch"(%12, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c48_i32 = arith.constant 48 : i32
      %14 = arith.addi %c48_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
      %17 = "simt_step.if"(%16) ({
        %c52_i32 = arith.constant 52 : i32
        %32 = arith.addi %c52_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_4 = arith.constant 1 : i32
        %34 = "simt_step.switch"(%33, %c1_i32_4) ({
        ^bb0(%arg3: i32):
          %c1_i32_5 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32_5 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %32 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %19 = arith.addi %c56_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_2 : i32
      %22 = "simt_step.if"(%21) ({
        %c60_i32 = arith.constant 60 : i32
        %32 = arith.addi %c60_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_4 = arith.constant 4 : i32
        %34 = "simt_step.switch"(%33, %c4_i32_4) ({
        ^bb0(%arg3: i32):
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_7 : i32
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c64_i32 = arith.constant 64 : i32
        %32 = arith.addi %c64_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_4 : i32
        %35 = "simt_step.if"(%34) ({
          %c1_i32_5 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32_5 : i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %24 = arith.addi %c68_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_3 : i32
      %27 = "simt_step.if"(%26) ({
        %c72_i32 = arith.constant 72 : i32
        %32 = arith.addi %c72_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %34 = "simt_step.switch"(%33, %c3_i32) ({
        ^bb0(%arg3: i32):
          %c1_i32_5 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32_5 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          %37 = arith.addi %0, %c0_i32_6 : i32
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %32 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %29 = arith.addi %c76_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = "simt_step.switch"(%30, %0) ({
      ^bb0(%arg3: i32):
        %c80_i32 = arith.constant 80 : i32
        %32 = arith.addi %c80_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_4 = arith.constant 4 : i32
        %34 = arith.addi %0, %c4_i32_4 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %48 = arith.addi %0, %c4_i32_7 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %37 = arith.addi %c84_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = "simt_step.switch"(%38, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %48 = arith.addi %0, %c0_i32_7 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb3(%49: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          %50 = arith.addi %0, %c1_i32_8 : i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %41 = arith.addi %c88_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_6 : i32
        %44 = "simt_step.if"(%43) ({
          %c1_i32_7 = arith.constant 1 : i32
          %45 = arith.addi %0, %c1_i32_7 : i32
          "simt_step.yield"(%45) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

