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
      %c0_i32_2 = arith.constant 0 : i32
      %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %4 = "simt_step.if"(%3) ({
        %c3_i32 = arith.constant 3 : i32
        %8 = "simt_step.switch"(%arg3, %c3_i32) ({
        ^bb0(%arg6: i32):
          %c2_i32_3 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_3) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c2_i32 = arith.constant 2 : i32
        %9 = arith.addi %arg0, %c2_i32 : i32
        "simt_step.yield"(%8) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %8 = arith.remsi %arg3, %c2_i32 : i32
        %9 = simt_step.subgroup_id
        %10 = arith.index_cast %9 : index to i32
        %11 = "simt_step.switch"(%8, %10) ({
        ^bb0(%arg6: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          %c1_i32_3 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_3) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c4_i32 = arith.constant 4 : i32
        "simt_step.yield"(%11) : (i32) -> ()
      }) : (i1) -> i32
      %5 = simt_step.subgroup_id
      %6 = arith.index_cast %5 : index to i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %7) : (i32, i32) -> ()
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
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %19 = arith.muli %arg4, %c4_i32_11 : i32
        %20 = arith.addi %19, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %21 = arith.addi %c12_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_12 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %19 = arith.addi %0, %c0_i32_11 : i32
        %20 = arith.addi %arg3, %19 : i32
        %c1_i32 = arith.constant 1 : i32
        %21 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.break"(%20, %21) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_4 = arith.constant true
      "simt_step.yield"(%10#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %14 = arith.addi %0, %c0_i32_5 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg3: i32):
        %c36_i32 = arith.constant 36 : i32
        %19 = arith.addi %c36_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_11 : i32
        %22 = "simt_step.if"(%21) ({
          %c4_i32_13 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_13) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %24 = arith.addi %c40_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_12 : i32
        %27 = "simt_step.if"(%26) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c4_i32_7 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %19 = arith.muli %arg4, %c4_i32_11 : i32
        %20 = arith.addi %19, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %21 = arith.addi %c44_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_12 : i32
        "simt_step.condition"(%23, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %19 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg4, %c1_i32 : i32
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c16_i32 = arith.constant 16 : i32
    %8 = arith.addi %c16_i32, %0 : i32
    %true_1 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

