module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = "simt_step.switch"(%arg3, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %3:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg6, %8 : i32
        "simt_step.condition"(%9, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %7 = arith.remsi %arg3, %c3_i32 : i32
        %8 = "simt_step.switch"(%7, %arg0) ({
        ^bb0(%arg7: i32):
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %c0_i32_4 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_4) {fallthrough = true} : (i32) -> ()
        ^bb2(%11: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = true} : (i32) -> ()
        ^bb3(%12: i32):  // no predecessors
          "simt_step.yield"(%arg0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %9 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%8, %9) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.addi %arg0, %c4_i32 : i32
      "simt_step.yield"(%3#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32_4 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg6, %8 : i32
        "simt_step.condition"(%9, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %8 = "simt_step.if"(%7) ({
          "simt_step.yield"(%arg0) : (i32) -> ()
        }, {
          %c0_i32_6 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_6) : (i32) -> ()
        }) : (i1) -> i32
        %c4_i32_5 = arith.constant 4 : i32
        %9 = arith.addi %arg0, %c4_i32_5 : i32
        %c1_i32 = arith.constant 1 : i32
        %10 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%8, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %1 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %2 = arith.addi %c0_i32, %arg0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_13 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_13 : i32
      %20 = arith.addi %19, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %21 = arith.addi %c8_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_14 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
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
      %c4_i32_13 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_13 : i32
      %20 = arith.addi %19, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %21 = arith.addi %c28_i32, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_14 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.yield"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_5 = arith.constant true
    %c32_i32 = arith.constant 32 : i32
    %9 = arith.addi %c32_i32, %0 : i32
    %true_6 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_7 = arith.constant 0 : i32
    %c0_i32_8 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_13 = arith.constant 4 : i32
      %19 = arith.muli %arg3, %c4_i32_13 : i32
      %20 = arith.addi %19, %0 : i32
      %c48_i32_14 = arith.constant 48 : i32
      %21 = arith.addi %c48_i32_14, %20 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_15 : i32
      "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %19 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %20 = arith.addi %arg3, %c1_i32 : i32
      "simt_step.continue"(%19, %20) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %true_9 = arith.constant true
    %c48_i32 = arith.constant 48 : i32
    %12 = arith.addi %c48_i32, %0 : i32
    %true_10 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c68_i32 = arith.constant 68 : i32
    %14 = arith.addi %c68_i32, %0 : i32
    %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
    %16 = "simt_step.switch"(%15, %0) ({
    ^bb0(%arg2: i32):
      %c2_i32 = arith.constant 2 : i32
      "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %20 = arith.addi %c72_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_13 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_13 : i32
      %23 = "simt_step.if"(%22) ({
        %c76_i32 = arith.constant 76 : i32
        %31 = arith.addi %c76_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_16 : i32
        %34 = "simt_step.if"(%33) ({
          %c4_i32_17 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %c4_i32_17 = arith.constant 4 : i32
          %35 = arith.addi %0, %c4_i32_17 : i32
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c4_i32_16 = arith.constant 4 : i32
        %31 = arith.addi %0, %c4_i32_16 : i32
        "simt_step.yield"(%31) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c80_i32 = arith.constant 80 : i32
      %25 = arith.addi %c80_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_14 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_14 : i32
      %28 = "simt_step.if"(%27) ({
        %c84_i32 = arith.constant 84 : i32
        %31 = arith.addi %c84_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_16 : i32
        %34 = "simt_step.if"(%33) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c4_i32_16 = arith.constant 4 : i32
        "simt_step.yield"(%c4_i32_16) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb3(%29: i32):  // no predecessors
      %c4_i32_15 = arith.constant 4 : i32
      %30 = arith.addi %0, %c4_i32_15 : i32
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_11 = arith.constant true
    %c64_i32 = arith.constant 64 : i32
    %17 = arith.addi %c64_i32, %0 : i32
    %true_12 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

