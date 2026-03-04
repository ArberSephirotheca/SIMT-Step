module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c2_i32 = arith.constant 2 : i32
      %2 = arith.remsi %arg3, %c2_i32 : i32
      %c2_i32_0 = arith.constant 2 : i32
      %3 = "simt_step.switch"(%2, %c2_i32_0) ({
      ^bb0(%arg4: i32):
        %c3_i32 = arith.constant 3 : i32
        %6 = arith.remsi %arg3, %c3_i32 : i32
        %c3_i32_2 = arith.constant 3 : i32
        %7 = "simt_step.switch"(%6, %c3_i32_2) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
        ^bb2(%12: i32):  // no predecessors
          %c3_i32_3 = arith.constant 3 : i32
          %13 = arith.addi %arg0, %c3_i32_3 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb3(%14: i32):  // no predecessors
          %c0_i32_4 = arith.constant 0 : i32
          %15 = arith.addi %arg0, %c0_i32_4 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %9 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg5: i32):
          %c2_i32_3 = arith.constant 2 : i32
          %10 = arith.addi %arg0, %c2_i32_3 : i32
          "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32_1, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = "simt_step.switch"(%4, %arg0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%8: i32):  // no predecessors
          %c0_i32_1 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_1) {fallthrough = false} : (i32) -> ()
        ^bb2(%9: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
        ^bb3(%11: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %7 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%5) : (i32) -> ()
      }, {
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
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg5, %c4_i32 : i32
          %7 = arith.addi %c32_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
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
      %21 = arith.addi %c8_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      "simt_step.if"(%23) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c16_i32 = arith.constant 16 : i32
      %21 = arith.addi %c16_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      %24 = "simt_step.if"(%23) ({
        %c20_i32 = arith.constant 20 : i32
        %27 = arith.addi %c20_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_6 : i32
        %30 = "simt_step.if"(%29) ({
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %31 = arith.addi %c48_i32, %0 : i32
        %true_7 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c24_i32 = arith.constant 24 : i32
        %27 = arith.addi %c24_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = simt_step.lane_id
        %30 = arith.index_cast %29 : index to i32
        %31 = "simt_step.switch"(%28, %30) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %35 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %32 = arith.addi %c64_i32, %0 : i32
        %true_7 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %25 = arith.addi %c80_i32, %0 : i32
      %true_5 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c28_i32 = arith.constant 28 : i32
      %21 = arith.addi %c28_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = "simt_step.switch"(%22, %0) ({
      ^bb0(%arg2: i32):
        %c32_i32 = arith.constant 32 : i32
        %24 = arith.addi %c32_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
        %27 = "simt_step.if"(%26) ({
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %30 = arith.muli %arg4, %c4_i32_7 : i32
          %31 = arith.addi %30, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %32 = arith.addi %c36_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_8 : i32
          "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %30 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg4, %c1_i32 : i32
          %true_7 = arith.constant true
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %10 = arith.addi %c96_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c56_i32 = arith.constant 56 : i32
    %12 = arith.addi %c56_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
    %15 = "simt_step.if"(%14) ({
      %c3_i32_4 = arith.constant 3 : i32
      %21 = arith.addi %0, %c3_i32_4 : i32
      "simt_step.yield"(%21) : (i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c112_i32 = arith.constant 112 : i32
    %16 = arith.addi %c112_i32, %0 : i32
    %true_3 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %18 = arith.addi %c60_i32, %0 : i32
    %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %20 = "simt_step.switch"(%19, %c3_i32) ({
    ^bb0(%arg2: i32):
      %c64_i32 = arith.constant 64 : i32
      %21 = arith.addi %c64_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      %24 = "simt_step.if"(%23) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_11 : i32
          %38 = arith.addi %37, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %39 = arith.addi %c68_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_12 : i32
          "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %37 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%36#0) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c88_i32 = arith.constant 88 : i32
      %26 = arith.addi %c88_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %28 = "simt_step.switch"(%27, %c4_i32_5) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_13 : i32
          %47 = arith.addi %46, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %48 = arith.addi %c92_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_14 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          %true_13 = arith.constant true
          "simt_step.break"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c112_i32_11 = arith.constant 112 : i32
        %38 = arith.addi %c112_i32_11, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
        %41 = "simt_step.if"(%40) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32_13 = arith.constant 3 : i32
          %46 = arith.addi %0, %c3_i32_13 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %43 = arith.addi %c116_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = "simt_step.switch"(%44, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb2(%47: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c120_i32 = arith.constant 120 : i32
      %30 = arith.addi %c120_i32, %0 : i32
      %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %32 = arith.cmpi ne, %31, %c0_i32_6 : i32
      %33 = "simt_step.if"(%32) ({
        %c124_i32 = arith.constant 124 : i32
        %36 = arith.addi %c124_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %37 = arith.muli %arg4, %c4_i32_11 : i32
          %38 = arith.addi %37, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %39 = arith.addi %c128_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_12 : i32
          "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %37 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%36#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %35:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_9 : i32
        %37 = arith.addi %36, %0 : i32
        %c148_i32 = arith.constant 148 : i32
        %38 = arith.addi %c148_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_10 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %39 = arith.muli %arg6, %c4_i32_12 : i32
          %40 = arith.addi %39, %0 : i32
          %c168_i32 = arith.constant 168 : i32
          %41 = arith.addi %c168_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
          "simt_step.condition"(%43, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %39 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %40 = arith.addi %arg6, %c1_i32_12 : i32
          %true_13 = arith.constant true
          "simt_step.continue"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %37 = arith.addi %arg3, %36#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        %true_11 = arith.constant true
        "simt_step.yield"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

