module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %10, %c1_i32 : i32
      %12 = arith.cmpi slt, %arg5, %11 : i32
      "simt_step.condition"(%12, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%c4_i32, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%arg3, %4) ({
    ^bb0(%arg4: i32):
      %c0_i32_4 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_4) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %13 = "simt_step.if"(%12) ({
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %7 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %9 = arith.select %8, %0#0, %5 : i32
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
      %c4_i32_6 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_6 : i32
      %17 = arith.addi %16, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_7 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %16 = arith.addi %arg2, %arg3 : i32
      %c1_i32_6 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32_6 : i32
      "simt_step.yield"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %6 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32_3 = arith.constant 4 : i32
    %c1_i32 = arith.constant 1 : i32
    %8 = arith.addi %0, %c1_i32 : i32
    %c28_i32 = arith.constant 28 : i32
    %9 = arith.addi %c28_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %11 = simt_step.subgroup_id
    %12 = arith.index_cast %11 : index to i32
    %13 = "simt_step.switch"(%10, %12) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_14 : i32
        %28 = arith.addi %27, %0 : i32
        %c32_i32_15 = arith.constant 32 : i32
        %29 = arith.addi %c32_i32_15, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_16 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c1_i32_14 = arith.constant 1 : i32
        %27 = arith.addi %arg3, %c1_i32_14 : i32
        %c1_i32_15 = arith.constant 1 : i32
        %28 = arith.addi %arg4, %c1_i32_15 : i32
        "simt_step.continue"(%27, %28) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%16#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c52_i32 = arith.constant 52 : i32
      %18 = arith.addi %c52_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c2_i32_14 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_9 = arith.constant true
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %27 = arith.muli %arg4, %c4_i32_14 : i32
        %28 = arith.addi %27, %0 : i32
        %c56_i32 = arith.constant 56 : i32
        %29 = arith.addi %c56_i32, %28 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_15 : i32
        "simt_step.condition"(%31, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_18 : i32
          %31 = arith.addi %30, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %32 = arith.addi %c76_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_19 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %30 = arith.addi %arg5, %arg6 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32_18 : i32
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_16 = arith.constant true
        %28 = arith.addi %arg3, %27#0 : i32
        %c1_i32_17 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32_17 : i32
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %24 = arith.addi %c96_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %26 = "simt_step.switch"(%25, %0) ({
      ^bb0(%arg3: i32):
        %c100_i32 = arith.constant 100 : i32
        %27 = arith.addi %c100_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %0, %c3_i32 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg4: i32):
          %c1_i32_19 = arith.constant 1 : i32
          %38 = arith.addi %0, %c1_i32_19 : i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_20) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %c4_i32_21 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_21) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_19 : i32
          %39 = arith.addi %38, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %40 = arith.addi %c104_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_20 : i32
          "simt_step.condition"(%42, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %38 = arith.addi %arg4, %arg5 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %39 = arith.addi %arg5, %c1_i32_19 : i32
          "simt_step.continue"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %34 = arith.addi %c124_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_18 : i32
        %37 = "simt_step.if"(%36) ({
          %c4_i32_19 = arith.constant 4 : i32
          %38 = arith.addi %0, %c4_i32_19 : i32
          "simt_step.yield"(%38) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_13 = arith.constant true
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_4 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %14 = arith.addi %c48_i32, %0 : i32
    %true_5 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

