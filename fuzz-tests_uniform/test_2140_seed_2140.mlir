module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %c1_i32_5 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_5) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }) : (i1) -> i32
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c1_i32 = arith.constant 1 : i32
      %9 = "simt_step.switch"(%arg3, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_11 : i32
          %22 = arith.cmpi slt, %arg7, %21 : i32
          "simt_step.condition"(%22, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c2_i32_10 = arith.constant 2 : i32
          %20 = arith.addi %arg0, %c2_i32_10 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %21 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.yield"(%20, %21) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_6 = arith.constant 1 : i32
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %c2_i32_7 = arith.constant 2 : i32
        %17 = arith.remsi %arg3, %c2_i32_7 : i32
        %c2_i32_8 = arith.constant 2 : i32
        %18 = arith.addi %arg0, %c2_i32_8 : i32
        %19 = "simt_step.switch"(%17, %18) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c1_i32_10 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32_9 = arith.constant 1 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c3_i32_1 = arith.constant 3 : i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %12 = arith.remsi %arg3, %c2_i32 : i32
      %c4_i32_2 = arith.constant 4 : i32
      %13 = "simt_step.switch"(%12, %c4_i32_2) ({
      ^bb0(%arg5: i32):
        %c2_i32_4 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_4 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %16 = "simt_step.switch"(%15, %c0_i32_5) ({
        ^bb0(%arg6: i32):
          %c0_i32_8 = arith.constant 0 : i32
          %20 = arith.addi %arg0, %c0_i32_8 : i32
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %22 = arith.addi %arg0, %c0_i32_9 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c2_i32_6 = arith.constant 2 : i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c2_i32_7 = arith.constant 2 : i32
        %18 = arith.addi %arg0, %c2_i32_7 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      %14 = arith.addi %arg0, %c4_i32_3 : i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_9 : i32
      %19 = arith.addi %18, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %20 = arith.addi %c8_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_10 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %21 = arith.muli %arg5, %c4_i32_12 : i32
        %22 = arith.addi %21, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %23 = arith.addi %c28_i32, %22 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_13 : i32
        "simt_step.condition"(%25, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c48_i32_12 = arith.constant 48 : i32
        %21 = arith.addi %c48_i32_12, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_13 : i32
        %24 = "simt_step.if"(%23) ({
          %27 = simt_step.subgroup_id
          %28 = arith.index_cast %27 : index to i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %c4_i32_15 = arith.constant 4 : i32
          %27 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        %25 = arith.addi %arg4, %24 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %26 = arith.addi %arg5, %c1_i32_14 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      %19 = arith.addi %arg2, %18#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.break"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %8 = arith.addi %c52_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %18 = arith.addi %c56_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %20 = "simt_step.switch"(%19, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %25 = arith.addi %c60_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %27 = "simt_step.switch"(%26, %0) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %30 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          %32 = arith.addi %0, %c4_i32_20 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c0_i32_21 = arith.constant 0 : i32
          %34 = arith.addi %0, %c0_i32_21 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %30 = arith.muli %arg5, %c4_i32_20 : i32
          %31 = arith.addi %30, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %32 = arith.addi %c64_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_21 : i32
          "simt_step.condition"(%34, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %30 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %31 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_16 : i32
        %26 = arith.addi %25, %0 : i32
        %c84_i32 = arith.constant 84 : i32
        %27 = arith.addi %c84_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_17 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c104_i32 = arith.constant 104 : i32
        %25 = arith.addi %c104_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %27 = "simt_step.switch"(%26, %c2_i32) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %c2_i32_17 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c3_i32_18 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb3(%32: i32):  // no predecessors
          %c4_i32_19 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %28 = arith.addi %arg3, %27 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c0_i32_13 = arith.constant 0 : i32
      %c0_i32_14 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_16 : i32
        %26 = arith.addi %25, %0 : i32
        %c108_i32 = arith.constant 108 : i32
        %27 = arith.addi %c108_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_17 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_15 = arith.constant true
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_5 = arith.constant 0 : i32
    %c0_i32_6 = arith.constant 0 : i32
    %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_9 : i32
      %19 = arith.addi %18, %0 : i32
      %c128_i32 = arith.constant 128 : i32
      %20 = arith.addi %c128_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_10 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_7 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %16 = arith.addi %c48_i32, %0 : i32
    %true_8 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

