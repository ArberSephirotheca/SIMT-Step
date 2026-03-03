module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %3 = "simt_step.if"(%2) ({
      %c2_i32 = arith.constant 2 : i32
      %8 = arith.remsi %arg3, %c2_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg0, %c1_i32 : i32
      %10 = "simt_step.switch"(%8, %9) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %14 = "simt_step.if"(%13) ({
          %c3_i32 = arith.constant 3 : i32
          %22 = arith.addi %arg0, %c3_i32 : i32
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %16 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %17 = "simt_step.if"(%16) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32_4 = arith.constant 1 : i32
        %18 = arith.addi %arg0, %c1_i32_4 : i32
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %21 = "simt_step.if"(%20) ({
          %c0_i32_6 = arith.constant 0 : i32
          %22 = arith.addi %arg0, %c0_i32_6 : i32
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %11 = simt_step.lane_id
      %12 = arith.index_cast %11 : index to i32
      "simt_step.yield"(%10) : (i32) -> ()
    }, {
      %8 = simt_step.lane_id
      %9 = arith.index_cast %8 : index to i32
      "simt_step.yield"(%9) : (i32) -> ()
    }) : (i1) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.addi %c0_i32_0, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %7 = arith.select %6, %1, %3 : i32
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
      %c4_i32_7 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_7 : i32
      %12 = arith.addi %11, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %13 = arith.addi %c8_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_8 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %11 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %6 = arith.addi %c16_i32, %0 : i32
    %true_2 = arith.constant true
    %7 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %6, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_7 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_7 : i32
      %12 = arith.addi %11, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %13 = arith.addi %c28_i32, %12 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_8 = arith.constant 0 : i32
      %15 = arith.cmpi ne, %14, %c0_i32_8 : i32
      "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c48_i32 = arith.constant 48 : i32
      %11 = arith.addi %c48_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_7 : i32
      %14 = "simt_step.if"(%13) ({
        %c52_i32 = arith.constant 52 : i32
        %17 = arith.addi %c52_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %19 = arith.addi %0, %c0_i32_8 : i32
        %20 = "simt_step.switch"(%18, %19) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %21 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %18 = arith.muli %arg5, %c4_i32_11 : i32
          %19 = arith.addi %18, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %20 = arith.addi %c56_i32, %19 : i32
          %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %22 = arith.cmpi ne, %21, %c0_i32_12 : i32
          "simt_step.condition"(%22, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %18 = arith.addi %arg4, %arg5 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %19 = arith.addi %arg5, %c1_i32_11 : i32
          "simt_step.yield"(%18, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        "simt_step.yield"(%17#0) : (i32) -> ()
      }) : (i1) -> i32
      %15 = arith.addi %arg2, %14 : i32
      %c1_i32 = arith.constant 1 : i32
      %16 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%15, %16) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

