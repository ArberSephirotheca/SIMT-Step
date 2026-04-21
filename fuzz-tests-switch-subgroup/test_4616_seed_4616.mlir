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
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg6: i32, %arg7: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32_3 : i32
        %5 = arith.cmpi slt, %arg7, %4 : i32
        "simt_step.condition"(%5, %arg6, %arg7) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg6: i32, %arg7: i32):
        %3 = simt_step.lane_id
        %4 = arith.index_cast %3 : index to i32
        %5 = "simt_step.switch"(%arg3, %4) ({
        ^bb0(%arg8: i32):
          %true = arith.constant true
          %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.muli %arg7, %c4_i32 : i32
          %9 = arith.addi %c0_i32_4, %8 : i32
          %10 = arith.addi %9, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
        ^bb1(%11: i32):  // no predecessors
          %true_5 = arith.constant true
          %12 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %13 = arith.muli %arg7, %c4_i32_6 : i32
          %14 = arith.addi %c16_i32, %13 : i32
          %15 = arith.addi %14, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %15, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %c1_i32_3 = arith.constant 1 : i32
        %6 = arith.addi %arg7, %c1_i32_3 : i32
        "simt_step.yield"(%5, %6) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%1#0, %2) : (i32, i32) -> ()
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
    %c2_i32 = arith.constant 2 : i32
    %7 = arith.addi %0, %c2_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %15 = arith.addi %c12_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %16, %c0_i32_1 : i32
      %18 = "simt_step.if"(%17) ({
        %c0_i32_9 = arith.constant 0 : i32
        %41 = arith.addi %0, %c0_i32_9 : i32
        "simt_step.yield"(%41) : (i32) -> ()
      }, {
        %c2_i32_9 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_9) : (i32) -> ()
      }) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %19 = arith.addi %c32_i32, %0 : i32
      %true_2 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c16_i32 = arith.constant 16 : i32
      %22 = arith.addi %c16_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_3 : i32
      %25 = "simt_step.if"(%24) ({
        %c20_i32 = arith.constant 20 : i32
        %41 = arith.addi %c20_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = "simt_step.switch"(%42, %0) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %45 = simt_step.lane_id
          %46 = arith.index_cast %45 : index to i32
          %true_9 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %47 = arith.addi %c48_i32, %0 : i32
          %true_10 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %true_11 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %50 = arith.addi %c64_i32, %0 : i32
          %true_12 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%43) : (i32) -> ()
      }, {
        %c24_i32 = arith.constant 24 : i32
        %41 = arith.addi %c24_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_9 : i32
        %44 = "simt_step.if"(%43) ({
          %47 = simt_step.subgroup_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32_10 = arith.constant 80 : i32
        %45 = arith.addi %c80_i32_10, %0 : i32
        %true_11 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) : (i32) -> ()
      }) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %26 = arith.addi %c96_i32, %0 : i32
      %true_4 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %29 = arith.addi %c28_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_5 : i32
      %32 = "simt_step.if"(%31) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_11 : i32
          %43 = arith.addi %42, %0 : i32
          %c32_i32_12 = arith.constant 32 : i32
          %44 = arith.addi %c32_i32_12, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_13 : i32
          "simt_step.condition"(%46, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %42 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg4, %c1_i32 : i32
          %true_11 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %44 = arith.muli %arg4, %c4_i32_12 : i32
          %45 = arith.addi %c112_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_13 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%41#0) : (i32) -> ()
      }, {
        %c52_i32 = arith.constant 52 : i32
        %41 = arith.addi %c52_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %43 = "simt_step.switch"(%42, %c0_i32_9) ({
        ^bb0(%arg3: i32):
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          %true_10 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %46 = arith.addi %c128_i32, %0 : i32
          %true_11 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%49: i32):  // no predecessors
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) {fallthrough = false} : (i32) -> ()
        ^bb3(%50: i32):  // no predecessors
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          %true_13 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %53 = arith.addi %c144_i32, %0 : i32
          %true_14 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      %c160_i32 = arith.constant 160 : i32
      %33 = arith.addi %c160_i32, %0 : i32
      %true_6 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c176_i32 = arith.constant 176 : i32
      %35 = arith.addi %c176_i32, %0 : i32
      %true_8 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
    ^bb3(%37: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %38 = arith.addi %c56_i32, %0 : i32
      %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
      %40 = "simt_step.switch"(%39, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_13 : i32
          %47 = arith.addi %46, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %48 = arith.addi %c60_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_14 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_15 : i32
          %49 = arith.addi %c192_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_16 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_11 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %42 = arith.addi %c208_i32, %0 : i32
        %true_12 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %45 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c80_i32 = arith.constant 80 : i32
    %9 = arith.addi %c80_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %10, %c0_i32_0 : i32
    %12 = "simt_step.if"(%11) ({
      %c84_i32 = arith.constant 84 : i32
      %15 = arith.addi %c84_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = simt_step.subgroup_id
      %18 = arith.index_cast %17 : index to i32
      %19 = "simt_step.switch"(%16, %18) ({
      ^bb0(%arg2: i32):
        %c3_i32_1 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32_1) {fallthrough = false} : (i32) -> ()
      ^bb1(%20: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %21 = arith.addi %c88_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_2 : i32
        %24 = "simt_step.if"(%23) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %25 = arith.addi %c224_i32, %0 : i32
        %true_3 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb2(%27: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_10 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_10 : i32
          %37 = arith.addi %36, %0 : i32
          %c92_i32 = arith.constant 92 : i32
          %38 = arith.addi %c92_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_11 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_11 : i32
          "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %36 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %37 = arith.addi %arg4, %c1_i32 : i32
          %true_10 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_11 : i32
          %39 = arith.addi %c240_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_12 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_6 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %29 = arith.addi %c256_i32, %0 : i32
        %true_7 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%31: i32):  // no predecessors
        %32 = simt_step.lane_id
        %33 = arith.index_cast %32 : index to i32
        %true_8 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %34 = arith.addi %c272_i32, %0 : i32
        %true_9 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%19) : (i32) -> ()
    }, {
      %c112_i32 = arith.constant 112 : i32
      %15 = arith.addi %c112_i32, %0 : i32
      %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
      %17 = "simt_step.switch"(%16, %0) ({
      ^bb0(%arg2: i32):
        %c116_i32 = arith.constant 116 : i32
        %18 = arith.addi %c116_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %20 = "simt_step.switch"(%19, %c1_i32) ({
        ^bb0(%arg3: i32):
          %33 = simt_step.subgroup_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c0_i32_7 = arith.constant 0 : i32
          %36 = arith.addi %0, %c0_i32_7 : i32
          %true_8 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %37 = arith.addi %c288_i32, %0 : i32
          %true_9 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %c2_i32_10 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_10) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_1 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %21 = arith.addi %c304_i32, %0 : i32
        %true_2 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %true_3 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %24 = arith.addi %c320_i32, %0 : i32
        %true_4 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %27 = arith.addi %c120_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_5 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %28, %c0_i32_5 : i32
        %30 = "simt_step.if"(%29) ({
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %33 = simt_step.lane_id
          %34 = arith.index_cast %33 : index to i32
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %31 = arith.addi %c336_i32, %0 : i32
        %true_6 = arith.constant true
        %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%17) : (i32) -> ()
    }) : (i1) -> i32
    %c352_i32 = arith.constant 352 : i32
    %13 = arith.addi %c352_i32, %0 : i32
    %true = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    return
  }
}

