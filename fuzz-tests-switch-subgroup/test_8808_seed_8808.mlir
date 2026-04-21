module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %0 = arith.cmpi ne, %arg2, %c0_i32 : i32
    %1 = "simt_step.if"(%0) ({
      %c0_i32_0 = arith.constant 0 : i32
      %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %3 = "simt_step.if"(%2) ({
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %4:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
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
          "simt_step.yield"(%5, %9) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%4#0) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %4 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %5 = arith.addi %arg0, %c1_i32 : i32
        %6 = "simt_step.switch"(%4, %5) ({
        ^bb0(%arg4: i32):
          %true = arith.constant true
          %7 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %8 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %8, %7) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
        ^bb1(%9: i32):  // no predecessors
          %true_1 = arith.constant true
          %10 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %11 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %11, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%10) {fallthrough = true} : (i32) -> ()
        ^bb2(%12: i32):  // no predecessors
          %true_2 = arith.constant true
          %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %14 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%6) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%3) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %2 = arith.remsi %arg3, %c3_i32 : i32
      %3 = simt_step.subgroup_id
      %4 = arith.index_cast %3 : index to i32
      %5 = "simt_step.switch"(%2, %4) ({
      ^bb0(%arg4: i32):
        %c0_i32_0 = arith.constant 0 : i32
        %c0_i32_1 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_7 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32 : i32
          %18 = arith.addi %c64_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %10:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_7 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32 : i32
          %18 = arith.addi %c80_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%10#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%11: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %12 = arith.addi %arg0, %c0_i32_4 : i32
        %13 = "simt_step.switch"(%arg3, %12) ({
        ^bb0(%arg5: i32):
          %true_7 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %17 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
        ^bb1(%18: i32):  // no predecessors
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %20 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = true} : (i32) -> ()
      ^bb3(%14: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_7 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32 : i32
          %18 = arith.addi %c128_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %7 = arith.addi %c144_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%5) : (i32) -> ()
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
    %c0_i32_0 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %2, %c0_i32_0 : i32
    "simt_step.if"(%5) ({
      %c8_i32 = arith.constant 8 : i32
      %12 = arith.addi %c8_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_5 : i32
      "simt_step.if"(%14) ({
        "simt_step.yield"() : () -> ()
      }, {
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"() : () -> ()
      }) : (i1) -> ()
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %6:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_5 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_5 : i32
      %13 = arith.addi %12, %0 : i32
      %c12_i32 = arith.constant 12 : i32
      %14 = arith.addi %c12_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_6 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %14 = arith.addi %0, %c3_i32 : i32
      %15 = "simt_step.switch"(%13, %14) ({
      ^bb0(%arg4: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %22:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %28 = arith.muli %arg6, %c4_i32_12 : i32
          %29 = arith.addi %28, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %30 = arith.addi %c36_i32, %29 : i32
          %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %32 = arith.cmpi ne, %31, %c0_i32_13 : i32
          "simt_step.condition"(%32, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %28 = arith.addi %arg5, %arg6 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %29 = arith.addi %arg6, %c1_i32_12 : i32
          %true_13 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %30 = arith.muli %arg6, %c4_i32_14 : i32
          %31 = arith.addi %c160_i32, %30 : i32
          %32 = arith.addi %31, %0 : i32
          %true_15 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28, %29) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%22#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %24 = simt_step.lane_id
        %25 = arith.index_cast %24 : index to i32
        %true_10 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %26 = arith.addi %c176_i32, %0 : i32
        %true_11 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %16 = arith.addi %arg2, %15 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg3, %c1_i32 : i32
      %true_5 = arith.constant true
      %c192_i32 = arith.constant 192 : i32
      %c4_i32_6 = arith.constant 4 : i32
      %18 = arith.muli %arg3, %c4_i32_6 : i32
      %19 = arith.addi %c192_i32, %18 : i32
      %20 = arith.addi %19, %0 : i32
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%16, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c56_i32 = arith.constant 56 : i32
    %7 = arith.addi %c56_i32, %0 : i32
    %8 = "simt_step.buffer.load"(%arg1, %7) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_3 = arith.constant 0 : i32
    %9 = "simt_step.switch"(%8, %c0_i32_3) ({
    ^bb0(%arg2: i32):
      %c60_i32 = arith.constant 60 : i32
      %12 = arith.addi %c60_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %14 = "simt_step.switch"(%13, %c3_i32) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_23 : i32
          %50 = arith.addi %49, %0 : i32
          %c64_i32 = arith.constant 64 : i32
          %51 = arith.addi %c64_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_24 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c208_i32 = arith.constant 208 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_24 : i32
          %52 = arith.addi %c208_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_25 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %36 = arith.addi %c224_i32, %0 : i32
        %true_14 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_23 : i32
          %50 = arith.addi %49, %0 : i32
          %c84_i32 = arith.constant 84 : i32
          %51 = arith.addi %c84_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_24 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_24 : i32
          %52 = arith.addi %c240_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_25 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%40: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %41:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_23 : i32
          %50 = arith.addi %49, %0 : i32
          %c104_i32 = arith.constant 104 : i32
          %51 = arith.addi %c104_i32, %50 : i32
          %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %53 = arith.cmpi ne, %52, %c0_i32_24 : i32
          "simt_step.condition"(%53, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %49 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %50 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %51 = arith.muli %arg5, %c4_i32_24 : i32
          %52 = arith.addi %c256_i32, %51 : i32
          %53 = arith.addi %52, %0 : i32
          %true_25 = arith.constant true
          %54 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%49, %50) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_19 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %42 = arith.addi %c272_i32, %0 : i32
        %true_20 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%44: i32):  // no predecessors
        %45 = simt_step.lane_id
        %46 = arith.index_cast %45 : index to i32
        %true_21 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %47 = arith.addi %c288_i32, %0 : i32
        %true_22 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_5 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %15 = arith.addi %c304_i32, %0 : i32
      %true_6 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c124_i32 = arith.constant 124 : i32
      %18 = arith.addi %c124_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_7 : i32
      %21 = "simt_step.if"(%20) ({
        %c128_i32 = arith.constant 128 : i32
        %35 = arith.addi %c128_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_11 : i32
        %38 = "simt_step.if"(%37) ({
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }, {
          %c3_i32_13 = arith.constant 3 : i32
          %41 = arith.addi %0, %c3_i32_13 : i32
          "simt_step.yield"(%41) : (i32) -> ()
        }) : (i1) -> i32
        %c320_i32 = arith.constant 320 : i32
        %39 = arith.addi %c320_i32, %0 : i32
        %true_12 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %35 = simt_step.subgroup_id
        %36 = arith.index_cast %35 : index to i32
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %22 = arith.addi %c336_i32, %0 : i32
      %true_8 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %24 = arith.addi %c352_i32, %0 : i32
      %true_10 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c132_i32 = arith.constant 132 : i32
      %27 = arith.addi %c132_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = simt_step.subgroup_id
      %30 = arith.index_cast %29 : index to i32
      %31 = "simt_step.switch"(%28, %30) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %52 = arith.muli %arg5, %c4_i32_19 : i32
          %53 = arith.addi %52, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %54 = arith.addi %c136_i32, %53 : i32
          %55 = "simt_step.buffer.load"(%arg1, %54) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %56 = arith.cmpi ne, %55, %c0_i32_20 : i32
          "simt_step.condition"(%56, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %52 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %53 = arith.addi %arg5, %c1_i32 : i32
          %true_19 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %54 = arith.muli %arg5, %c4_i32_20 : i32
          %55 = arith.addi %c368_i32, %54 : i32
          %56 = arith.addi %55, %0 : i32
          %true_21 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%52, %53) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c156_i32 = arith.constant 156 : i32
        %37 = arith.addi %c156_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_13 : i32
        %40 = "simt_step.if"(%39) ({
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }, {
          %c3_i32_19 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_19) : (i32) -> ()
        }) : (i1) -> i32
        %c384_i32 = arith.constant 384 : i32
        %41 = arith.addi %c384_i32, %0 : i32
        %true_14 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_15 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %43 = arith.addi %c400_i32, %0 : i32
        %true_16 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      ^bb2(%45: i32):  // no predecessors
        %c160_i32 = arith.constant 160 : i32
        %46 = arith.addi %c160_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_17 : i32
        %49 = "simt_step.if"(%48) ({
          %c4_i32_19 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_19) : (i32) -> ()
        }, {
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) : (i32) -> ()
        }) : (i1) -> i32
        %c416_i32 = arith.constant 416 : i32
        %50 = arith.addi %c416_i32, %0 : i32
        %true_18 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %33 = simt_step.subgroup_id
      %34 = arith.index_cast %33 : index to i32
      "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c432_i32 = arith.constant 432 : i32
    %10 = arith.addi %c432_i32, %0 : i32
    %true_4 = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

