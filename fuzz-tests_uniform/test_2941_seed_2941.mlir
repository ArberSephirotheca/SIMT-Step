module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c0_i32_2 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %7 = "simt_step.if"(%6) ({
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%8) : (i32) -> ()
        }, {
          %8 = simt_step.subgroup_id
          %9 = arith.index_cast %8 : index to i32
          "simt_step.yield"(%9) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %7 = "simt_step.switch"(%6, %arg0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%9: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb2(%10: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%11: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %8 = arith.addi %arg0, %c3_i32 : i32
        "simt_step.yield"(%7) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %5 = "simt_step.if"(%4) ({
        %c2_i32 = arith.constant 2 : i32
        %6 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%6) : (i32) -> ()
      }, {
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32 : i32
          %11 = arith.cmpi slt, %arg5, %10 : i32
          "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %c2_i32 = arith.constant 2 : i32
          %9 = arith.addi %arg0, %c2_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.yield"(%9, %10) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %7 = simt_step.lane_id
        %8 = arith.index_cast %7 : index to i32
        "simt_step.yield"(%6#0) : (i32) -> ()
      }) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_5) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %15 = arith.muli %arg4, %c4_i32_9 : i32
        %16 = arith.addi %15, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %17 = arith.addi %c12_i32, %16 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %19 = arith.cmpi ne, %18, %c0_i32_10 : i32
        "simt_step.condition"(%19, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %15 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c32_i32_6 = arith.constant 32 : i32
      %15 = arith.addi %c32_i32_6, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c52_i32 = arith.constant 52 : i32
      %13 = arith.addi %c52_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = "simt_step.switch"(%14, %0) ({
      ^bb0(%arg4: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %18 = arith.addi %0, %c4_i32_6 : i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %20 = arith.addi %c56_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %22 = "simt_step.switch"(%21, %c3_i32) ({
        ^bb0(%arg5: i32):
          %c0_i32_8 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_8) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %16 = arith.addi %arg2, %15 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.break"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_3 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_4 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c2_i32 = arith.constant 2 : i32
    return
  }
}

