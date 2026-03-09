module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c2_i32 = arith.constant 2 : i32
      %1 = arith.remsi %arg3, %c2_i32 : i32
      %2 = "simt_step.switch"(%1, %arg0) ({
      ^bb0(%arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32_7 : i32
          %15 = arith.cmpi slt, %arg8, %14 : i32
          "simt_step.condition"(%15, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c2_i32_6 = arith.constant 2 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %13 = arith.addi %arg8, %c1_i32_7 : i32
          "simt_step.yield"(%c2_i32_6, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c2_i32_4 = arith.constant 2 : i32
        %10 = arith.remsi %arg3, %c2_i32_4 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %11 = arith.addi %arg0, %c4_i32_5 : i32
        %12 = "simt_step.switch"(%10, %11) ({
        ^bb0(%arg7: i32):
          %c3_i32 = arith.constant 3 : i32
          %13 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.muli %arg5, %c4_i32 : i32
      %5 = arith.addi %c0_i32_1, %4 : i32
      %6 = arith.addi %5, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%2, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_8 : i32
        %22 = arith.addi %21, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %23 = arith.addi %c12_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_9 : i32
        "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c32_i32 = arith.constant 32 : i32
        %21 = arith.addi %c32_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %23 = simt_step.subgroup_id
        %24 = arith.index_cast %23 : index to i32
        %25 = "simt_step.switch"(%22, %24) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c16_i32 = arith.constant 16 : i32
        %26 = arith.addi %c16_i32, %0 : i32
        %true_9 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %28 = arith.addi %arg2, %25 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg3, %c1_i32 : i32
        %true_10 = arith.constant true
        %c32_i32_11 = arith.constant 32 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %30 = arith.muli %arg3, %c4_i32_12 : i32
        %31 = arith.addi %c32_i32_11, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_13 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) : (i32) -> ()
    }, {
      %c36_i32 = arith.constant 36 : i32
      %20 = arith.addi %c36_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
      %23 = "simt_step.if"(%22) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %27 = arith.muli %arg3, %c4_i32_10 : i32
          %28 = arith.addi %27, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %29 = arith.addi %c40_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_11 : i32
          "simt_step.condition"(%31, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %27 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg3, %c1_i32 : i32
          %true_10 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %29 = arith.muli %arg3, %c4_i32_11 : i32
          %30 = arith.addi %c48_i32, %29 : i32
          %31 = arith.addi %30, %0 : i32
          %true_12 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %27 = arith.muli %arg3, %c4_i32_10 : i32
          %28 = arith.addi %27, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %29 = arith.addi %c60_i32, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_11 : i32
          "simt_step.condition"(%31, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %27 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg3, %c1_i32 : i32
          %true_10 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %29 = arith.muli %arg3, %c4_i32_11 : i32
          %30 = arith.addi %c64_i32, %29 : i32
          %31 = arith.addi %30, %0 : i32
          %true_12 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) : (i32) -> ()
      }) : (i1) -> i32
      %c80_i32 = arith.constant 80 : i32
      %24 = arith.addi %c80_i32, %0 : i32
      %true_7 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c96_i32 = arith.constant 96 : i32
    %10 = arith.addi %c96_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_6 : i32
      %21 = arith.addi %20, %0 : i32
      %c80_i32 = arith.constant 80 : i32
      %22 = arith.addi %c80_i32, %21 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_7 : i32
      "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %20 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      %true_6 = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %22 = arith.muli %arg3, %c4_i32_7 : i32
      %23 = arith.addi %c112_i32, %22 : i32
      %24 = arith.addi %23, %0 : i32
      %true_8 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c100_i32 = arith.constant 100 : i32
    %13 = arith.addi %c100_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %15 = simt_step.subgroup_id
    %16 = arith.index_cast %15 : index to i32
    %17 = "simt_step.switch"(%14, %16) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_10 : i32
        %29 = arith.addi %28, %0 : i32
        %c104_i32 = arith.constant 104 : i32
        %30 = arith.addi %c104_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_11 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %arg4 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32_10 : i32
        %true_11 = arith.constant true
        "simt_step.continue"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c124_i32 = arith.constant 124 : i32
      %23 = arith.addi %c124_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %25 = arith.addi %0, %c1_i32 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c128_i32_10 = arith.constant 128 : i32
        %28 = arith.addi %c128_i32_10, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_11 : i32
        %31 = "simt_step.if"(%30) ({
          %c1_i32_14 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_14) : (i32) -> ()
        }, {
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_14 : i32
          %36 = arith.addi %35, %0 : i32
          %c132_i32 = arith.constant 132 : i32
          %37 = arith.addi %c132_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_15 : i32
          "simt_step.condition"(%39, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %35 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %36 = arith.addi %arg5, %c1_i32_14 : i32
          %true_15 = arith.constant true
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb3(%27: i32):  // no predecessors
      %c4_i32_9 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_9) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c128_i32 = arith.constant 128 : i32
    %18 = arith.addi %c128_i32, %0 : i32
    %true_5 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

