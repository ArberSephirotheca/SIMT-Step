module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %7 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.cmpi slt, %arg5, %8 : i32
        "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c1_i32 = arith.constant 1 : i32
        %7 = "simt_step.switch"(%arg3, %c1_i32) ({
        ^bb0(%arg6: i32):
          %true_5 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c16_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
        ^bb1(%13: i32):  // no predecessors
          %true_6 = arith.constant true
          %14 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %15 = arith.muli %arg5, %c4_i32_7 : i32
          %16 = arith.addi %c32_i32, %15 : i32
          %17 = arith.addi %16, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32_4 = arith.constant 1 : i32
        %8 = arith.addi %arg5, %c1_i32_4 : i32
        "simt_step.yield"(%7, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%6#0) : (i32) -> ()
    }, {
      %true_2 = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %7 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
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
      %c4_i32_4 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_4 : i32
      %11 = arith.addi %10, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %12 = arith.addi %c8_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_5 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %10 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c64_i32 = arith.constant 64 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_4 : i32
      %13 = arith.addi %c64_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_5 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_4 : i32
      %11 = arith.addi %10, %0 : i32
      %c28_i32 = arith.constant 28 : i32
      %12 = arith.addi %c28_i32, %11 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_5 : i32
      "simt_step.condition"(%14, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %10 = simt_step.lane_id
      %11 = arith.index_cast %10 : index to i32
      %12 = arith.addi %arg2, %11 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %c4_i32_4 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_4 : i32
      %15 = arith.addi %c80_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_5 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c48_i32 = arith.constant 48 : i32
    %7 = arith.addi %c48_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %9 = "simt_step.switch"(%8, %c2_i32) ({
    ^bb0(%arg2: i32):
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
    ^bb1(%10: i32):  // no predecessors
      %c1_i32_4 = arith.constant 1 : i32
      %true = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %11 = arith.addi %c96_i32, %0 : i32
      %true_5 = arith.constant true
      %12 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c1_i32_4) {fallthrough = false} : (i32) -> ()
    ^bb2(%13: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_10 : i32
        %24 = arith.addi %23, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %25 = arith.addi %c52_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_11 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_16 : i32
          %31 = arith.addi %30, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %32 = arith.addi %c72_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_17 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %30 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_18 : i32
          %33 = arith.addi %c112_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_19 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %24 = arith.addi %arg3, %23#0 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_14 : i32
        %27 = arith.addi %c128_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_15 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%15: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %16 = arith.addi %c92_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %true_10 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %23 = arith.addi %c144_i32, %0 : i32
        %true_11 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %27 = arith.muli %arg5, %c4_i32_14 : i32
          %28 = arith.addi %27, %0 : i32
          %c96_i32_15 = arith.constant 96 : i32
          %29 = arith.addi %c96_i32_15, %28 : i32
          %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %31 = arith.cmpi ne, %30, %c0_i32_16 : i32
          "simt_step.condition"(%31, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %27 = arith.addi %arg4, %arg5 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %28 = arith.addi %arg5, %c1_i32_14 : i32
          %true_15 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %29 = arith.muli %arg5, %c4_i32_16 : i32
          %30 = arith.addi %c160_i32, %29 : i32
          %31 = arith.addi %30, %0 : i32
          %true_17 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %21 = arith.addi %c176_i32, %0 : i32
      %true_9 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

