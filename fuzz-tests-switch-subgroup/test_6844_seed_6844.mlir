module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.addi %arg0, %c2_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %c0_i32_0 = arith.constant 0 : i32
      %3:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_4 = arith.constant 1 : i32
        %10 = arith.addi %9, %c1_i32_4 : i32
        %11 = arith.cmpi slt, %arg6, %10 : i32
        "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %11 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %12 = arith.addi %11, %c1_i32_7 : i32
          %13 = arith.cmpi slt, %arg8, %12 : i32
          "simt_step.condition"(%13, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg8, %c4_i32 : i32
          %13 = arith.addi %c0_i32_7, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_8 = arith.constant 1 : i32
          %15 = arith.addi %arg8, %c1_i32_8 : i32
          "simt_step.continue"(%11, %15) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_6 = arith.constant 1 : i32
        %10 = arith.addi %arg6, %c1_i32_6 : i32
        "simt_step.break"(%9#0, %10) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%3#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%4: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_4 = arith.constant 1 : i32
        %10 = arith.addi %9, %c1_i32_4 : i32
        %11 = arith.cmpi slt, %arg6, %10 : i32
        "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_4 = arith.constant 2 : i32
        %9 = arith.remsi %arg3, %c2_i32_4 : i32
        %10 = simt_step.lane_id
        %11 = arith.index_cast %10 : index to i32
        %12 = "simt_step.switch"(%9, %11) ({
        ^bb0(%arg7: i32):
          %true_6 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %19 = arith.muli %arg6, %c4_i32_7 : i32
          %20 = arith.addi %c16_i32, %19 : i32
          %21 = arith.addi %20, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%22: i32):  // no predecessors
          %true_8 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %24 = arith.muli %arg6, %c4_i32_9 : i32
          %25 = arith.addi %c32_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %true_10 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_11 : i32
          %30 = arith.addi %c48_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %c4_i32 = arith.constant 4 : i32
        %14 = arith.muli %arg6, %c4_i32 : i32
        %15 = arith.addi %c64_i32, %14 : i32
        %16 = arith.addi %15, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_5 = arith.constant 1 : i32
        %17 = arith.addi %arg6, %c1_i32_5 : i32
        "simt_step.break"(%12, %17) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%6: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      %7 = arith.remsi %arg3, %c3_i32_3 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = "simt_step.switch"(%7, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %10 = "simt_step.if"(%9) ({
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %18 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %18 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %true = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %13 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %true_5 = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %16 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
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
    %c3_i32 = arith.constant 3 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %6 = arith.muli %arg3, %c4_i32_2 : i32
      %7 = arith.addi %6, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %8 = arith.addi %c8_i32, %7 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_3 : i32
      "simt_step.condition"(%10, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %6 = arith.addi %c28_i32, %0 : i32
      %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
      %8 = "simt_step.switch"(%7, %0) ({
      ^bb0(%arg4: i32):
        %15 = simt_step.lane_id
        %16 = arith.index_cast %15 : index to i32
        %true_4 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %17 = arith.addi %c144_i32, %0 : i32
        %true_5 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %20 = arith.addi %c32_i32, %0 : i32
        %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_6 = arith.constant 3 : i32
        %22 = arith.addi %0, %c3_i32_6 : i32
        %23 = "simt_step.switch"(%21, %22) ({
        ^bb0(%arg5: i32):
          %c1_i32_9 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %c3_i32_10 = arith.constant 3 : i32
          %true_11 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %27 = arith.addi %c160_i32, %0 : i32
          %true_12 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %25:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_9 : i32
          %27 = arith.addi %26, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %28 = arith.addi %c36_i32, %27 : i32
          %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %30 = arith.cmpi ne, %29, %c0_i32_10 : i32
          "simt_step.condition"(%30, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %26 = arith.addi %arg5, %arg6 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %27 = arith.addi %arg6, %c1_i32_9 : i32
          %true_10 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %28 = arith.muli %arg6, %c4_i32_11 : i32
          %29 = arith.addi %c176_i32, %28 : i32
          %30 = arith.addi %29, %0 : i32
          %true_12 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%26, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%25#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %9 = arith.addi %arg2, %8 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %c4_i32_2 = arith.constant 4 : i32
      %11 = arith.muli %arg3, %c4_i32_2 : i32
      %12 = arith.addi %c192_i32, %11 : i32
      %13 = arith.addi %12, %0 : i32
      %true_3 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

