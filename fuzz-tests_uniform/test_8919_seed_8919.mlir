module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = "simt_step.switch"(%0, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %5 = "simt_step.if"(%4) ({
        %c4_i32_4 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %14 = arith.addi %arg0, %c1_i32_5 : i32
        %15 = "simt_step.switch"(%13, %14) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          %19 = arith.addi %arg0, %c2_i32_7 : i32
          "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
        ^bb3(%20: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          %21 = arith.addi %arg0, %c3_i32_8 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c2_i32_6 = arith.constant 2 : i32
        %16 = arith.addi %arg0, %c2_i32_6 : i32
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_8 : i32
          %16 = arith.cmpi slt, %arg6, %15 : i32
          "simt_step.condition"(%16, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c2_i32_7 = arith.constant 2 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %14 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.yield"(%c2_i32_7, %14) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_6 = arith.constant 2 : i32
        "simt_step.yield"(%13#0) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %7:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %14 = arith.addi %13, %c1_i32_5 : i32
        %15 = arith.cmpi slt, %arg6, %14 : i32
        "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %14 = "simt_step.if"(%13) ({
          %c1_i32_6 = arith.constant 1 : i32
          %16 = arith.addi %arg0, %c1_i32_6 : i32
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_5 = arith.constant 1 : i32
        %15 = arith.addi %arg6, %c1_i32_5 : i32
        "simt_step.continue"(%14, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %9 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %10 = "simt_step.if"(%9) ({
        %c4_i32_4 = arith.constant 4 : i32
        %13 = arith.remsi %arg3, %c4_i32_4 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %14 = "simt_step.switch"(%13, %c4_i32_5) ({
        ^bb0(%arg5: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %15 = arith.addi %arg0, %c0_i32_7 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %17 = arith.addi %arg0, %c2_i32_8 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%19: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %20 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32_6 = arith.constant 3 : i32
        "simt_step.yield"(%14) : (i32) -> ()
      }, {
        %c1_i32_4 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_4) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.subgroup_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c2_i32 = arith.constant 2 : i32
      %22 = arith.addi %0, %c2_i32 : i32
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %24 = arith.addi %c12_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c16_i32_10 = arith.constant 16 : i32
        %38 = arith.addi %c16_i32_10, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_11 : i32
        %41 = "simt_step.if"(%40) ({
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) : (i32) -> ()
        }, {
          %c1_i32_13 = arith.constant 1 : i32
          %43 = arith.addi %0, %c1_i32_13 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c2_i32_12 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %28 = arith.addi %c20_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
      %31 = "simt_step.if"(%30) ({
        %c24_i32 = arith.constant 24 : i32
        %37 = arith.addi %c24_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_10 : i32
        %40 = "simt_step.if"(%39) ({
          %c0_i32_11 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_11) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%40) : (i32) -> ()
      }, {
        %c2_i32_10 = arith.constant 2 : i32
        %37 = arith.addi %0, %c2_i32_10 : i32
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %33 = arith.addi %c28_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %35 = arith.addi %0, %c1_i32 : i32
      %36 = "simt_step.switch"(%34, %35) ({
      ^bb0(%arg3: i32):
        %c32_i32_10 = arith.constant 32 : i32
        %37 = arith.addi %c32_i32_10, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = "simt_step.switch"(%38, %c0_i32_11) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c4_i32_19 = arith.constant 4 : i32
          %45 = arith.addi %0, %c4_i32_19 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_19 : i32
          %45 = arith.addi %44, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %46 = arith.addi %c36_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_20 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_19 : i32
          "simt_step.break"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%41#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_19 : i32
          %45 = arith.addi %44, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %46 = arith.addi %c56_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_20 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_19 : i32
          "simt_step.continue"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c76_i32 = arith.constant 76 : i32
    %12 = arith.addi %c76_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.lane_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c80_i32 = arith.constant 80 : i32
      %22 = arith.addi %c80_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
      %25 = "simt_step.if"(%24) ({
        %c84_i32 = arith.constant 84 : i32
        %31 = arith.addi %c84_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_9 : i32
        %34 = "simt_step.if"(%33) ({
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %32 = arith.muli %arg4, %c4_i32_12 : i32
          %33 = arith.addi %32, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %34 = arith.addi %c88_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_13 : i32
          "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %32 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%31#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c108_i32 = arith.constant 108 : i32
      %27 = arith.addi %c108_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %29 = arith.addi %0, %c3_i32 : i32
      %30 = "simt_step.switch"(%28, %29) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %41 = arith.muli %arg5, %c4_i32_14 : i32
          %42 = arith.addi %41, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %43 = arith.addi %c112_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_15 : i32
          "simt_step.condition"(%45, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %41 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %42 = arith.addi %arg5, %c1_i32_14 : i32
          "simt_step.yield"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c132_i32 = arith.constant 132 : i32
        %33 = arith.addi %c132_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_12 : i32
        %36 = "simt_step.if"(%35) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c3_i32_14 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c136_i32 = arith.constant 136 : i32
        %38 = arith.addi %c136_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %40 = "simt_step.switch"(%39, %c1_i32) ({
        ^bb0(%arg4: i32):
          %c1_i32_14 = arith.constant 1 : i32
          %41 = arith.addi %0, %c1_i32_14 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c1_i32_15 = arith.constant 1 : i32
          %43 = arith.addi %0, %c1_i32_15 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          %45 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %17 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %19:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %22 = arith.muli %arg3, %c4_i32_7 : i32
      %23 = arith.addi %22, %0 : i32
      %c140_i32 = arith.constant 140 : i32
      %24 = arith.addi %c140_i32, %23 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_8 : i32
      "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c160_i32 = arith.constant 160 : i32
      %22 = arith.addi %c160_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %24 = "simt_step.switch"(%23, %c2_i32) ({
      ^bb0(%arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %39 = arith.muli %arg6, %c4_i32_16 : i32
          %40 = arith.addi %39, %0 : i32
          %c164_i32 = arith.constant 164 : i32
          %41 = arith.addi %c164_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_17 : i32
          "simt_step.condition"(%43, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %39 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %40 = arith.addi %arg6, %c1_i32_16 : i32
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%27#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %39 = arith.muli %arg6, %c4_i32_16 : i32
          %40 = arith.addi %39, %0 : i32
          %c184_i32 = arith.constant 184 : i32
          %41 = arith.addi %c184_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_17 : i32
          "simt_step.condition"(%43, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %39 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %40 = arith.addi %arg6, %c1_i32_16 : i32
          "simt_step.yield"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c204_i32 = arith.constant 204 : i32
        %31 = arith.addi %c204_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_14 : i32
        %34 = "simt_step.if"(%33) ({
          %c0_i32_16 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_16) : (i32) -> ()
        }, {
          %c0_i32_16 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb3(%35: i32):  // no predecessors
        %c208_i32 = arith.constant 208 : i32
        %36 = arith.addi %c208_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          %40 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %25 = arith.addi %arg2, %24 : i32
      %c1_i32 = arith.constant 1 : i32
      %26 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%25, %26) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %20 = arith.addi %c48_i32, %0 : i32
    %true_6 = arith.constant true
    %21 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

