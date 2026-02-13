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
      %true_2 = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg5, %8 : i32
        "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c2_i32 = arith.constant 2 : i32
        %8 = arith.addi %arg0, %c2_i32 : i32
        %9 = "simt_step.switch"(%7, %8) ({
        ^bb0(%arg6: i32):
          %c3_i32 = arith.constant 3 : i32
          %11 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb2(%13: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%14: i32):  // no predecessors
          %c0_i32_5 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_5) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%9, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %20 = arith.addi %c8_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      "simt_step.if"(%22) ({
        %c3_i32 = arith.constant 3 : i32
        %23 = arith.addi %0, %c3_i32 : i32
        %24 = "simt_step.switch"(%0, %23) ({
        ^bb0(%arg2: i32):
          %c4_i32_4 = arith.constant 4 : i32
          %25 = arith.addi %arg2, %c4_i32_4 : i32
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c0_i32_5 = arith.constant 0 : i32
          %27 = arith.addi %26, %c0_i32_5 : i32
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_1 = arith.constant 4 : i32
    %8 = "simt_step.switch"(%7, %c4_i32_1) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_7 : i32
        %33 = arith.addi %32, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %34 = arith.addi %c16_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_8 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %35 = arith.muli %arg6, %c4_i32_11 : i32
          %36 = arith.addi %35, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %37 = arith.addi %c36_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_12 : i32
          "simt_step.condition"(%39, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %35 = arith.addi %arg5, %arg6 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %36 = arith.addi %arg6, %c1_i32_11 : i32
          %true_12 = arith.constant true
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %33 = arith.addi %arg3, %32#0 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32_9 : i32
        %true_10 = arith.constant true
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %22 = arith.addi %c56_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
      %25 = "simt_step.if"(%24) ({
        %c60_i32 = arith.constant 60 : i32
        %32 = arith.addi %c60_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = "simt_step.switch"(%33, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c1_i32_8 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c2_i32_9 = arith.constant 2 : i32
          %37 = arith.addi %0, %c2_i32_9 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_9 : i32
          %34 = arith.addi %33, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %35 = arith.addi %c64_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32_9 : i32
          %true_10 = arith.constant true
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %27 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %29 = arith.addi %c84_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = "simt_step.switch"(%30, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_10 : i32
          %42 = arith.addi %41, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %43 = arith.addi %c88_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_11 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_10 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_10 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c108_i32 = arith.constant 108 : i32
        %34 = arith.addi %c108_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %36 = "simt_step.switch"(%35, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c1_i32_10 = arith.constant 1 : i32
          %41 = arith.addi %0, %c1_i32_10 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c1_i32_11 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_11) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c112_i32 = arith.constant 112 : i32
        %38 = arith.addi %c112_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = "simt_step.switch"(%39, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c1_i32_11 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          %43 = arith.addi %0, %c2_i32_12 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c116_i32 = arith.constant 116 : i32
    %11 = arith.addi %c116_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %13 = arith.addi %0, %c1_i32 : i32
    %14 = "simt_step.switch"(%12, %13) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_8 : i32
        %36 = arith.addi %35, %0 : i32
        %c120_i32 = arith.constant 120 : i32
        %37 = arith.addi %c120_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_9 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %35 = arith.addi %arg3, %arg4 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32_8 : i32
        %true_9 = arith.constant true
        "simt_step.yield"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c140_i32 = arith.constant 140 : i32
      %22 = arith.addi %c140_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_5 = arith.constant 1 : i32
      %24 = "simt_step.switch"(%23, %c1_i32_5) ({
      ^bb0(%arg3: i32):
        %c144_i32 = arith.constant 144 : i32
        %35 = arith.addi %c144_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
        %38 = "simt_step.if"(%37) ({
          %c3_i32 = arith.constant 3 : i32
          %40 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c4_i32_9 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c148_i32 = arith.constant 148 : i32
      %26 = arith.addi %c148_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_6 = arith.constant 4 : i32
      %28 = arith.addi %0, %c4_i32_6 : i32
      %29 = "simt_step.switch"(%27, %28) ({
      ^bb0(%arg3: i32):
        %c152_i32 = arith.constant 152 : i32
        %35 = arith.addi %c152_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %37 = arith.addi %0, %c3_i32 : i32
        %38 = "simt_step.switch"(%36, %37) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %c4_i32_12 = arith.constant 4 : i32
          %52 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c4_i32_8 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c156_i32 = arith.constant 156 : i32
        %41 = arith.addi %c156_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_9 = arith.constant 3 : i32
        %43 = "simt_step.switch"(%42, %c3_i32_9) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %c3_i32_12 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb3(%44: i32):  // no predecessors
        %c160_i32 = arith.constant 160 : i32
        %45 = arith.addi %c160_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %47 = arith.addi %0, %c0_i32_11 : i32
        %48 = "simt_step.switch"(%46, %47) ({
        ^bb0(%arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          %51 = arith.addi %0, %c3_i32_13 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb3(%52: i32):  // no predecessors
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c164_i32 = arith.constant 164 : i32
      %31 = arith.addi %c164_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_7 = arith.constant 1 : i32
      %33 = arith.addi %0, %c1_i32_7 : i32
      %34 = "simt_step.switch"(%32, %33) ({
      ^bb0(%arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %35 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c168_i32 = arith.constant 168 : i32
        %37 = arith.addi %c168_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_8 : i32
        %40 = "simt_step.if"(%39) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c172_i32 = arith.constant 172 : i32
    %15 = arith.addi %c172_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %17 = simt_step.subgroup_id
    %18 = arith.index_cast %17 : index to i32
    %19 = "simt_step.switch"(%16, %18) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c176_i32 = arith.constant 176 : i32
      %21 = arith.addi %c176_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32_3 = arith.constant 1 : i32
      %23 = arith.addi %0, %c1_i32_3 : i32
      %24 = "simt_step.switch"(%22, %23) ({
      ^bb0(%arg3: i32):
        %c180_i32 = arith.constant 180 : i32
        %29 = arith.addi %c180_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = "simt_step.switch"(%30, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c184_i32 = arith.constant 184 : i32
        %33 = arith.addi %c184_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = "simt_step.switch"(%34, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c1_i32_12 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_12) {fallthrough = true} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = true} : (i32) -> ()
        ^bb3(%48: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c188_i32 = arith.constant 188 : i32
        %37 = arith.addi %c188_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_10 : i32
        %40 = "simt_step.if"(%39) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_12 = arith.constant 4 : i32
          %46 = arith.addi %0, %c4_i32_12 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c192_i32 = arith.constant 192 : i32
        %42 = arith.addi %c192_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_11 : i32
        %45 = "simt_step.if"(%44) ({
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) : (i32) -> ()
        }, {
          %c0_i32_12 = arith.constant 0 : i32
          %46 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_8 : i32
        %30 = arith.addi %29, %0 : i32
        %c196_i32 = arith.constant 196 : i32
        %31 = arith.addi %c196_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_9 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c216_i32 = arith.constant 216 : i32
        %29 = arith.addi %c216_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %31 = arith.addi %0, %c3_i32 : i32
        %32 = "simt_step.switch"(%30, %31) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %33 = arith.addi %arg3, %32 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32_8 : i32
        %true_9 = arith.constant true
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%27: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_8 : i32
        %30 = arith.addi %29, %0 : i32
        %c220_i32 = arith.constant 220 : i32
        %31 = arith.addi %c220_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_9 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %29 = arith.addi %arg3, %arg4 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32_8 : i32
        %true_9 = arith.constant true
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

