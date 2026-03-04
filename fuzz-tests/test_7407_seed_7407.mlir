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
      %c3_i32 = arith.constant 3 : i32
      %3 = arith.remsi %arg3, %c3_i32 : i32
      %4 = simt_step.lane_id
      %5 = arith.index_cast %4 : index to i32
      %6 = "simt_step.switch"(%3, %5) ({
      ^bb0(%arg6: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %8 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %9 = "simt_step.if"(%8) ({
          %c2_i32_4 = arith.constant 2 : i32
          %15 = arith.addi %arg0, %c2_i32_4 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %c1_i32_4 = arith.constant 1 : i32
          %15 = arith.addi %arg0, %c1_i32_4 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %11 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %14 = "simt_step.if"(%13) ({
          %c3_i32_4 = arith.constant 3 : i32
          %15 = arith.addi %arg0, %c3_i32_4 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %c3_i32_4 = arith.constant 3 : i32
          %15 = arith.addi %arg0, %c3_i32_4 : i32
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %7) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %11 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%11, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %11 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %11) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %6 = simt_step.lane_id
    %7 = arith.index_cast %6 : index to i32
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_5 : i32
      %11 = arith.addi %10, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %12 = arith.addi %c8_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_6 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_5 : i32
      %13 = arith.addi %c16_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_6 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %9:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_5 : i32
      %11 = arith.addi %10, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %12 = arith.addi %c28_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_6 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c32_i32 = arith.constant 32 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_5 : i32
      %13 = arith.addi %c32_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_6 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

