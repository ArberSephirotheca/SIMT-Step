module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %18 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %18, %c1_i32 : i32
      %20 = arith.cmpi slt, %arg5, %19 : i32
      "simt_step.condition"(%20, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%arg0, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %c3_i32, %0#0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %18 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %18, %c1_i32 : i32
      %20 = arith.cmpi slt, %arg5, %19 : i32
      "simt_step.condition"(%20, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%c4_i32, %18) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %7 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_6 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
    %9 = arith.select %8, %4, %5#0 : i32
    %c3_i32_7 = arith.constant 3 : i32
    %10 = arith.remsi %arg3, %c3_i32_7 : i32
    %11 = simt_step.lane_id
    %12 = arith.index_cast %11 : index to i32
    %13 = "simt_step.switch"(%10, %12) ({
    ^bb0(%arg4: i32):
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %27 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %27, %c1_i32 : i32
        %29 = arith.cmpi slt, %arg6, %28 : i32
        "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %30 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %31 = arith.addi %30, %c1_i32_19 : i32
          %32 = arith.cmpi slt, %arg8, %31 : i32
          "simt_step.condition"(%32, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %30 = arith.addi %arg8, %c1_i32_19 : i32
          "simt_step.yield"(%c4_i32, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %28 = arith.addi %arg0, %c1_i32 : i32
        %c1_i32_18 = arith.constant 1 : i32
        %29 = arith.addi %arg6, %c1_i32_18 : i32
        "simt_step.yield"(%27#0, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c0_i32_12 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
      %21 = "simt_step.if"(%20) ({
        %c3_i32_16 = arith.constant 3 : i32
        %27 = arith.remsi %arg3, %c3_i32_16 : i32
        %28 = "simt_step.switch"(%27, %arg0) ({
        ^bb0(%arg5: i32):
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c3_i32_18 = arith.constant 3 : i32
          %32 = arith.addi %arg0, %c3_i32_18 : i32
          "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          %c0_i32_19 = arith.constant 0 : i32
          %34 = arith.addi %arg0, %c0_i32_19 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %29 = arith.addi %arg0, %c0_i32_17 : i32
        "simt_step.yield"(%28) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %27 = arith.remsi %arg3, %c2_i32 : i32
        %c4_i32 = arith.constant 4 : i32
        %28 = arith.addi %arg0, %c4_i32 : i32
        %29 = "simt_step.switch"(%27, %28) ({
        ^bb0(%arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %30 = arith.addi %arg0, %c4_i32_16 : i32
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32_13 = arith.constant 3 : i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c3_i32_14 = arith.constant 3 : i32
      %23 = arith.remsi %arg3, %c3_i32_14 : i32
      %24 = "simt_step.switch"(%23, %arg0) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %arg2, %c0_i32_16 : i32
        %29 = "simt_step.if"(%28) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %32 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32 : i32
          %34 = arith.cmpi slt, %arg7, %33 : i32
          "simt_step.condition"(%34, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%arg0, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c3_i32_20 = arith.constant 3 : i32
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c3_i32_15 = arith.constant 3 : i32
      %25 = arith.addi %arg0, %c3_i32_15 : i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_8 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_9 = arith.constant 0 : i32
    %16 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
    %17 = arith.select %16, %9, %13 : i32
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
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_12 : i32
        %31 = arith.addi %30, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %32 = arith.addi %c12_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_13 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %30 = arith.addi %c32_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %36 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %33 = arith.addi %arg3, %32 : i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_7 = arith.constant true
      "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c4_i32_8 = arith.constant 4 : i32
      %27 = arith.addi %0, %c4_i32_8 : i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_12 : i32
        %31 = arith.addi %30, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %32 = arith.addi %c36_i32, %31 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_13 : i32
        "simt_step.condition"(%34, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %30 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %10 = arith.addi %c48_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c56_i32 = arith.constant 56 : i32
    %12 = arith.addi %c56_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %24 = arith.addi %0, %c0_i32_5 : i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %26:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_11 : i32
        %33 = arith.addi %32, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %34 = arith.addi %c60_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_12 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %32 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c80_i32_9 = arith.constant 80 : i32
      %28 = arith.addi %c80_i32_9, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_10 : i32
      %31 = "simt_step.if"(%30) ({
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_14 : i32
          %34 = arith.addi %33, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %35 = arith.addi %c84_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_15 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.break"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%32#0) : (i32) -> ()
      }, {
        %c104_i32 = arith.constant 104 : i32
        %32 = arith.addi %c104_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %34 = arith.addi %0, %c0_i32_11 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg3: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.addi %0, %c4_i32_13 : i32
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %17 = arith.addi %c64_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c108_i32 = arith.constant 108 : i32
    %19 = arith.addi %c108_i32, %0 : i32
    %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
    %21 = "simt_step.switch"(%20, %0) ({
    ^bb0(%arg2: i32):
      %c112_i32 = arith.constant 112 : i32
      %24 = arith.addi %c112_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %26 = "simt_step.switch"(%25, %c1_i32) ({
      ^bb0(%arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %41 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %43 = arith.addi %c116_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_10 : i32
        %46 = "simt_step.if"(%45) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %48:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_15 : i32
          %54 = arith.addi %53, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %55 = arith.addi %c120_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_16 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32_15 : i32
          "simt_step.yield"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%48#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%49: i32):  // no predecessors
        %c140_i32 = arith.constant 140 : i32
        %50 = arith.addi %c140_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %52 = "simt_step.switch"(%51, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_15 = arith.constant 1 : i32
          %53 = arith.addi %0, %c1_i32_15 : i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %c3_i32_16 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c144_i32 = arith.constant 144 : i32
      %28 = arith.addi %c144_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_6 : i32
      %31 = "simt_step.if"(%30) ({
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }, {
        %c148_i32 = arith.constant 148 : i32
        %41 = arith.addi %c148_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = "simt_step.switch"(%42, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%32: i32):  // no predecessors
      %c152_i32 = arith.constant 152 : i32
      %33 = arith.addi %c152_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %35 = "simt_step.switch"(%34, %0) ({
      ^bb0(%arg3: i32):
        %c156_i32 = arith.constant 156 : i32
        %41 = arith.addi %c156_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %43 = arith.addi %0, %c4_i32_10 : i32
        %44 = "simt_step.switch"(%42, %43) ({
        ^bb0(%arg4: i32):
          %c2_i32_16 = arith.constant 2 : i32
          %58 = arith.addi %0, %c2_i32_16 : i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb2(%60: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
      ^bb1(%45: i32):  // no predecessors
        %c160_i32 = arith.constant 160 : i32
        %46 = arith.addi %c160_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %48 = "simt_step.switch"(%47, %c2_i32) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %60 = arith.addi %0, %c0_i32_17 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %50 = arith.addi %c164_i32, %0 : i32
        %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %52 = arith.addi %0, %c3_i32 : i32
        %53 = "simt_step.switch"(%51, %52) ({
        ^bb0(%arg4: i32):
          %c3_i32_16 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%53) {fallthrough = true} : (i32) -> ()
      ^bb3(%54: i32):  // no predecessors
        %c168_i32 = arith.constant 168 : i32
        %55 = arith.addi %c168_i32, %0 : i32
        %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_14 = arith.constant 4 : i32
        %57 = "simt_step.switch"(%56, %c4_i32_14) ({
        ^bb0(%arg4: i32):
          %c3_i32_16 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %c1_i32_17 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c172_i32 = arith.constant 172 : i32
      %37 = arith.addi %c172_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_8 = arith.constant 4 : i32
      %39 = arith.addi %0, %c4_i32_8 : i32
      %40 = "simt_step.switch"(%38, %39) ({
      ^bb0(%arg3: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %41 = arith.addi %0, %c4_i32_10 : i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c80_i32 = arith.constant 80 : i32
    %22 = arith.addi %c80_i32, %0 : i32
    %true_4 = arith.constant true
    %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

