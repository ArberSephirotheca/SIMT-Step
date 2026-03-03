module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %c2_i32 = arith.constant 2 : i32
    %2 = arith.remsi %arg3, %c2_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %16 = arith.remsi %arg3, %c4_i32_5 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %17 = arith.addi %16, %c1_i32_6 : i32
        %18 = arith.cmpi slt, %arg6, %17 : i32
        "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_9 : i32
          %20 = arith.cmpi slt, %arg8, %19 : i32
          "simt_step.condition"(%20, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %18 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.break"(%c4_i32_8, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_7 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_7 : i32
        "simt_step.yield"(%16#0, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32 = arith.constant 4 : i32
      %11 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c2_i32_3 = arith.constant 2 : i32
      %13 = arith.remsi %arg3, %c2_i32_3 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %14 = "simt_step.switch"(%13, %c0_i32_4) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %16:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_13 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32_12 = arith.constant 3 : i32
          %23 = arith.addi %arg0, %c3_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %24 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.yield"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_7 = arith.constant 0 : i32
        "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %18 = arith.remsi %arg3, %c3_i32 : i32
        %c2_i32_8 = arith.constant 2 : i32
        %19 = arith.addi %arg0, %c2_i32_8 : i32
        %20 = "simt_step.switch"(%18, %19) ({
        ^bb0(%arg6: i32):
          %c3_i32_12 = arith.constant 3 : i32
          %23 = arith.addi %arg0, %c3_i32_12 : i32
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          %26 = arith.addi %arg0, %c4_i32_14 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb3(%27: i32):  // no predecessors
          %c0_i32_15 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32_13 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_12 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32_12 : i32
          "simt_step.yield"(%arg0, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %7 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %9 = arith.select %8, %1, %5 : i32
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
    %c3_i32 = arith.constant 3 : i32
    %7 = "simt_step.switch"(%6, %c3_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %21 = arith.addi %c12_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %23 = "simt_step.switch"(%22, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c16_i32_11 = arith.constant 16 : i32
        %34 = arith.addi %c16_i32_11, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32_17 = arith.constant 3 : i32
          %51 = arith.addi %0, %c3_i32_17 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        ^bb1(%52: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %53 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %38 = arith.addi %c20_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_13 : i32
        %41 = "simt_step.if"(%40) ({
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%51) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = true} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %43 = arith.addi %c24_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_14 = arith.constant 4 : i32
        %45 = "simt_step.switch"(%44, %c4_i32_14) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%51: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %52 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        ^bb2(%53: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%54: i32):  // no predecessors
          %c2_i32_18 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
      ^bb3(%46: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %47 = arith.addi %c28_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %49 = arith.cmpi ne, %48, %c0_i32_16 : i32
        %50 = "simt_step.if"(%49) ({
          %c3_i32_17 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_17) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          %51 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%51) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c3_i32_6 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32_6) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c32_i32_7 = arith.constant 32 : i32
      %26 = arith.addi %c32_i32_7, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
      %29 = "simt_step.if"(%28) ({
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_14 : i32
          %36 = arith.addi %35, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %37 = arith.addi %c36_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.break"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%34#0) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_14 : i32
          %36 = arith.addi %35, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %37 = arith.addi %c56_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.continue"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%34#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %31 = arith.addi %c76_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_9 = arith.constant 2 : i32
      %33 = "simt_step.switch"(%32, %c2_i32_9) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %36 = arith.addi %c80_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32_11 = arith.constant 1 : i32
        %38 = "simt_step.switch"(%37, %c1_i32_11) ({
        ^bb0(%arg4: i32):
          %c0_i32_13 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c3_i32_14 = arith.constant 3 : i32
          %41 = arith.addi %0, %c3_i32_14 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c3_i32_15 = arith.constant 3 : i32
          %43 = arith.addi %0, %c3_i32_15 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb3(%44: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c84_i32 = arith.constant 84 : i32
    %10 = arith.addi %c84_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = "simt_step.switch"(%11, %0) ({
    ^bb0(%arg2: i32):
      %c88_i32 = arith.constant 88 : i32
      %21 = arith.addi %c88_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_5 : i32
      %24 = "simt_step.if"(%23) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_10 : i32
          %32 = arith.addi %31, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %33 = arith.addi %c92_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_11 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%30#0) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c112_i32 = arith.constant 112 : i32
      %26 = arith.addi %c112_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_6 : i32
      %29 = "simt_step.if"(%28) ({
        %c116_i32 = arith.constant 116 : i32
        %30 = arith.addi %c116_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c120_i32 = arith.constant 120 : i32
    %15 = arith.addi %c120_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %17 = arith.cmpi ne, %16, %c0_i32_3 : i32
    %18 = "simt_step.if"(%17) ({
      %c124_i32 = arith.constant 124 : i32
      %21 = arith.addi %c124_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_5 : i32
      %24 = "simt_step.if"(%23) ({
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_9 : i32
          %27 = arith.addi %26, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %28 = arith.addi %c128_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_10 : i32
          "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %26 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg3, %c1_i32 : i32
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%25#0) : (i32) -> ()
      }, {
        %c148_i32 = arith.constant 148 : i32
        %25 = arith.addi %c148_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_6 : i32
        %28 = "simt_step.if"(%27) ({
          %29 = simt_step.subgroup_id
          %30 = arith.index_cast %29 : index to i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c152_i32 = arith.constant 152 : i32
      %21 = arith.addi %c152_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32_5 = arith.constant 3 : i32
      %23 = arith.addi %0, %c3_i32_5 : i32
      %24 = "simt_step.switch"(%22, %23) ({
      ^bb0(%arg2: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_12 : i32
          %36 = arith.addi %35, %0 : i32
          %c156_i32 = arith.constant 156 : i32
          %37 = arith.addi %c156_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_13 : i32
          "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %35 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %27 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %29 = arith.addi %0, %c0_i32_10 : i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb3(%30: i32):  // no predecessors
        %c176_i32 = arith.constant 176 : i32
        %31 = arith.addi %c176_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_11 : i32
        %34 = "simt_step.if"(%33) ({
          %c0_i32_12 = arith.constant 0 : i32
          %35 = arith.addi %0, %c0_i32_12 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c3_i32_12 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %19 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

