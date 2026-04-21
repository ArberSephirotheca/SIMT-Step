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
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %2 = "simt_step.switch"(%1, %arg0) ({
      ^bb0(%arg6: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32_9 : i32
          %14 = arith.cmpi slt, %arg8, %13 : i32
          "simt_step.condition"(%14, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %13 = arith.muli %arg8, %c4_i32_9 : i32
          %14 = arith.addi %c0_i32_8, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %16 = arith.addi %arg8, %c1_i32_10 : i32
          "simt_step.yield"(%12, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%5: i32):  // no predecessors
        %c0_i32_3 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %7 = "simt_step.if"(%6) ({
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32_8 : i32
          %14 = arith.addi %c16_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) : (i32) -> ()
        }, {
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %13 = arith.muli %arg5, %c4_i32_8 : i32
          %14 = arith.addi %c32_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
      ^bb2(%8: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32_9 : i32
          %14 = arith.cmpi slt, %arg8, %13 : i32
          "simt_step.condition"(%14, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %13 = arith.muli %arg8, %c4_i32_8 : i32
          %14 = arith.addi %c48_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %16 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.yield"(%12, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%9#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%10: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %11:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %12 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %13 = arith.addi %12, %c1_i32_9 : i32
          %14 = arith.cmpi slt, %arg8, %13 : i32
          "simt_step.condition"(%14, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %13 = arith.muli %arg8, %c4_i32_8 : i32
          %14 = arith.addi %c64_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %16 = arith.addi %arg8, %c1_i32_9 : i32
          "simt_step.yield"(%12, %16) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %3 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%2, %3) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %17 = arith.addi %c12_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %19 = "simt_step.switch"(%18, %c0_i32_5) ({
      ^bb0(%arg2: i32):
        %20 = simt_step.subgroup_id
        %21 = arith.index_cast %20 : index to i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c16_i32 = arith.constant 16 : i32
        %23 = arith.addi %c16_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %25 = simt_step.lane_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%24, %26) ({
        ^bb0(%arg3: i32):
          %38 = simt_step.subgroup_id
          %39 = arith.index_cast %38 : index to i32
          %true_15 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %40 = arith.addi %c80_i32, %0 : i32
          %true_16 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %43 = arith.addi %0, %c0_i32_17 : i32
          %true_18 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %44 = arith.addi %c96_i32, %0 : i32
          %true_19 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c112_i32_7 = arith.constant 112 : i32
        %28 = arith.addi %c112_i32_7, %0 : i32
        %true_8 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %31 = arith.addi %0, %c3_i32 : i32
        %true_9 = arith.constant true
        %c128_i32 = arith.constant 128 : i32
        %32 = arith.addi %c128_i32, %0 : i32
        %true_10 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb3(%34: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_15 : i32
          %39 = arith.addi %38, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %40 = arith.addi %c20_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_16 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_16 : i32
          %41 = arith.addi %c144_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_17 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %36 = arith.addi %c160_i32, %0 : i32
        %true_14 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c40_i32 = arith.constant 40 : i32
      %17 = arith.addi %c40_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_5 : i32
      %20 = "simt_step.if"(%19) ({
        %23 = simt_step.lane_id
        %24 = arith.index_cast %23 : index to i32
        "simt_step.yield"(%24) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %24 = arith.muli %arg3, %c4_i32_9 : i32
          %25 = arith.addi %24, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %26 = arith.addi %c44_i32, %25 : i32
          %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %28 = arith.cmpi ne, %27, %c0_i32_10 : i32
          "simt_step.condition"(%28, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %24 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %arg3, %c1_i32 : i32
          %true_9 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %26 = arith.muli %arg3, %c4_i32_10 : i32
          %27 = arith.addi %c176_i32, %26 : i32
          %28 = arith.addi %27, %0 : i32
          %true_11 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24, %25) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%23#0) : (i32) -> ()
      }) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %21 = arith.addi %c192_i32, %0 : i32
      %true_6 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c208_i32 = arith.constant 208 : i32
    %9 = arith.addi %c208_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %17 = arith.muli %arg3, %c4_i32_5 : i32
      %18 = arith.addi %17, %0 : i32
      %c64_i32 = arith.constant 64 : i32
      %19 = arith.addi %c64_i32, %18 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_6 : i32
      "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c84_i32 = arith.constant 84 : i32
      %17 = arith.addi %c84_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg4: i32):
        %c88_i32 = arith.constant 88 : i32
        %28 = arith.addi %c88_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_8 : i32
        %31 = "simt_step.if"(%30) ({
          %43 = simt_step.lane_id
          %44 = arith.index_cast %43 : index to i32
          "simt_step.yield"(%44) : (i32) -> ()
        }, {
          %c4_i32_16 = arith.constant 4 : i32
          %43 = arith.addi %0, %c4_i32_16 : i32
          "simt_step.yield"(%43) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %32 = arith.addi %c224_i32, %0 : i32
        %true_9 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_10 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %34 = arith.addi %c240_i32, %0 : i32
        %true_11 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %43 = arith.muli %arg6, %c4_i32_16 : i32
          %44 = arith.addi %43, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %45 = arith.addi %c92_i32, %44 : i32
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
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %45 = arith.muli %arg6, %c4_i32_18 : i32
          %46 = arith.addi %c256_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_19 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %39 = simt_step.subgroup_id
        %40 = arith.index_cast %39 : index to i32
        %true_14 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %41 = arith.addi %c272_i32, %0 : i32
        %true_15 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %22 = arith.addi %arg2, %21 : i32
      %c1_i32 = arith.constant 1 : i32
      %23 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %24 = arith.muli %arg3, %c4_i32_6 : i32
      %25 = arith.addi %c288_i32, %24 : i32
      %26 = arith.addi %25, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22, %23) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c112_i32 = arith.constant 112 : i32
    %12 = arith.addi %c112_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = "simt_step.switch"(%13, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_13 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_13 : i32
        %38 = arith.addi %37, %0 : i32
        %c116_i32 = arith.constant 116 : i32
        %39 = arith.addi %c116_i32, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_14 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %37 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        %true_13 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_14 : i32
        %40 = arith.addi %c304_i32, %39 : i32
        %41 = arith.addi %40, %0 : i32
        %true_15 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c136_i32 = arith.constant 136 : i32
      %19 = arith.addi %c136_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %21 = arith.addi %0, %c3_i32 : i32
      %22 = "simt_step.switch"(%20, %21) ({
      ^bb0(%arg3: i32):
        %c140_i32 = arith.constant 140 : i32
        %37 = arith.addi %c140_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_13 : i32
        %40 = "simt_step.if"(%39) ({
          %c3_i32_21 = arith.constant 3 : i32
          %59 = arith.addi %0, %c3_i32_21 : i32
          "simt_step.yield"(%59) : (i32) -> ()
        }, {
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %41 = arith.addi %c320_i32, %0 : i32
        %true_14 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %44:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_21 : i32
          %60 = arith.addi %59, %0 : i32
          %c144_i32 = arith.constant 144 : i32
          %61 = arith.addi %c144_i32, %60 : i32
          %62 = "simt_step.buffer.load"(%arg1, %61) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %63 = arith.cmpi ne, %62, %c0_i32_22 : i32
          "simt_step.condition"(%63, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %59 = arith.addi %arg4, %arg5 : i32
          %c1_i32_21 = arith.constant 1 : i32
          %60 = arith.addi %arg5, %c1_i32_21 : i32
          %true_22 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %61 = arith.muli %arg5, %c4_i32_23 : i32
          %62 = arith.addi %c336_i32, %61 : i32
          %63 = arith.addi %62, %0 : i32
          %true_24 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%59, %60) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_17 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %45 = arith.addi %c352_i32, %0 : i32
        %true_18 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%47: i32):  // no predecessors
        %c164_i32 = arith.constant 164 : i32
        %48 = arith.addi %c164_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %50 = "simt_step.switch"(%49, %c1_i32) ({
        ^bb0(%arg4: i32):
          %c1_i32_21 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_21) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          %63 = simt_step.lane_id
          %64 = arith.index_cast %63 : index to i32
          %true_22 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %65 = arith.addi %c368_i32, %0 : i32
          %true_23 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      ^bb3(%51: i32):  // no predecessors
        %c168_i32 = arith.constant 168 : i32
        %52 = arith.addi %c168_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %54 = simt_step.subgroup_id
        %55 = arith.index_cast %54 : index to i32
        %56 = "simt_step.switch"(%53, %55) ({
        ^bb0(%arg4: i32):
          %c1_i32_21 = arith.constant 1 : i32
          %59 = arith.addi %0, %c1_i32_21 : i32
          %true_22 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %60 = arith.addi %c384_i32, %0 : i32
          %true_23 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
        ^bb1(%62: i32):  // no predecessors
          %c1_i32_24 = arith.constant 1 : i32
          %63 = arith.addi %0, %c1_i32_24 : i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb2(%64: i32):  // no predecessors
          %c4_i32_25 = arith.constant 4 : i32
          %65 = arith.addi %0, %c4_i32_25 : i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %57 = arith.addi %c400_i32, %0 : i32
        %true_20 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %23 = arith.addi %c416_i32, %0 : i32
      %true_8 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %26 = simt_step.lane_id
      %27 = arith.index_cast %26 : index to i32
      "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
    ^bb3(%28: i32):  // no predecessors
      %c172_i32 = arith.constant 172 : i32
      %29 = arith.addi %c172_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_9 : i32
      %32 = "simt_step.if"(%31) ({
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_15 : i32
          %39 = arith.addi %38, %0 : i32
          %c176_i32 = arith.constant 176 : i32
          %40 = arith.addi %c176_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_16 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32 : i32
          %true_15 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_16 : i32
          %41 = arith.addi %c432_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_17 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) : (i32) -> ()
      }, {
        %c1_i32 = arith.constant 1 : i32
        "simt_step.yield"(%c1_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c448_i32 = arith.constant 448 : i32
      %33 = arith.addi %c448_i32, %0 : i32
      %true_10 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_11 = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %35 = arith.addi %c464_i32, %0 : i32
      %true_12 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true_3 = arith.constant true
    %c480_i32 = arith.constant 480 : i32
    %15 = arith.addi %c480_i32, %0 : i32
    %true_4 = arith.constant true
    %16 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

