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
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32_9 : i32
          %10 = arith.cmpi slt, %arg9, %9 : i32
          "simt_step.condition"(%10, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg9, %c4_i32 : i32
          %10 = arith.addi %c16_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %12 = arith.addi %arg9, %c1_i32_9 : i32
          "simt_step.continue"(%8, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_8 = arith.constant 1 : i32
        %7 = arith.addi %arg7, %c1_i32_8 : i32
        "simt_step.yield"(%6#0, %7) : (i32, i32) -> ()
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
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c3_i32 = arith.constant 3 : i32
    %7 = arith.addi %0, %c3_i32 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = "simt_step.switch"(%17, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %32 = arith.addi %c16_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %34 = simt_step.subgroup_id
        %35 = arith.index_cast %34 : index to i32
        %36 = "simt_step.switch"(%33, %35) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %54 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
        ^bb1(%55: i32):  // no predecessors
          %c2_i32_14 = arith.constant 2 : i32
          %56 = arith.addi %0, %c2_i32_14 : i32
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb2(%57: i32):  // no predecessors
          %true_15 = arith.constant true
          %c32_i32 = arith.constant 32 : i32
          %58 = arith.addi %c32_i32, %0 : i32
          %true_16 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c48_i32 = arith.constant 48 : i32
        %37 = arith.addi %c48_i32, %0 : i32
        %true_9 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %40 = arith.addi %c20_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_10 : i32
        %43 = "simt_step.if"(%42) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32_14 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_14) : (i32) -> ()
        }) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %44 = arith.addi %c64_i32, %0 : i32
        %true_11 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %46 = arith.addi %c80_i32, %0 : i32
        %true_13 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %49 = arith.addi %c24_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %51 = simt_step.subgroup_id
        %52 = arith.index_cast %51 : index to i32
        %53 = "simt_step.switch"(%50, %52) ({
        ^bb0(%arg4: i32):
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          %true_14 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %59 = arith.addi %c96_i32, %0 : i32
          %true_15 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_16 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %62 = arith.addi %c112_i32, %0 : i32
          %true_17 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) {fallthrough = true} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %20 = arith.addi %c28_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = simt_step.subgroup_id
      %23 = arith.index_cast %22 : index to i32
      %24 = "simt_step.switch"(%21, %23) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_16 : i32
          %45 = arith.addi %44, %0 : i32
          %c32_i32 = arith.constant 32 : i32
          %46 = arith.addi %c32_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_17 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_18 : i32
          %47 = arith.addi %c128_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_19 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_16 : i32
          %45 = arith.addi %44, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %46 = arith.addi %c52_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_17 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_18 : i32
          %47 = arith.addi %c144_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_19 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %35 = arith.addi %c160_i32, %0 : i32
        %true_13 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%37: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %38 = arith.addi %c72_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_14 : i32
        %41 = "simt_step.if"(%40) ({
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) : (i32) -> ()
        }, {
          %44 = simt_step.subgroup_id
          %45 = arith.index_cast %44 : index to i32
          "simt_step.yield"(%45) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %42 = arith.addi %c176_i32, %0 : i32
        %true_15 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %25 = arith.addi %c192_i32, %0 : i32
      %true_2 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %27 = arith.addi %c208_i32, %0 : i32
      %true_4 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb2(%29: i32):  // no predecessors
      %c4_i32_5 = arith.constant 4 : i32
      %true_6 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %30 = arith.addi %c224_i32, %0 : i32
      %true_7 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c4_i32_5) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %9 = arith.addi %0, %c1_i32 : i32
    %c76_i32 = arith.constant 76 : i32
    %10 = arith.addi %c76_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_0 : i32
    %13 = "simt_step.if"(%12) ({
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      "simt_step.yield"(%17) : (i32) -> ()
    }, {
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %17 = arith.muli %arg3, %c4_i32_3 : i32
        %18 = arith.addi %17, %0 : i32
        %c80_i32 = arith.constant 80 : i32
        %19 = arith.addi %c80_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c100_i32 = arith.constant 100 : i32
        %17 = arith.addi %c100_i32, %0 : i32
        %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
        %19 = simt_step.lane_id
        %20 = arith.index_cast %19 : index to i32
        %21 = "simt_step.switch"(%18, %20) ({
        ^bb0(%arg4: i32):
          %true_7 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %28 = arith.addi %c240_i32, %0 : i32
          %true_8 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %22 = arith.addi %arg2, %21 : i32
        %c1_i32_3 = arith.constant 1 : i32
        %23 = arith.addi %arg3, %c1_i32_3 : i32
        %true_4 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %24 = arith.muli %arg3, %c4_i32_5 : i32
        %25 = arith.addi %c256_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_6 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) : (i32) -> ()
    }) : (i1) -> i32
    %c272_i32 = arith.constant 272 : i32
    %14 = arith.addi %c272_i32, %0 : i32
    %true = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

