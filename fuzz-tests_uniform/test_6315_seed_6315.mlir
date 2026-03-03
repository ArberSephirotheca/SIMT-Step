module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %14 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %14, %c1_i32 : i32
      %16 = arith.cmpi slt, %arg5, %15 : i32
      "simt_step.condition"(%16, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = "simt_step.if"(%3) ({
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) : (i32) -> ()
    }) : (i1) -> i32
    %true_3 = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %8 = arith.select %7, %0#0, %4 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %c0_i32_6 = arith.constant 0 : i32
    %9:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %14 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %14, %c1_i32 : i32
      %16 = arith.cmpi slt, %arg5, %15 : i32
      "simt_step.condition"(%16, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_9 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
      %15 = "simt_step.if"(%14) ({
        %c3_i32 = arith.constant 3 : i32
        %18 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %19 = "simt_step.switch"(%18, %c1_i32_11) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %22 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %c3_i32_12 = arith.constant 3 : i32
        "simt_step.yield"(%19) : (i32) -> ()
      }, {
        %18 = simt_step.subgroup_id
        %19 = arith.index_cast %18 : index to i32
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg0, %c1_i32 : i32
      %c1_i32_10 = arith.constant 1 : i32
      %17 = arith.addi %arg5, %c1_i32_10 : i32
      "simt_step.yield"(%15, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_7 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_8 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
    %13 = arith.select %12, %8, %9#0 : i32
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
    %c1_i32 = arith.constant 1 : i32
    %5 = arith.addi %0, %c1_i32 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_5 : i32
      %15 = arith.addi %14, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %16 = arith.addi %c8_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_6 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %14 = arith.addi %c28_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_5 : i32
      %17 = "simt_step.if"(%16) ({
        %c32_i32 = arith.constant 32 : i32
        %20 = arith.addi %c32_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = simt_step.subgroup_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %20 = arith.addi %c36_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_7 : i32
        %23 = "simt_step.if"(%22) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }) : (i1) -> i32
      %18 = arith.addi %arg2, %17 : i32
      %c1_i32_6 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32_6 : i32
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %7 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c40_i32 = arith.constant 40 : i32
    %9 = arith.addi %c40_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %11 = "simt_step.switch"(%10, %0) ({
    ^bb0(%arg2: i32):
      %c44_i32 = arith.constant 44 : i32
      %14 = arith.addi %c44_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %16 = "simt_step.switch"(%15, %0) ({
      ^bb0(%arg3: i32):
        %c1_i32_14 = arith.constant 1 : i32
        %25 = arith.addi %0, %c1_i32_14 : i32
        "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_21 : i32
          %35 = arith.addi %34, %0 : i32
          %c48_i32_22 = arith.constant 48 : i32
          %36 = arith.addi %c48_i32_22, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_23 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32_21 : i32
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%27#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %29 = arith.addi %c68_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_18 = arith.constant 4 : i32
        %31 = "simt_step.switch"(%30, %c4_i32_18) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c0_i32_21 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_21) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb3(%36: i32):  // no predecessors
          %c4_i32_22 = arith.constant 4 : i32
          %37 = arith.addi %0, %c4_i32_22 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
      ^bb3(%32: i32):  // no predecessors
        %c0_i32_20 = arith.constant 0 : i32
        %33 = arith.addi %0, %c0_i32_20 : i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %18 = arith.addi %c72_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_6 = arith.constant 4 : i32
      %20 = "simt_step.switch"(%19, %c4_i32_6) ({
      ^bb0(%arg3: i32):
        %c76_i32 = arith.constant 76 : i32
        %25 = arith.addi %c76_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_14 : i32
        %28 = "simt_step.if"(%27) ({
          %c0_i32_15 = arith.constant 0 : i32
          %30 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_14 : i32
        %26 = arith.addi %25, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %27 = arith.addi %c80_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_15 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32_14 : i32
        "simt_step.continue"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_14 : i32
        %26 = arith.addi %25, %0 : i32
        %c100_i32 = arith.constant 100 : i32
        %27 = arith.addi %c100_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_15 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %25 = arith.addi %arg3, %arg4 : i32
        %c1_i32_14 = arith.constant 1 : i32
        %26 = arith.addi %arg4, %c1_i32_14 : i32
        "simt_step.yield"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %12 = arith.addi %c64_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

