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
      %c2_i32 = arith.constant 2 : i32
      %1 = arith.remsi %arg3, %c2_i32 : i32
      %2 = simt_step.lane_id
      %3 = arith.index_cast %2 : index to i32
      %4 = "simt_step.switch"(%1, %3) ({
      ^bb0(%arg6: i32):
        %c0_i32_1 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
        %7 = "simt_step.if"(%6) ({
          %true = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_3 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg5, %c4_i32 : i32
          %13 = arith.addi %c0_i32_3, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }, {
          %true = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg5, %c4_i32 : i32
          %13 = arith.addi %c16_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
      ^bb1(%8: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %10 = "simt_step.if"(%9) ({
          %true = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg5, %c4_i32 : i32
          %13 = arith.addi %c32_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }, {
          %true = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %12 = arith.muli %arg5, %c4_i32 : i32
          %13 = arith.addi %c48_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %5 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%4, %5) : (i32, i32) -> ()
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
      %c8_i32 = arith.constant 8 : i32
      %21 = arith.addi %c8_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      "simt_step.if"(%23) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c12_i32 = arith.constant 12 : i32
    %6 = arith.addi %c12_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %21 = arith.addi %c16_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      %24 = "simt_step.if"(%23) ({
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_12 : i32
          %42 = arith.addi %41, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %43 = arith.addi %c20_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_13 : i32
          "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %41 = arith.addi %arg3, %arg4 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %42 = arith.addi %arg4, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_14 : i32
          %44 = arith.addi %c64_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_15 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%40#0) : (i32) -> ()
      }, {
        %c40_i32 = arith.constant 40 : i32
        %40 = arith.addi %c40_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_10 : i32
        %43 = "simt_step.if"(%42) ({
          %c0_i32_13 = arith.constant 0 : i32
          %46 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %c1_i32_13 = arith.constant 1 : i32
          %46 = arith.addi %0, %c1_i32_13 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }) : (i1) -> i32
        %c80_i32_11 = arith.constant 80 : i32
        %44 = arith.addi %c80_i32_11, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      %c96_i32 = arith.constant 96 : i32
      %25 = arith.addi %c96_i32, %0 : i32
      %true_5 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c44_i32 = arith.constant 44 : i32
      %28 = arith.addi %c44_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %30 = arith.cmpi ne, %29, %c0_i32_6 : i32
      %31 = "simt_step.if"(%30) ({
        %c48_i32 = arith.constant 48 : i32
        %40 = arith.addi %c48_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %42 = "simt_step.switch"(%41, %0) ({
        ^bb0(%arg3: i32):
          %c0_i32_10 = arith.constant 0 : i32
          %43 = arith.addi %0, %c0_i32_10 : i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%45: i32):  // no predecessors
          %c1_i32_11 = arith.constant 1 : i32
          %46 = arith.addi %0, %c1_i32_11 : i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %true_12 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %48 = arith.addi %c112_i32, %0 : i32
          %true_13 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%42) : (i32) -> ()
      }, {
        %c52_i32 = arith.constant 52 : i32
        %40 = arith.addi %c52_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_10 : i32
        %43 = "simt_step.if"(%42) ({
          %c0_i32_12 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_12) : (i32) -> ()
        }, {
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %44 = arith.addi %c128_i32, %0 : i32
        %true_11 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) : (i32) -> ()
      }) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %32 = arith.addi %c144_i32, %0 : i32
      %true_7 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %34 = arith.addi %c160_i32, %0 : i32
      %true_9 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%36: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %37 = arith.addi %c56_i32, %0 : i32
      %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %39 = "simt_step.switch"(%38, %c1_i32) ({
      ^bb0(%arg3: i32):
        %40 = simt_step.subgroup_id
        %41 = arith.index_cast %40 : index to i32
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_15 : i32
          %49 = arith.addi %48, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %50 = arith.addi %c60_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_16 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32_15 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32_15 : i32
          %true_16 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_17 : i32
          %51 = arith.addi %c176_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_18 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c4_i32_12 = arith.constant 4 : i32
        %45 = arith.addi %0, %c4_i32_12 : i32
        %true_13 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %46 = arith.addi %c192_i32, %0 : i32
        %true_14 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c208_i32 = arith.constant 208 : i32
    %11 = arith.addi %c208_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %c80_i32 = arith.constant 80 : i32
    %15 = arith.addi %c80_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %17 = arith.cmpi ne, %16, %c0_i32_2 : i32
    %18 = "simt_step.if"(%17) ({
      %c84_i32 = arith.constant 84 : i32
      %21 = arith.addi %c84_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_4 : i32
      %24 = "simt_step.if"(%23) ({
        %c2_i32 = arith.constant 2 : i32
        %27 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %27 = simt_step.subgroup_id
        %28 = arith.index_cast %27 : index to i32
        "simt_step.yield"(%28) : (i32) -> ()
      }) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %25 = arith.addi %c224_i32, %0 : i32
      %true_5 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) : (i32) -> ()
    }, {
      %c1_i32 = arith.constant 1 : i32
      %21 = arith.addi %0, %c1_i32 : i32
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %19 = arith.addi %c240_i32, %0 : i32
    %true_3 = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

