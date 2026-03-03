module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.remsi %arg3, %c4_i32 : i32
      %c3_i32_2 = arith.constant 3 : i32
      %7 = "simt_step.switch"(%6, %c3_i32_2) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %11 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg0, %c1_i32 : i32
        %13 = "simt_step.switch"(%11, %12) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c2_i32_3 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_3 : i32
        %c3_i32_4 = arith.constant 3 : i32
        %16 = "simt_step.switch"(%15, %c3_i32_4) ({
        ^bb0(%arg5: i32):
          %c1_i32_6 = arith.constant 1 : i32
          %18 = arith.addi %arg0, %c1_i32_6 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c2_i32_7 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb2(%20: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          %21 = arith.addi %arg0, %c2_i32_8 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb3(%17: i32):  // no predecessors
        %c1_i32_5 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32_5) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %8 = simt_step.subgroup_id
      %9 = arith.index_cast %8 : index to i32
      "simt_step.yield"(%7) : (i32) -> ()
    }, {
      "simt_step.yield"(%arg0) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %c3_i32, %1 : i32
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_10 : i32
        %31 = arith.addi %30, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %32 = arith.addi %c12_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_11 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %30 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb3(%25: i32):  // no predecessors
      %c32_i32_8 = arith.constant 32 : i32
      %26 = arith.addi %c32_i32_8, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_9 : i32
      %29 = "simt_step.if"(%28) ({
        %c3_i32 = arith.constant 3 : i32
        %30 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%30) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c36_i32 = arith.constant 36 : i32
    %10 = arith.addi %c36_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = "simt_step.switch"(%11, %0) ({
    ^bb0(%arg2: i32):
      %c40_i32 = arith.constant 40 : i32
      %22 = arith.addi %c40_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %24 = "simt_step.switch"(%23, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_19 : i32
          %50 = arith.addi %49, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %51 = arith.addi %c44_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_20 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32_19 : i32
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %39 = arith.addi %c64_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %41 = arith.addi %0, %c2_i32 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          %50 = arith.addi %0, %c1_i32_19 : i32
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb2(%43: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_19 : i32
          %50 = arith.addi %49, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %51 = arith.addi %c68_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_20 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32_19 : i32
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%44#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %46 = arith.addi %c88_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %48 = "simt_step.switch"(%47, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_19 = arith.constant 0 : i32
          %49 = arith.addi %0, %c0_i32_19 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%51: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_18 = arith.constant true
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %26 = arith.addi %c92_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %28 = arith.addi %0, %c1_i32 : i32
      %29 = "simt_step.switch"(%27, %28) ({
      ^bb0(%arg3: i32):
        %c1_i32_11 = arith.constant 1 : i32
        %37 = arith.addi %0, %c1_i32_11 : i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_18 : i32
          %47 = arith.addi %46, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %48 = arith.addi %c96_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_19 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.break"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c3_i32_15 = arith.constant 3 : i32
        %41 = arith.addi %0, %c3_i32_15 : i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %43 = arith.addi %c116_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_16 = arith.constant 3 : i32
        %45 = "simt_step.switch"(%44, %c3_i32_16) ({
        ^bb0(%arg4: i32):
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c120_i32 = arith.constant 120 : i32
      %31 = arith.addi %c120_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_7 : i32
      %34 = "simt_step.if"(%33) ({
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_14 : i32
          %39 = arith.addi %38, %0 : i32
          %c124_i32 = arith.constant 124 : i32
          %40 = arith.addi %c124_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_15 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32_14 : i32
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%37#0) : (i32) -> ()
      }, {
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_14 : i32
          %39 = arith.addi %38, %0 : i32
          %c144_i32 = arith.constant 144 : i32
          %40 = arith.addi %c144_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_15 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32_14 : i32
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%37#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    ^bb3(%35: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %36:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_11 : i32
        %38 = arith.addi %37, %0 : i32
        %c164_i32 = arith.constant 164 : i32
        %39 = arith.addi %c164_i32, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_12 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %37 = arith.addi %arg3, %arg4 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32_11 : i32
        "simt_step.yield"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c184_i32 = arith.constant 184 : i32
    %15 = arith.addi %c184_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %17 = simt_step.lane_id
    %18 = arith.index_cast %17 : index to i32
    %19 = "simt_step.switch"(%16, %18) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_11 : i32
        %26 = arith.addi %25, %0 : i32
        %c188_i32 = arith.constant 188 : i32
        %27 = arith.addi %c188_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_11 : i32
        %26 = arith.addi %25, %0 : i32
        %c208_i32 = arith.constant 208 : i32
        %27 = arith.addi %c208_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %20 = arith.addi %c48_i32, %0 : i32
    %true_4 = arith.constant true
    %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

