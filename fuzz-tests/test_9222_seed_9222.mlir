module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %10, %c1_i32 : i32
      %12 = arith.cmpi slt, %arg5, %11 : i32
      "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %11 = arith.muli %arg5, %c4_i32 : i32
      %12 = arith.addi %c0_i32_4, %11 : i32
      %13 = arith.addi %12, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%10, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %1 = "simt_step.switch"(%arg3, %c0_i32_1) ({
    ^bb0(%arg4: i32):
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c3_i32_4 = arith.constant 3 : i32
      %12 = arith.addi %arg0, %c3_i32_4 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %3 = arith.select %2, %0#0, %1 : i32
    %c3_i32 = arith.constant 3 : i32
    %4 = arith.remsi %arg3, %c3_i32 : i32
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %7 = "simt_step.switch"(%4, %6) ({
    ^bb0(%arg4: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %10 = arith.addi %arg0, %c0_i32_4 : i32
      "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %13 = "simt_step.if"(%12) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32 : i32
          %20 = arith.cmpi slt, %arg6, %19 : i32
          "simt_step.condition"(%20, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %c1_i32 = arith.constant 1 : i32
          %18 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%c4_i32_8, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32 : i32
        %c3_i32_6 = arith.constant 3 : i32
        %18 = "simt_step.switch"(%17, %c3_i32_6) ({
        ^bb0(%arg5: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
    ^bb2(%14: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %15 = arith.remsi %arg3, %c4_i32 : i32
      %16 = "simt_step.switch"(%15, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%arg0, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %20 = "simt_step.if"(%19) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c0_i32_11 = arith.constant 0 : i32
          %25 = arith.addi %arg0, %c0_i32_11 : i32
          "simt_step.yield"(%25) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %22 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb3(%23: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %25 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %25, %c1_i32 : i32
          %27 = arith.cmpi slt, %arg7, %26 : i32
          "simt_step.condition"(%27, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.break"(%arg0, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %9 = arith.select %8, %3, %7 : i32
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
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32_4 = arith.constant 1 : i32
        %15 = arith.cmpi slt, %arg3, %c1_i32_4 : i32
        "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_4 = arith.constant 1 : i32
        %15 = arith.addi %arg3, %c1_i32_4 : i32
        "simt_step.yield"(%arg2, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %14 = arith.addi %c12_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_2 = arith.constant 4 : i32
      %16 = "simt_step.switch"(%15, %c4_i32_2) ({
      ^bb0(%arg3: i32):
        %c16_i32_5 = arith.constant 16 : i32
        %31 = arith.addi %c16_i32_5, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %33 = "simt_step.switch"(%32, %c2_i32) ({
        ^bb0(%arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %47 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c4_i32_11 = arith.constant 4 : i32
          %50 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %35 = arith.addi %c20_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          %49 = arith.addi %0, %c4_i32_10 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %39 = arith.addi %c24_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_7 : i32
        %42 = "simt_step.if"(%41) ({
          %c3_i32_10 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32_10 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
      ^bb3(%43: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %44 = arith.addi %c28_i32, %0 : i32
        %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %46 = "simt_step.switch"(%45, %c0_i32_8) ({
        ^bb0(%arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %c0_i32_11 = arith.constant 0 : i32
          %48 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %18 = arith.addi %c32_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_3 : i32
      %21 = "simt_step.if"(%20) ({
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %31 = arith.addi %c36_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_5 = arith.constant 4 : i32
        %33 = arith.addi %0, %c4_i32_5 : i32
        %34 = "simt_step.switch"(%32, %33) ({
        ^bb0(%arg3: i32):
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          %36 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %23 = arith.addi %c40_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_4 : i32
      %26 = "simt_step.if"(%25) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c44_i32 = arith.constant 44 : i32
        %31 = arith.addi %c44_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %33 = "simt_step.switch"(%32, %c0_i32_5) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb3(%27: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %28 = arith.addi %c48_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %30 = "simt_step.switch"(%29, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_11 : i32
          %41 = arith.addi %40, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %42 = arith.addi %c52_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_12 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32_11 : i32
          %true_12 = arith.constant true
          "simt_step.continue"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c1_i32_7 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_7) {fallthrough = true} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_11 : i32
          %41 = arith.addi %40, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %42 = arith.addi %c72_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_12 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32_11 : i32
          %true_12 = arith.constant true
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%35: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %36 = arith.addi %c92_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_10 : i32
        %39 = "simt_step.if"(%38) ({
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          %c4_i32_11 = arith.constant 4 : i32
          %40 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c96_i32 = arith.constant 96 : i32
    %11 = arith.addi %c96_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %13 = "simt_step.switch"(%12, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_7 : i32
        %23 = arith.addi %22, %0 : i32
        %c100_i32 = arith.constant 100 : i32
        %24 = arith.addi %c100_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %22 = arith.addi %arg3, %c0_i32_7 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32_8 : i32
        %true_9 = arith.constant true
        "simt_step.break"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_7 : i32
        %23 = arith.addi %22, %0 : i32
        %c120_i32 = arith.constant 120 : i32
        %24 = arith.addi %c120_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.addi %0, %c4_i32_7 : i32
        %23 = arith.addi %arg3, %22 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32_8 : i32
        %true_9 = arith.constant true
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %c140_i32 = arith.constant 140 : i32
      %18 = arith.addi %c140_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_6 = arith.constant 1 : i32
      %20 = arith.addi %0, %c1_i32_6 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg3: i32):
        %c1_i32_7 = arith.constant 1 : i32
        %22 = arith.addi %0, %c1_i32_7 : i32
        "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %30 = arith.muli %arg5, %c4_i32_11 : i32
          %31 = arith.addi %30, %0 : i32
          %c144_i32 = arith.constant 144 : i32
          %32 = arith.addi %c144_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_12 : i32
          "simt_step.condition"(%34, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %30 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %31 = arith.addi %arg5, %c1_i32_11 : i32
          %true_12 = arith.constant true
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%25: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %26 = arith.addi %c164_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_10 : i32
        %29 = "simt_step.if"(%28) ({
          %c1_i32_11 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_11) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

