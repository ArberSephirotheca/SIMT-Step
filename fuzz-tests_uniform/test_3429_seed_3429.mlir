module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.lane_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %9, %c1_i32 : i32
        %11 = arith.cmpi slt, %arg6, %10 : i32
        "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %10 = "simt_step.if"(%9) ({
          %c1_i32_6 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_6) : (i32) -> ()
        }, {
          "simt_step.yield"(%arg0) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32 = arith.constant 3 : i32
        %11 = arith.addi %arg0, %c3_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %12 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%10, %12) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c2_i32_2 = arith.constant 2 : i32
      %7 = arith.remsi %arg3, %c2_i32_2 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %8 = "simt_step.switch"(%7, %c0_i32_3) ({
      ^bb0(%arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %18 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %19 = arith.addi %18, %c1_i32_12 : i32
          %20 = arith.cmpi slt, %arg7, %19 : i32
          "simt_step.condition"(%20, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c1_i32_11 = arith.constant 1 : i32
          %18 = arith.addi %arg7, %c1_i32_11 : i32
          "simt_step.yield"(%arg0, %18) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %11 = arith.remsi %arg3, %c3_i32 : i32
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.addi %arg0, %c4_i32 : i32
        %13 = "simt_step.switch"(%11, %12) ({
        ^bb0(%arg6: i32):
          %c2_i32_11 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_11) {fallthrough = false} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c2_i32_12 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %20 = arith.addi %arg0, %c4_i32_13 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb3(%21: i32):  // no predecessors
          %c4_i32_14 = arith.constant 4 : i32
          %22 = arith.addi %arg0, %c4_i32_14 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c3_i32_8 = arith.constant 3 : i32
        %15 = arith.remsi %arg3, %c3_i32_8 : i32
        %c3_i32_9 = arith.constant 3 : i32
        %16 = "simt_step.switch"(%15, %c3_i32_9) ({
        ^bb0(%arg6: i32):
          %c3_i32_11 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_11) {fallthrough = true} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          %19 = arith.addi %arg0, %c0_i32_12 : i32
          "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
        ^bb2(%20: i32):  // no predecessors
          %c0_i32_13 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_13) {fallthrough = true} : (i32) -> ()
        ^bb3(%21: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c2_i32_10 = arith.constant 2 : i32
        %17 = arith.addi %arg0, %c2_i32_10 : i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %c2_i32_4 = arith.constant 2 : i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %4 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_0 : i32
    %9 = "simt_step.if"(%8) ({
      %c12_i32 = arith.constant 12 : i32
      %12 = arith.addi %c12_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_1 : i32
      %15 = "simt_step.if"(%14) ({
        %c16_i32_2 = arith.constant 16 : i32
        %16 = arith.addi %c16_i32_2, %0 : i32
        %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %17, %c0_i32_3 : i32
        %19 = "simt_step.if"(%18) ({
          %c4_i32_4 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_4) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          %20 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%20) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_2) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %13 = arith.muli %arg3, %c4_i32_4 : i32
        %14 = arith.addi %13, %0 : i32
        %c20_i32 = arith.constant 20 : i32
        %15 = arith.addi %c20_i32, %14 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_5 : i32
        "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %13 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_3 = arith.constant true
      "simt_step.yield"(%12#0) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %10 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

