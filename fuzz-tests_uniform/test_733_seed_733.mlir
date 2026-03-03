module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %3 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %3, %c1_i32 : i32
      %5 = arith.cmpi slt, %arg5, %4 : i32
      "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c2_i32 = arith.constant 2 : i32
      %3 = arith.remsi %arg3, %c2_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = "simt_step.switch"(%3, %c1_i32) ({
      ^bb0(%arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %7 = arith.addi %arg0, %c0_i32_3 : i32
        %8 = "simt_step.switch"(%arg3, %7) ({
        ^bb0(%arg7: i32):
          %c3_i32_8 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32_8 : i32
          %15 = arith.cmpi slt, %arg8, %14 : i32
          "simt_step.condition"(%15, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c2_i32_8 = arith.constant 2 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %13 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.continue"(%c2_i32_8, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_6 = arith.constant 2 : i32
        "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%11: i32):  // no predecessors
        %c1_i32_7 = arith.constant 1 : i32
        %12 = arith.addi %arg0, %c1_i32_7 : i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %5 = arith.addi %arg0, %c3_i32 : i32
      %c1_i32_2 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32_2 : i32
      "simt_step.yield"(%4, %6) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_11 : i32
        %26 = arith.addi %25, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %27 = arith.addi %c12_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32_11 = arith.constant 32 : i32
        %25 = arith.addi %c32_i32_11, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %27 = arith.addi %0, %c0_i32_12 : i32
        %28 = "simt_step.switch"(%26, %27) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          %32 = arith.addi %0, %c2_i32_14 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %29 = arith.addi %arg3, %28 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %19 = arith.addi %c36_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_7 : i32
      %22 = "simt_step.if"(%21) ({
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }, {
        %c40_i32 = arith.constant 40 : i32
        %25 = arith.addi %c40_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %27 = "simt_step.switch"(%26, %c1_i32) ({
        ^bb0(%arg3: i32):
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb1(%28: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_11 : i32
        %26 = arith.addi %25, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %27 = arith.addi %c44_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c64_i32 = arith.constant 64 : i32
    %10 = arith.addi %c64_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %12 = arith.addi %0, %c2_i32 : i32
    %13 = "simt_step.switch"(%11, %12) ({
    ^bb0(%arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %17 = arith.addi %c68_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_4 = arith.constant 2 : i32
      %19 = arith.addi %0, %c2_i32_4 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_13 : i32
          %35 = arith.addi %34, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %36 = arith.addi %c72_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_14 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32_13 : i32
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %28 = arith.addi %c92_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %30 = arith.addi %0, %c0_i32_10 : i32
        %31 = "simt_step.switch"(%29, %30) ({
        ^bb0(%arg4: i32):
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c4_i32_12 = arith.constant 4 : i32
        %33 = arith.addi %0, %c4_i32_12 : i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %22 = arith.addi %c96_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
      %25 = "simt_step.if"(%24) ({
        %c100_i32 = arith.constant 100 : i32
        %26 = arith.addi %c100_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %28 = arith.addi %0, %c4_i32_7 : i32
        %29 = "simt_step.switch"(%27, %28) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c4_i32_9 = arith.constant 4 : i32
          %31 = arith.addi %0, %c4_i32_9 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c104_i32 = arith.constant 104 : i32
        %26 = arith.addi %c104_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = "simt_step.switch"(%27, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%30: i32):  // no predecessors
          %c3_i32_8 = arith.constant 3 : i32
          %31 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %0 : i32
    %true_3 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

