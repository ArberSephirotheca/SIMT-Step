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
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %3:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32_5 : i32
        %8 = arith.cmpi slt, %arg7, %7 : i32
        "simt_step.condition"(%8, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %11 = arith.addi %10, %c1_i32_8 : i32
          %12 = arith.cmpi slt, %arg9, %11 : i32
          "simt_step.condition"(%12, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %c2_i32 = arith.constant 2 : i32
          %10 = arith.addi %arg0, %c2_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %11 = arith.addi %arg9, %c1_i32_8 : i32
          "simt_step.yield"(%10, %11) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %7 = simt_step.subgroup_id
        %8 = arith.index_cast %7 : index to i32
        %c1_i32_7 = arith.constant 1 : i32
        %9 = arith.addi %arg7, %c1_i32_7 : i32
        "simt_step.break"(%6#0, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c0_i32_4 = arith.constant 0 : i32
      %4 = arith.addi %arg0, %c0_i32_4 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%3#0, %5) : (i32, i32) -> ()
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
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %18 = arith.addi %c12_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %20 = "simt_step.switch"(%19, %c0_i32_3) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_12 : i32
          %43 = arith.addi %42, %0 : i32
          %c16_i32_13 = arith.constant 16 : i32
          %44 = arith.addi %c16_i32_13, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_14 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%36#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %38 = arith.addi %c36_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_11 : i32
        %41 = "simt_step.if"(%40) ({
          %c4_i32_12 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_12) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %22 = arith.addi %c40_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_5 : i32
      %25 = "simt_step.if"(%24) ({
        %c44_i32 = arith.constant 44 : i32
        %35 = arith.addi %c44_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
        %38 = "simt_step.if"(%37) ({
          %c0_i32_9 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c3_i32_8 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_8) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %27 = arith.addi %c48_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = "simt_step.switch"(%28, %0) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c52_i32 = arith.constant 52 : i32
        %36 = arith.addi %c52_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = "simt_step.switch"(%37, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c1_i32_9 = arith.constant 1 : i32
          %43 = arith.addi %0, %c1_i32_9 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %31 = arith.addi %c56_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_7 : i32
      %34 = "simt_step.if"(%33) ({
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_11 : i32
          %37 = arith.addi %36, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %38 = arith.addi %c60_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_12 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%35#0) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %35 = arith.addi %c80_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %37 = "simt_step.switch"(%36, %c1_i32) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c3_i32_9 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32_9 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %c84_i32 = arith.constant 84 : i32
    %12 = arith.addi %c84_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
    %15 = "simt_step.if"(%14) ({
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c88_i32 = arith.constant 88 : i32
      %18 = arith.addi %c88_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = simt_step.subgroup_id
      %21 = arith.index_cast %20 : index to i32
      %22 = "simt_step.switch"(%19, %21) ({
      ^bb0(%arg2: i32):
        %c92_i32 = arith.constant 92 : i32
        %23 = arith.addi %c92_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %25 = "simt_step.switch"(%24, %c1_i32) ({
        ^bb0(%arg3: i32):
          %c3_i32_6 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_6) {fallthrough = false} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c1_i32_7 = arith.constant 1 : i32
          %32 = arith.addi %0, %c1_i32_7 : i32
          "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          %34 = arith.addi %0, %c0_i32_8 : i32
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %27 = arith.addi %c96_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %29 = arith.addi %0, %c2_i32 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg3: i32):
          %c0_i32_6 = arith.constant 0 : i32
          %31 = arith.addi %0, %c0_i32_6 : i32
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) {fallthrough = true} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%22) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %16 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

