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
      %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
      %2 = "simt_step.if"(%1) ({
        %c3_i32 = arith.constant 3 : i32
        %4 = arith.remsi %arg3, %c3_i32 : i32
        %5 = "simt_step.switch"(%4, %arg0) ({
        ^bb0(%arg6: i32):
          %true = arith.constant true
          %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c0_i32_2 = arith.constant 0 : i32
          %c4_i32 = arith.constant 4 : i32
          %7 = arith.muli %arg5, %c4_i32 : i32
          %8 = arith.addi %c0_i32_2, %7 : i32
          %9 = arith.addi %8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
        ^bb1(%10: i32):  // no predecessors
          %true_3 = arith.constant true
          %11 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %12 = arith.muli %arg5, %c4_i32_4 : i32
          %13 = arith.addi %c16_i32, %12 : i32
          %14 = arith.addi %13, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
        ^bb2(%15: i32):  // no predecessors
          %true_5 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %17 = arith.muli %arg5, %c4_i32_6 : i32
          %18 = arith.addi %c32_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%5) : (i32) -> ()
      }, {
        %true = arith.constant true
        %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %c4_i32 = arith.constant 4 : i32
        %5 = arith.muli %arg5, %c4_i32 : i32
        %6 = arith.addi %c48_i32, %5 : i32
        %7 = arith.addi %6, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%4) : (i32) -> ()
      }) : (i1) -> i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %5:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_3 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_3 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_4 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg4: i32, %arg5: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_7 : i32
        %20 = arith.addi %19, %0 : i32
        %c28_i32 = arith.constant 28 : i32
        %21 = arith.addi %c28_i32, %20 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %23 = arith.cmpi ne, %22, %c0_i32_8 : i32
        "simt_step.condition"(%23, %arg4, %arg5) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg4: i32, %arg5: i32):
        %19 = arith.addi %arg4, %arg5 : i32
        %c1_i32_7 = arith.constant 1 : i32
        %20 = arith.addi %arg5, %c1_i32_7 : i32
        %true_8 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %21 = arith.muli %arg5, %c4_i32_9 : i32
        %22 = arith.addi %c64_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_10 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %13 = arith.addi %arg2, %12#0 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c80_i32 = arith.constant 80 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %15 = arith.muli %arg3, %c4_i32_5 : i32
      %16 = arith.addi %c80_i32, %15 : i32
      %17 = arith.addi %16, %0 : i32
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13, %14) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c48_i32 = arith.constant 48 : i32
    %6 = arith.addi %c48_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_14 : i32
        %40 = arith.addi %39, %0 : i32
        %c52_i32 = arith.constant 52 : i32
        %41 = arith.addi %c52_i32, %40 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %43 = arith.cmpi ne, %42, %c0_i32_15 : i32
        "simt_step.condition"(%43, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %39 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %40 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c96_i32_15 = arith.constant 96 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %41 = arith.muli %arg4, %c4_i32_16 : i32
        %42 = arith.addi %c96_i32_15, %41 : i32
        %43 = arith.addi %42, %0 : i32
        %true_17 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%39, %40) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c112_i32 = arith.constant 112 : i32
      %13 = arith.addi %c112_i32, %0 : i32
      %true_5 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %16 = arith.addi %c72_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_6 : i32
      %19 = "simt_step.if"(%18) ({
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) : (i32) -> ()
      }, {
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_16 : i32
          %41 = arith.addi %40, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %42 = arith.addi %c76_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_17 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_17 : i32
          %43 = arith.addi %c128_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_18 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) : (i32) -> ()
      }) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %20 = arith.addi %c144_i32, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c160_i32 = arith.constant 160 : i32
      %22 = arith.addi %c160_i32, %0 : i32
      %true_9 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
    ^bb2(%24: i32):  // no predecessors
      %c96_i32 = arith.constant 96 : i32
      %25 = arith.addi %c96_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %27 = simt_step.lane_id
      %28 = arith.index_cast %27 : index to i32
      %29 = "simt_step.switch"(%26, %28) ({
      ^bb0(%arg3: i32):
        %c100_i32 = arith.constant 100 : i32
        %39 = arith.addi %c100_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_14 : i32
        %42 = "simt_step.if"(%41) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c176_i32_15 = arith.constant 176 : i32
        %43 = arith.addi %c176_i32_15, %0 : i32
        %true_16 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %45 = arith.addi %c192_i32, %0 : i32
        %true_18 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb1(%47: i32):  // no predecessors
        %c104_i32 = arith.constant 104 : i32
        %48 = arith.addi %c104_i32, %0 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %50 = simt_step.lane_id
        %51 = arith.index_cast %50 : index to i32
        %52 = "simt_step.switch"(%49, %51) ({
        ^bb0(%arg4: i32):
          %64 = simt_step.lane_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %67 = simt_step.lane_id
          %68 = arith.index_cast %67 : index to i32
          %true_25 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %69 = arith.addi %c208_i32, %0 : i32
          %true_26 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb2(%71: i32):  // no predecessors
          %true_27 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %72 = arith.addi %c224_i32, %0 : i32
          %true_28 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_28) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%74: i32):  // no predecessors
          %c0_i32_29 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%52) {fallthrough = true} : (i32) -> ()
      ^bb2(%53: i32):  // no predecessors
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %54:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_25 = arith.constant 4 : i32
          %64 = arith.muli %arg5, %c4_i32_25 : i32
          %65 = arith.addi %64, %0 : i32
          %c108_i32 = arith.constant 108 : i32
          %66 = arith.addi %c108_i32, %65 : i32
          %67 = "simt_step.buffer.load"(%arg1, %66) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_26 = arith.constant 0 : i32
          %68 = arith.cmpi ne, %67, %c0_i32_26 : i32
          "simt_step.condition"(%68, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %64 = arith.addi %arg4, %arg5 : i32
          %c1_i32_25 = arith.constant 1 : i32
          %65 = arith.addi %arg5, %c1_i32_25 : i32
          %true_26 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_27 = arith.constant 4 : i32
          %66 = arith.muli %arg5, %c4_i32_27 : i32
          %67 = arith.addi %c240_i32, %66 : i32
          %68 = arith.addi %67, %0 : i32
          %true_28 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_28) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64, %65) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_21 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %55 = arith.addi %c256_i32, %0 : i32
        %true_22 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%57: i32):  // no predecessors
        %c128_i32 = arith.constant 128 : i32
        %58 = arith.addi %c128_i32, %0 : i32
        %59 = "simt_step.buffer.load"(%arg1, %58) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %60 = arith.addi %0, %c1_i32 : i32
        %61 = "simt_step.switch"(%59, %60) ({
        ^bb0(%arg4: i32):
          %c0_i32_25 = arith.constant 0 : i32
          %64 = arith.addi %0, %c0_i32_25 : i32
          %true_26 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %65 = arith.addi %c272_i32, %0 : i32
          %true_27 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        ^bb1(%67: i32):  // no predecessors
          %c4_i32_28 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_28) {fallthrough = true} : (i32) -> ()
        ^bb2(%68: i32):  // no predecessors
          %69 = simt_step.subgroup_id
          %70 = arith.index_cast %69 : index to i32
          "simt_step.yield"(%70) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_23 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %62 = arith.addi %c288_i32, %0 : i32
        %true_24 = arith.constant true
        %63 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
    ^bb3(%30: i32):  // no predecessors
      %c132_i32 = arith.constant 132 : i32
      %31 = arith.addi %c132_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %33 = arith.cmpi ne, %32, %c0_i32_10 : i32
      %34 = "simt_step.if"(%33) ({
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_16 : i32
          %41 = arith.addi %40, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %42 = arith.addi %c136_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_17 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_17 : i32
          %43 = arith.addi %c304_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_18 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) : (i32) -> ()
      }, {
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_16 : i32
          %41 = arith.addi %40, %0 : i32
          %c156_i32 = arith.constant 156 : i32
          %42 = arith.addi %c156_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_17 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_17 : i32
          %43 = arith.addi %c320_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_18 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %35 = arith.addi %c336_i32, %0 : i32
      %true_11 = arith.constant true
      %36 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_12 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %37 = arith.addi %c352_i32, %0 : i32
      %true_13 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c176_i32 = arith.constant 176 : i32
    %9 = arith.addi %c176_i32, %0 : i32
    %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_2 = arith.constant 0 : i32
    %11 = "simt_step.switch"(%10, %c0_i32_2) ({
    ^bb0(%arg2: i32):
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %12:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_8 : i32
        %23 = arith.addi %22, %0 : i32
        %c180_i32 = arith.constant 180 : i32
        %24 = arith.addi %c180_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_9 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_13 : i32
          %30 = arith.addi %29, %0 : i32
          %c200_i32 = arith.constant 200 : i32
          %31 = arith.addi %c200_i32, %30 : i32
          %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %33 = arith.cmpi ne, %32, %c0_i32_14 : i32
          "simt_step.condition"(%33, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %29 = arith.addi %arg5, %arg6 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %30 = arith.addi %arg6, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %31 = arith.muli %arg6, %c4_i32_15 : i32
          %32 = arith.addi %c368_i32, %31 : i32
          %33 = arith.addi %32, %0 : i32
          %true_16 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29, %30) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %23 = arith.addi %arg3, %22#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_11 : i32
        %26 = arith.addi %c384_i32, %25 : i32
        %27 = arith.addi %26, %0 : i32
        %true_12 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c400_i32 = arith.constant 400 : i32
      %13 = arith.addi %c400_i32, %0 : i32
      %true_5 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c220_i32 = arith.constant 220 : i32
      %16 = arith.addi %c220_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_6 : i32
      %19 = "simt_step.if"(%18) ({
        %c224_i32 = arith.constant 224 : i32
        %22 = arith.addi %c224_i32, %0 : i32
        %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %23, %c0_i32_8 : i32
        %25 = "simt_step.if"(%24) ({
          %28 = simt_step.subgroup_id
          %29 = arith.index_cast %28 : index to i32
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          %28 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%28) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %26 = arith.addi %c416_i32, %0 : i32
        %true_9 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c432_i32 = arith.constant 432 : i32
      %20 = arith.addi %c432_i32, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

