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
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.muli %arg5, %c4_i32 : i32
      %7 = arith.addi %c0_i32_3, %6 : i32
      %8 = arith.addi %7, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.continue"(%5, %9) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %1 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %2 = "simt_step.if"(%1) ({
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
        %c2_i32 = arith.constant 2 : i32
        %6 = arith.remsi %arg3, %c2_i32 : i32
        %7 = simt_step.lane_id
        %8 = arith.index_cast %7 : index to i32
        %9 = "simt_step.switch"(%6, %8) ({
        ^bb0(%arg6: i32):
          %true_5 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %16 = arith.muli %arg5, %c4_i32_6 : i32
          %17 = arith.addi %c16_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %true_7 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %21 = arith.muli %arg5, %c4_i32_8 : i32
          %22 = arith.addi %c32_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
        ^bb2(%24: i32):  // no predecessors
          %true_9 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %26 = arith.muli %arg5, %c4_i32_10 : i32
          %27 = arith.addi %c48_i32, %26 : i32
          %28 = arith.addi %27, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %c4_i32 = arith.constant 4 : i32
        %11 = arith.muli %arg5, %c4_i32 : i32
        %12 = arith.addi %c64_i32, %11 : i32
        %13 = arith.addi %12, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%9, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%5#0) : (i32) -> ()
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
        %c0_i32_6 = arith.constant 0 : i32
        %6:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32_7 : i32
          %10 = arith.cmpi slt, %arg7, %9 : i32
          "simt_step.condition"(%10, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg7, %c4_i32 : i32
          %10 = arith.addi %c80_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %12 = arith.addi %arg7, %c1_i32_7 : i32
          "simt_step.yield"(%8, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %c1_i32 = arith.constant 1 : i32
        %7 = arith.addi %arg5, %c1_i32 : i32
        "simt_step.yield"(%6#0, %7) : (i32, i32) -> ()
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
    call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
    %c8_i32 = arith.constant 8 : i32
    %5 = arith.addi %c8_i32, %0 : i32
    %6 = "simt_step.buffer.load"(%arg1, %5) : (!simt_step.resource<Global, i32>, i32) -> i32
    %7 = simt_step.lane_id
    %8 = arith.index_cast %7 : index to i32
    %9 = "simt_step.switch"(%6, %8) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %21 = arith.addi %c12_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      %25 = "simt_step.switch"(%22, %24) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %46 = arith.addi %c16_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %48 = simt_step.subgroup_id
        %49 = arith.index_cast %48 : index to i32
        %50 = "simt_step.switch"(%47, %49) ({
        ^bb0(%arg4: i32):
          %66 = simt_step.subgroup_id
          %67 = arith.index_cast %66 : index to i32
          %true_20 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %68 = arith.addi %c96_i32, %0 : i32
          %true_21 = arith.constant true
          %69 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %68, %69) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        ^bb1(%70: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%71: i32):  // no predecessors
          %c0_i32_22 = arith.constant 0 : i32
          %true_23 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %72 = arith.addi %c112_i32, %0 : i32
          %true_24 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
      ^bb1(%51: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %66 = arith.muli %arg5, %c4_i32_20 : i32
          %67 = arith.addi %66, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %68 = arith.addi %c20_i32, %67 : i32
          %69 = "simt_step.buffer.load"(%arg1, %68) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %70 = arith.cmpi ne, %69, %c0_i32_21 : i32
          "simt_step.condition"(%70, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %66 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %67 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %68 = arith.muli %arg5, %c4_i32_21 : i32
          %69 = arith.addi %c128_i32, %68 : i32
          %70 = arith.addi %69, %0 : i32
          %true_22 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%66, %67) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%52#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%53: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %54 = arith.addi %c40_i32, %0 : i32
        %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %56 = arith.cmpi ne, %55, %c0_i32_11 : i32
        %57 = "simt_step.if"(%56) ({
          %c1_i32 = arith.constant 1 : i32
          %66 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%66) : (i32) -> ()
        }, {
          %66 = simt_step.lane_id
          %67 = arith.index_cast %66 : index to i32
          "simt_step.yield"(%67) : (i32) -> ()
        }) : (i1) -> i32
        %c144_i32_12 = arith.constant 144 : i32
        %58 = arith.addi %c144_i32_12, %0 : i32
        %true_13 = arith.constant true
        %59 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_14 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %60 = arith.addi %c160_i32, %0 : i32
        %true_15 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
      ^bb3(%62: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %63:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %66 = arith.muli %arg5, %c4_i32_20 : i32
          %67 = arith.addi %66, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %68 = arith.addi %c44_i32, %67 : i32
          %69 = "simt_step.buffer.load"(%arg1, %68) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %70 = arith.cmpi ne, %69, %c0_i32_21 : i32
          "simt_step.condition"(%70, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %66 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %67 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c176_i32_21 = arith.constant 176 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %68 = arith.muli %arg5, %c4_i32_22 : i32
          %69 = arith.addi %c176_i32_21, %68 : i32
          %70 = arith.addi %69, %0 : i32
          %true_23 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%66, %67) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_18 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %64 = arith.addi %c192_i32, %0 : i32
        %true_19 = arith.constant true
        %65 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%63#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %26 = arith.addi %c208_i32, %0 : i32
      %true_2 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %29 = arith.addi %c64_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %31 = simt_step.subgroup_id
      %32 = arith.index_cast %31 : index to i32
      %33 = "simt_step.switch"(%30, %32) ({
      ^bb0(%arg3: i32):
        %c68_i32 = arith.constant 68 : i32
        %46 = arith.addi %c68_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_9 : i32
        %49 = "simt_step.if"(%48) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %66 = simt_step.subgroup_id
          %67 = arith.index_cast %66 : index to i32
          "simt_step.yield"(%67) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %50 = arith.addi %c224_i32, %0 : i32
        %true_10 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      ^bb1(%52: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %53:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %66 = arith.muli %arg5, %c4_i32_20 : i32
          %67 = arith.addi %66, %0 : i32
          %c72_i32 = arith.constant 72 : i32
          %68 = arith.addi %c72_i32, %67 : i32
          %69 = "simt_step.buffer.load"(%arg1, %68) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %70 = arith.cmpi ne, %69, %c0_i32_21 : i32
          "simt_step.condition"(%70, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %66 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %67 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %68 = arith.muli %arg5, %c4_i32_21 : i32
          %69 = arith.addi %c240_i32, %68 : i32
          %70 = arith.addi %69, %0 : i32
          %true_22 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%66, %67) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %54 = arith.addi %c256_i32, %0 : i32
        %true_14 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%53#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%56: i32):  // no predecessors
        %true_15 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %57 = arith.addi %c272_i32, %0 : i32
        %true_16 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb3(%59: i32):  // no predecessors
        %c92_i32 = arith.constant 92 : i32
        %60 = arith.addi %c92_i32, %0 : i32
        %61 = "simt_step.buffer.load"(%arg1, %60) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_17 = arith.constant 4 : i32
        %62 = arith.addi %0, %c4_i32_17 : i32
        %63 = "simt_step.switch"(%61, %62) ({
        ^bb0(%arg4: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %66 = arith.addi %0, %c4_i32_20 : i32
          "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
        ^bb1(%67: i32):  // no predecessors
          %68 = simt_step.subgroup_id
          %69 = arith.index_cast %68 : index to i32
          %true_21 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %70 = arith.addi %c288_i32, %0 : i32
          %true_22 = arith.constant true
          %71 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %70, %71) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        ^bb2(%72: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %true_23 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %73 = arith.addi %c304_i32, %0 : i32
          %true_24 = arith.constant true
          %74 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %73, %74) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%75: i32):  // no predecessors
          %c4_i32_25 = arith.constant 4 : i32
          %76 = arith.addi %0, %c4_i32_25 : i32
          %true_26 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %77 = arith.addi %c320_i32, %0 : i32
          %true_27 = arith.constant true
          %78 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %77, %78) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%76) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_18 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %64 = arith.addi %c336_i32, %0 : i32
        %true_19 = arith.constant true
        %65 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %34 = arith.addi %c352_i32, %0 : i32
      %true_4 = arith.constant true
      %35 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    ^bb2(%36: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %37:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %46 = arith.muli %arg4, %c4_i32_9 : i32
        %47 = arith.addi %46, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %48 = arith.addi %c96_i32, %47 : i32
        %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %50 = arith.cmpi ne, %49, %c0_i32_10 : i32
        "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %46:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %53 = arith.muli %arg6, %c4_i32_14 : i32
          %54 = arith.addi %53, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %55 = arith.addi %c116_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_15 : i32
          "simt_step.condition"(%57, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %53 = arith.addi %arg5, %arg6 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %54 = arith.addi %arg6, %c1_i32_14 : i32
          %true_15 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %55 = arith.muli %arg6, %c4_i32_16 : i32
          %56 = arith.addi %c368_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_17 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %47 = arith.addi %arg3, %46#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %48 = arith.addi %arg4, %c1_i32 : i32
        %true_11 = arith.constant true
        %c384_i32 = arith.constant 384 : i32
        %c4_i32_12 = arith.constant 4 : i32
        %49 = arith.muli %arg4, %c4_i32_12 : i32
        %50 = arith.addi %c384_i32, %49 : i32
        %51 = arith.addi %50, %0 : i32
        %true_13 = arith.constant true
        %52 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47, %48) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
    ^bb3(%38: i32):  // no predecessors
      %c136_i32 = arith.constant 136 : i32
      %39 = arith.addi %c136_i32, %0 : i32
      %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
      %41 = simt_step.subgroup_id
      %42 = arith.index_cast %41 : index to i32
      %43 = "simt_step.switch"(%40, %42) ({
      ^bb0(%arg3: i32):
        %c140_i32 = arith.constant 140 : i32
        %46 = arith.addi %c140_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_9 : i32
        %49 = "simt_step.if"(%48) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          "simt_step.yield"(%56) : (i32) -> ()
        }) : (i1) -> i32
        %c400_i32 = arith.constant 400 : i32
        %50 = arith.addi %c400_i32, %0 : i32
        %true_10 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %52 = arith.addi %c416_i32, %0 : i32
        %true_12 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      ^bb1(%54: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %44 = arith.addi %c432_i32, %0 : i32
      %true_8 = arith.constant true
      %45 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c144_i32 = arith.constant 144 : i32
    %10 = arith.addi %c144_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %12 = simt_step.subgroup_id
    %13 = arith.index_cast %12 : index to i32
    %14 = "simt_step.switch"(%11, %13) ({
    ^bb0(%arg2: i32):
      %c148_i32 = arith.constant 148 : i32
      %21 = arith.addi %c148_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_1 : i32
      %24 = "simt_step.if"(%23) ({
        %c152_i32 = arith.constant 152 : i32
        %30 = arith.addi %c152_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.subgroup_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg3: i32):
          %true_7 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %37 = arith.addi %c448_i32, %0 : i32
          %true_8 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%39: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c464_i32 = arith.constant 464 : i32
        %35 = arith.addi %c464_i32, %0 : i32
        %true_6 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %31 = arith.muli %arg4, %c4_i32_7 : i32
          %32 = arith.addi %31, %0 : i32
          %c156_i32 = arith.constant 156 : i32
          %33 = arith.addi %c156_i32, %32 : i32
          %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %35 = arith.cmpi ne, %34, %c0_i32_8 : i32
          "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %31 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %arg4, %c1_i32 : i32
          %true_7 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_8 : i32
          %34 = arith.addi %c480_i32, %33 : i32
          %35 = arith.addi %34, %0 : i32
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31, %32) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) : (i32) -> ()
      }) : (i1) -> i32
      %c496_i32 = arith.constant 496 : i32
      %25 = arith.addi %c496_i32, %0 : i32
      %true_2 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%27: i32):  // no predecessors
      %true_3 = arith.constant true
      %c512_i32 = arith.constant 512 : i32
      %28 = arith.addi %c512_i32, %0 : i32
      %true_4 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
    %c176_i32 = arith.constant 176 : i32
    %15 = arith.addi %c176_i32, %0 : i32
    %16 = "simt_step.buffer.load"(%arg1, %15) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %17 = arith.cmpi ne, %16, %c0_i32_0 : i32
    %18 = "simt_step.if"(%17) ({
      %c3_i32 = arith.constant 3 : i32
      "simt_step.yield"(%c3_i32) : (i32) -> ()
    }, {
      %c180_i32 = arith.constant 180 : i32
      %21 = arith.addi %c180_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %23 = "simt_step.switch"(%22, %c0_i32_1) ({
      ^bb0(%arg2: i32):
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%24: i32):  // no predecessors
        %c184_i32 = arith.constant 184 : i32
        %25 = arith.addi %c184_i32, %0 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_2 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_2 : i32
        %28 = "simt_step.if"(%27) ({
          %35 = simt_step.lane_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }, {
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          "simt_step.yield"(%36) : (i32) -> ()
        }) : (i1) -> i32
        %c528_i32 = arith.constant 528 : i32
        %29 = arith.addi %c528_i32, %0 : i32
        %true_3 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c3_i32_4 = arith.constant 3 : i32
        %32 = arith.addi %0, %c3_i32_4 : i32
        %true_5 = arith.constant true
        %c544_i32 = arith.constant 544 : i32
        %33 = arith.addi %c544_i32, %0 : i32
        %true_6 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%23) : (i32) -> ()
    }) : (i1) -> i32
    %c560_i32 = arith.constant 560 : i32
    %19 = arith.addi %c560_i32, %0 : i32
    %true = arith.constant true
    %20 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

