module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
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
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.muli %arg5, %c4_i32 : i32
        %10 = arith.addi %c0_i32_4, %9 : i32
        %11 = arith.addi %10, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) : (i32) -> ()
      }, {
        %true = arith.constant true
        %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %c4_i32 = arith.constant 4 : i32
        %9 = arith.muli %arg5, %c4_i32 : i32
        %10 = arith.addi %c16_i32, %9 : i32
        %11 = arith.addi %10, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%6, %7) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %2 = "simt_step.if"(%1) ({
      %c0_i32_3 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %6 = "simt_step.if"(%5) ({
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %8 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %8 = "simt_step.if"(%7) ({
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %10 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }, {
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %10 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%8) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %5:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32 = arith.constant 4 : i32
        %6 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %6, %c1_i32 : i32
        %8 = arith.cmpi slt, %arg5, %7 : i32
        "simt_step.condition"(%8, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %6 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %7 = "simt_step.if"(%6) ({
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c80_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }, {
          %true = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg5, %c4_i32 : i32
          %11 = arith.addi %c96_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%9) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %8 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%7, %8) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0#0, %2 : i32
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
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
      "simt_step.if"(%16) ({
        %17 = simt_step.lane_id
        %18 = arith.index_cast %17 : index to i32
        %19 = "simt_step.switch"(%0, %18) ({
        ^bb0(%arg2: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %20 = arith.addi %arg2, %c4_i32_5 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %22 = arith.addi %21, %c2_i32 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }, {
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %6 = simt_step.lane_id
    %7 = arith.index_cast %6 : index to i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.addi %0, %c0_i32_1 : i32
    %c12_i32 = arith.constant 12 : i32
    %9 = arith.addi %c12_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c4_i32_2 = arith.constant 4 : i32
    %11 = "simt_step.switch"(%10, %c4_i32_2) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %14 = arith.addi %c16_i32, %0 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %16 = simt_step.subgroup_id
      %17 = arith.index_cast %16 : index to i32
      %18 = "simt_step.switch"(%15, %17) ({
      ^bb0(%arg3: i32):
        %c20_i32 = arith.constant 20 : i32
        %40 = arith.addi %c20_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_14 : i32
        %43 = "simt_step.if"(%42) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c0_i32_28 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_28) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %44 = arith.addi %c112_i32, %0 : i32
        %true_15 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb1(%46: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %47:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_28 = arith.constant 4 : i32
          %64 = arith.muli %arg5, %c4_i32_28 : i32
          %65 = arith.addi %64, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %66 = arith.addi %c24_i32, %65 : i32
          %67 = "simt_step.buffer.load"(%arg1, %66) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_29 = arith.constant 0 : i32
          %68 = arith.cmpi ne, %67, %c0_i32_29 : i32
          "simt_step.condition"(%68, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %64 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %65 = arith.addi %arg5, %c1_i32 : i32
          %true_28 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_29 = arith.constant 4 : i32
          %66 = arith.muli %arg5, %c4_i32_29 : i32
          %67 = arith.addi %c128_i32, %66 : i32
          %68 = arith.addi %67, %0 : i32
          %true_30 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_30) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64, %65) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %48 = arith.addi %c144_i32, %0 : i32
        %true_19 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%50: i32):  // no predecessors
        %c0_i32_20 = arith.constant 0 : i32
        %c0_i32_21 = arith.constant 0 : i32
        %51:2 = "simt_step.loop"(%c0_i32_20, %c0_i32_21) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_28 = arith.constant 4 : i32
          %64 = arith.muli %arg5, %c4_i32_28 : i32
          %65 = arith.addi %64, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %66 = arith.addi %c44_i32, %65 : i32
          %67 = "simt_step.buffer.load"(%arg1, %66) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_29 = arith.constant 0 : i32
          %68 = arith.cmpi ne, %67, %c0_i32_29 : i32
          "simt_step.condition"(%68, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %64 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %65 = arith.addi %arg5, %c1_i32 : i32
          %true_28 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_29 = arith.constant 4 : i32
          %66 = arith.muli %arg5, %c4_i32_29 : i32
          %67 = arith.addi %c160_i32, %66 : i32
          %68 = arith.addi %67, %0 : i32
          %true_30 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_30) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%64, %65) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_22 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %52 = arith.addi %c176_i32, %0 : i32
        %true_23 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%54: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %55 = arith.addi %c64_i32, %0 : i32
        %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
        %57 = simt_step.lane_id
        %58 = arith.index_cast %57 : index to i32
        %59 = "simt_step.switch"(%56, %58) ({
        ^bb0(%arg4: i32):
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = true} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %c4_i32_28 = arith.constant 4 : i32
          %67 = arith.addi %0, %c4_i32_28 : i32
          %true_29 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %68 = arith.addi %c192_i32, %0 : i32
          %true_30 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_30) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67) {fallthrough = true} : (i32) -> ()
        ^bb2(%70: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %71 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%71) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_24 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %60 = arith.addi %c208_i32, %0 : i32
        %true_25 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_26 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %62 = arith.addi %c224_i32, %0 : i32
        %true_27 = arith.constant true
        %63 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c240_i32 = arith.constant 240 : i32
      %19 = arith.addi %c240_i32, %0 : i32
      %true_5 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %22 = arith.addi %c68_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %24 = arith.cmpi ne, %23, %c0_i32_6 : i32
      %25 = "simt_step.if"(%24) ({
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %41 = arith.muli %arg4, %c4_i32_16 : i32
          %42 = arith.addi %41, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %43 = arith.addi %c72_i32, %42 : i32
          %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %45 = arith.cmpi ne, %44, %c0_i32_17 : i32
          "simt_step.condition"(%45, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %41 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %42 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_17 : i32
          %44 = arith.addi %c256_i32, %43 : i32
          %45 = arith.addi %44, %0 : i32
          %true_18 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%41, %42) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%40#0) : (i32) -> ()
      }, {
        %c3_i32 = arith.constant 3 : i32
        %40 = arith.addi %0, %c3_i32 : i32
        "simt_step.yield"(%40) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %26 = arith.addi %c272_i32, %0 : i32
      %true_7 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%28: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %29 = arith.addi %c92_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = simt_step.subgroup_id
      %32 = arith.index_cast %31 : index to i32
      %33 = "simt_step.switch"(%30, %32) ({
      ^bb0(%arg3: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %true_15 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %40 = arith.addi %c288_i32, %0 : i32
        %true_16 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c0_i32_14) {fallthrough = true} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %43 = simt_step.subgroup_id
        %44 = arith.index_cast %43 : index to i32
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %34 = arith.addi %c304_i32, %0 : i32
      %true_9 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %36 = arith.addi %c320_i32, %0 : i32
      %true_11 = arith.constant true
      %37 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c0_i32_12 = arith.constant 0 : i32
      %c0_i32_13 = arith.constant 0 : i32
      %39:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %40 = arith.muli %arg4, %c4_i32_14 : i32
        %41 = arith.addi %40, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %42 = arith.addi %c96_i32, %41 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_15 : i32
        "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %47 = arith.muli %arg6, %c4_i32_19 : i32
          %48 = arith.addi %47, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %49 = arith.addi %c116_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_20 : i32
          "simt_step.condition"(%51, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %47 = arith.addi %arg5, %arg6 : i32
          %c1_i32_19 = arith.constant 1 : i32
          %48 = arith.addi %arg6, %c1_i32_19 : i32
          %true_20 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %49 = arith.muli %arg6, %c4_i32_21 : i32
          %50 = arith.addi %c336_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_22 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %41 = arith.addi %arg3, %40#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %42 = arith.addi %arg4, %c1_i32 : i32
        %true_16 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_17 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_17 : i32
        %44 = arith.addi %c352_i32, %43 : i32
        %45 = arith.addi %44, %0 : i32
        %true_18 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41, %42) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c368_i32 = arith.constant 368 : i32
    %12 = arith.addi %c368_i32, %0 : i32
    %true_3 = arith.constant true
    %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

