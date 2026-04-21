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
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %3:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg8: i32, %arg9: i32):
          %c4_i32 = arith.constant 4 : i32
          %5 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %6 = arith.addi %5, %c1_i32_6 : i32
          %7 = arith.cmpi slt, %arg9, %6 : i32
          "simt_step.condition"(%7, %arg8, %arg9) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg8: i32, %arg9: i32):
          %true = arith.constant true
          %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_6 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %6 = arith.muli %arg9, %c4_i32 : i32
          %7 = arith.addi %c0_i32_6, %6 : i32
          %8 = arith.addi %7, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %arg9, %c1_i32_7 : i32
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32_5 = arith.constant 1 : i32
        %4 = arith.addi %arg7, %c1_i32_5 : i32
        "simt_step.yield"(%3#0, %4) : (i32, i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      "simt_step.yield"() : () -> ()
    }, {
      %c8_i32 = arith.constant 8 : i32
      %18 = arith.addi %c8_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_6 : i32
      "simt_step.if"(%20) ({
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_6 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_6 : i32
      %19 = arith.addi %18, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %20 = arith.addi %c12_i32, %19 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %22 = arith.cmpi ne, %21, %c0_i32_7 : i32
      "simt_step.condition"(%22, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %18 = arith.addi %arg2, %arg3 : i32
      %c1_i32_6 = arith.constant 1 : i32
      %19 = arith.addi %arg3, %c1_i32_6 : i32
      %true_7 = arith.constant true
      %c16_i32 = arith.constant 16 : i32
      %c4_i32_8 = arith.constant 4 : i32
      %20 = arith.muli %arg3, %c4_i32_8 : i32
      %21 = arith.addi %c16_i32, %20 : i32
      %22 = arith.addi %21, %0 : i32
      %true_9 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18, %19) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c32_i32 = arith.constant 32 : i32
    %7 = arith.addi %c32_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %9 = "simt_step.switch"(%8, %c1_i32) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %19 = simt_step.subgroup_id
      %20 = arith.index_cast %19 : index to i32
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb2(%21: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %22 = arith.addi %c36_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %24 = arith.addi %0, %c2_i32 : i32
      %25 = "simt_step.switch"(%23, %24) ({
      ^bb0(%arg3: i32):
        %28 = simt_step.subgroup_id
        %29 = arith.index_cast %28 : index to i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_16 : i32
          %44 = arith.addi %43, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %45 = arith.addi %c40_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_17 : i32
          "simt_step.condition"(%47, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %43 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %44 = arith.addi %arg5, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c32_i32_18 = arith.constant 32 : i32
          %c4_i32_19 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_19 : i32
          %46 = arith.addi %c32_i32_18, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_20 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %33 = arith.addi %c60_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_10 : i32
        %36 = "simt_step.if"(%35) ({
          %c1_i32_16 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_16) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %37 = arith.addi %c48_i32, %0 : i32
        %true_11 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %39 = arith.addi %c64_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb3(%41: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %42:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %43 = arith.muli %arg5, %c4_i32_16 : i32
          %44 = arith.addi %43, %0 : i32
          %c64_i32_17 = arith.constant 64 : i32
          %45 = arith.addi %c64_i32_17, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_18 : i32
          "simt_step.condition"(%47, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %43 = arith.addi %arg4, %arg5 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %44 = arith.addi %arg5, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_18 : i32
          %46 = arith.addi %c80_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_19 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%42#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c96_i32 = arith.constant 96 : i32
      %26 = arith.addi %c96_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c112_i32 = arith.constant 112 : i32
    %10 = arith.addi %c112_i32, %0 : i32
    %true_3 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c84_i32 = arith.constant 84 : i32
    %12 = arith.addi %c84_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %14 = arith.cmpi ne, %13, %c0_i32_4 : i32
    %15 = "simt_step.if"(%14) ({
      %c88_i32 = arith.constant 88 : i32
      %18 = arith.addi %c88_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = "simt_step.switch"(%19, %0) ({
      ^bb0(%arg2: i32):
        %c1_i32_6 = arith.constant 1 : i32
        %21 = arith.addi %0, %c1_i32_6 : i32
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb1(%22: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %23 = arith.addi %c92_i32, %0 : i32
        %24 = "simt_step.buffer.load"(%arg1, %23) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %24, %c0_i32_7 : i32
        %26 = "simt_step.if"(%25) ({
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %31 = simt_step.subgroup_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %27 = arith.addi %c128_i32, %0 : i32
        %true_8 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %29 = arith.addi %c144_i32, %0 : i32
        %true_10 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) : (i32) -> ()
    }, {
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %19 = arith.muli %arg3, %c4_i32_8 : i32
        %20 = arith.addi %19, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %21 = arith.addi %c96_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_9 : i32
        "simt_step.condition"(%23, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c116_i32 = arith.constant 116 : i32
        %19 = arith.addi %c116_i32, %0 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_8 : i32
        %22 = "simt_step.if"(%21) ({
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %23 = arith.addi %c160_i32, %0 : i32
        %true_9 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %25 = arith.addi %arg2, %22 : i32
        %c1_i32_10 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32_10 : i32
        %true_11 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %27 = arith.muli %arg3, %c4_i32_12 : i32
        %28 = arith.addi %c176_i32, %27 : i32
        %29 = arith.addi %28, %0 : i32
        %true_13 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%25, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) : (i32) -> ()
    }) : (i1) -> i32
    %c192_i32 = arith.constant 192 : i32
    %16 = arith.addi %c192_i32, %0 : i32
    %true_5 = arith.constant true
    %17 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

