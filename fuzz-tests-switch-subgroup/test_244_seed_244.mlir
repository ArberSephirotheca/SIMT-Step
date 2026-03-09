module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_0 = arith.constant 0 : i32
    %2 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
    %3 = "simt_step.if"(%2) ({
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %7 = "simt_step.switch"(%6, %c0_i32_2) ({
      ^bb0(%arg4: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %19 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %20 = arith.addi %19, %c1_i32 : i32
          %21 = arith.cmpi slt, %arg6, %20 : i32
          "simt_step.condition"(%21, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %20 = arith.muli %arg6, %c4_i32 : i32
          %21 = arith.addi %c16_i32, %20 : i32
          %22 = arith.addi %21, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %23 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.continue"(%19, %23) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%9: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %10 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %11 = "simt_step.if"(%10) ({
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %20 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %20 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb2(%12: i32):  // no predecessors
        %c2_i32_6 = arith.constant 2 : i32
        %13 = arith.remsi %arg3, %c2_i32_6 : i32
        %14 = simt_step.lane_id
        %15 = arith.index_cast %14 : index to i32
        %16 = "simt_step.switch"(%13, %15) ({
        ^bb0(%arg5: i32):
          %true_8 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %20 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %true_9 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %23 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %18 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) : (i32) -> ()
    }, {
      %c2_i32 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %arg0, %c1_i32 : i32
      %8 = "simt_step.switch"(%6, %7) ({
      ^bb0(%arg4: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %9 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %10 = "simt_step.if"(%9) ({
          %true_6 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %17 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %17 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%16) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%10) {fallthrough = false} : (i32) -> ()
      ^bb1(%11: i32):  // no predecessors
        %true_3 = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %13 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
      ^bb2(%14: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_6 = arith.constant 1 : i32
          %17 = arith.addi %16, %c1_i32_6 : i32
          %18 = arith.cmpi slt, %arg6, %17 : i32
          "simt_step.condition"(%18, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_6 = arith.constant true
          %16 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32 = arith.constant 4 : i32
          %17 = arith.muli %arg6, %c4_i32 : i32
          %18 = arith.addi %c160_i32, %17 : i32
          %19 = arith.addi %18, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_7 = arith.constant 1 : i32
          %20 = arith.addi %arg6, %c1_i32_7 : i32
          "simt_step.break"(%16, %20) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%8) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0, %3 : i32
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
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %26 = arith.cmpi slt, %arg3, %c2_i32 : i32
        "simt_step.condition"(%26, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %26) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %7, %c0_i32_1 : i32
    %9 = "simt_step.if"(%8) ({
      %c12_i32 = arith.constant 12 : i32
      %25 = arith.addi %c12_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_6 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_6 : i32
      %28 = "simt_step.if"(%27) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg2: i32, %arg3: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %32 = arith.muli %arg3, %c4_i32_11 : i32
          %33 = arith.addi %32, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %34 = arith.addi %c16_i32, %33 : i32
          %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %36 = arith.cmpi ne, %35, %c0_i32_12 : i32
          "simt_step.condition"(%36, %arg2, %arg3) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg2: i32, %arg3: i32):
          %32 = arith.addi %arg2, %arg3 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %arg3, %c1_i32 : i32
          %true_11 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %34 = arith.muli %arg3, %c4_i32_12 : i32
          %35 = arith.addi %c176_i32, %34 : i32
          %36 = arith.addi %35, %0 : i32
          %true_13 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%32, %33) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) : (i32) -> ()
      }, {
        %c36_i32 = arith.constant 36 : i32
        %31 = arith.addi %c36_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %32, %c0_i32_9 : i32
        %34 = "simt_step.if"(%33) ({
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) : (i32) -> ()
        }, {
          %37 = simt_step.subgroup_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) : (i32) -> ()
        }) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %35 = arith.addi %c192_i32, %0 : i32
        %true_10 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32_7 = arith.constant 208 : i32
      %29 = arith.addi %c208_i32_7, %0 : i32
      %true_8 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) : (i32) -> ()
    }, {
      %c40_i32 = arith.constant 40 : i32
      %25 = arith.addi %c40_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c3_i32 = arith.constant 3 : i32
      %27 = "simt_step.switch"(%26, %c3_i32) ({
      ^bb0(%arg2: i32):
        %c44_i32 = arith.constant 44 : i32
        %28 = arith.addi %c44_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_6 : i32
        %31 = "simt_step.if"(%30) ({
          %c4_i32_14 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_14) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %32 = arith.addi %c224_i32, %0 : i32
        %true_7 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = true} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_14 : i32
          %41 = arith.addi %40, %0 : i32
          %c48_i32 = arith.constant 48 : i32
          %42 = arith.addi %c48_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_15 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_15 : i32
          %43 = arith.addi %c240_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_16 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_14 : i32
          %41 = arith.addi %40, %0 : i32
          %c68_i32 = arith.constant 68 : i32
          %42 = arith.addi %c68_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_15 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_15 : i32
          %43 = arith.addi %c256_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_16 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %38 = arith.addi %c272_i32, %0 : i32
        %true_13 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%27) : (i32) -> ()
    }) : (i1) -> i32
    %c288_i32 = arith.constant 288 : i32
    %10 = arith.addi %c288_i32, %0 : i32
    %true = arith.constant true
    %11 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %10, %11) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c88_i32 = arith.constant 88 : i32
    %12 = arith.addi %c88_i32, %0 : i32
    %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
    %14 = simt_step.subgroup_id
    %15 = arith.index_cast %14 : index to i32
    %16 = "simt_step.switch"(%13, %15) ({
    ^bb0(%arg2: i32):
      %c0_i32_6 = arith.constant 0 : i32
      %25 = arith.addi %0, %c0_i32_6 : i32
      %true_7 = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %26 = arith.addi %c304_i32, %0 : i32
      %true_8 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
    ^bb1(%28: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %29 = arith.addi %c92_i32, %0 : i32
      %30 = "simt_step.buffer.load"(%arg1, %29) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_9 = arith.constant 0 : i32
      %31 = arith.cmpi ne, %30, %c0_i32_9 : i32
      %32 = "simt_step.if"(%31) ({
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %53:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %54 = arith.muli %arg4, %c4_i32_21 : i32
          %55 = arith.addi %54, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %56 = arith.addi %c96_i32, %55 : i32
          %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %58 = arith.cmpi ne, %57, %c0_i32_22 : i32
          "simt_step.condition"(%58, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %54 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %55 = arith.addi %arg4, %c1_i32 : i32
          %true_21 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %56 = arith.muli %arg4, %c4_i32_22 : i32
          %57 = arith.addi %c320_i32, %56 : i32
          %58 = arith.addi %57, %0 : i32
          %true_23 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54, %55) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%53#0) : (i32) -> ()
      }, {
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %53:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %54 = arith.muli %arg4, %c4_i32_21 : i32
          %55 = arith.addi %54, %0 : i32
          %c116_i32 = arith.constant 116 : i32
          %56 = arith.addi %c116_i32, %55 : i32
          %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %58 = arith.cmpi ne, %57, %c0_i32_22 : i32
          "simt_step.condition"(%58, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %54 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %55 = arith.addi %arg4, %c1_i32 : i32
          %true_21 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %56 = arith.muli %arg4, %c4_i32_22 : i32
          %57 = arith.addi %c336_i32, %56 : i32
          %58 = arith.addi %57, %0 : i32
          %true_23 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54, %55) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%53#0) : (i32) -> ()
      }) : (i1) -> i32
      %c352_i32 = arith.constant 352 : i32
      %33 = arith.addi %c352_i32, %0 : i32
      %true_10 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
    ^bb2(%35: i32):  // no predecessors
      %c136_i32 = arith.constant 136 : i32
      %36 = arith.addi %c136_i32, %0 : i32
      %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_11 = arith.constant 0 : i32
      %38 = arith.cmpi ne, %37, %c0_i32_11 : i32
      %39 = "simt_step.if"(%38) ({
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %53:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %54 = arith.muli %arg4, %c4_i32_21 : i32
          %55 = arith.addi %54, %0 : i32
          %c140_i32 = arith.constant 140 : i32
          %56 = arith.addi %c140_i32, %55 : i32
          %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %58 = arith.cmpi ne, %57, %c0_i32_22 : i32
          "simt_step.condition"(%58, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %54 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %55 = arith.addi %arg4, %c1_i32 : i32
          %true_21 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %56 = arith.muli %arg4, %c4_i32_22 : i32
          %57 = arith.addi %c368_i32, %56 : i32
          %58 = arith.addi %57, %0 : i32
          %true_23 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54, %55) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%53#0) : (i32) -> ()
      }, {
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %53:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %54 = arith.muli %arg4, %c4_i32_21 : i32
          %55 = arith.addi %54, %0 : i32
          %c160_i32 = arith.constant 160 : i32
          %56 = arith.addi %c160_i32, %55 : i32
          %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %58 = arith.cmpi ne, %57, %c0_i32_22 : i32
          "simt_step.condition"(%58, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %54 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %55 = arith.addi %arg4, %c1_i32 : i32
          %true_21 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %56 = arith.muli %arg4, %c4_i32_22 : i32
          %57 = arith.addi %c384_i32, %56 : i32
          %58 = arith.addi %57, %0 : i32
          %true_23 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%54, %55) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%53#0) : (i32) -> ()
      }) : (i1) -> i32
      %c400_i32 = arith.constant 400 : i32
      %40 = arith.addi %c400_i32, %0 : i32
      %true_12 = arith.constant true
      %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_13 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %42 = arith.addi %c416_i32, %0 : i32
      %true_14 = arith.constant true
      %43 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
    ^bb3(%44: i32):  // no predecessors
      %c180_i32 = arith.constant 180 : i32
      %45 = arith.addi %c180_i32, %0 : i32
      %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_15 = arith.constant 0 : i32
      %47 = arith.cmpi ne, %46, %c0_i32_15 : i32
      %48 = "simt_step.if"(%47) ({
        %c0_i32_19 = arith.constant 0 : i32
        %c0_i32_20 = arith.constant 0 : i32
        %53:2 = "simt_step.loop"(%c0_i32_19, %c0_i32_20) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %54 = arith.muli %arg4, %c4_i32_21 : i32
          %55 = arith.addi %54, %0 : i32
          %c184_i32 = arith.constant 184 : i32
          %56 = arith.addi %c184_i32, %55 : i32
          %57 = "simt_step.buffer.load"(%arg1, %56) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %58 = arith.cmpi ne, %57, %c0_i32_22 : i32
          "simt_step.condition"(%58, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %54 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %55 = arith.addi %arg4, %c1_i32 : i32
          %true_21 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %56 = arith.muli %arg4, %c4_i32_22 : i32
          %57 = arith.addi %c432_i32, %56 : i32
          %58 = arith.addi %57, %0 : i32
          %true_23 = arith.constant true
          %59 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %58, %59) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%54, %55) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%53#0) : (i32) -> ()
      }, {
        %c204_i32 = arith.constant 204 : i32
        %53 = arith.addi %c204_i32, %0 : i32
        %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_19 = arith.constant 0 : i32
        %55 = arith.cmpi ne, %54, %c0_i32_19 : i32
        %56 = "simt_step.if"(%55) ({
          %59 = simt_step.subgroup_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) : (i32) -> ()
        }, {
          %59 = simt_step.subgroup_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %57 = arith.addi %c448_i32, %0 : i32
        %true_20 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) : (i32) -> ()
      }) : (i1) -> i32
      %c464_i32 = arith.constant 464 : i32
      %49 = arith.addi %c464_i32, %0 : i32
      %true_16 = arith.constant true
      %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_17 = arith.constant true
      %c480_i32 = arith.constant 480 : i32
      %51 = arith.addi %c480_i32, %0 : i32
      %true_18 = arith.constant true
      %52 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_2 = arith.constant true
    %c496_i32 = arith.constant 496 : i32
    %17 = arith.addi %c496_i32, %0 : i32
    %true_3 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c208_i32 = arith.constant 208 : i32
    %19 = arith.addi %c208_i32, %0 : i32
    %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
    %22 = "simt_step.if"(%21) ({
      %c0_i32_6 = arith.constant 0 : i32
      %c0_i32_7 = arith.constant 0 : i32
      %25:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_8 = arith.constant 4 : i32
        %26 = arith.muli %arg3, %c4_i32_8 : i32
        %27 = arith.addi %26, %0 : i32
        %c212_i32 = arith.constant 212 : i32
        %28 = arith.addi %c212_i32, %27 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_9 : i32
        "simt_step.condition"(%30, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %26 = arith.addi %arg2, %0 : i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg3, %c1_i32 : i32
        %true_8 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %28 = arith.muli %arg3, %c4_i32_9 : i32
        %29 = arith.addi %c512_i32, %28 : i32
        %30 = arith.addi %29, %0 : i32
        %true_10 = arith.constant true
        %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%25#0) : (i32) -> ()
    }, {
      %25 = simt_step.lane_id
      %26 = arith.index_cast %25 : index to i32
      "simt_step.yield"(%26) : (i32) -> ()
    }) : (i1) -> i32
    %c528_i32 = arith.constant 528 : i32
    %23 = arith.addi %c528_i32, %0 : i32
    %true_5 = arith.constant true
    %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

