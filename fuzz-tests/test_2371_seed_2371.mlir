module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %2 = simt_step.subgroup_id
    %3 = arith.index_cast %2 : index to i32
    %4 = "simt_step.switch"(%arg3, %3) ({
    ^bb0(%arg4: i32):
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %13 = arith.addi %arg0, %c0_i32_3 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %6 = arith.select %5, %0, %4 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %8 = "simt_step.if"(%7) ({
      %c0_i32_3 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %12 = "simt_step.if"(%11) ({
        %true_4 = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %14 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %13 = arith.remsi %arg3, %c2_i32 : i32
        %14 = simt_step.lane_id
        %15 = arith.index_cast %14 : index to i32
        %16 = "simt_step.switch"(%13, %15) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%12) : (i32) -> ()
    }, {
      %c4_i32 = arith.constant 4 : i32
      %11 = "simt_step.switch"(%arg3, %c4_i32) ({
      ^bb0(%arg4: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32_3 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %13 = "simt_step.switch"(%12, %c0_i32_4) ({
        ^bb0(%arg5: i32):
          %c0_i32_5 = arith.constant 0 : i32
          %17 = arith.addi %arg0, %c0_i32_5 : i32
          "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %c2_i32_6 = arith.constant 2 : i32
          %20 = arith.addi %arg0, %c2_i32_6 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb3(%21: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32 : i32
        %c2_i32 = arith.constant 2 : i32
        %16 = "simt_step.switch"(%15, %c2_i32) ({
        ^bb0(%arg5: i32):
          %c3_i32_5 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_5) {fallthrough = true} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %10 = arith.select %9, %6, %8 : i32
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
    %7 = "simt_step.switch"(%6, %c0_i32_0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %20 = "simt_step.switch"(%19, %c0_i32_6) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %30 = arith.addi %c16_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_9 : i32
        %33 = "simt_step.if"(%32) ({
          %c2_i32 = arith.constant 2 : i32
          %43 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %35 = arith.addi %c20_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        %38 = "simt_step.if"(%37) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %40 = arith.addi %c24_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = "simt_step.switch"(%41, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %22 = arith.addi %c28_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %24 = "simt_step.switch"(%23, %c0_i32_7) ({
      ^bb0(%arg3: i32):
        %c32_i32_9 = arith.constant 32 : i32
        %30 = arith.addi %c32_i32_9, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %32 = "simt_step.switch"(%31, %c3_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %34 = arith.addi %c36_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %0, %c1_i32 : i32
        %37 = "simt_step.switch"(%35, %36) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %40 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_13 : i32
          %41 = arith.addi %40, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %42 = arith.addi %c40_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_14 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32_13 : i32
          %true_14 = arith.constant true
          "simt_step.continue"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c60_i32 = arith.constant 60 : i32
      %26 = arith.addi %c60_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_8 : i32
      %29 = "simt_step.if"(%28) ({
        %c64_i32 = arith.constant 64 : i32
        %30 = arith.addi %c64_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%32) : (i32) -> ()
      }, {
        %c4_i32_9 = arith.constant 4 : i32
        %30 = arith.addi %0, %c4_i32_9 : i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %8 = arith.addi %c32_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_6 : i32
      %19 = arith.addi %18, %0 : i32
      %c68_i32 = arith.constant 68 : i32
      %20 = arith.addi %c68_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_7 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c88_i32 = arith.constant 88 : i32
      %18 = arith.addi %c88_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %0, %c1_i32 : i32
      %21 = "simt_step.switch"(%19, %20) ({
      ^bb0(%arg4: i32):
        %c92_i32 = arith.constant 92 : i32
        %30 = arith.addi %c92_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %32 = arith.addi %0, %c0_i32_12 : i32
        %33 = "simt_step.switch"(%31, %32) ({
        ^bb0(%arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          %41 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %35 = arith.addi %c96_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %37 = arith.addi %0, %c3_i32 : i32
        %38 = "simt_step.switch"(%36, %37) ({
        ^bb0(%arg5: i32):
          %c0_i32_13 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c1_i32_14 = arith.constant 1 : i32
          %41 = arith.addi %0, %c1_i32_14 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c48_i32 = arith.constant 48 : i32
      %22 = arith.addi %c48_i32, %0 : i32
      %true_7 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %24 = arith.addi %arg2, %21 : i32
      %c1_i32_8 = arith.constant 1 : i32
      %25 = arith.addi %arg3, %c1_i32_8 : i32
      %true_9 = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %c4_i32_10 = arith.constant 4 : i32
      %26 = arith.muli %arg3, %c4_i32_10 : i32
      %27 = arith.addi %c64_i32, %26 : i32
      %28 = arith.addi %27, %0 : i32
      %true_11 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24, %25) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c100_i32 = arith.constant 100 : i32
    %11 = arith.addi %c100_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.subgroup_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %18 = arith.addi %0, %c4_i32_6 : i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c104_i32 = arith.constant 104 : i32
      %20 = arith.addi %c104_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_7 : i32
      %23 = "simt_step.if"(%22) ({
        %c108_i32 = arith.constant 108 : i32
        %26 = arith.addi %c108_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %28 = "simt_step.switch"(%27, %c0_i32_9) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) {fallthrough = true} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %32 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c4_i32_9 = arith.constant 4 : i32
        %26 = arith.addi %0, %c4_i32_9 : i32
        "simt_step.yield"(%26) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %25 = arith.addi %0, %c0_i32_8 : i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c80_i32 = arith.constant 80 : i32
    %16 = arith.addi %c80_i32, %0 : i32
    %true_5 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

