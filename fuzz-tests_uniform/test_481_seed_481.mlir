module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c2_i32 = arith.constant 2 : i32
      %4 = arith.remsi %arg3, %c2_i32 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = "simt_step.switch"(%4, %c4_i32) ({
      ^bb0(%arg4: i32):
        %c2_i32_1 = arith.constant 2 : i32
        %6 = arith.remsi %arg3, %c2_i32_1 : i32
        %c3_i32 = arith.constant 3 : i32
        %7 = "simt_step.switch"(%6, %c3_i32) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %c3_i32_3 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_3) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %10 = "simt_step.if"(%9) ({
          %c3_i32_3 = arith.constant 3 : i32
          %11 = arith.addi %arg0, %c3_i32_3 : i32
          "simt_step.yield"(%11) : (i32) -> ()
        }, {
          %c2_i32_3 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_3) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%5) : (i32) -> ()
    }, {
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %5 = simt_step.lane_id
      %6 = arith.index_cast %5 : index to i32
      %7 = "simt_step.switch"(%4, %6) ({
      ^bb0(%arg4: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %11 = "simt_step.if"(%10) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %13:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32_8 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32_8 : i32
          "simt_step.yield"(%c0_i32_7, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c4_i32_4 = arith.constant 4 : i32
        "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %15 = "simt_step.switch"(%arg3, %c0_i32_5) ({
        ^bb0(%arg5: i32):
          %c0_i32_7 = arith.constant 0 : i32
          %20 = arith.addi %arg0, %c0_i32_7 : i32
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg0, %c1_i32 : i32
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      ^bb3(%17: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %19 = "simt_step.if"(%18) ({
          %c0_i32_7 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_7) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %8 = simt_step.subgroup_id
      %9 = arith.index_cast %8 : index to i32
      "simt_step.yield"(%7) : (i32) -> ()
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
      %11 = arith.addi %c12_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
      %14 = "simt_step.if"(%13) ({
        %c16_i32_2 = arith.constant 16 : i32
        %15 = arith.addi %c16_i32_2, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %17 = arith.addi %0, %c0_i32_3 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg2: i32):
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %c4_i32_5 = arith.constant 4 : i32
          %21 = arith.addi %0, %c4_i32_5 : i32
          "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
        ^bb2(%22: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %23 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb3(%24: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        "simt_step.yield"(%18) : (i32) -> ()
      }, {
        %c20_i32 = arith.constant 20 : i32
        %15 = arith.addi %c20_i32, %0 : i32
        %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %16, %c0_i32_2 : i32
        %18 = "simt_step.if"(%17) ({
          %c0_i32_3 = arith.constant 0 : i32
          %19 = arith.addi %0, %c0_i32_3 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %c4_i32_3 = arith.constant 4 : i32
          %19 = arith.addi %0, %c4_i32_3 : i32
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%14) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) : (i32) -> ()
    }) : (i1) -> i32
    %c16_i32 = arith.constant 16 : i32
    %9 = arith.addi %c16_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

