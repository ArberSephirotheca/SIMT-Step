module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = "simt_step.switch"(%arg3, %arg0) ({
    ^bb0(%arg4: i32):
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%3: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_2 = arith.constant 1 : i32
        %6 = arith.addi %5, %c1_i32_2 : i32
        %7 = arith.cmpi slt, %arg6, %6 : i32
        "simt_step.condition"(%7, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %5:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32_6 : i32
          %10 = arith.cmpi slt, %arg8, %9 : i32
          "simt_step.condition"(%10, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c2_i32_6 = arith.constant 2 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %8 = arith.addi %arg8, %c1_i32_7 : i32
          "simt_step.continue"(%c2_i32_6, %8) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32_4 = arith.constant 2 : i32
        %6 = arith.addi %arg0, %c2_i32_4 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %7 = arith.addi %arg6, %c1_i32_5 : i32
        "simt_step.yield"(%5#0, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%4#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32, %arg0 : i32
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
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %21 = "simt_step.switch"(%20, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c16_i32_10 = arith.constant 16 : i32
        %27 = arith.addi %c16_i32_10, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %29 = "simt_step.switch"(%28, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c4_i32_19 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_19) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c0_i32_20 = arith.constant 0 : i32
          %37 = arith.addi %0, %c0_i32_20 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %c2_i32_21 = arith.constant 2 : i32
          %39 = arith.addi %0, %c2_i32_21 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          %c4_i32_22 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_19 : i32
          %37 = arith.addi %36, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %38 = arith.addi %c20_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_20 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c4_i32_15 = arith.constant 4 : i32
        %33 = arith.addi %0, %c4_i32_15 : i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb3(%34: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %36 = arith.muli %arg5, %c4_i32_19 : i32
          %37 = arith.addi %36, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %38 = arith.addi %c40_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_20 : i32
          "simt_step.condition"(%40, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %36 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_10 : i32
        %28 = arith.addi %27, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %29 = arith.addi %c60_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_11 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %27 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_10 : i32
        %28 = arith.addi %27, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %29 = arith.addi %c80_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_11 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %27 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      "simt_step.yield"(%25#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c100_i32 = arith.constant 100 : i32
    %12 = arith.addi %c100_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c104_i32 = arith.constant 104 : i32
      %19 = arith.addi %c104_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %21 = arith.addi %0, %c3_i32 : i32
      %22 = "simt_step.switch"(%20, %21) ({
      ^bb0(%arg3: i32):
        %c108_i32 = arith.constant 108 : i32
        %32 = arith.addi %c108_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_6 : i32
        %35 = "simt_step.if"(%34) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32_8 = arith.constant 3 : i32
          %40 = arith.addi %0, %c3_i32_8 : i32
          "simt_step.yield"(%40) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c112_i32 = arith.constant 112 : i32
        %37 = arith.addi %c112_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %39 = "simt_step.switch"(%38, %c1_i32) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %c2_i32_8 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c116_i32 = arith.constant 116 : i32
      %24 = arith.addi %c116_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
      %27 = "simt_step.if"(%26) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c4_i32_6 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_6) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c120_i32 = arith.constant 120 : i32
      %29 = arith.addi %c120_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = "simt_step.switch"(%30, %0) ({
      ^bb0(%arg3: i32):
        %c124_i32 = arith.constant 124 : i32
        %32 = arith.addi %c124_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %34 = "simt_step.switch"(%33, %c2_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_7) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %17 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

