module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %7 = arith.addi %c0_i32_1, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) : (i32) -> ()
    }) : (i1) -> i32
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = "simt_step.switch"(%2, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_4 = arith.constant 0 : i32
        %15 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %16 = "simt_step.if"(%15) ({
          %true = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %18 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }, {
          %true = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %18 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%16) : (i32) -> ()
      }, {
        %true = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %16 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %16, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %15 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %15, %c1_i32 : i32
        %17 = arith.cmpi slt, %arg6, %16 : i32
        "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %true = arith.constant true
        %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %c4_i32 = arith.constant 4 : i32
        %16 = arith.muli %arg6, %c4_i32 : i32
        %17 = arith.addi %c80_i32, %16 : i32
        %18 = arith.addi %17, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%15, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %11 = arith.remsi %arg3, %c2_i32 : i32
      %12 = simt_step.lane_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32 : i32
          %21 = arith.cmpi slt, %arg7, %20 : i32
          "simt_step.condition"(%21, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_6 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg7, %c4_i32 : i32
          %21 = arith.addi %c96_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%19, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%16: i32):  // no predecessors
        %true = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %18 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %5 = arith.select %4, %1, %3 : i32
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
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %15 = arith.addi %c8_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %13 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_6 : i32
      %16 = arith.addi %c128_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_7 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c28_i32 = arith.constant 28 : i32
    %6 = arith.addi %c28_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_2 : i32
    %9 = "simt_step.if"(%8) ({
      %c4_i32_5 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_5) : (i32) -> ()
    }, {
      %c32_i32 = arith.constant 32 : i32
      %13 = arith.addi %c32_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_5 = arith.constant 4 : i32
      %15 = arith.addi %0, %c4_i32_5 : i32
      %16 = "simt_step.switch"(%14, %15) ({
      ^bb0(%arg2: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %22 = arith.muli %arg4, %c4_i32_12 : i32
          %23 = arith.addi %22, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %24 = arith.addi %c36_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_13 : i32
          "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %22 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg4, %c1_i32 : i32
          %true_12 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %24 = arith.muli %arg4, %c4_i32_13 : i32
          %25 = arith.addi %c144_i32, %24 : i32
          %26 = arith.addi %25, %0 : i32
          %true_14 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %22 = arith.muli %arg4, %c4_i32_12 : i32
          %23 = arith.addi %22, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %24 = arith.addi %c56_i32, %23 : i32
          %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %26 = arith.cmpi ne, %25, %c0_i32_13 : i32
          "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %22 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg4, %c1_i32 : i32
          %true_12 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %24 = arith.muli %arg4, %c4_i32_13 : i32
          %25 = arith.addi %c160_i32, %24 : i32
          %26 = arith.addi %25, %0 : i32
          %true_14 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%22, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_10 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %20 = arith.addi %c176_i32, %0 : i32
        %true_11 = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) : (i32) -> ()
    }) : (i1) -> i32
    %c192_i32 = arith.constant 192 : i32
    %10 = arith.addi %c192_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_3 = arith.constant 0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %13 = arith.muli %arg3, %c4_i32_5 : i32
      %14 = arith.addi %13, %0 : i32
      %c76_i32 = arith.constant 76 : i32
      %15 = arith.addi %c76_i32, %14 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_6 : i32
      "simt_step.condition"(%17, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c96_i32 = arith.constant 96 : i32
      %13 = arith.addi %c96_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = simt_step.subgroup_id
      %16 = arith.index_cast %15 : index to i32
      %17 = "simt_step.switch"(%14, %16) ({
      ^bb0(%arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %43 = arith.muli %arg6, %c4_i32_16 : i32
          %44 = arith.addi %43, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %45 = arith.addi %c100_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_17 : i32
          "simt_step.condition"(%47, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %43 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %44 = arith.addi %arg6, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %45 = arith.muli %arg6, %c4_i32_18 : i32
          %46 = arith.addi %c208_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_19 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %26 = arith.addi %c120_i32, %0 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %28 = simt_step.lane_id
        %29 = arith.index_cast %28 : index to i32
        %30 = "simt_step.switch"(%27, %29) ({
        ^bb0(%arg5: i32):
          %43 = simt_step.subgroup_id
          %44 = arith.index_cast %43 : index to i32
          %true_16 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %45 = arith.addi %c224_i32, %0 : i32
          %true_17 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = true} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c1_i32_18 = arith.constant 1 : i32
          %51 = arith.addi %0, %c1_i32_18 : i32
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %31 = arith.addi %c240_i32, %0 : i32
        %true_11 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %34 = arith.addi %c124_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = simt_step.lane_id
        %37 = arith.index_cast %36 : index to i32
        %38 = "simt_step.switch"(%35, %37) ({
        ^bb0(%arg5: i32):
          %true_16 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %43 = arith.addi %c256_i32, %0 : i32
          %true_17 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c1_i32_18 = arith.constant 1 : i32
          %46 = arith.addi %0, %c1_i32_18 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %39 = arith.addi %c272_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %41 = arith.addi %c288_i32, %0 : i32
        %true_15 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %18 = arith.addi %arg2, %17 : i32
      %c1_i32 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_6 : i32
      %21 = arith.addi %c304_i32, %20 : i32
      %22 = arith.addi %21, %0 : i32
      %true_7 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

