module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %6 = arith.addi %5, %c1_i32 : i32
        %7 = arith.cmpi slt, %arg5, %6 : i32
        "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %5 = simt_step.lane_id
        %6 = arith.index_cast %5 : index to i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%6, %7) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%4#0) : (i32) -> ()
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
        %7 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %8 = "simt_step.if"(%7) ({
          %11 = simt_step.subgroup_id
          %12 = arith.index_cast %11 : index to i32
          "simt_step.yield"(%12) : (i32) -> ()
        }, {
          %c0_i32_4 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_4) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32 = arith.constant 3 : i32
        %9 = arith.addi %arg0, %c3_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%8, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %5 = simt_step.lane_id
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
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %20:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_7 : i32
        %26 = arith.addi %25, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %27 = arith.addi %c12_i32, %26 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_8 : i32
        "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32_7 = arith.constant 32 : i32
        %25 = arith.addi %c32_i32_7, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %27 = "simt_step.switch"(%26, %c2_i32) ({
        ^bb0(%arg5: i32):
          %c3_i32_9 = arith.constant 3 : i32
          %30 = arith.addi %0, %c3_i32_9 : i32
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%31: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %28 = arith.addi %arg3, %27 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_5 = arith.constant true
      "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %22 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %24 = arith.addi %0, %c0_i32_6 : i32
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c36_i32 = arith.constant 36 : i32
    %12 = arith.addi %c36_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c40_i32 = arith.constant 40 : i32
      %19 = arith.addi %c40_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
      %22 = "simt_step.if"(%21) ({
        %c1_i32 = arith.constant 1 : i32
        %35 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%35) : (i32) -> ()
      }, {
        %c44_i32 = arith.constant 44 : i32
        %35 = arith.addi %c44_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        %38 = "simt_step.if"(%37) ({
          %c4_i32_11 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %39 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %24 = arith.addi %c48_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
      %27 = "simt_step.if"(%26) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_13 : i32
          %37 = arith.addi %36, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %38 = arith.addi %c52_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_14 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%35#0) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_13 : i32
          %37 = arith.addi %36, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %38 = arith.addi %c72_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_14 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        "simt_step.yield"(%35#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %29 = arith.addi %c92_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %31 = arith.addi %0, %c4_i32_5 : i32
      %32 = "simt_step.switch"(%30, %31) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %35 = arith.addi %c96_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c100_i32 = arith.constant 100 : i32
        %40 = arith.addi %c100_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %42 = arith.addi %0, %c1_i32 : i32
        %43 = "simt_step.switch"(%41, %42) ({
        ^bb0(%arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %49 = arith.addi %0, %c4_i32_14 : i32
          "simt_step.yield"(%49) {fallthrough = true} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c4_i32_15 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_15) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %46 = arith.addi %c104_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        %48 = "simt_step.switch"(%47, %c4_i32_12) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_10 : i32
        %36 = arith.addi %35, %0 : i32
        %c108_i32 = arith.constant 108 : i32
        %37 = arith.addi %c108_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_11 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %35 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_9 = arith.constant true
      "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %17 = arith.addi %c32_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

