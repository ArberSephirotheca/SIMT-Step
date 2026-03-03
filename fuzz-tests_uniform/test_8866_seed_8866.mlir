module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %4 = simt_step.lane_id
      %5 = arith.index_cast %4 : index to i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %4 = arith.remsi %arg3, %c2_i32 : i32
      %5 = simt_step.lane_id
      %6 = arith.index_cast %5 : index to i32
      %7 = "simt_step.switch"(%4, %6) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %11 = arith.remsi %arg3, %c3_i32 : i32
        %12 = "simt_step.switch"(%11, %arg0) ({
        ^bb0(%arg5: i32):
          %c1_i32_1 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_1) {fallthrough = false} : (i32) -> ()
        ^bb1(%14: i32):  // no predecessors
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %8 = simt_step.lane_id
      %9 = arith.index_cast %8 : index to i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_8 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_8 : i32
      %20 = arith.addi %19, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %21 = arith.addi %c8_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_9 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
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
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %9, %c0_i32_3 : i32
    %11 = "simt_step.if"(%10) ({
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %20 = arith.muli %arg3, %c4_i32_11 : i32
        %21 = arith.addi %20, %0 : i32
        %c32_i32_12 = arith.constant 32 : i32
        %22 = arith.addi %c32_i32_12, %21 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_13 : i32
        "simt_step.condition"(%24, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %20 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.break"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%19#0) : (i32) -> ()
    }) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c52_i32 = arith.constant 52 : i32
    %14 = arith.addi %c52_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_5 = arith.constant 4 : i32
    %16 = "simt_step.switch"(%15, %c4_i32_5) ({
    ^bb0(%arg2: i32):
      %c56_i32 = arith.constant 56 : i32
      %19 = arith.addi %c56_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %30 = arith.addi %c60_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %32 = "simt_step.switch"(%31, %c1_i32) ({
        ^bb0(%arg4: i32):
          %c1_i32_13 = arith.constant 1 : i32
          %37 = arith.addi %0, %c1_i32_13 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          %39 = arith.addi %0, %c0_i32_14 : i32
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %34 = arith.addi %c64_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg4: i32):
          %c0_i32_13 = arith.constant 0 : i32
          %37 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %23 = arith.addi %c68_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %25 = "simt_step.switch"(%24, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_17 : i32
          %35 = arith.addi %34, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %36 = arith.addi %c72_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_18 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_17 : i32
          %35 = arith.addi %34, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %36 = arith.addi %c92_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_18 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c112_i32 = arith.constant 112 : i32
      %27 = arith.addi %c112_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = "simt_step.switch"(%28, %0) ({
      ^bb0(%arg3: i32):
        %c116_i32 = arith.constant 116 : i32
        %30 = arith.addi %c116_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %32 = "simt_step.switch"(%31, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c2_i32_18 = arith.constant 2 : i32
          %37 = arith.addi %0, %c2_i32_18 : i32
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_18 : i32
          %38 = arith.addi %37, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %39 = arith.addi %c120_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_19 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.break"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        "simt_step.yield"(%34#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %36:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %37 = arith.muli %arg5, %c4_i32_18 : i32
          %38 = arith.addi %37, %0 : i32
          %c140_i32 = arith.constant 140 : i32
          %39 = arith.addi %c140_i32, %38 : i32
          %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %41 = arith.cmpi ne, %40, %c0_i32_19 : i32
          "simt_step.condition"(%41, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %37 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%37, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_6 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %17 = arith.addi %c48_i32, %0 : i32
    %true_7 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

