module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %3 = "simt_step.if"(%2) ({
      "simt_step.yield"(%arg0) : (i32) -> ()
    }, {
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %7 = arith.select %6, %1, %3 : i32
    %c4_i32 = arith.constant 4 : i32
    %8 = arith.remsi %arg3, %c4_i32 : i32
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    %11 = "simt_step.switch"(%8, %10) ({
    ^bb0(%arg4: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %17 = "simt_step.if"(%16) ({
        %c4_i32_11 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_11) : (i32) -> ()
      }, {
        "simt_step.yield"(%arg0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
      %20 = "simt_step.if"(%19) ({
        "simt_step.yield"(%arg0) : (i32) -> ()
      }, {
        %c2_i32_11 = arith.constant 2 : i32
        %29 = arith.addi %arg0, %c2_i32_11 : i32
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      %c3_i32 = arith.constant 3 : i32
      %21 = arith.addi %arg0, %c3_i32 : i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %29 = arith.remsi %arg3, %c4_i32_11 : i32
        %c1_i32 = arith.constant 1 : i32
        %30 = arith.addi %29, %c1_i32 : i32
        %31 = arith.cmpi slt, %arg6, %30 : i32
        "simt_step.condition"(%31, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%arg0, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32_8 = arith.constant 4 : i32
      %24 = arith.addi %arg0, %c4_i32_8 : i32
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%25: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %26 = arith.remsi %arg3, %c2_i32 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %27 = arith.addi %arg0, %c0_i32_9 : i32
      %28 = "simt_step.switch"(%26, %27) ({
      ^bb0(%arg5: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %34 = arith.remsi %arg3, %c4_i32_17 : i32
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %34, %c1_i32 : i32
          %36 = arith.cmpi slt, %arg7, %35 : i32
          "simt_step.condition"(%36, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %34 = arith.addi %arg0, %c4_i32_17 : i32
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.continue"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_13 = arith.constant 0 : i32
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c3_i32_14 = arith.constant 3 : i32
        %31 = arith.remsi %arg3, %c3_i32_14 : i32
        %c3_i32_15 = arith.constant 3 : i32
        %32 = arith.addi %arg0, %c3_i32_15 : i32
        %33 = "simt_step.switch"(%31, %32) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c4_i32_17 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_17) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c2_i32_16 = arith.constant 2 : i32
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %c3_i32_10 = arith.constant 3 : i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %13 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %15 = arith.select %14, %7, %11 : i32
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c8_i32 = arith.constant 8 : i32
    %7 = arith.addi %c8_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %9 = simt_step.lane_id
    %10 = arith.index_cast %9 : index to i32
    %11 = "simt_step.switch"(%8, %10) ({
    ^bb0(%arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%20: i32):  // no predecessors
      %c4_i32_3 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_3) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %12 = arith.addi %c32_i32, %0 : i32
    %true_0 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c12_i32 = arith.constant 12 : i32
    %14 = arith.addi %c12_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
    %17 = "simt_step.if"(%16) ({
      %c16_i32 = arith.constant 16 : i32
      %20 = arith.addi %c16_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c20_i32 = arith.constant 20 : i32
        %24 = arith.addi %c20_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = "simt_step.switch"(%25, %0) ({
        ^bb0(%arg2: i32):
          %c4_i32_5 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_5) {fallthrough = false} : (i32) -> ()
        ^bb1(%27: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = true} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_6) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        "simt_step.yield"(%26) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %24 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %c24_i32 = arith.constant 24 : i32
      %20 = arith.addi %c24_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_3 : i32
      %23 = "simt_step.if"(%22) ({
        %c28_i32 = arith.constant 28 : i32
        %24 = arith.addi %c28_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_4 : i32
        %27 = "simt_step.if"(%26) ({
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          %28 = simt_step.lane_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %c32_i32_4 = arith.constant 32 : i32
        %24 = arith.addi %c32_i32_4, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_5 : i32
        %27 = "simt_step.if"(%26) ({
          %c3_i32 = arith.constant 3 : i32
          %28 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c48_i32 = arith.constant 48 : i32
    %18 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %19 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

