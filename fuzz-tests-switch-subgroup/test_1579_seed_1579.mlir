module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %7, %c1_i32 : i32
      %9 = arith.cmpi slt, %arg5, %8 : i32
      "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.muli %arg5, %c4_i32 : i32
      %9 = arith.addi %c0_i32_7, %8 : i32
      %10 = arith.addi %9, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%7, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %1:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %7, %c1_i32 : i32
      %9 = arith.cmpi slt, %arg5, %8 : i32
      "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %8 = arith.muli %arg5, %c4_i32 : i32
      %9 = arith.addi %c16_i32, %8 : i32
      %10 = arith.addi %9, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%7, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_3 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %3 = arith.select %2, %0#0, %1#0 : i32
    %c0_i32_4 = arith.constant 0 : i32
    %c0_i32_5 = arith.constant 0 : i32
    %4:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %7 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %8 = arith.addi %7, %c1_i32 : i32
      %9 = arith.cmpi slt, %arg5, %8 : i32
      "simt_step.condition"(%9, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %c2_i32 = arith.constant 2 : i32
      %7 = arith.remsi %arg3, %c2_i32 : i32
      %8 = simt_step.subgroup_id
      %9 = arith.index_cast %8 : index to i32
      %10 = "simt_step.switch"(%7, %9) ({
      ^bb0(%arg6: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %12:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32_11 : i32
          %21 = arith.cmpi slt, %arg8, %20 : i32
          "simt_step.condition"(%21, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg8, %c4_i32 : i32
          %21 = arith.addi %c32_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_11 = arith.constant 1 : i32
          %23 = arith.addi %arg8, %c1_i32_11 : i32
          "simt_step.continue"(%19, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%12#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%13: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %14 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %15 = "simt_step.if"(%14) ({
          %true = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32 : i32
          %21 = arith.addi %c48_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %true = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32 : i32
          %21 = arith.addi %c64_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%15) {fallthrough = true} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %17 = arith.cmpi ne, %arg2, %c0_i32_10 : i32
        %18 = "simt_step.if"(%17) ({
          %true = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32 : i32
          %21 = arith.addi %c80_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %true = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg5, %c4_i32 : i32
          %21 = arith.addi %c96_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %c1_i32 = arith.constant 1 : i32
      %11 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.break"(%10, %11) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_6 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
    %6 = arith.select %5, %3, %4#0 : i32
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
      %11 = arith.addi %c8_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      "simt_step.if"(%13) ({
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
    %8 = "simt_step.switch"(%7, %0) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_2 : i32
      %14 = "simt_step.if"(%13) ({
        %c20_i32 = arith.constant 20 : i32
        %35 = arith.addi %c20_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %39 = arith.addi %c112_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c24_i32 = arith.constant 24 : i32
        %35 = arith.addi %c24_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          %c0_i32_14 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_14) : (i32) -> ()
        }, {
          %41 = simt_step.lane_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %39 = arith.addi %c128_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %15 = arith.addi %c144_i32, %0 : i32
      %true_3 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = true} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %18 = arith.addi %c28_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
      %21 = "simt_step.if"(%20) ({
        %c32_i32 = arith.constant 32 : i32
        %35 = arith.addi %c32_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_12 = arith.constant 2 : i32
        %37 = arith.addi %0, %c2_i32_12 : i32
        %38 = "simt_step.switch"(%36, %37) ({
        ^bb0(%arg3: i32):
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %true_13 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %42 = arith.addi %c160_i32, %0 : i32
          %true_14 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          %true_16 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %45 = arith.addi %c176_i32, %0 : i32
          %true_17 = arith.constant true
          %46 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_15) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %35 = arith.addi %c36_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          "simt_step.yield"(%42) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %39 = arith.addi %c192_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %22 = arith.addi %c208_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %24 = arith.addi %c224_i32, %0 : i32
      %true_7 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %27 = arith.addi %c40_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %29 = arith.addi %0, %c2_i32 : i32
      %30 = "simt_step.switch"(%28, %29) ({
      ^bb0(%arg3: i32):
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_20 : i32
          %50 = arith.addi %49, %0 : i32
          %c44_i32 = arith.constant 44 : i32
          %51 = arith.addi %c44_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_21 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_21 : i32
          %52 = arith.addi %c240_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_22 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_20 : i32
          %50 = arith.addi %49, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %51 = arith.addi %c64_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_21 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_21 : i32
          %52 = arith.addi %c256_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_22 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%38: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %39 = arith.addi %c84_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = "simt_step.switch"(%40, %0) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%49: i32):  // no predecessors
          %50 = simt_step.subgroup_id
          %51 = arith.index_cast %50 : index to i32
          %true_20 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %52 = arith.addi %c272_i32, %0 : i32
          %true_21 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %42 = arith.addi %c288_i32, %0 : i32
        %true_17 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      ^bb3(%44: i32):  // no predecessors
        %45 = simt_step.subgroup_id
        %46 = arith.index_cast %45 : index to i32
        %true_18 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %47 = arith.addi %c304_i32, %0 : i32
        %true_19 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c320_i32 = arith.constant 320 : i32
      %31 = arith.addi %c320_i32, %0 : i32
      %true_9 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb3(%33: i32):  // no predecessors
      %c0_i32_10 = arith.constant 0 : i32
      %c0_i32_11 = arith.constant 0 : i32
      %34:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %35 = arith.muli %arg4, %c4_i32_12 : i32
        %36 = arith.addi %35, %0 : i32
        %c88_i32 = arith.constant 88 : i32
        %37 = arith.addi %c88_i32, %36 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_13 : i32
        "simt_step.condition"(%39, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c108_i32 = arith.constant 108 : i32
        %35 = arith.addi %c108_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_12 : i32
        %38 = "simt_step.if"(%37) ({
          %c2_i32_17 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_17) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %39 = arith.addi %c336_i32, %0 : i32
        %true_13 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %41 = arith.addi %arg3, %38 : i32
        %c1_i32 = arith.constant 1 : i32
        %42 = arith.addi %arg4, %c1_i32 : i32
        %true_14 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %c4_i32_15 = arith.constant 4 : i32
        %43 = arith.muli %arg4, %c4_i32_15 : i32
        %44 = arith.addi %c352_i32, %43 : i32
        %45 = arith.addi %44, %0 : i32
        %true_16 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41, %42) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c368_i32 = arith.constant 368 : i32
    %9 = arith.addi %c368_i32, %0 : i32
    %true_1 = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

