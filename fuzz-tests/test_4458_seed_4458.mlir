module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = "simt_step.switch"(%2, %arg0) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
        %5 = "simt_step.if"(%4) ({
          %c4_i32 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%5) {fallthrough = true} : (i32) -> ()
      ^bb1(%6: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %8 = "simt_step.if"(%7) ({
          %c3_i32_4 = arith.constant 3 : i32
          %12 = arith.addi %arg0, %c3_i32_4 : i32
          "simt_step.yield"(%12) : (i32) -> ()
        }, {
          %c2_i32_4 = arith.constant 2 : i32
          %12 = arith.addi %arg0, %c2_i32_4 : i32
          "simt_step.yield"(%12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%8) {fallthrough = true} : (i32) -> ()
      ^bb2(%9: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32 : i32
          %14 = arith.cmpi slt, %arg6, %13 : i32
          "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%arg0, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%11: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = "simt_step.switch"(%2, %arg0) ({
      ^bb0(%arg4: i32):
        %c2_i32 = arith.constant 2 : i32
        %6 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
      ^bb1(%7: i32):  // no predecessors
        %c0_i32_1 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %9 = "simt_step.if"(%8) ({
          %c0_i32_3 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_3) : (i32) -> ()
        }, {
          %c0_i32_3 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_3) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb2(%10: i32):  // no predecessors
        %c3_i32_2 = arith.constant 3 : i32
        %11 = arith.remsi %arg3, %c3_i32_2 : i32
        %12 = "simt_step.switch"(%11, %arg0) ({
        ^bb0(%arg5: i32):
          %c2_i32_3 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_3) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %c2_i32_4 = arith.constant 2 : i32
          %14 = arith.addi %arg0, %c2_i32_4 : i32
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          %c3_i32_5 = arith.constant 3 : i32
          %16 = arith.addi %arg0, %c3_i32_5 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32_0, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%3) : (i32) -> ()
    }) : (i1) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = "simt_step.switch"(%6, %c0_i32_0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %22 = arith.addi %c12_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
      %25 = "simt_step.if"(%24) ({
        %c16_i32_12 = arith.constant 16 : i32
        %31 = arith.addi %c16_i32_12, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %33 = "simt_step.switch"(%32, %c3_i32) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c3_i32_13 = arith.constant 3 : i32
          %35 = arith.addi %0, %c3_i32_13 : i32
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%33) : (i32) -> ()
      }, {
        %c4_i32_12 = arith.constant 4 : i32
        %31 = arith.addi %0, %c4_i32_12 : i32
        "simt_step.yield"(%31) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c0_i32_7 = arith.constant 0 : i32
      %c0_i32_8 = arith.constant 0 : i32
      %27:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_12 : i32
        %32 = arith.addi %31, %0 : i32
        %c20_i32 = arith.constant 20 : i32
        %33 = arith.addi %c20_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %31 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%27#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_12 : i32
        %32 = arith.addi %31, %0 : i32
        %c40_i32 = arith.constant 40 : i32
        %33 = arith.addi %c40_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_13 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %31 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_11) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c60_i32 = arith.constant 60 : i32
    %10 = arith.addi %c60_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_2 : i32
    %13 = "simt_step.if"(%12) ({
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_8 : i32
        %24 = arith.addi %23, %0 : i32
        %c64_i32_9 = arith.constant 64 : i32
        %25 = arith.addi %c64_i32_9, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_10 : i32
        "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c84_i32 = arith.constant 84 : i32
        %23 = arith.addi %c84_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_8 : i32
        %26 = "simt_step.if"(%25) ({
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %27 = arith.addi %c32_i32, %0 : i32
        %true_9 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %29 = arith.addi %arg2, %26 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %arg3, %c1_i32 : i32
        %true_10 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %31 = arith.muli %arg3, %c4_i32_11 : i32
        %32 = arith.addi %c48_i32, %31 : i32
        %33 = arith.addi %32, %0 : i32
        %true_12 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29, %30) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) : (i32) -> ()
    }, {
      %22 = simt_step.lane_id
      %23 = arith.index_cast %22 : index to i32
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c64_i32 = arith.constant 64 : i32
    %14 = arith.addi %c64_i32, %0 : i32
    %true_3 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c88_i32 = arith.constant 88 : i32
    %16 = arith.addi %c88_i32, %0 : i32
    %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %18 = arith.cmpi ne, %17, %c0_i32_4 : i32
    %19 = "simt_step.if"(%18) ({
      %c92_i32 = arith.constant 92 : i32
      %22 = arith.addi %c92_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
      %25 = "simt_step.if"(%24) ({
        %c96_i32_8 = arith.constant 96 : i32
        %28 = arith.addi %c96_i32_8, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_9 : i32
        %31 = "simt_step.if"(%30) ({
          %34 = simt_step.lane_id
          %35 = arith.index_cast %34 : index to i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %34 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %32 = arith.addi %c80_i32, %0 : i32
        %true_10 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %28 = simt_step.lane_id
        %29 = arith.index_cast %28 : index to i32
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %26 = arith.addi %c96_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) : (i32) -> ()
    }, {
      %c100_i32 = arith.constant 100 : i32
      %22 = arith.addi %c100_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
      %25 = "simt_step.if"(%24) ({
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        "simt_step.yield"(%29) : (i32) -> ()
      }, {
        %c104_i32 = arith.constant 104 : i32
        %28 = arith.addi %c104_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = simt_step.lane_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg2: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %34 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) : (i32) -> ()
      }) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %26 = arith.addi %c112_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) : (i32) -> ()
    }) : (i1) -> i32
    %c128_i32 = arith.constant 128 : i32
    %20 = arith.addi %c128_i32, %0 : i32
    %true_5 = arith.constant true
    %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

