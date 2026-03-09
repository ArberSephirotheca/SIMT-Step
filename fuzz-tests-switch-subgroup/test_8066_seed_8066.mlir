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
      %c4_i32 = arith.constant 4 : i32
      %1 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %2 = arith.addi %arg0, %c1_i32 : i32
      %3 = "simt_step.switch"(%1, %2) ({
      ^bb0(%arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %9:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg7: i32, %arg8: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %34 = arith.remsi %arg3, %c4_i32_15 : i32
          %c1_i32_16 = arith.constant 1 : i32
          %35 = arith.addi %34, %c1_i32_16 : i32
          %36 = arith.cmpi slt, %arg8, %35 : i32
          "simt_step.condition"(%36, %arg7, %arg8) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg7: i32, %arg8: i32):
          %true_15 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %35 = arith.muli %arg8, %c4_i32_17 : i32
          %36 = arith.addi %c0_i32_16, %35 : i32
          %37 = arith.addi %36, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_18 = arith.constant 1 : i32
          %38 = arith.addi %arg8, %c1_i32_18 : i32
          "simt_step.continue"(%34, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%9#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%10: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %11 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32_5 = arith.constant 1 : i32
        %12 = arith.addi %arg0, %c1_i32_5 : i32
        %13 = "simt_step.switch"(%11, %12) ({
        ^bb0(%arg7: i32):
          %true_15 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_16 : i32
          %36 = arith.addi %c16_i32, %35 : i32
          %37 = arith.addi %36, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_17 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_18 : i32
          %41 = arith.addi %c32_i32, %40 : i32
          %42 = arith.addi %41, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %true_19 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_20 : i32
          %46 = arith.addi %c48_i32, %45 : i32
          %47 = arith.addi %46, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %47, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %c4_i32_7 = arith.constant 4 : i32
        %15 = arith.muli %arg5, %c4_i32_7 : i32
        %16 = arith.addi %c64_i32, %15 : i32
        %17 = arith.addi %16, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb2(%18: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %19 = arith.remsi %arg3, %c3_i32 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %20 = arith.addi %arg0, %c0_i32_8 : i32
        %21 = "simt_step.switch"(%19, %20) ({
        ^bb0(%arg7: i32):
          %true_15 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_16 : i32
          %36 = arith.addi %c80_i32, %35 : i32
          %37 = arith.addi %36, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_17 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_18 : i32
          %41 = arith.addi %c96_i32, %40 : i32
          %42 = arith.addi %41, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %true_19 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %45 = arith.muli %arg5, %c4_i32_20 : i32
          %46 = arith.addi %c112_i32, %45 : i32
          %47 = arith.addi %46, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %47, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %23 = arith.muli %arg5, %c4_i32_10 : i32
        %24 = arith.addi %c128_i32, %23 : i32
        %25 = arith.addi %24, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
      ^bb3(%26: i32):  // no predecessors
        %c2_i32_11 = arith.constant 2 : i32
        %27 = arith.remsi %arg3, %c2_i32_11 : i32
        %c2_i32_12 = arith.constant 2 : i32
        %28 = arith.addi %arg0, %c2_i32_12 : i32
        %29 = "simt_step.switch"(%27, %28) ({
        ^bb0(%arg7: i32):
          %true_15 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %35 = arith.muli %arg5, %c4_i32_16 : i32
          %36 = arith.addi %c144_i32, %35 : i32
          %37 = arith.addi %36, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %true_17 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %40 = arith.muli %arg5, %c4_i32_18 : i32
          %41 = arith.addi %c160_i32, %40 : i32
          %42 = arith.addi %41, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %31 = arith.muli %arg5, %c4_i32_14 : i32
        %32 = arith.addi %c176_i32, %31 : i32
        %33 = arith.addi %32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %33, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %c4_i32_1 = arith.constant 4 : i32
      %5 = arith.muli %arg5, %c4_i32_1 : i32
      %6 = arith.addi %c192_i32, %5 : i32
      %7 = arith.addi %6, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32_2 = arith.constant 1 : i32
      %8 = arith.addi %arg5, %c1_i32_2 : i32
      "simt_step.yield"(%3, %8) : (i32, i32) -> ()
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
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c1_i32 = arith.constant 1 : i32
        %15 = arith.cmpi slt, %arg3, %c1_i32 : i32
        "simt_step.condition"(%15, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %c2_i32 = arith.constant 2 : i32
        %15 = arith.remsi %0, %c2_i32 : i32
        %16 = simt_step.lane_id
        %17 = arith.index_cast %16 : index to i32
        %18 = "simt_step.switch"(%15, %17) ({
        ^bb0(%arg4: i32):
          %c0_i32_6 = arith.constant 0 : i32
          %20 = arith.addi %arg4, %c0_i32_6 : i32
          "simt_step.yield"(%20) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %c4_i32_7 = arith.constant 4 : i32
          %22 = arith.addi %21, %c4_i32_7 : i32
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        func.call @helper0(%0, %arg0, %2, %4) : (i32, !simt_step.resource<Global, i32>, i32, i32) -> ()
        %c1_i32 = arith.constant 1 : i32
        %19 = arith.addi %arg3, %c1_i32 : i32
        "simt_step.yield"(%arg2, %19) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"() : () -> ()
    }, {
      "simt_step.yield"() : () -> ()
    }) : (i1) -> ()
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_4 = arith.constant 0 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %14:2 = "simt_step.loop"(%c0_i32_4, %c0_i32_5) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_12 : i32
        %23 = arith.addi %22, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %24 = arith.addi %c12_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_13 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c208_i32 = arith.constant 208 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_13 : i32
        %25 = arith.addi %c208_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_14 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_6 = arith.constant true
      %c224_i32 = arith.constant 224 : i32
      %15 = arith.addi %c224_i32, %0 : i32
      %true_7 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %18:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %22 = arith.muli %arg4, %c4_i32_12 : i32
        %23 = arith.addi %22, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %24 = arith.addi %c32_i32, %23 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_13 : i32
        "simt_step.condition"(%26, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %22 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %23 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_13 : i32
        %25 = arith.addi %c240_i32, %24 : i32
        %26 = arith.addi %25, %0 : i32
        %true_14 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%22, %23) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%18#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %true_10 = arith.constant true
      %c256_i32 = arith.constant 256 : i32
      %20 = arith.addi %c256_i32, %0 : i32
      %true_11 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c272_i32 = arith.constant 272 : i32
    %11 = arith.addi %c272_i32, %0 : i32
    %true_1 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_2 = arith.constant 0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %13:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_4 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_4 : i32
      %15 = arith.addi %14, %0 : i32
      %c52_i32 = arith.constant 52 : i32
      %16 = arith.addi %c52_i32, %15 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_5 : i32
      "simt_step.condition"(%18, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %14 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %15 = arith.addi %arg3, %c1_i32 : i32
      %true_4 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %c4_i32_5 = arith.constant 4 : i32
      %16 = arith.muli %arg3, %c4_i32_5 : i32
      %17 = arith.addi %c288_i32, %16 : i32
      %18 = arith.addi %17, %0 : i32
      %true_6 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%14, %15) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

