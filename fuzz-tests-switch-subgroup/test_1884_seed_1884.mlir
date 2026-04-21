module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %2 = simt_step.subgroup_id
      %3 = arith.index_cast %2 : index to i32
      %4 = "simt_step.switch"(%arg3, %3) ({
      ^bb0(%arg4: i32):
        %true_0 = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
        %c0_i32_1 = arith.constant 0 : i32
        %8 = arith.addi %c0_i32_1, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) {fallthrough = true} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %true_2 = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %11 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %6 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) : (i32) -> ()
    }, {
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %2:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %3 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %3, %c1_i32 : i32
        %5 = arith.cmpi slt, %arg5, %4 : i32
        "simt_step.condition"(%5, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_4 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_4 : i32
          %7 = arith.cmpi slt, %arg7, %6 : i32
          "simt_step.condition"(%7, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg7, %c4_i32 : i32
          %7 = arith.addi %c48_i32, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_4 = arith.constant 1 : i32
          %9 = arith.addi %arg7, %c1_i32_4 : i32
          "simt_step.break"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %4 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%2#0) : (i32) -> ()
    }) : (i1) -> i32
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
    %c2_i32 = arith.constant 2 : i32
    %5 = arith.addi %0, %c2_i32 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_0 : i32
    %9 = "simt_step.if"(%8) ({
      %c1_i32 = arith.constant 1 : i32
      "simt_step.yield"(%c1_i32) : (i32) -> ()
    }, {
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg2: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %22 = arith.addi %0, %c0_i32_3 : i32
        %true_4 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %23 = arith.addi %c64_i32, %0 : i32
        %true_5 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) : (i32) -> ()
    }) : (i1) -> i32
    %c80_i32 = arith.constant 80 : i32
    %10 = arith.addi %c80_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c16_i32 = arith.constant 16 : i32
    %12 = arith.addi %c16_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c20_i32 = arith.constant 20 : i32
      %19 = arith.addi %c20_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %21 = arith.cmpi ne, %20, %c0_i32_3 : i32
      %22 = "simt_step.if"(%21) ({
        %c24_i32 = arith.constant 24 : i32
        %43 = arith.addi %c24_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg3: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %49 = arith.addi %0, %c3_i32 : i32
          %true_16 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %50 = arith.addi %c96_i32, %0 : i32
          %true_17 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%47) : (i32) -> ()
      }, {
        %c28_i32 = arith.constant 28 : i32
        %43 = arith.addi %c28_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg3: i32):
          %c0_i32_16 = arith.constant 0 : i32
          %true_17 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %48 = arith.addi %c112_i32, %0 : i32
          %true_18 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_16) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %51 = simt_step.lane_id
          %52 = arith.index_cast %51 : index to i32
          "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%47) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %23 = arith.addi %c128_i32, %0 : i32
      %true_4 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %25 = arith.addi %c144_i32, %0 : i32
      %true_6 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %28 = arith.addi %c32_i32, %0 : i32
      %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
      %30 = simt_step.lane_id
      %31 = arith.index_cast %30 : index to i32
      %32 = "simt_step.switch"(%29, %31) ({
      ^bb0(%arg3: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_22 : i32
          %56 = arith.addi %55, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %57 = arith.addi %c36_i32, %56 : i32
          %58 = "simt_step.buffer.load"(%arg1, %57) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %59 = arith.cmpi ne, %58, %c0_i32_23 : i32
          "simt_step.condition"(%59, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %55 = arith.addi %arg4, %arg5 : i32
          %c1_i32_22 = arith.constant 1 : i32
          %56 = arith.addi %arg5, %c1_i32_22 : i32
          %true_23 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_24 : i32
          %58 = arith.addi %c160_i32, %57 : i32
          %59 = arith.addi %58, %0 : i32
          %true_25 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55, %56) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%44: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %45 = arith.addi %0, %c1_i32 : i32
        %true_18 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %46 = arith.addi %c176_i32, %0 : i32
        %true_19 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%48: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %49 = arith.addi %c56_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_20 = arith.constant 0 : i32
        %51 = arith.cmpi ne, %50, %c0_i32_20 : i32
        %52 = "simt_step.if"(%51) ({
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }, {
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %53 = arith.addi %c192_i32, %0 : i32
        %true_21 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %33 = arith.addi %c208_i32, %0 : i32
      %true_8 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
    ^bb2(%35: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %36:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_16 : i32
        %44 = arith.addi %43, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %45 = arith.addi %c60_i32, %44 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_17 : i32
        "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c80_i32_16 = arith.constant 80 : i32
        %43 = arith.addi %c80_i32_16, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_17 : i32
        %46 = "simt_step.if"(%45) ({
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }, {
          %55 = simt_step.lane_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %47 = arith.addi %c224_i32, %0 : i32
        %true_18 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %49 = arith.addi %arg3, %46 : i32
        %c1_i32 = arith.constant 1 : i32
        %50 = arith.addi %arg4, %c1_i32 : i32
        %true_19 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_20 = arith.constant 4 : i32
        %51 = arith.muli %arg4, %c4_i32_20 : i32
        %52 = arith.addi %c240_i32, %51 : i32
        %53 = arith.addi %52, %0 : i32
        %true_21 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49, %50) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_11 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %37 = arith.addi %c256_i32, %0 : i32
      %true_12 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%39: i32):  // no predecessors
      %c0_i32_13 = arith.constant 0 : i32
      %40 = arith.addi %0, %c0_i32_13 : i32
      %true_14 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %41 = arith.addi %c272_i32, %0 : i32
      %true_15 = arith.constant true
      %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true_1 = arith.constant true
    %c288_i32 = arith.constant 288 : i32
    %17 = arith.addi %c288_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

