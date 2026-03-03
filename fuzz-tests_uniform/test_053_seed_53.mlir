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
      %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %4 = "simt_step.if"(%3) ({
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.addi %arg0, %c4_i32 : i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %7 = arith.remsi %arg3, %c2_i32 : i32
        %8 = simt_step.lane_id
        %9 = arith.index_cast %8 : index to i32
        %10 = "simt_step.switch"(%7, %9) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %c1_i32_4 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb2(%12: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%10) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg0, %c1_i32 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %6 = arith.addi %arg5, %c1_i32_3 : i32
      "simt_step.break"(%4, %6) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_5 : i32
      %17 = arith.addi %16, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %16 = arith.addi %arg2, %arg3 : i32
      %c1_i32_5 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32_5 : i32
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c32_i32_5 = arith.constant 32 : i32
      %16 = arith.addi %c32_i32_5, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_6 : i32
      %19 = "simt_step.if"(%18) ({
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %27 = arith.addi %c36_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %29 = "simt_step.switch"(%28, %c2_i32) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %c1_i32_13 = arith.constant 1 : i32
          %32 = arith.addi %0, %c1_i32_13 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb3(%33: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %21:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_12 : i32
        %28 = arith.addi %27, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %29 = arith.addi %c40_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_13 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c60_i32 = arith.constant 60 : i32
        %27 = arith.addi %c60_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %29 = "simt_step.switch"(%28, %c3_i32) ({
        ^bb0(%arg5: i32):
          %c1_i32_14 = arith.constant 1 : i32
          %32 = arith.addi %0, %c1_i32_14 : i32
          "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          %34 = arith.addi %0, %c4_i32_15 : i32
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %30 = arith.addi %arg3, %29 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %31 = arith.addi %arg4, %c1_i32_13 : i32
        "simt_step.yield"(%30, %31) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %23 = arith.addi %c64_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_10 = arith.constant 4 : i32
      %25 = arith.addi %0, %c4_i32_10 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c68_i32 = arith.constant 68 : i32
        %27 = arith.addi %c68_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %29 = "simt_step.switch"(%28, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          %45 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %31 = arith.addi %c72_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %33 = "simt_step.switch"(%32, %c2_i32) ({
        ^bb0(%arg4: i32):
          %c2_i32_17 = arith.constant 2 : i32
          %43 = arith.addi %0, %c2_i32_17 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_18) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c76_i32 = arith.constant 76 : i32
        %35 = arith.addi %c76_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_14 : i32
        %38 = "simt_step.if"(%37) ({
          %c1_i32_17 = arith.constant 1 : i32
          %43 = arith.addi %0, %c1_i32_17 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %40 = arith.addi %c80_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_15 = arith.constant 4 : i32
        %42 = "simt_step.switch"(%41, %c4_i32_15) ({
        ^bb0(%arg4: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %43 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_11 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c1_i32 = arith.constant 1 : i32
    %15 = arith.addi %0, %c1_i32 : i32
    return
  }
}

