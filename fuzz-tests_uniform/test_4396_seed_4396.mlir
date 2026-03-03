module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_5 = arith.constant 1 : i32
          %8 = arith.addi %7, %c1_i32_5 : i32
          %9 = arith.cmpi slt, %arg5, %8 : i32
          "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %c1_i32_5 = arith.constant 1 : i32
          %7 = arith.addi %arg5, %c1_i32_5 : i32
          "simt_step.yield"(%arg0, %7) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%6#0) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %7 = "simt_step.if"(%6) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32 = arith.constant 4 : i32
        %8 = arith.addi %arg0, %c4_i32 : i32
        "simt_step.yield"(%7) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.addi %arg0, %c3_i32 : i32
      %5 = "simt_step.switch"(%arg3, %4) ({
      ^bb0(%arg4: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32 : i32
          %13 = arith.cmpi slt, %arg6, %12 : i32
          "simt_step.condition"(%13, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %11 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%arg0, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_3 = arith.constant 3 : i32
        "simt_step.yield"(%8#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %10 = "simt_step.switch"(%arg3, %c2_i32) ({
        ^bb0(%arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %6 = simt_step.subgroup_id
      %7 = arith.index_cast %6 : index to i32
      "simt_step.yield"(%5) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %5 = arith.addi %0, %c4_i32_0 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_10 : i32
        %29 = arith.addi %28, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %30 = arith.addi %c12_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_11 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32_10 = arith.constant 32 : i32
        %28 = arith.addi %c32_i32_10, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_11 : i32
        %31 = "simt_step.if"(%30) ({
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %32 = arith.addi %arg3, %31 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %21 = arith.addi %c36_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %23 = "simt_step.switch"(%22, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %30 = arith.addi %c40_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %32 = arith.addi %0, %c0_i32_10 : i32
        %33 = "simt_step.switch"(%31, %32) ({
        ^bb0(%arg4: i32):
          %c2_i32_18 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          %39 = arith.addi %0, %c1_i32_19 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c2_i32_20 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_20) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %c1_i32_21 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_18 : i32
          %39 = arith.addi %38, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %40 = arith.addi %c44_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_19 : i32
          "simt_step.condition"(%42, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %38 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %39 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%36: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_18 : i32
          %39 = arith.addi %38, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %40 = arith.addi %c64_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_19 : i32
          "simt_step.condition"(%42, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %38 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %39 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %25 = arith.addi %c84_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_8 = arith.constant 2 : i32
      %27 = "simt_step.switch"(%26, %c2_i32_8) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_16 : i32
          %32 = arith.addi %31, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %33 = arith.addi %c88_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_17 : i32
          "simt_step.condition"(%35, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %31 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_16 : i32
          %32 = arith.addi %31, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %33 = arith.addi %c108_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_17 : i32
          "simt_step.condition"(%35, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %31 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_15 = arith.constant true
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %11 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c128_i32 = arith.constant 128 : i32
    %13 = arith.addi %c128_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %15 = arith.addi %0, %c2_i32 : i32
    %16 = "simt_step.switch"(%14, %15) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c132_i32 = arith.constant 132 : i32
      %20 = arith.addi %c132_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_4 : i32
      %23 = "simt_step.if"(%22) ({
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %29 = arith.muli %arg4, %c4_i32_14 : i32
          %30 = arith.addi %29, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %31 = arith.addi %c136_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_15 : i32
          "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %29 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %30 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%28#0) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_11 : i32
        %29 = arith.addi %28, %0 : i32
        %c156_i32 = arith.constant 156 : i32
        %30 = arith.addi %c156_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_12 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_11 : i32
        %29 = arith.addi %28, %0 : i32
        %c176_i32 = arith.constant 176 : i32
        %30 = arith.addi %c176_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_12 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c2_i32_11 = arith.constant 2 : i32
        %28 = arith.addi %0, %c2_i32_11 : i32
        %29 = arith.addi %arg3, %28 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%27#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %17 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

