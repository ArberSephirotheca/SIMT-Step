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
      %13 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %14 = arith.addi %13, %c1_i32 : i32
      %15 = arith.cmpi slt, %arg5, %14 : i32
      "simt_step.condition"(%15, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_6 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %c4_i32 = arith.constant 4 : i32
      %14 = arith.muli %arg5, %c4_i32 : i32
      %15 = arith.addi %c16_i32, %14 : i32
      %16 = arith.addi %15, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %16, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%13, %17) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c0_i32_2 = arith.constant 0 : i32
    %3 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
    %4 = arith.select %3, %0, %2#0 : i32
    %c0_i32_3 = arith.constant 0 : i32
    %5 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
    %6 = "simt_step.if"(%5) ({
      %true_6 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c32_i32 = arith.constant 32 : i32
      %14 = arith.addi %c32_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) : (i32) -> ()
    }, {
      %true_6 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c48_i32 = arith.constant 48 : i32
      %14 = arith.addi %c48_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) : (i32) -> ()
    }) : (i1) -> i32
    %c0_i32_4 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
    %8 = arith.select %7, %4, %6 : i32
    %c3_i32 = arith.constant 3 : i32
    %9 = arith.remsi %arg3, %c3_i32 : i32
    %10 = "simt_step.switch"(%9, %arg0) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %13 = arith.remsi %arg3, %c2_i32 : i32
      %14 = simt_step.subgroup_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg5: i32):
        %c2_i32_10 = arith.constant 2 : i32
        %25 = arith.remsi %arg3, %c2_i32_10 : i32
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg6: i32):
          %true_14 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %40 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %true_15 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %43 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %30 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c4_i32 = arith.constant 4 : i32
        %32 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = "simt_step.switch"(%32, %c1_i32) ({
        ^bb0(%arg6: i32):
          %true_14 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %40 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %true_15 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %43 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %true_16 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %46 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %46, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %true_17 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %49 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %49, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_12 = arith.constant true
        %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %35 = arith.addi %c176_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %true_13 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %38 = arith.addi %c192_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %true_6 = arith.constant true
      %18 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %19 = arith.addi %c208_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %true_7 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      %c224_i32 = arith.constant 224 : i32
      %22 = arith.addi %c224_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb3(%23: i32):  // no predecessors
      %c0_i32_8 = arith.constant 0 : i32
      %c0_i32_9 = arith.constant 0 : i32
      %24:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %25 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %26 = arith.addi %25, %c1_i32 : i32
        %27 = arith.cmpi slt, %arg6, %26 : i32
        "simt_step.condition"(%27, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %25 = arith.remsi %arg3, %c4_i32 : i32
        %c4_i32_10 = arith.constant 4 : i32
        %26 = "simt_step.switch"(%25, %c4_i32_10) ({
        ^bb0(%arg7: i32):
          %true_11 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_12 : i32
          %30 = arith.addi %c240_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %34 = arith.muli %arg6, %c4_i32_14 : i32
          %35 = arith.addi %c256_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %true_15 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %39 = arith.muli %arg6, %c4_i32_16 : i32
          %40 = arith.addi %c272_i32, %39 : i32
          %41 = arith.addi %40, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %41, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %true_17 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_18 = arith.constant 4 : i32
          %44 = arith.muli %arg6, %c4_i32_18 : i32
          %45 = arith.addi %c288_i32, %44 : i32
          %46 = arith.addi %45, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %46, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.yield"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c0_i32_5 = arith.constant 0 : i32
    %11 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
    %12 = arith.select %11, %8, %10 : i32
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
      %c4_i32_2 = arith.constant 4 : i32
      %12 = arith.muli %arg3, %c4_i32_2 : i32
      %13 = arith.addi %12, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %14 = arith.addi %c8_i32, %13 : i32
      %15 = "simt_step.buffer.load"(%arg1, %14) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %15, %c0_i32_3 : i32
      "simt_step.condition"(%16, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %12 = arith.addi %arg2, %arg3 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %c4_i32_2 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_2 : i32
      %15 = arith.addi %c304_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_3 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.continue"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %6 = simt_step.subgroup_id
    %7 = arith.index_cast %6 : index to i32
    %c28_i32 = arith.constant 28 : i32
    %8 = arith.addi %c28_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c2_i32 = arith.constant 2 : i32
    %10 = arith.addi %0, %c2_i32 : i32
    %11 = "simt_step.switch"(%9, %10) ({
    ^bb0(%arg2: i32):
      %c32_i32 = arith.constant 32 : i32
      %12 = arith.addi %c32_i32, %0 : i32
      %13 = "simt_step.buffer.load"(%arg1, %12) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %14 = arith.cmpi ne, %13, %c0_i32_2 : i32
      %15 = "simt_step.if"(%14) ({
        %c1_i32 = arith.constant 1 : i32
        %39 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%39) : (i32) -> ()
      }, {
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %40 = arith.muli %arg4, %c4_i32_12 : i32
          %41 = arith.addi %40, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %42 = arith.addi %c36_i32, %41 : i32
          %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %44 = arith.cmpi ne, %43, %c0_i32_13 : i32
          "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %40 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %41 = arith.addi %arg4, %c1_i32 : i32
          %true_12 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %42 = arith.muli %arg4, %c4_i32_13 : i32
          %43 = arith.addi %c320_i32, %42 : i32
          %44 = arith.addi %43, %0 : i32
          %true_14 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%40, %41) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%39#0) : (i32) -> ()
      }) : (i1) -> i32
      %c336_i32 = arith.constant 336 : i32
      %16 = arith.addi %c336_i32, %0 : i32
      %true = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15) {fallthrough = false} : (i32) -> ()
    ^bb1(%18: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %19 = arith.addi %c56_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %63 = arith.muli %arg5, %c4_i32_21 : i32
          %64 = arith.addi %63, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %65 = arith.addi %c60_i32, %64 : i32
          %66 = "simt_step.buffer.load"(%arg1, %65) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_22 = arith.constant 0 : i32
          %67 = arith.cmpi ne, %66, %c0_i32_22 : i32
          "simt_step.condition"(%67, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %63 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %64 = arith.addi %arg5, %c1_i32 : i32
          %true_21 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %c4_i32_22 = arith.constant 4 : i32
          %65 = arith.muli %arg5, %c4_i32_22 : i32
          %66 = arith.addi %c352_i32, %65 : i32
          %67 = arith.addi %66, %0 : i32
          %true_23 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_23) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63, %64) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_12 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %40 = arith.addi %c368_i32, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c80_i32 = arith.constant 80 : i32
        %43 = arith.addi %c80_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_14 = arith.constant 4 : i32
        %45 = "simt_step.switch"(%44, %c4_i32_14) ({
        ^bb0(%arg4: i32):
          %63 = simt_step.lane_id
          %64 = arith.index_cast %63 : index to i32
          %true_21 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %65 = arith.addi %c384_i32, %0 : i32
          %true_22 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%64) {fallthrough = false} : (i32) -> ()
        ^bb1(%67: i32):  // no predecessors
          %68 = simt_step.subgroup_id
          %69 = arith.index_cast %68 : index to i32
          "simt_step.yield"(%69) {fallthrough = false} : (i32) -> ()
        ^bb2(%70: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%71: i32):  // no predecessors
          %c2_i32_23 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_23) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c84_i32 = arith.constant 84 : i32
        %47 = arith.addi %c84_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %49 = simt_step.lane_id
        %50 = arith.index_cast %49 : index to i32
        %51 = "simt_step.switch"(%48, %50) ({
        ^bb0(%arg4: i32):
          %c4_i32_21 = arith.constant 4 : i32
          %63 = arith.addi %0, %c4_i32_21 : i32
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          %c0_i32_22 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_22) {fallthrough = false} : (i32) -> ()
        ^bb2(%65: i32):  // no predecessors
          %c4_i32_23 = arith.constant 4 : i32
          %66 = arith.addi %0, %c4_i32_23 : i32
          %true_24 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %67 = arith.addi %c400_i32, %0 : i32
          %true_25 = arith.constant true
          %68 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %67, %68) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%66) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %52 = arith.addi %c416_i32, %0 : i32
        %true_16 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      ^bb3(%54: i32):  // no predecessors
        %c88_i32 = arith.constant 88 : i32
        %55 = arith.addi %c88_i32, %0 : i32
        %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %57 = arith.cmpi ne, %56, %c0_i32_17 : i32
        %58 = "simt_step.if"(%57) ({
          %63 = simt_step.lane_id
          %64 = arith.index_cast %63 : index to i32
          "simt_step.yield"(%64) : (i32) -> ()
        }, {
          %63 = simt_step.subgroup_id
          %64 = arith.index_cast %63 : index to i32
          "simt_step.yield"(%64) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %59 = arith.addi %c432_i32, %0 : i32
        %true_18 = arith.constant true
        %60 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %61 = arith.addi %c448_i32, %0 : i32
        %true_20 = arith.constant true
        %62 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %22 = arith.addi %c464_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c480_i32 = arith.constant 480 : i32
      %24 = arith.addi %c480_i32, %0 : i32
      %true_6 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb2(%26: i32):  // no predecessors
      %c92_i32 = arith.constant 92 : i32
      %27 = arith.addi %c92_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = simt_step.subgroup_id
      %30 = arith.index_cast %29 : index to i32
      %31 = "simt_step.switch"(%28, %30) ({
      ^bb0(%arg3: i32):
        %c96_i32 = arith.constant 96 : i32
        %39 = arith.addi %c96_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_10 = arith.constant 2 : i32
        %41 = arith.addi %0, %c2_i32_10 : i32
        %42 = "simt_step.switch"(%40, %41) ({
        ^bb0(%arg4: i32):
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb1(%50: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          %51 = arith.addi %0, %c2_i32_15 : i32
          %true_16 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %52 = arith.addi %c496_i32, %0 : i32
          %true_17 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      ^bb1(%43: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_15 : i32
          %49 = arith.addi %48, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %50 = arith.addi %c100_i32, %49 : i32
          %51 = "simt_step.buffer.load"(%arg1, %50) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %52 = arith.cmpi ne, %51, %c0_i32_16 : i32
          "simt_step.condition"(%52, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %48 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %50 = arith.muli %arg5, %c4_i32_16 : i32
          %51 = arith.addi %c512_i32, %50 : i32
          %52 = arith.addi %51, %0 : i32
          %true_17 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48, %49) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_13 = arith.constant true
        %c528_i32 = arith.constant 528 : i32
        %46 = arith.addi %c528_i32, %0 : i32
        %true_14 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb3(%32: i32):  // no predecessors
      %c120_i32 = arith.constant 120 : i32
      %33 = arith.addi %c120_i32, %0 : i32
      %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_7 = arith.constant 0 : i32
      %35 = arith.addi %0, %c0_i32_7 : i32
      %36 = "simt_step.switch"(%34, %35) ({
      ^bb0(%arg3: i32):
        %c0_i32_10 = arith.constant 0 : i32
        %true_11 = arith.constant true
        %c544_i32 = arith.constant 544 : i32
        %39 = arith.addi %c544_i32, %0 : i32
        %true_12 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c0_i32_10) {fallthrough = false} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %true_13 = arith.constant true
        %c560_i32 = arith.constant 560 : i32
        %42 = arith.addi %c560_i32, %0 : i32
        %true_14 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %45 = arith.addi %c124_i32, %0 : i32
        %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_15 = arith.constant 0 : i32
        %47 = arith.cmpi ne, %46, %c0_i32_15 : i32
        %48 = "simt_step.if"(%47) ({
          %53 = simt_step.lane_id
          %54 = arith.index_cast %53 : index to i32
          "simt_step.yield"(%54) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c576_i32 = arith.constant 576 : i32
        %49 = arith.addi %c576_i32, %0 : i32
        %true_16 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%48) {fallthrough = true} : (i32) -> ()
      ^bb3(%51: i32):  // no predecessors
        %c0_i32_17 = arith.constant 0 : i32
        %c0_i32_18 = arith.constant 0 : i32
        %52:2 = "simt_step.loop"(%c0_i32_17, %c0_i32_18) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_19 = arith.constant 4 : i32
          %53 = arith.muli %arg5, %c4_i32_19 : i32
          %54 = arith.addi %53, %0 : i32
          %c128_i32 = arith.constant 128 : i32
          %55 = arith.addi %c128_i32, %54 : i32
          %56 = "simt_step.buffer.load"(%arg1, %55) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_20 = arith.constant 0 : i32
          %57 = arith.cmpi ne, %56, %c0_i32_20 : i32
          "simt_step.condition"(%57, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %53 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %54 = arith.addi %arg5, %c1_i32 : i32
          %true_19 = arith.constant true
          %c592_i32 = arith.constant 592 : i32
          %c4_i32_20 = arith.constant 4 : i32
          %55 = arith.muli %arg5, %c4_i32_20 : i32
          %56 = arith.addi %c592_i32, %55 : i32
          %57 = arith.addi %56, %0 : i32
          %true_21 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%53, %54) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%52#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_8 = arith.constant true
      %c608_i32 = arith.constant 608 : i32
      %37 = arith.addi %c608_i32, %0 : i32
      %true_9 = arith.constant true
      %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

