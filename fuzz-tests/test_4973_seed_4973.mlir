module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %6 = "simt_step.if"(%5) ({
        %c3_i32 = arith.constant 3 : i32
        %9 = "simt_step.switch"(%arg3, %c3_i32) ({
        ^bb0(%arg5: i32):
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%9) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %9 = arith.remsi %arg3, %c2_i32 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %10 = arith.addi %arg0, %c0_i32_1 : i32
        %11 = "simt_step.switch"(%9, %10) ({
        ^bb0(%arg5: i32):
          %c0_i32_2 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_2) {fallthrough = false} : (i32) -> ()
        ^bb1(%12: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%11) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %8 = "simt_step.switch"(%arg3, %arg0) ({
      ^bb0(%arg5: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %10 = "simt_step.if"(%9) ({
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.addi %arg0, %c4_i32 : i32
          "simt_step.yield"(%13) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg0, %c1_i32 : i32
          "simt_step.yield"(%13) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg7, %14 : i32
          "simt_step.condition"(%15, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %c3_i32 = arith.constant 3 : i32
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%c3_i32, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %c1_i32 = arith.constant 1 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_3 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %12 = arith.addi %arg2, %arg3 : i32
      %c1_i32_3 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32_3 : i32
      %true_4 = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_5 : i32
      %15 = arith.addi %c16_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_6 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
    %9 = "simt_step.if"(%8) ({
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_3 : i32
      %15 = "simt_step.if"(%14) ({
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %18:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.muli %arg3, %c4_i32_7 : i32
          %20 = arith.addi %19, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %21 = arith.addi %c36_i32, %20 : i32
          %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
          "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %19 = arith.addi %arg2, %arg3 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %20 = arith.addi %arg3, %c1_i32_7 : i32
          %true_8 = arith.constant true
          %c32_i32_9 = arith.constant 32 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %21 = arith.muli %arg3, %c4_i32_10 : i32
          %22 = arith.addi %c32_i32_9, %21 : i32
          %23 = arith.addi %22, %0 : i32
          %true_11 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%18#0) : (i32) -> ()
      }, {
        %c56_i32 = arith.constant 56 : i32
        %18 = arith.addi %c56_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %20 = "simt_step.switch"(%19, %0) ({
        ^bb0(%arg2: i32):
          %c1_i32_7 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_7) {fallthrough = true} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %c4_i32_8 = arith.constant 4 : i32
          %24 = arith.addi %0, %c4_i32_8 : i32
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%25: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %21 = arith.addi %c48_i32, %0 : i32
        %true_6 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }) : (i1) -> i32
      %c64_i32 = arith.constant 64 : i32
      %16 = arith.addi %c64_i32, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %12 = arith.addi %0, %c0_i32_3 : i32
      "simt_step.yield"(%12) : (i32) -> ()
    }) : (i1) -> i32
    %c80_i32 = arith.constant 80 : i32
    %10 = arith.addi %c80_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

