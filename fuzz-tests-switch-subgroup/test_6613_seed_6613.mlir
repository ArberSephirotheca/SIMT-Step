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
      %c3_i32 = arith.constant 3 : i32
      %1 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = "simt_step.switch"(%1, %c1_i32) ({
      ^bb0(%arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %4 = arith.remsi %arg3, %c4_i32 : i32
        %5 = "simt_step.switch"(%4, %arg0) ({
        ^bb0(%arg7: i32):
          %true_7 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %16 = arith.muli %arg5, %c4_i32_9 : i32
          %17 = arith.addi %c0_i32_8, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_10 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_11 : i32
          %22 = arith.addi %c16_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %true_12 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_13 : i32
          %27 = arith.addi %c32_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          %true_14 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %31 = arith.muli %arg5, %c4_i32_15 : i32
          %32 = arith.addi %c48_i32, %31 : i32
          %33 = arith.addi %32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
      ^bb1(%6: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_8 : i32
          %17 = arith.cmpi slt, %arg8, %16 : i32
          "simt_step.condition"(%17, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_7 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %16 = arith.muli %arg8, %c4_i32_8 : i32
          %17 = arith.addi %c64_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %19 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.continue"(%15, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%7#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%8: i32):  // no predecessors
        %true = arith.constant true
        %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %10 = arith.muli %arg5, %c4_i32_4 : i32
        %11 = arith.addi %c80_i32, %10 : i32
        %12 = arith.addi %11, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
      ^bb3(%13: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_7 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32_8 : i32
          %17 = arith.cmpi slt, %arg8, %16 : i32
          "simt_step.condition"(%17, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_7 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %16 = arith.muli %arg8, %c4_i32_8 : i32
          %17 = arith.addi %c96_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %19 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.yield"(%15, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %c1_i32_1 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32_1 : i32
      "simt_step.break"(%2, %3) : (i32, i32) -> ()
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
      "simt_step.yield"() : () -> ()
    }, {
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %13 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%13, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %13 = arith.remsi %0, %c3_i32 : i32
        %14 = "simt_step.switch"(%13, %0) ({
        ^bb0(%arg4: i32):
          %c1_i32_4 = arith.constant 1 : i32
          %16 = arith.addi %arg4, %c1_i32_4 : i32
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        ^bb1(%17: i32):  // no predecessors
          %c0_i32_5 = arith.constant 0 : i32
          %18 = arith.addi %17, %c0_i32_5 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb2(%19: i32):  // no predecessors
          %c4_i32_6 = arith.constant 4 : i32
          %20 = arith.addi %19, %c4_i32_6 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %15) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_1 = arith.constant 4 : i32
    %8 = arith.addi %0, %c4_i32_1 : i32
    %9 = "simt_step.switch"(%7, %8) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %17 = arith.muli %arg4, %c4_i32_7 : i32
        %18 = arith.addi %17, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %19 = arith.addi %c12_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_8 : i32
        "simt_step.condition"(%21, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %17 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %18 = arith.addi %arg4, %c1_i32 : i32
        %true_7 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %c4_i32_8 = arith.constant 4 : i32
        %19 = arith.muli %arg4, %c4_i32_8 : i32
        %20 = arith.addi %c112_i32, %19 : i32
        %21 = arith.addi %20, %0 : i32
        %true_9 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%13: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %17 = arith.muli %arg4, %c4_i32_7 : i32
        %18 = arith.addi %17, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %19 = arith.addi %c32_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_8 : i32
        "simt_step.condition"(%21, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32_12 : i32
          %25 = arith.addi %24, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %26 = arith.addi %c52_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_13 : i32
          "simt_step.condition"(%28, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %24 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %25 = arith.addi %arg6, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_14 : i32
          %27 = arith.addi %c128_i32, %26 : i32
          %28 = arith.addi %27, %0 : i32
          %true_15 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %18 = arith.addi %arg3, %17#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg4, %c1_i32 : i32
        %true_9 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %20 = arith.muli %arg4, %c4_i32_10 : i32
        %21 = arith.addi %c144_i32, %20 : i32
        %22 = arith.addi %21, %0 : i32
        %true_11 = arith.constant true
        %23 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %15 = arith.addi %c160_i32, %0 : i32
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    return
  }
}

