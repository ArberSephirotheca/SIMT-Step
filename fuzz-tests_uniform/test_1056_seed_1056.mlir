module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      %4 = arith.addi %arg0, %c3_i32 : i32
      "simt_step.yield"(%4) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c3_i32 = arith.constant 3 : i32
        %7 = arith.remsi %arg3, %c3_i32 : i32
        %8 = simt_step.lane_id
        %9 = arith.index_cast %8 : index to i32
        %10 = "simt_step.switch"(%7, %9) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%14: i32):  // no predecessors
          %c0_i32_3 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_3) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %11 = simt_step.lane_id
        %12 = arith.index_cast %11 : index to i32
        "simt_step.yield"(%10) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32 : i32
          %10 = arith.cmpi slt, %arg5, %9 : i32
          "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %c1_i32 = arith.constant 1 : i32
          %8 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%c4_i32_5, %8) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%7#0) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %6 = arith.addi %arg0, %c0_i32_2 : i32
      "simt_step.yield"(%5) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
      %19 = "simt_step.if"(%18) ({
        %c16_i32_6 = arith.constant 16 : i32
        %20 = arith.addi %c16_i32_6, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_7 = arith.constant 4 : i32
        %22 = arith.addi %0, %c4_i32_7 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg2: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          %25 = arith.addi %0, %c0_i32_9 : i32
          "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %20 = arith.addi %c20_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = "simt_step.switch"(%21, %0) ({
        ^bb0(%arg2: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %24 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb3(%27: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c24_i32 = arith.constant 24 : i32
      %16 = arith.addi %c24_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
      %19 = "simt_step.if"(%18) ({
        %c28_i32 = arith.constant 28 : i32
        %20 = arith.addi %c28_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %22 = arith.cmpi ne, %21, %c0_i32_6 : i32
        %23 = "simt_step.if"(%22) ({
          %c4_i32_7 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_7) : (i32) -> ()
        }, {
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%23) : (i32) -> ()
      }, {
        %c32_i32_6 = arith.constant 32 : i32
        %20 = arith.addi %c32_i32_6, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %22 = simt_step.subgroup_id
        %23 = arith.index_cast %22 : index to i32
        %24 = "simt_step.switch"(%21, %23) ({
        ^bb0(%arg2: i32):
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %c0_i32_9 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_9) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %11 = simt_step.lane_id
    %12 = arith.index_cast %11 : index to i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %13:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_5 : i32
      %17 = arith.addi %16, %0 : i32
      %c36_i32 = arith.constant 36 : i32
      %18 = arith.addi %c36_i32, %17 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
      "simt_step.condition"(%20, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c56_i32 = arith.constant 56 : i32
      %16 = arith.addi %c56_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
      %19 = "simt_step.if"(%18) ({
        %c60_i32 = arith.constant 60 : i32
        %22 = arith.addi %c60_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
        %25 = "simt_step.if"(%24) ({
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_9 : i32
          %24 = arith.addi %23, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %25 = arith.addi %c64_i32, %24 : i32
          %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %27 = arith.cmpi ne, %26, %c0_i32_10 : i32
          "simt_step.condition"(%27, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %23 = arith.addi %arg4, %arg5 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %24 = arith.addi %arg5, %c1_i32_9 : i32
          "simt_step.continue"(%23, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        "simt_step.yield"(%22#0) : (i32) -> ()
      }) : (i1) -> i32
      %20 = arith.addi %arg2, %19 : i32
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.break"(%20, %21) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %14 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

