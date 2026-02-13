module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %1, %c1_i32 : i32
      %3 = arith.cmpi slt, %arg5, %2 : i32
      "simt_step.condition"(%3, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %2 = "simt_step.if"(%1) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = simt_step.subgroup_id
        %6 = arith.index_cast %5 : index to i32
        %7 = "simt_step.switch"(%4, %6) ({
        ^bb0(%arg6: i32):
          %c4_i32_3 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_3) {fallthrough = false} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %c1_i32_4 = arith.constant 1 : i32
          %13 = arith.addi %arg0, %c1_i32_4 : i32
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        ^bb2(%14: i32):  // no predecessors
          %c0_i32_5 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_5) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.muli %arg5, %c4_i32 : i32
        %10 = arith.addi %c0_i32_2, %9 : i32
        %11 = arith.addi %10, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %4 = simt_step.lane_id
        %5 = arith.index_cast %4 : index to i32
        %6 = "simt_step.switch"(%arg3, %5) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%7: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %8 = arith.addi %arg0, %c2_i32 : i32
          "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%6) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%2, %3) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
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
      %c8_i32 = arith.constant 8 : i32
      %9 = arith.addi %c8_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_3 : i32
      "simt_step.if"(%11) ({
        %c3_i32 = arith.constant 3 : i32
        %12 = arith.remsi %0, %c3_i32 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %13 = arith.addi %0, %c4_i32_4 : i32
        %14 = "simt_step.switch"(%12, %13) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %15 = arith.addi %arg2, %c1_i32 : i32
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%16: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          %17 = arith.addi %16, %c4_i32_5 : i32
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb2(%18: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %19 = arith.addi %18, %c2_i32 : i32
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb3(%20: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          %21 = arith.addi %20, %c4_i32_6 : i32
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
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
      %c4_i32_3 = arith.constant 4 : i32
      %9 = arith.muli %arg3, %c4_i32_3 : i32
      %10 = arith.addi %9, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %11 = arith.addi %c12_i32, %10 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_4 : i32
      "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c3_i32 = arith.constant 3 : i32
      %9 = arith.addi %arg2, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_3 : i32
      %12 = arith.addi %c16_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_4 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

