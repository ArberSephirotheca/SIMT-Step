module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %8 = arith.addi %7, %c1_i32_4 : i32
          %9 = arith.cmpi slt, %arg5, %8 : i32
          "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %c1_i32_4 = arith.constant 1 : i32
          %7 = arith.addi %arg5, %c1_i32_4 : i32
          "simt_step.break"(%arg0, %7) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%6#0) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %6 = arith.remsi %arg3, %c3_i32 : i32
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.addi %arg0, %c4_i32 : i32
        %8 = "simt_step.switch"(%6, %7) ({
        ^bb0(%arg4: i32):
          %c3_i32_2 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_2) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %c4_i32_3 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_3) {fallthrough = false} : (i32) -> ()
        ^bb2(%12: i32):  // no predecessors
          %c4_i32_4 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb3(%13: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %9 = simt_step.lane_id
        %10 = arith.index_cast %9 : index to i32
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %4 = arith.remsi %arg3, %c2_i32 : i32
      %5 = simt_step.subgroup_id
      %6 = arith.index_cast %5 : index to i32
      %7 = "simt_step.switch"(%4, %6) ({
      ^bb0(%arg4: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %9 = "simt_step.if"(%8) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_2 = arith.constant 4 : i32
        %10 = arith.addi %arg0, %c4_i32_2 : i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32 : i32
        %13 = "simt_step.switch"(%12, %arg0) ({
        ^bb0(%arg5: i32):
          %c4_i32_4 = arith.constant 4 : i32
          %17 = arith.addi %arg0, %c4_i32_4 : i32
          "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %c0_i32_5 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_5) {fallthrough = true} : (i32) -> ()
        ^bb3(%20: i32):  // no predecessors
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c3_i32_3 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32_3 : i32
        %16 = "simt_step.switch"(%15, %arg0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_4) {fallthrough = true} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          %19 = arith.addi %arg0, %c4_i32_5 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c4_i32 = arith.constant 4 : i32
      "simt_step.yield"(%7) : (i32) -> ()
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
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_14 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_14 : i32
      %22 = arith.addi %21, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %23 = arith.addi %c8_i32, %22 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_15 : i32
      "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %21 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_3 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_14 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_14 : i32
      %22 = arith.addi %21, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %23 = arith.addi %c28_i32, %22 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_15 : i32
      "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %21 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_6 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_7 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_8 = arith.constant 0 : i32
    %c0_i32_9 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_14 = arith.constant 4 : i32
      %21 = arith.muli %arg3, %c4_i32_14 : i32
      %22 = arith.addi %21, %0 : i32
      %c48_i32_15 = arith.constant 48 : i32
      %23 = arith.addi %c48_i32_15, %22 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_16 = arith.constant 0 : i32
      %25 = arith.cmpi ne, %24, %c0_i32_16 : i32
      "simt_step.condition"(%25, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %21 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %22 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%21, %22) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_10 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %12 = arith.addi %c48_i32, %0 : i32
    %true_11 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %14 = arith.addi %c68_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %16 = simt_step.lane_id
    %17 = arith.index_cast %16 : index to i32
    %18 = "simt_step.switch"(%15, %17) ({
    ^bb0(%arg2: i32):
      %c72_i32 = arith.constant 72 : i32
      %21 = arith.addi %c72_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %23 = arith.addi %0, %c2_i32 : i32
      %24 = "simt_step.switch"(%22, %23) ({
      ^bb0(%arg3: i32):
        %c76_i32 = arith.constant 76 : i32
        %35 = arith.addi %c76_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_17 : i32
        %38 = "simt_step.if"(%37) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c2_i32_19 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %40 = arith.addi %c80_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_18 : i32
        %43 = "simt_step.if"(%42) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_19 = arith.constant 4 : i32
          %44 = arith.addi %0, %c4_i32_19 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_14 = arith.constant true
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %26 = arith.addi %c84_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %28 = arith.addi %0, %c1_i32 : i32
      %29 = "simt_step.switch"(%27, %28) ({
      ^bb0(%arg3: i32):
        %c88_i32 = arith.constant 88 : i32
        %35 = arith.addi %c88_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_17 : i32
        %38 = "simt_step.if"(%37) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c4_i32_20 = arith.constant 4 : i32
          %44 = arith.addi %0, %c4_i32_20 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %40 = arith.addi %c92_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_18 = arith.constant 2 : i32
        %42 = arith.addi %0, %c2_i32_18 : i32
        %43 = "simt_step.switch"(%41, %42) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %45 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %c2_i32_20 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_15 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %31 = arith.addi %c96_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_16 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_16 : i32
      %34 = "simt_step.if"(%33) ({
        %c4_i32_17 = arith.constant 4 : i32
        %35 = arith.addi %0, %c4_i32_17 : i32
        "simt_step.yield"(%35) : (i32) -> ()
      }, {
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_20 : i32
          %37 = arith.addi %36, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %38 = arith.addi %c100_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_21 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32_20 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        "simt_step.yield"(%35#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_12 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %19 = arith.addi %c64_i32, %0 : i32
    %true_13 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

