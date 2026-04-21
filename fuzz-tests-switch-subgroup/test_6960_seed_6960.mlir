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
      %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %6 = "simt_step.if"(%5) ({
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32 : i32
          %10 = arith.cmpi slt, %arg5, %9 : i32
          "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
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
        "simt_step.yield"(%7#0) : (i32) -> ()
      }, {
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %7:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32 = arith.constant 4 : i32
          %8 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %9 = arith.addi %8, %c1_i32 : i32
          %10 = arith.cmpi slt, %arg5, %9 : i32
          "simt_step.condition"(%10, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %true = arith.constant true
          %8 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.muli %arg5, %c4_i32 : i32
          %10 = arith.addi %c32_i32, %9 : i32
          %11 = arith.addi %10, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %8) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %12 = arith.addi %arg5, %c1_i32 : i32
          "simt_step.continue"(%8, %12) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%7#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) : (i32) -> ()
    }, {
      %c0_i32_3 = arith.constant 0 : i32
      %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
      %6 = "simt_step.if"(%5) ({
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %8 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) : (i32) -> ()
      }, {
        %true = arith.constant true
        %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %8 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%7) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%6) : (i32) -> ()
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_14 : i32
        %38 = arith.addi %37, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %39 = arith.addi %c12_i32, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_15 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %37 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_15 : i32
        %40 = arith.addi %c80_i32, %39 : i32
        %41 = arith.addi %40, %0 : i32
        %true_16 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c32_i32 = arith.constant 32 : i32
      %17 = arith.addi %c32_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %19 = arith.cmpi ne, %18, %c0_i32_4 : i32
      %20 = "simt_step.if"(%19) ({
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_16 : i32
          %39 = arith.addi %38, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %40 = arith.addi %c36_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_17 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_17 : i32
          %41 = arith.addi %c96_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_18 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) : (i32) -> ()
      }, {
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %38 = arith.muli %arg4, %c4_i32_16 : i32
          %39 = arith.addi %38, %0 : i32
          %c56_i32 = arith.constant 56 : i32
          %40 = arith.addi %c56_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_17 : i32
          "simt_step.condition"(%42, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %38 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_17 : i32
          %41 = arith.addi %c112_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_18 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) : (i32) -> ()
      }) : (i1) -> i32
      %c128_i32 = arith.constant 128 : i32
      %21 = arith.addi %c128_i32, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c144_i32 = arith.constant 144 : i32
      %23 = arith.addi %c144_i32, %0 : i32
      %true_7 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb2(%25: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %26 = arith.addi %c76_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %28 = simt_step.subgroup_id
      %29 = arith.index_cast %28 : index to i32
      %30 = "simt_step.switch"(%27, %29) ({
      ^bb0(%arg3: i32):
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_22 : i32
          %51 = arith.addi %50, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %52 = arith.addi %c80_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_23 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_23 : i32
          %53 = arith.addi %c160_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_24 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c0_i32_16 = arith.constant 0 : i32
        %c0_i32_17 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_16, %c0_i32_17) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_22 : i32
          %51 = arith.addi %50, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %52 = arith.addi %c100_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_23 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_23 : i32
          %53 = arith.addi %c176_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_24 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %41 = arith.addi %c120_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = simt_step.subgroup_id
        %44 = arith.index_cast %43 : index to i32
        %45 = "simt_step.switch"(%42, %44) ({
        ^bb0(%arg4: i32):
          %50 = simt_step.lane_id
          %51 = arith.index_cast %50 : index to i32
          %true_22 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %52 = arith.addi %c192_i32, %0 : i32
          %true_23 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = true} : (i32) -> ()
        ^bb1(%54: i32):  // no predecessors
          %55 = simt_step.subgroup_id
          %56 = arith.index_cast %55 : index to i32
          %true_24 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %57 = arith.addi %c208_i32, %0 : i32
          %true_25 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb2(%59: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %60 = arith.addi %0, %c2_i32 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb3(%46: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %47:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_22 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_22 : i32
          %51 = arith.addi %50, %0 : i32
          %c124_i32 = arith.constant 124 : i32
          %52 = arith.addi %c124_i32, %51 : i32
          %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_23 = arith.constant 0 : i32
          %54 = arith.cmpi ne, %53, %c0_i32_23 : i32
          "simt_step.condition"(%54, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %50 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %51 = arith.addi %arg5, %c1_i32 : i32
          %true_22 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_23 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_23 : i32
          %53 = arith.addi %c224_i32, %52 : i32
          %54 = arith.addi %53, %0 : i32
          %true_24 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%50, %51) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_20 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %48 = arith.addi %c240_i32, %0 : i32
        %true_21 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %31 = arith.addi %c256_i32, %0 : i32
      %true_9 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_10 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %33 = arith.addi %c272_i32, %0 : i32
      %true_11 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb3(%35: i32):  // no predecessors
      %c0_i32_12 = arith.constant 0 : i32
      %c0_i32_13 = arith.constant 0 : i32
      %36:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_14 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_14 : i32
        %38 = arith.addi %37, %0 : i32
        %c144_i32_15 = arith.constant 144 : i32
        %39 = arith.addi %c144_i32_15, %38 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_16 : i32
        "simt_step.condition"(%41, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %37 = arith.addi %arg3, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %38 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %39 = arith.muli %arg4, %c4_i32_15 : i32
        %40 = arith.addi %c288_i32, %39 : i32
        %41 = arith.addi %40, %0 : i32
        %true_16 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%37, %38) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%36#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c4_i32_0 = arith.constant 4 : i32
    %c164_i32 = arith.constant 164 : i32
    %8 = arith.addi %c164_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = simt_step.subgroup_id
    %11 = arith.index_cast %10 : index to i32
    %12 = "simt_step.switch"(%9, %11) ({
    ^bb0(%arg2: i32):
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_8 : i32
        %24 = arith.addi %23, %0 : i32
        %c168_i32 = arith.constant 168 : i32
        %25 = arith.addi %c168_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %23:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_13 : i32
          %31 = arith.addi %30, %0 : i32
          %c188_i32 = arith.constant 188 : i32
          %32 = arith.addi %c188_i32, %31 : i32
          %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %34 = arith.cmpi ne, %33, %c0_i32_14 : i32
          "simt_step.condition"(%34, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %30 = arith.addi %arg5, %arg6 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %31 = arith.addi %arg6, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %32 = arith.muli %arg6, %c4_i32_15 : i32
          %33 = arith.addi %c304_i32, %32 : i32
          %34 = arith.addi %33, %0 : i32
          %true_16 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %24 = arith.addi %arg3, %23#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg4, %c1_i32 : i32
        %true_10 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %26 = arith.muli %arg4, %c4_i32_11 : i32
        %27 = arith.addi %c320_i32, %26 : i32
        %28 = arith.addi %27, %0 : i32
        %true_12 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24, %25) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %17:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %23 = arith.muli %arg4, %c4_i32_8 : i32
        %24 = arith.addi %23, %0 : i32
        %c208_i32 = arith.constant 208 : i32
        %25 = arith.addi %c208_i32, %24 : i32
        %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %26, %c0_i32_9 : i32
        "simt_step.condition"(%27, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %23 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %24 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %25 = arith.muli %arg4, %c4_i32_9 : i32
        %26 = arith.addi %c336_i32, %25 : i32
        %27 = arith.addi %26, %0 : i32
        %true_10 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23, %24) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%17#0) {fallthrough = true} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      %true_6 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %21 = arith.addi %c352_i32, %0 : i32
      %true_7 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c368_i32 = arith.constant 368 : i32
    %13 = arith.addi %c368_i32, %0 : i32
    %true_1 = arith.constant true
    %14 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

