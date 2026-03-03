module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
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
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32 : i32
        %13 = simt_step.lane_id
        %14 = arith.index_cast %13 : index to i32
        %15 = "simt_step.switch"(%12, %14) ({
        ^bb0(%arg6: i32):
          %c3_i32_4 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_4) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %c1_i32_5 = arith.constant 1 : i32
          %20 = arith.addi %arg0, %c1_i32_5 : i32
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb3(%21: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %16 = simt_step.lane_id
        %17 = arith.index_cast %16 : index to i32
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %13 = "simt_step.if"(%12) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %15 = simt_step.lane_id
          %16 = arith.index_cast %15 : index to i32
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_5 = arith.constant 1 : i32
        %14 = arith.addi %arg0, %c1_i32_5 : i32
        "simt_step.yield"(%13) : (i32) -> ()
      }) : (i1) -> i32
      %9 = simt_step.lane_id
      %10 = arith.index_cast %9 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%8, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %6 = arith.select %5, %1, %2#0 : i32
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
    %5 = simt_step.lane_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %9 = "simt_step.switch"(%8, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_8 : i32
        %23 = arith.addi %22, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %24 = arith.addi %c12_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_9 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32_8 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32_8 : i32
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c4_i32_7 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.lane_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c36_i32 = arith.constant 36 : i32
      %19 = arith.addi %c36_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_4 = arith.constant 4 : i32
      %21 = "simt_step.switch"(%20, %c4_i32_4) ({
      ^bb0(%arg3: i32):
        %c40_i32 = arith.constant 40 : i32
        %29 = arith.addi %c40_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %31 = "simt_step.switch"(%30, %c2_i32) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c1_i32_16 = arith.constant 1 : i32
          %45 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%45) {fallthrough = true} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %c0_i32_18 = arith.constant 0 : i32
          %48 = arith.addi %0, %c0_i32_18 : i32
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%32: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_16 : i32
          %45 = arith.addi %44, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %46 = arith.addi %c44_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_17 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_16 : i32
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%34: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %35 = arith.addi %c64_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_14 : i32
        %38 = "simt_step.if"(%37) ({
          %c1_i32_16 = arith.constant 1 : i32
          %44 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          %c1_i32_16 = arith.constant 1 : i32
          %44 = arith.addi %0, %c1_i32_16 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      ^bb3(%39: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %40 = arith.addi %c68_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_15 : i32
        %43 = "simt_step.if"(%42) ({
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %44 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%44) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %29 = arith.muli %arg4, %c4_i32_10 : i32
        %30 = arith.addi %29, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %31 = arith.addi %c72_i32, %30 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_11 : i32
        "simt_step.condition"(%33, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c92_i32 = arith.constant 92 : i32
        %29 = arith.addi %c92_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %30, %c0_i32_10 : i32
        %32 = "simt_step.if"(%31) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %33 = arith.addi %arg3, %32 : i32
        %c1_i32_11 = arith.constant 1 : i32
        %34 = arith.addi %arg4, %c1_i32_11 : i32
        "simt_step.yield"(%33, %34) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %25 = arith.addi %c96_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
      %28 = "simt_step.if"(%27) ({
        %c100_i32 = arith.constant 100 : i32
        %29 = arith.addi %c100_i32, %0 : i32
        %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
        %31 = "simt_step.switch"(%30, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_11 = arith.constant 0 : i32
          %32 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c32_i32_2 = arith.constant 32 : i32
    %17 = arith.addi %c32_i32_2, %0 : i32
    %true_3 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

