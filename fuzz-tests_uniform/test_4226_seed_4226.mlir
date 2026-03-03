module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) : (i32) -> ()
    }, {
      "simt_step.yield"(%arg0) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %3 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %c4_i32, %1 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %7 = "simt_step.if"(%6) ({
      %c1_i32 = arith.constant 1 : i32
      %18 = arith.addi %arg0, %c1_i32 : i32
      "simt_step.yield"(%18) : (i32) -> ()
    }, {
      %18 = simt_step.lane_id
      %19 = arith.index_cast %18 : index to i32
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %true_3 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %9, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_4 = arith.constant 0 : i32
    %10 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %11 = arith.select %10, %5, %7 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %13 = "simt_step.if"(%12) ({
      %c3_i32 = arith.constant 3 : i32
      %18 = arith.remsi %arg3, %c3_i32 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %19 = arith.addi %arg0, %c4_i32_8 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg4: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32_15 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32_16 : i32
          %34 = arith.cmpi slt, %arg6, %33 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c1_i32_15 = arith.constant 1 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %32 = arith.addi %arg6, %c1_i32_16 : i32
          "simt_step.yield"(%c1_i32_15, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c2_i32 = arith.constant 2 : i32
        %24 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c3_i32_11 = arith.constant 3 : i32
        %26 = arith.remsi %arg3, %c3_i32_11 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = "simt_step.switch"(%26, %c1_i32) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          %33 = arith.addi %arg0, %c2_i32_15 : i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%34: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c4_i32_13 = arith.constant 4 : i32
        %29 = arith.remsi %arg3, %c4_i32_13 : i32
        %30 = "simt_step.switch"(%29, %arg0) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %c3_i32_15 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb2(%33: i32):  // no predecessors
          %c4_i32_16 = arith.constant 4 : i32
          %34 = arith.addi %arg0, %c4_i32_16 : i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb3(%35: i32):  // no predecessors
          %c3_i32_17 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_17) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %c3_i32_14 = arith.constant 3 : i32
        %31 = arith.addi %arg0, %c3_i32_14 : i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %18 = arith.addi %arg0, %c2_i32 : i32
      "simt_step.yield"(%18) : (i32) -> ()
    }) : (i1) -> i32
    %true_6 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    %c32_i32 = arith.constant 32 : i32
    %15 = arith.addi %c32_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_7 = arith.constant 0 : i32
    %16 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
    %17 = arith.select %16, %11, %13 : i32
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
    %c2_i32 = arith.constant 2 : i32
    %5 = arith.addi %0, %c2_i32 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_4 : i32
      %10 = arith.addi %9, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %11 = arith.addi %c8_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_5 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %9 = arith.addi %c28_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_4 : i32
      %12 = "simt_step.if"(%11) ({
        %c32_i32 = arith.constant 32 : i32
        %15 = arith.addi %c32_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_5 : i32
        %18 = "simt_step.if"(%17) ({
          %19 = simt_step.subgroup_id
          %20 = arith.index_cast %19 : index to i32
          "simt_step.yield"(%20) : (i32) -> ()
        }, {
          %19 = simt_step.lane_id
          %20 = arith.index_cast %19 : index to i32
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %16 = arith.muli %arg5, %c4_i32_8 : i32
          %17 = arith.addi %16, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %18 = arith.addi %c36_i32, %17 : i32
          %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %20 = arith.cmpi ne, %19, %c0_i32_9 : i32
          "simt_step.condition"(%20, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %16 = arith.addi %arg4, %arg5 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %17 = arith.addi %arg5, %c1_i32_8 : i32
          "simt_step.yield"(%16, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        "simt_step.yield"(%15#0) : (i32) -> ()
      }) : (i1) -> i32
      %13 = arith.addi %arg2, %12 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %7 = arith.addi %c48_i32, %0 : i32
    %true_2 = arith.constant true
    %8 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %7, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c4_i32_3 = arith.constant 4 : i32
    return
  }
}

