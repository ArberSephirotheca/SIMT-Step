module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32 : i32
      %6 = arith.addi %c0_i32_4, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %8) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %4 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %4, %c1_i32 : i32
      %6 = arith.cmpi slt, %arg5, %5 : i32
      "simt_step.condition"(%6, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %4:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_6 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32_6 : i32
        %8 = arith.cmpi slt, %arg7, %7 : i32
        "simt_step.condition"(%8, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %c2_i32 = arith.constant 2 : i32
        %6 = arith.remsi %arg3, %c2_i32 : i32
        %7 = simt_step.subgroup_id
        %8 = arith.index_cast %7 : index to i32
        %9 = "simt_step.switch"(%6, %8) ({
        ^bb0(%arg8: i32):
          %true_7 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %16 = arith.muli %arg7, %c4_i32_8 : i32
          %17 = arith.addi %c16_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_9 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %21 = arith.muli %arg7, %c4_i32_10 : i32
          %22 = arith.addi %c32_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %true_11 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %26 = arith.muli %arg7, %c4_i32_12 : i32
          %27 = arith.addi %c48_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.muli %arg7, %c4_i32 : i32
        %12 = arith.addi %c64_i32, %11 : i32
        %13 = arith.addi %12, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32_6 = arith.constant 1 : i32
        %14 = arith.addi %arg7, %c1_i32_6 : i32
        "simt_step.yield"(%9, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4#0, %5) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %3 = arith.select %2, %0#0, %1#0 : i32
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
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %17 = arith.muli %arg5, %c4_i32_9 : i32
        %18 = arith.addi %17, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %19 = arith.addi %c28_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_10 : i32
        "simt_step.condition"(%21, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %17 = arith.addi %arg4, %arg5 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %18 = arith.addi %arg5, %c1_i32_9 : i32
        %true_10 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_11 : i32
        %20 = arith.addi %c80_i32, %19 : i32
        %21 = arith.addi %20, %0 : i32
        %true_12 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17, %18) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %11 = arith.addi %arg2, %10#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %c4_i32_7 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_7 : i32
      %14 = arith.addi %c96_i32, %13 : i32
      %15 = arith.addi %14, %0 : i32
      %true_8 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %10 = arith.muli %arg3, %c4_i32_5 : i32
      %11 = arith.addi %10, %0 : i32
      %c48_i32 = arith.constant 48 : i32
      %12 = arith.addi %c48_i32, %11 : i32
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
      %c112_i32 = arith.constant 112 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_5 : i32
      %13 = arith.addi %c112_i32, %12 : i32
      %14 = arith.addi %13, %0 : i32
      %true_6 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c68_i32 = arith.constant 68 : i32
    %7 = arith.addi %c68_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %9 = "simt_step.switch"(%8, %c0_i32_4) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %10:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %28 = arith.muli %arg4, %c4_i32_14 : i32
        %29 = arith.addi %28, %0 : i32
        %c72_i32 = arith.constant 72 : i32
        %30 = arith.addi %c72_i32, %29 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_15 : i32
        "simt_step.condition"(%32, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %28 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %29 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %30 = arith.muli %arg4, %c4_i32_15 : i32
        %31 = arith.addi %c128_i32, %30 : i32
        %32 = arith.addi %31, %0 : i32
        %true_16 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28, %29) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%10#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%11: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %12 = arith.addi %c92_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_7 : i32
      %15 = "simt_step.if"(%14) ({
        %c96_i32 = arith.constant 96 : i32
        %28 = arith.addi %c96_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %30 = arith.addi %0, %c0_i32_14 : i32
        %31 = "simt_step.switch"(%29, %30) ({
        ^bb0(%arg3: i32):
          %32 = simt_step.lane_id
          %33 = arith.index_cast %32 : index to i32
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_15 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %35 = arith.addi %c144_i32, %0 : i32
          %true_16 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %true_18 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %38 = arith.addi %c160_i32, %0 : i32
          %true_19 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_17) {fallthrough = true} : (i32) -> ()
        ^bb3(%40: i32):  // no predecessors
          %c3_i32_20 = arith.constant 3 : i32
          %true_21 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %41 = arith.addi %c176_i32, %0 : i32
          %true_22 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %28 = arith.addi %c100_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = "simt_step.switch"(%29, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_16 = arith.constant 0 : i32
          %33 = arith.addi %0, %c0_i32_16 : i32
          %true_17 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %34 = arith.addi %c192_i32, %0 : i32
          %true_18 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %37 = simt_step.lane_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %31 = arith.addi %c208_i32, %0 : i32
        %true_15 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %16 = arith.addi %c224_i32, %0 : i32
      %true = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %18 = arith.addi %c240_i32, %0 : i32
      %true_9 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %21 = arith.addi %0, %c2_i32 : i32
      %true_10 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %22 = arith.addi %c256_i32, %0 : i32
      %true_11 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %25 = arith.addi %0, %c3_i32 : i32
      %true_12 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %26 = arith.addi %c272_i32, %0 : i32
      %true_13 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

