module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %5 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %6 = arith.addi %5, %c1_i32 : i32
      %7 = arith.cmpi slt, %arg5, %6 : i32
      "simt_step.condition"(%7, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %6 = "simt_step.if"(%5) ({
        %true_4 = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.muli %arg5, %c4_i32 : i32
        %10 = arith.addi %c16_i32, %9 : i32
        %11 = arith.addi %10, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32_6 : i32
          %11 = arith.cmpi slt, %arg7, %10 : i32
          "simt_step.condition"(%11, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_6 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg7, %c4_i32 : i32
          %11 = arith.addi %c32_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %13 = arith.addi %arg7, %c1_i32_7 : i32
          "simt_step.yield"(%9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
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
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_1 : i32
      "simt_step.if"(%16) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %14 = arith.addi %c16_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %16 = "simt_step.switch"(%15, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c20_i32 = arith.constant 20 : i32
        %38 = arith.addi %c20_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_7 : i32
        %41 = "simt_step.if"(%40) ({
          %c4_i32_18 = arith.constant 4 : i32
          %57 = arith.addi %0, %c4_i32_18 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          %c4_i32_18 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_18) : (i32) -> ()
        }) : (i1) -> i32
        %c48_i32_8 = arith.constant 48 : i32
        %42 = arith.addi %c48_i32_8, %0 : i32
        %true_9 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_18 : i32
          %58 = arith.addi %57, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %59 = arith.addi %c24_i32, %58 : i32
          %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %61 = arith.cmpi ne, %60, %c0_i32_19 : i32
          "simt_step.condition"(%61, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %57 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %58 = arith.addi %arg5, %c1_i32 : i32
          %true_18 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_19 : i32
          %60 = arith.addi %c64_i32, %59 : i32
          %61 = arith.addi %60, %0 : i32
          %true_20 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%57, %58) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %46 = arith.addi %c80_i32, %0 : i32
        %true_13 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %49 = arith.addi %c44_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %51 = arith.cmpi ne, %50, %c0_i32_14 : i32
        %52 = "simt_step.if"(%51) ({
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) : (i32) -> ()
        }, {
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) : (i32) -> ()
        }) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %53 = arith.addi %c96_i32, %0 : i32
        %true_15 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %55 = arith.addi %c112_i32, %0 : i32
        %true_17 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c48_i32 = arith.constant 48 : i32
      %18 = arith.addi %c48_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_1 : i32
      %21 = "simt_step.if"(%20) ({
        %c2_i32_7 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32_7) : (i32) -> ()
      }, {
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %39 = arith.muli %arg4, %c4_i32_9 : i32
          %40 = arith.addi %39, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %41 = arith.addi %c52_i32, %40 : i32
          %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_10 = arith.constant 0 : i32
          %43 = arith.cmpi ne, %42, %c0_i32_10 : i32
          "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %39 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %40 = arith.addi %arg4, %c1_i32 : i32
          %true_9 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_10 : i32
          %42 = arith.addi %c128_i32, %41 : i32
          %43 = arith.addi %42, %0 : i32
          %true_11 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%39, %40) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%38#0) : (i32) -> ()
      }) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %22 = arith.addi %c144_i32, %0 : i32
      %true = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %25 = arith.addi %c72_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_2 : i32
      %28 = "simt_step.if"(%27) ({
        %c76_i32 = arith.constant 76 : i32
        %38 = arith.addi %c76_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = "simt_step.switch"(%39, %0) ({
        ^bb0(%arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %true_8 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %41 = arith.addi %c160_i32, %0 : i32
          %true_9 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%43: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%40) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %38 = arith.addi %c80_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = simt_step.lane_id
        %41 = arith.index_cast %40 : index to i32
        %42 = "simt_step.switch"(%39, %41) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %true_9 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %49 = arith.addi %c176_i32, %0 : i32
          %true_10 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %43 = arith.addi %c192_i32, %0 : i32
        %true_8 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %29 = arith.addi %c208_i32, %0 : i32
      %true_3 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_4 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %31 = arith.addi %c224_i32, %0 : i32
      %true_5 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c84_i32 = arith.constant 84 : i32
      %34 = arith.addi %c84_i32, %0 : i32
      %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %36 = arith.addi %0, %c0_i32_6 : i32
      %37 = "simt_step.switch"(%35, %36) ({
      ^bb0(%arg3: i32):
        %c88_i32 = arith.constant 88 : i32
        %38 = arith.addi %c88_i32, %0 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %40 = "simt_step.switch"(%39, %0) ({
        ^bb0(%arg4: i32):
          %true_15 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %56 = arith.addi %c240_i32, %0 : i32
          %true_16 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %true_17 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %60 = arith.addi %c256_i32, %0 : i32
          %true_18 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%62: i32):  // no predecessors
          %c3_i32_19 = arith.constant 3 : i32
          %63 = arith.addi %0, %c3_i32_19 : i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %42 = arith.addi %c92_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %44 = arith.addi %0, %c0_i32_7 : i32
        %45 = "simt_step.switch"(%43, %44) ({
        ^bb0(%arg4: i32):
          %c0_i32_15 = arith.constant 0 : i32
          %true_16 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %56 = arith.addi %c272_i32, %0 : i32
          %true_17 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %c4_i32_18 = arith.constant 4 : i32
          %true_19 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %59 = arith.addi %c288_i32, %0 : i32
          %true_20 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_18) {fallthrough = false} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %62 = simt_step.subgroup_id
          %63 = arith.index_cast %62 : index to i32
          %true_21 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %64 = arith.addi %c304_i32, %0 : i32
          %true_22 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb3(%66: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %46 = arith.addi %c320_i32, %0 : i32
        %true_9 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %49:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %56 = arith.muli %arg5, %c4_i32_15 : i32
          %57 = arith.addi %56, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %58 = arith.addi %c96_i32, %57 : i32
          %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %60 = arith.cmpi ne, %59, %c0_i32_16 : i32
          "simt_step.condition"(%60, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %56 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %57 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %58 = arith.muli %arg5, %c4_i32_16 : i32
          %59 = arith.addi %c336_i32, %58 : i32
          %60 = arith.addi %59, %0 : i32
          %true_17 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56, %57) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%49#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%50: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %51 = arith.addi %c116_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_12 = arith.constant 4 : i32
        %53 = "simt_step.switch"(%52, %c4_i32_12) ({
        ^bb0(%arg4: i32):
          %true_15 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %56 = arith.addi %c352_i32, %0 : i32
          %true_16 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %c0_i32_17 = arith.constant 0 : i32
          %59 = arith.addi %0, %c0_i32_17 : i32
          %true_18 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %60 = arith.addi %c368_i32, %0 : i32
          %true_19 = arith.constant true
          %61 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%59) {fallthrough = true} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_20) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %54 = arith.addi %c384_i32, %0 : i32
        %true_14 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %c120_i32 = arith.constant 120 : i32
    %9 = arith.addi %c120_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %11 = simt_step.subgroup_id
    %12 = arith.index_cast %11 : index to i32
    %13 = "simt_step.switch"(%10, %12) ({
    ^bb0(%arg2: i32):
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_6 : i32
        %23 = arith.addi %22, %0 : i32
        %c124_i32 = arith.constant 124 : i32
        %24 = arith.addi %c124_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_11 : i32
          %30 = arith.addi %29, %0 : i32
          %c144_i32 = arith.constant 144 : i32
          %31 = arith.addi %c144_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_12 : i32
          "simt_step.condition"(%33, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %29 = arith.addi %arg5, %arg6 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %30 = arith.addi %arg6, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %31 = arith.muli %arg6, %c4_i32_13 : i32
          %32 = arith.addi %c400_i32, %31 : i32
          %33 = arith.addi %32, %0 : i32
          %true_14 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %23 = arith.addi %arg3, %22#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_9 : i32
        %26 = arith.addi %c416_i32, %25 : i32
        %27 = arith.addi %26, %0 : i32
        %true_10 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_6 : i32
        %23 = arith.addi %22, %0 : i32
        %c164_i32 = arith.constant 164 : i32
        %24 = arith.addi %c164_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_7 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32 : i32
        %true_6 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_7 : i32
        %25 = arith.addi %c432_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_8 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%17: i32):  // no predecessors
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      %true = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %20 = arith.addi %c448_i32, %0 : i32
      %true_5 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

