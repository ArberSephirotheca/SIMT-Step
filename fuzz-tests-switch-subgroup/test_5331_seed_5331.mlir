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
      %c2_i32 = arith.constant 2 : i32
      %1 = arith.remsi %arg3, %c2_i32 : i32
      %2 = simt_step.lane_id
      %3 = arith.index_cast %2 : index to i32
      %4 = "simt_step.switch"(%1, %3) ({
      ^bb0(%arg6: i32):
        %c3_i32 = arith.constant 3 : i32
        %10 = arith.remsi %arg3, %c3_i32 : i32
        %c1_i32_1 = arith.constant 1 : i32
        %11 = "simt_step.switch"(%10, %c1_i32_1) ({
        ^bb0(%arg7: i32):
          %true_6 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c0_i32_7 = arith.constant 0 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_8 : i32
          %24 = arith.addi %c0_i32_7, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = true} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %true_9 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_10 : i32
          %29 = arith.addi %c16_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = true} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_11 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %33 = arith.muli %arg5, %c4_i32_12 : i32
          %34 = arith.addi %c32_i32, %33 : i32
          %35 = arith.addi %34, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
      ^bb1(%12: i32):  // no predecessors
        %c0_i32_2 = arith.constant 0 : i32
        %13 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
        %14 = "simt_step.if"(%13) ({
          %true_6 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_7 : i32
          %24 = arith.addi %c48_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_7 : i32
          %24 = arith.addi %c64_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
      ^bb2(%15: i32):  // no predecessors
        %c3_i32_3 = arith.constant 3 : i32
        %16 = arith.remsi %arg3, %c3_i32_3 : i32
        %17 = "simt_step.switch"(%16, %arg0) ({
        ^bb0(%arg7: i32):
          %true_6 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %23 = arith.muli %arg5, %c4_i32_7 : i32
          %24 = arith.addi %c80_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %true_8 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %28 = arith.muli %arg5, %c4_i32_9 : i32
          %29 = arith.addi %c96_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%31: i32):  // no predecessors
          %true_10 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_11 = arith.constant 4 : i32
          %33 = arith.muli %arg5, %c4_i32_11 : i32
          %34 = arith.addi %c112_i32, %33 : i32
          %35 = arith.addi %34, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_4 = arith.constant true
        %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_5 = arith.constant 4 : i32
        %19 = arith.muli %arg5, %c4_i32_5 : i32
        %20 = arith.addi %c128_i32, %19 : i32
        %21 = arith.addi %20, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %21, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c144_i32 = arith.constant 144 : i32
      %c4_i32 = arith.constant 4 : i32
      %6 = arith.muli %arg5, %c4_i32 : i32
      %7 = arith.addi %c144_i32, %6 : i32
      %8 = arith.addi %7, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %8, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %9 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%4, %9) : (i32, i32) -> ()
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
      %c8_i32 = arith.constant 8 : i32
      %11 = arith.addi %c8_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %13 = arith.cmpi ne, %12, %c0_i32_1 : i32
      "simt_step.if"(%13) ({
        %c3_i32 = arith.constant 3 : i32
        %14 = arith.remsi %0, %c3_i32 : i32
        %15 = simt_step.lane_id
        %16 = arith.index_cast %15 : index to i32
        %17 = "simt_step.switch"(%14, %16) ({
        ^bb0(%arg2: i32):
          %c2_i32 = arith.constant 2 : i32
          %18 = arith.addi %arg2, %c2_i32 : i32
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%19: i32):  // no predecessors
          %c0_i32_2 = arith.constant 0 : i32
          %20 = arith.addi %19, %c0_i32_2 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb2(%21: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %22 = arith.addi %21, %c1_i32 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
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
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c16_i32 = arith.constant 16 : i32
      %11 = arith.addi %c16_i32, %0 : i32
      %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
      %13 = simt_step.subgroup_id
      %14 = arith.index_cast %13 : index to i32
      %15 = "simt_step.switch"(%12, %14) ({
      ^bb0(%arg3: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_17 : i32
          %39 = arith.addi %38, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %40 = arith.addi %c20_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_18 : i32
          "simt_step.condition"(%42, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %38 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_18 : i32
          %41 = arith.addi %c160_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_19 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c176_i32 = arith.constant 176 : i32
        %32 = arith.addi %c176_i32, %0 : i32
        %true_14 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%34: i32):  // no predecessors
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_17 = arith.constant 4 : i32
          %38 = arith.muli %arg5, %c4_i32_17 : i32
          %39 = arith.addi %38, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %40 = arith.addi %c40_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_18 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_18 : i32
          "simt_step.condition"(%42, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %38 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg5, %c1_i32 : i32
          %true_17 = arith.constant true
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_18 : i32
          %41 = arith.addi %c192_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_19 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb3(%37: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c208_i32 = arith.constant 208 : i32
      %16 = arith.addi %c208_i32, %0 : i32
      %true_1 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %19:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_11 = arith.constant 4 : i32
        %31 = arith.muli %arg4, %c4_i32_11 : i32
        %32 = arith.addi %31, %0 : i32
        %c60_i32 = arith.constant 60 : i32
        %33 = arith.addi %c60_i32, %32 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_12 : i32
        "simt_step.condition"(%35, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %38 = arith.muli %arg6, %c4_i32_16 : i32
          %39 = arith.addi %38, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %40 = arith.addi %c80_i32, %39 : i32
          %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %42 = arith.cmpi ne, %41, %c0_i32_17 : i32
          "simt_step.condition"(%42, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %38 = arith.addi %arg5, %arg6 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %39 = arith.addi %arg6, %c1_i32_16 : i32
          %true_17 = arith.constant true
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %40 = arith.muli %arg6, %c4_i32_18 : i32
          %41 = arith.addi %c224_i32, %40 : i32
          %42 = arith.addi %41, %0 : i32
          %true_19 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%38, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %32 = arith.addi %arg3, %31#0 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        %true_13 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_14 : i32
        %35 = arith.addi %c240_i32, %34 : i32
        %36 = arith.addi %35, %0 : i32
        %true_15 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_4 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %20 = arith.addi %c256_i32, %0 : i32
      %true_5 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c4_i32_6 = arith.constant 4 : i32
      "simt_step.yield"(%c4_i32_6) {fallthrough = false} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c100_i32 = arith.constant 100 : i32
      %24 = arith.addi %c100_i32, %0 : i32
      %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %26 = "simt_step.switch"(%25, %c2_i32) ({
      ^bb0(%arg3: i32):
        %c104_i32 = arith.constant 104 : i32
        %31 = arith.addi %c104_i32, %0 : i32
        %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
        %33 = "simt_step.switch"(%32, %0) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %64 = arith.addi %0, %c3_i32 : i32
          %true_23 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %65 = arith.addi %c272_i32, %0 : i32
          %true_24 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        ^bb1(%67: i32):  // no predecessors
          %c4_i32_25 = arith.constant 4 : i32
          %68 = arith.addi %0, %c4_i32_25 : i32
          %true_26 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %69 = arith.addi %c288_i32, %0 : i32
          %true_27 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb2(%71: i32):  // no predecessors
          %72 = simt_step.lane_id
          %73 = arith.index_cast %72 : index to i32
          "simt_step.yield"(%73) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c304_i32 = arith.constant 304 : i32
        %34 = arith.addi %c304_i32, %0 : i32
        %true_12 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_13 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %36 = arith.addi %c320_i32, %0 : i32
        %true_14 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c108_i32 = arith.constant 108 : i32
        %39 = arith.addi %c108_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %41 = simt_step.subgroup_id
        %42 = arith.index_cast %41 : index to i32
        %43 = "simt_step.switch"(%40, %42) ({
        ^bb0(%arg4: i32):
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb1(%66: i32):  // no predecessors
          %67 = simt_step.subgroup_id
          %68 = arith.index_cast %67 : index to i32
          %true_23 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %69 = arith.addi %c336_i32, %0 : i32
          %true_24 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%68) {fallthrough = false} : (i32) -> ()
        ^bb2(%71: i32):  // no predecessors
          %c4_i32_25 = arith.constant 4 : i32
          %true_26 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %72 = arith.addi %c352_i32, %0 : i32
          %true_27 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_27) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_25) {fallthrough = false} : (i32) -> ()
        ^bb3(%74: i32):  // no predecessors
          %75 = simt_step.subgroup_id
          %76 = arith.index_cast %75 : index to i32
          %true_28 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %77 = arith.addi %c368_i32, %0 : i32
          %true_29 = arith.constant true
          %78 = "simt_step.wave_count_bits"(%true_29) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %77, %78) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%76) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c112_i32 = arith.constant 112 : i32
        %45 = arith.addi %c112_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %47 = simt_step.subgroup_id
        %48 = arith.index_cast %47 : index to i32
        %49 = "simt_step.switch"(%46, %48) ({
        ^bb0(%arg4: i32):
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          %true_23 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %66 = arith.addi %c384_i32, %0 : i32
          %true_24 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        ^bb1(%68: i32):  // no predecessors
          %true_25 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %69 = arith.addi %c400_i32, %0 : i32
          %true_26 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb2(%71: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          %72 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%72) {fallthrough = true} : (i32) -> ()
        ^bb3(%73: i32):  // no predecessors
          %c2_i32_27 = arith.constant 2 : i32
          %true_28 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %74 = arith.addi %c416_i32, %0 : i32
          %true_29 = arith.constant true
          %75 = "simt_step.wave_count_bits"(%true_29) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %74, %75) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %50 = arith.addi %c432_i32, %0 : i32
        %true_16 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_17 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %52 = arith.addi %c448_i32, %0 : i32
        %true_18 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      ^bb3(%54: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %55 = arith.addi %c116_i32, %0 : i32
        %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
        %57 = simt_step.lane_id
        %58 = arith.index_cast %57 : index to i32
        %59 = "simt_step.switch"(%56, %58) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %64 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        ^bb1(%65: i32):  // no predecessors
          %true_23 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %66 = arith.addi %c464_i32, %0 : i32
          %true_24 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%68: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_25 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %69 = arith.addi %c480_i32, %0 : i32
          %true_26 = arith.constant true
          %70 = "simt_step.wave_count_bits"(%true_26) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %69, %70) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%71: i32):  // no predecessors
          %c2_i32_27 = arith.constant 2 : i32
          %true_28 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %72 = arith.addi %c496_i32, %0 : i32
          %true_29 = arith.constant true
          %73 = "simt_step.wave_count_bits"(%true_29) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %72, %73) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_19 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %60 = arith.addi %c512_i32, %0 : i32
        %true_20 = arith.constant true
        %61 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %60, %61) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_21 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %62 = arith.addi %c528_i32, %0 : i32
        %true_22 = arith.constant true
        %63 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%59) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c544_i32 = arith.constant 544 : i32
      %27 = arith.addi %c544_i32, %0 : i32
      %true_8 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_9 = arith.constant true
      %c560_i32 = arith.constant 560 : i32
      %29 = arith.addi %c560_i32, %0 : i32
      %true_10 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

