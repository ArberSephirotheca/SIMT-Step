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
      %8 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %8, %c1_i32 : i32
      %10 = arith.cmpi slt, %arg5, %9 : i32
      "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_4 = arith.constant true
      %8 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.muli %arg5, %c4_i32 : i32
      %10 = arith.addi %c16_i32, %9 : i32
      %11 = arith.addi %10, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %12 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%8, %12) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %5 = "simt_step.switch"(%arg3, %arg0) ({
    ^bb0(%arg4: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %8:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %13 = "simt_step.if"(%12) ({
          %true_8 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32 : i32
          %17 = arith.addi %c32_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32 : i32
          %17 = arith.addi %c48_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%9: i32):  // no predecessors
      %c0_i32_6 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
      %11 = "simt_step.if"(%10) ({
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %13 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %14 = arith.addi %13, %c1_i32 : i32
          %15 = arith.cmpi slt, %arg6, %14 : i32
          "simt_step.condition"(%15, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_9 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %14 = arith.muli %arg6, %c4_i32 : i32
          %15 = arith.addi %c64_i32, %14 : i32
          %16 = arith.addi %15, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%13, %17) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %12 = arith.remsi %arg3, %c2_i32 : i32
        %13 = simt_step.lane_id
        %14 = arith.index_cast %13 : index to i32
        %15 = "simt_step.switch"(%12, %14) ({
        ^bb0(%arg5: i32):
          %true_7 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %17 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %20 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %23 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%15) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %6 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %7 = arith.select %6, %4, %5 : i32
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
      %c0_i32_4 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
      "simt_step.if"(%20) ({
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
    %c4_i32_1 = arith.constant 4 : i32
    %8 = "simt_step.switch"(%7, %c4_i32_1) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_18 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_18 : i32
        %36 = arith.addi %35, %0 : i32
        %c16_i32 = arith.constant 16 : i32
        %37 = arith.addi %c16_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_19 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c36_i32 = arith.constant 36 : i32
        %35 = arith.addi %c36_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_18 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_18 : i32
        %38 = "simt_step.if"(%37) ({
          %c1_i32_24 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_24) : (i32) -> ()
        }, {
          %c4_i32_24 = arith.constant 4 : i32
          %47 = arith.addi %0, %c4_i32_24 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %39 = arith.addi %c128_i32, %0 : i32
        %true_19 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %41 = arith.addi %arg3, %38 : i32
        %c1_i32_20 = arith.constant 1 : i32
        %42 = arith.addi %arg4, %c1_i32_20 : i32
        %true_21 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %c4_i32_22 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_22 : i32
        %44 = arith.addi %c144_i32, %43 : i32
        %45 = arith.addi %44, %0 : i32
        %true_23 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41, %42) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %19 = arith.addi %c160_i32, %0 : i32
      %true_7 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %22 = arith.addi %c40_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %24 = "simt_step.switch"(%23, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_28 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_28 : i32
          %50 = arith.addi %49, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %51 = arith.addi %c44_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_29 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_29 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32_28 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32_28 : i32
          %true_29 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_30 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_30 : i32
          %52 = arith.addi %c176_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_31 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_31) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_20 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %36 = arith.addi %c192_i32, %0 : i32
        %true_21 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c0_i32_22 = arith.constant 0 : i32
        %c0_i32_23 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_22, %c0_i32_23) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_28 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_28 : i32
          %50 = arith.addi %49, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %51 = arith.addi %c64_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_29 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_29 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32_28 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32_28 : i32
          %true_29 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_30 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_30 : i32
          %52 = arith.addi %c208_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_31 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_31) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %41 = arith.addi %c84_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_24 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_24 : i32
        %44 = "simt_step.if"(%43) ({
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }, {
          %49 = simt_step.lane_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %45 = arith.addi %c224_i32, %0 : i32
        %true_25 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_26 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %47 = arith.addi %c240_i32, %0 : i32
        %true_27 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %25 = arith.addi %c256_i32, %0 : i32
      %true_9 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %28:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_18 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_18 : i32
        %36 = arith.addi %35, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %37 = arith.addi %c88_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_19 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %35 = arith.addi %arg3, %arg4 : i32
        %c1_i32_18 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32_18 : i32
        %true_19 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %c4_i32_20 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_20 : i32
        %38 = arith.addi %c272_i32, %37 : i32
        %39 = arith.addi %38, %0 : i32
        %true_21 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_12 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %29 = arith.addi %c288_i32, %0 : i32
      %true_13 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%31: i32):  // no predecessors
      %c0_i32_14 = arith.constant 0 : i32
      %c0_i32_15 = arith.constant 0 : i32
      %32:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_18 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_18 : i32
        %36 = arith.addi %35, %0 : i32
        %c108_i32 = arith.constant 108 : i32
        %37 = arith.addi %c108_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_19 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_24 = arith.constant 4 : i32
          %42 = arith.muli %arg6, %c4_i32_24 : i32
          %43 = arith.addi %42, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %44 = arith.addi %c128_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_25 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_25 : i32
          "simt_step.condition"(%46, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %42 = arith.addi %arg5, %arg6 : i32
          %c1_i32_24 = arith.constant 1 : i32
          %43 = arith.addi %arg6, %c1_i32_24 : i32
          %true_25 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_26 = arith.constant 4 : i32
          %44 = arith.muli %arg6, %c4_i32_26 : i32
          %45 = arith.addi %c304_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_27 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %36 = arith.addi %arg3, %35#0 : i32
        %c1_i32_20 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_20 : i32
        %true_21 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %c4_i32_22 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_22 : i32
        %39 = arith.addi %c320_i32, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_23 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_16 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %33 = arith.addi %c336_i32, %0 : i32
      %true_17 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c148_i32 = arith.constant 148 : i32
    %9 = arith.addi %c148_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %11 = arith.addi %0, %c0_i32_2 : i32
    %12 = "simt_step.switch"(%10, %11) ({
    ^bb0(%arg2: i32):
      %c152_i32 = arith.constant 152 : i32
      %18 = arith.addi %c152_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %20 = simt_step.lane_id
      %21 = arith.index_cast %20 : index to i32
      %22 = "simt_step.switch"(%19, %21) ({
      ^bb0(%arg3: i32):
        %true_16 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %36 = arith.addi %c352_i32, %0 : i32
        %true_17 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_20 : i32
          %41 = arith.addi %40, %0 : i32
          %c156_i32 = arith.constant 156 : i32
          %42 = arith.addi %c156_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_21 : i32
          "simt_step.condition"(%44, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %40 = arith.addi %arg4, %arg5 : i32
          %c1_i32_20 = arith.constant 1 : i32
          %41 = arith.addi %arg5, %c1_i32_20 : i32
          %true_21 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_22 : i32
          %43 = arith.addi %c368_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_23 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c384_i32 = arith.constant 384 : i32
      %23 = arith.addi %c384_i32, %0 : i32
      %true_5 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb1(%25: i32):  // no predecessors
      %true_6 = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %26 = arith.addi %c400_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %29:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_16 : i32
        %37 = arith.addi %36, %0 : i32
        %c176_i32 = arith.constant 176 : i32
        %38 = arith.addi %c176_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_17 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c196_i32 = arith.constant 196 : i32
        %36 = arith.addi %c196_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_16 : i32
        %39 = "simt_step.if"(%38) ({
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %40 = arith.addi %c416_i32, %0 : i32
        %true_17 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %42 = arith.addi %arg3, %39 : i32
        %c1_i32_18 = arith.constant 1 : i32
        %43 = arith.addi %arg4, %c1_i32_18 : i32
        %true_19 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %c4_i32_20 = arith.constant 4 : i32
        %44 = arith.muli %arg4, %c4_i32_20 : i32
        %45 = arith.addi %c432_i32, %44 : i32
        %46 = arith.addi %45, %0 : i32
        %true_21 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42, %43) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_10 = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %30 = arith.addi %c448_i32, %0 : i32
      %true_11 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %c0_i32_12 = arith.constant 0 : i32
      %c0_i32_13 = arith.constant 0 : i32
      %33:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_16 = arith.constant 4 : i32
        %36 = arith.muli %arg4, %c4_i32_16 : i32
        %37 = arith.addi %36, %0 : i32
        %c200_i32 = arith.constant 200 : i32
        %38 = arith.addi %c200_i32, %37 : i32
        %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %40 = arith.cmpi ne, %39, %c0_i32_17 : i32
        "simt_step.condition"(%40, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_16 = arith.constant 0 : i32
        %36 = arith.addi %arg3, %c0_i32_16 : i32
        %c1_i32_17 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_17 : i32
        %true_18 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %c4_i32_19 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_19 : i32
        %39 = arith.addi %c464_i32, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_20 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_14 = arith.constant true
      %c480_i32 = arith.constant 480 : i32
      %34 = arith.addi %c480_i32, %0 : i32
      %true_15 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c496_i32 = arith.constant 496 : i32
    %13 = arith.addi %c496_i32, %0 : i32
    %true_3 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c220_i32 = arith.constant 220 : i32
    %15 = arith.addi %c220_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c1_i32 = arith.constant 1 : i32
    %17 = "simt_step.switch"(%16, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c224_i32 = arith.constant 224 : i32
      %18 = arith.addi %c224_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %20 = "simt_step.switch"(%19, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c228_i32 = arith.constant 228 : i32
        %33 = arith.addi %c228_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = simt_step.lane_id
        %36 = arith.index_cast %35 : index to i32
        %37 = "simt_step.switch"(%34, %36) ({
        ^bb0(%arg4: i32):
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          %true_18 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %50 = arith.addi %c512_i32, %0 : i32
          %true_19 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %38 = arith.addi %c528_i32, %0 : i32
        %true_15 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_18 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_18 : i32
          %46 = arith.addi %45, %0 : i32
          %c232_i32 = arith.constant 232 : i32
          %47 = arith.addi %c232_i32, %46 : i32
          %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_19 = arith.constant 0 : i32
          %49 = arith.cmpi ne, %48, %c0_i32_19 : i32
          "simt_step.condition"(%49, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %45 = arith.addi %arg4, %arg5 : i32
          %c1_i32_18 = arith.constant 1 : i32
          %46 = arith.addi %arg5, %c1_i32_18 : i32
          %true_19 = arith.constant true
          %c544_i32 = arith.constant 544 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_20 : i32
          %48 = arith.addi %c544_i32, %47 : i32
          %49 = arith.addi %48, %0 : i32
          %true_21 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45, %46) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %43 = simt_step.subgroup_id
        %44 = arith.index_cast %43 : index to i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c560_i32 = arith.constant 560 : i32
      %21 = arith.addi %c560_i32, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    ^bb1(%23: i32):  // no predecessors
      %c3_i32_6 = arith.constant 3 : i32
      %24 = arith.addi %0, %c3_i32_6 : i32
      %true_7 = arith.constant true
      %c576_i32 = arith.constant 576 : i32
      %25 = arith.addi %c576_i32, %0 : i32
      %true_8 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb2(%27: i32):  // no predecessors
      %c1_i32_9 = arith.constant 1 : i32
      %true_10 = arith.constant true
      %c592_i32 = arith.constant 592 : i32
      %28 = arith.addi %c592_i32, %0 : i32
      %true_11 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c1_i32_9) {fallthrough = false} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %true_12 = arith.constant true
      %c608_i32 = arith.constant 608 : i32
      %31 = arith.addi %c608_i32, %0 : i32
      %true_13 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

