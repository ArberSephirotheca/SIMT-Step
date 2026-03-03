module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_2 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %7 = "simt_step.if"(%6) ({
          %10 = simt_step.subgroup_id
          %11 = arith.index_cast %10 : index to i32
          "simt_step.yield"(%11) : (i32) -> ()
        }, {
          %c1_i32_3 = arith.constant 1 : i32
          %10 = arith.addi %arg0, %c1_i32_3 : i32
          "simt_step.yield"(%10) : (i32) -> ()
        }) : (i1) -> i32
        %8 = simt_step.subgroup_id
        %9 = arith.index_cast %8 : index to i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %7 = simt_step.subgroup_id
        %8 = arith.index_cast %7 : index to i32
        %9 = "simt_step.switch"(%6, %8) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%11: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb3(%12: i32):  // no predecessors
          %c4_i32_2 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_2) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg5, %8 : i32
        "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.break"(%c0_i32_3, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %5 = simt_step.subgroup_id
      %6 = arith.index_cast %5 : index to i32
      "simt_step.yield"(%4#0) : (i32) -> ()
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
      %c0_i32_9 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_9 : i32
      %21 = "simt_step.if"(%20) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c16_i32_14 = arith.constant 16 : i32
        %32 = arith.addi %c16_i32_14, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %34 = arith.addi %0, %c3_i32 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg3: i32):
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %23 = arith.addi %c20_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %25 = "simt_step.switch"(%24, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %32 = arith.addi %c24_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_14 : i32
        %35 = "simt_step.if"(%34) ({
          %c0_i32_16 = arith.constant 0 : i32
          %41 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %38 = arith.addi %c28_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %40 = "simt_step.switch"(%39, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c32_i32_11 = arith.constant 32 : i32
      %27 = arith.addi %c32_i32_11, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_12 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
      %30 = "simt_step.if"(%29) ({
        "simt_step.yield"(%0) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %32 = arith.addi %c36_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %34 = arith.cmpi ne, %33, %c0_i32_14 : i32
        %35 = "simt_step.if"(%34) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%35) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c4_i32_13 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_9 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_9 : i32
      %19 = arith.addi %18, %0 : i32
      %c40_i32 = arith.constant 40 : i32
      %20 = arith.addi %c40_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_10 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.break"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
      %c60_i32 = arith.constant 60 : i32
      %20 = arith.addi %c60_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_10 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c80_i32 = arith.constant 80 : i32
      %18 = arith.addi %c80_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg4: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_13 : i32
          %27 = arith.addi %26, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %28 = arith.addi %c84_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_14 : i32
          "simt_step.condition"(%30, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %26 = arith.addi %arg5, %arg6 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %27 = arith.addi %arg6, %c1_i32_13 : i32
          "simt_step.yield"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %25 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      %21 = arith.addi %arg2, %20 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%21, %22) : (i32, i32) -> ()
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

