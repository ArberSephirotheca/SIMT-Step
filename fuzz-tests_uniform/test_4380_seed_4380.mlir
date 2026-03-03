module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c3_i32 = arith.constant 3 : i32
    %1 = "simt_step.switch"(%0, %c3_i32) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %9, %c1_i32 : i32
        %11 = arith.cmpi slt, %arg6, %10 : i32
        "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %10 = "simt_step.if"(%9) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c1_i32_5 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_5) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%10, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32_2 = arith.constant 2 : i32
      %5 = arith.addi %arg0, %c2_i32_2 : i32
      "simt_step.yield"(%4#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %8 = "simt_step.switch"(%7, %arg0) ({
      ^bb0(%arg5: i32):
        "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg7, %17 : i32
          "simt_step.condition"(%18, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%arg0, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%11: i32):  // no predecessors
        %c3_i32_6 = arith.constant 3 : i32
        %12 = arith.addi %arg0, %c3_i32_6 : i32
        "simt_step.yield"(%12) {fallthrough = true} : (i32) -> ()
      ^bb3(%13: i32):  // no predecessors
        %14 = "simt_step.switch"(%arg3, %arg0) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c3_i32_7 = arith.constant 3 : i32
        %15 = arith.addi %arg0, %c3_i32_7 : i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32, %arg0 : i32
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
      %c4_i32_5 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_5 : i32
      %16 = arith.addi %15, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %17 = arith.addi %c8_i32, %16 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_6 : i32
      "simt_step.condition"(%19, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %15 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
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
    %10 = simt_step.lane_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c32_i32_5 = arith.constant 32 : i32
      %15 = arith.addi %c32_i32_5, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %0, %c1_i32 : i32
      %18 = "simt_step.switch"(%16, %17) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_16 : i32
          %36 = arith.addi %35, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %37 = arith.addi %c36_i32, %36 : i32
          %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %39 = arith.cmpi ne, %38, %c0_i32_17 : i32
          "simt_step.condition"(%39, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %35 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %36 = arith.addi %arg5, %c1_i32_16 : i32
          "simt_step.yield"(%35, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %27 = arith.addi %c56_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %29 = arith.addi %0, %c2_i32 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c4_i32_15 = arith.constant 4 : i32
        %32 = arith.addi %0, %c4_i32_15 : i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb3(%33: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %34 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_11 : i32
        %26 = arith.addi %25, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %27 = arith.addi %c60_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_12 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c80_i32 = arith.constant 80 : i32
        %25 = arith.addi %c80_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %27 = "simt_step.switch"(%26, %c0_i32_11) ({
        ^bb0(%arg5: i32):
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %28 = arith.addi %arg3, %27 : i32
        %c1_i32_13 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32_13 : i32
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %22 = arith.addi %c84_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %24 = "simt_step.switch"(%23, %0) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_18 : i32
          %35 = arith.addi %34, %0 : i32
          %c88_i32 = arith.constant 88 : i32
          %36 = arith.addi %c88_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_19 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%26#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c108_i32 = arith.constant 108 : i32
        %28 = arith.addi %c108_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_14 : i32
        %31 = "simt_step.if"(%30) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_18 = arith.constant 4 : i32
          %34 = arith.addi %0, %c4_i32_18 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb3(%32: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %34 = arith.muli %arg5, %c4_i32_18 : i32
          %35 = arith.addi %34, %0 : i32
          %c112_i32 = arith.constant 112 : i32
          %36 = arith.addi %c112_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_19 : i32
          "simt_step.condition"(%38, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %34 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %35 = arith.addi %arg5, %c1_i32_18 : i32
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_10 = arith.constant true
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %13 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

