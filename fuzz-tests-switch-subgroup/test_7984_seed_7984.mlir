module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %1 = simt_step.lane_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32 : i32
          %15 = arith.addi %c0_i32_7, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.continue"(%13, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32 : i32
          %15 = arith.addi %c16_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%13, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %9:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_4 = arith.constant 2 : i32
        %12 = arith.remsi %arg3, %c2_i32_4 : i32
        %13 = "simt_step.switch"(%12, %arg0) ({
        ^bb0(%arg7: i32):
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32 : i32
          %17 = arith.addi %c32_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_6 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32_7 : i32
          %22 = arith.addi %c48_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %true_8 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %26 = arith.muli %arg6, %c4_i32_9 : i32
          %27 = arith.addi %c64_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c2_i32_4 = arith.constant 2 : i32
        %12 = arith.remsi %arg3, %c2_i32_4 : i32
        %13 = simt_step.lane_id
        %14 = arith.index_cast %13 : index to i32
        %15 = "simt_step.switch"(%12, %14) ({
        ^bb0(%arg7: i32):
          %true_5 = arith.constant true
          %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %18 = arith.muli %arg6, %c4_i32 : i32
          %19 = arith.addi %c80_i32, %18 : i32
          %20 = arith.addi %19, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %true_6 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %23 = arith.muli %arg6, %c4_i32_7 : i32
          %24 = arith.addi %c96_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %16 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%15, %16) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c112_i32 = arith.constant 112 : i32
    %5 = arith.addi %c112_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c3_i32 = arith.constant 3 : i32
    %7 = arith.addi %0, %c3_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %true_3 = arith.constant true
      %c128_i32 = arith.constant 128 : i32
      %22 = arith.addi %c128_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%24: i32):  // no predecessors
      %25 = simt_step.lane_id
      %26 = arith.index_cast %25 : index to i32
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c12_i32 = arith.constant 12 : i32
      %28 = arith.addi %c12_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %30 = "simt_step.switch"(%29, %0) ({
      ^bb0(%arg3: i32):
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %34 = simt_step.subgroup_id
        %35 = arith.index_cast %34 : index to i32
        %true_7 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %36 = arith.addi %c144_i32, %0 : i32
        %true_8 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c16_i32 = arith.constant 16 : i32
        %39 = arith.addi %c16_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_9 : i32
        %42 = "simt_step.if"(%41) ({
          %c0_i32_15 = arith.constant 0 : i32
          %49 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %43 = arith.addi %c160_i32, %0 : i32
        %true_10 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %45 = arith.addi %c176_i32, %0 : i32
        %true_12 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb3(%47: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %48:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_15 : i32
          %50 = arith.addi %49, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %51 = arith.addi %c20_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_16 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_16 : i32
          %52 = arith.addi %c192_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_17 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%48#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %31 = arith.addi %c208_i32, %0 : i32
      %true_6 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c224_i32 = arith.constant 224 : i32
    %9 = arith.addi %c224_i32, %0 : i32
    %true_0 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c40_i32 = arith.constant 40 : i32
    %11 = arith.addi %c40_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
    %14 = "simt_step.if"(%13) ({
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %22:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %23 = arith.muli %arg3, %c4_i32_5 : i32
        %24 = arith.addi %23, %0 : i32
        %c44_i32 = arith.constant 44 : i32
        %25 = arith.addi %c44_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_6 : i32
        "simt_step.condition"(%27, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %23 = arith.addi %arg2, %arg3 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg3, %c1_i32 : i32
        %true_5 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %25 = arith.muli %arg3, %c4_i32_6 : i32
        %26 = arith.addi %c240_i32, %25 : i32
        %27 = arith.addi %26, %0 : i32
        %true_7 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%22#0) : (i32) -> ()
    }, {
      "simt_step.yield"(%0) : (i32) -> ()
    }) : (i1) -> i32
    %c256_i32 = arith.constant 256 : i32
    %15 = arith.addi %c256_i32, %0 : i32
    %true_2 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c64_i32 = arith.constant 64 : i32
    %17 = arith.addi %c64_i32, %0 : i32
    %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
    %19 = simt_step.lane_id
    %20 = arith.index_cast %19 : index to i32
    %21 = "simt_step.switch"(%18, %20) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      "simt_step.yield"(%c0_i32_3) {fallthrough = false} : (i32) -> ()
    ^bb1(%22: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %23 = arith.addi %c68_i32, %0 : i32
      %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %25 = arith.addi %0, %c1_i32 : i32
      %26 = "simt_step.switch"(%24, %25) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        "simt_step.yield"(%c0_i32_6) {fallthrough = true} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_15 : i32
          %48 = arith.addi %47, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %49 = arith.addi %c72_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_16 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_17 : i32
          %50 = arith.addi %c272_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_18 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %31 = arith.addi %c288_i32, %0 : i32
        %true_10 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %34 = arith.addi %c92_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_11 : i32
        %37 = "simt_step.if"(%36) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %38 = arith.addi %c304_i32, %0 : i32
        %true_12 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb3(%40: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %41 = arith.addi %c96_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_13 : i32
        %44 = "simt_step.if"(%43) ({
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %c3_i32_15 = arith.constant 3 : i32
          %47 = arith.addi %0, %c3_i32_15 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %45 = arith.addi %c320_i32, %0 : i32
        %true_14 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %27 = arith.addi %c336_i32, %0 : i32
      %true_5 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

