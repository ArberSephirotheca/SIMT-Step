module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %3 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %4 = arith.addi %3, %c1_i32 : i32
      %5 = arith.cmpi slt, %arg5, %4 : i32
      "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c2_i32 = arith.constant 2 : i32
      %3 = arith.remsi %arg3, %c2_i32 : i32
      %4 = simt_step.lane_id
      %5 = arith.index_cast %4 : index to i32
      %6 = "simt_step.switch"(%3, %5) ({
      ^bb0(%arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %15 = arith.addi %14, %c1_i32_6 : i32
          %16 = arith.cmpi slt, %arg8, %15 : i32
          "simt_step.condition"(%16, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %c1_i32_6 = arith.constant 1 : i32
          %14 = arith.addi %arg8, %c1_i32_6 : i32
          "simt_step.yield"(%arg0, %14) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c0_i32_4 = arith.constant 0 : i32
        "simt_step.yield"(%10#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %13 = "simt_step.if"(%12) ({
          %c1_i32_6 = arith.constant 1 : i32
          %14 = arith.addi %arg0, %c1_i32_6 : i32
          "simt_step.yield"(%14) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %7 = simt_step.subgroup_id
      %8 = arith.index_cast %7 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32_1, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %2, %1) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %16 = arith.muli %arg4, %c4_i32_12 : i32
        %17 = arith.addi %16, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %18 = arith.addi %c12_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_13 : i32
        "simt_step.condition"(%20, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c32_i32_12 = arith.constant 32 : i32
        %16 = arith.addi %c32_i32_12, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_13 : i32
        %19 = "simt_step.if"(%18) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        %20 = arith.addi %arg3, %19 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_8 = arith.constant true
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %16 = arith.muli %arg4, %c4_i32_12 : i32
        %17 = arith.addi %16, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %18 = arith.addi %c36_i32, %17 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %20 = arith.cmpi ne, %19, %c0_i32_13 : i32
        "simt_step.condition"(%20, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c56_i32 = arith.constant 56 : i32
        %16 = arith.addi %c56_i32, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_12 : i32
        %19 = "simt_step.if"(%18) ({
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %20 = arith.addi %arg3, %19 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.continue"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_6 : i32
      %14 = arith.addi %13, %0 : i32
      %c60_i32 = arith.constant 60 : i32
      %15 = arith.addi %c60_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_7 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c80_i32 = arith.constant 80 : i32
      %13 = arith.addi %c80_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %15 = "simt_step.switch"(%14, %c3_i32) ({
      ^bb0(%arg4: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %25 = arith.muli %arg6, %c4_i32_12 : i32
          %26 = arith.addi %25, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %27 = arith.addi %c84_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_13 : i32
          "simt_step.condition"(%29, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %25 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %26 = arith.addi %arg6, %c1_i32_12 : i32
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %21 = arith.addi %c104_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.addi %0, %c4_i32_10 : i32
        %24 = "simt_step.switch"(%22, %23) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %16 = arith.addi %arg2, %15 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_4 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %11 = arith.addi %c32_i32, %0 : i32
    %true_5 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

