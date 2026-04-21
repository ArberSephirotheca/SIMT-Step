module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = arith.addi %arg0, %c2_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %4 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%3) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c2_i32_0 = arith.constant 2 : i32
      %6 = arith.remsi %arg3, %c2_i32_0 : i32
      %c1_i32 = arith.constant 1 : i32
      %7 = "simt_step.switch"(%6, %c1_i32) ({
      ^bb0(%arg5: i32):
        %c2_i32_3 = arith.constant 2 : i32
        %14 = arith.remsi %arg3, %c2_i32_3 : i32
        %c3_i32_4 = arith.constant 3 : i32
        %15 = arith.addi %arg0, %c3_i32_4 : i32
        %16 = "simt_step.switch"(%14, %15) ({
        ^bb0(%arg6: i32):
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %23 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        ^bb1(%24: i32):  // no predecessors
          %true_9 = arith.constant true
          %25 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %26 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25) {fallthrough = true} : (i32) -> ()
        ^bb2(%27: i32):  // no predecessors
          %true_10 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %29 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      ^bb1(%17: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %18 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %19 = "simt_step.if"(%18) ({
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %23 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %23 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb2(%20: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %21:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %22 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32_8 = arith.constant 1 : i32
          %23 = arith.addi %22, %c1_i32_8 : i32
          %24 = arith.cmpi slt, %arg7, %23 : i32
          "simt_step.condition"(%24, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.muli %arg7, %c4_i32 : i32
          %24 = arith.addi %c96_i32, %23 : i32
          %25 = arith.addi %24, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_9 = arith.constant 1 : i32
          %26 = arith.addi %arg7, %c1_i32_9 : i32
          "simt_step.yield"(%22, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%21#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    ^bb2(%8: i32):  // no predecessors
      %true_1 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %10 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %10, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb3(%11: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %13 = "simt_step.if"(%12) ({
        %c4_i32 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32 : i32
        %15 = "simt_step.switch"(%14, %arg0) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %18 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %19 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %19, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
        ^bb1(%20: i32):  // no predecessors
          %true_5 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %22 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb2(%23: i32):  // no predecessors
          %true_6 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %25 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb3(%26: i32):  // no predecessors
          %true_7 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %28 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_3 = arith.constant true
        %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %17 = arith.addi %c192_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %17, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%15) : (i32) -> ()
      }, {
        %true_3 = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %15 = arith.addi %c208_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
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
      %16 = arith.addi %c12_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = "simt_step.switch"(%17, %0) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %34 = arith.addi %c16_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_7 : i32
        %37 = "simt_step.if"(%36) ({
          %c0_i32_13 = arith.constant 0 : i32
          %49 = arith.addi %0, %c0_i32_13 : i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          "simt_step.yield"(%50) : (i32) -> ()
        }) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %38 = arith.addi %c224_i32, %0 : i32
        %true_8 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_9 = arith.constant true
        %c240_i32 = arith.constant 240 : i32
        %40 = arith.addi %c240_i32, %0 : i32
        %true_10 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %43 = arith.addi %c20_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_11 : i32
        %46 = "simt_step.if"(%45) ({
          %c2_i32_13 = arith.constant 2 : i32
          %49 = arith.addi %0, %c2_i32_13 : i32
          "simt_step.yield"(%49) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %47 = arith.addi %c256_i32, %0 : i32
        %true_12 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c272_i32 = arith.constant 272 : i32
      %19 = arith.addi %c272_i32, %0 : i32
      %true_2 = arith.constant true
      %20 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %19, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb1(%21: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %22 = arith.addi %c24_i32, %0 : i32
      %23 = "simt_step.buffer.load"(%arg1, %22) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32 = arith.constant 2 : i32
      %24 = arith.addi %0, %c2_i32 : i32
      %25 = "simt_step.switch"(%23, %24) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_15 : i32
          %47 = arith.addi %46, %0 : i32
          %c28_i32 = arith.constant 28 : i32
          %48 = arith.addi %c28_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_16 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_16 : i32
          %49 = arith.addi %c288_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_17 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.continue"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%35: i32):  // no predecessors
        %c48_i32 = arith.constant 48 : i32
        %36 = arith.addi %c48_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %38 = arith.cmpi ne, %37, %c0_i32_9 : i32
        %39 = "simt_step.if"(%38) ({
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %40 = arith.addi %c304_i32, %0 : i32
        %true_10 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c320_i32 = arith.constant 320 : i32
        %42 = arith.addi %c320_i32, %0 : i32
        %true_12 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb2(%44: i32):  // no predecessors
        %c0_i32_13 = arith.constant 0 : i32
        %c0_i32_14 = arith.constant 0 : i32
        %45:2 = "simt_step.loop"(%c0_i32_13, %c0_i32_14) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_15 : i32
          %47 = arith.addi %46, %0 : i32
          %c52_i32 = arith.constant 52 : i32
          %48 = arith.addi %c52_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_16 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_16 : i32
          %49 = arith.addi %c336_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_17 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%45#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c352_i32 = arith.constant 352 : i32
      %26 = arith.addi %c352_i32, %0 : i32
      %true_4 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c368_i32 = arith.constant 368 : i32
      %28 = arith.addi %c368_i32, %0 : i32
      %true_6 = arith.constant true
      %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    ^bb2(%30: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %31 = arith.addi %c72_i32, %0 : i32
      %32 = "simt_step.buffer.load"(%arg1, %31) : (!simt_step.resource<Global, i32>, i32) -> i32
      %33 = "simt_step.switch"(%32, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_15 : i32
          %47 = arith.addi %46, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %48 = arith.addi %c76_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_16 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_16 : i32
          %49 = arith.addi %c384_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_17 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %35 = arith.addi %c400_i32, %0 : i32
        %true_10 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%37: i32):  // no predecessors
        %c0_i32_11 = arith.constant 0 : i32
        %c0_i32_12 = arith.constant 0 : i32
        %38:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_15 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_15 : i32
          %47 = arith.addi %46, %0 : i32
          %c96_i32 = arith.constant 96 : i32
          %48 = arith.addi %c96_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_16 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_16 : i32
          "simt_step.condition"(%50, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %46 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg5, %c1_i32 : i32
          %true_15 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_16 = arith.constant 4 : i32
          %48 = arith.muli %arg5, %c4_i32_16 : i32
          %49 = arith.addi %c416_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_17 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%38#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%39: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %40 = arith.addi %c116_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %42 = arith.cmpi ne, %41, %c0_i32_13 : i32
        %43 = "simt_step.if"(%42) ({
          %c0_i32_15 = arith.constant 0 : i32
          %46 = arith.addi %0, %c0_i32_15 : i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %c2_i32_15 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32_15) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %44 = arith.addi %c432_i32, %0 : i32
        %true_14 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
    %c120_i32 = arith.constant 120 : i32
    %10 = arith.addi %c120_i32, %0 : i32
    %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_0 = arith.constant 0 : i32
    %12 = arith.cmpi ne, %11, %c0_i32_0 : i32
    %13 = "simt_step.if"(%12) ({
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %16:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg2: i32, %arg3: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %17 = arith.muli %arg3, %c4_i32_3 : i32
        %18 = arith.addi %17, %0 : i32
        %c124_i32 = arith.constant 124 : i32
        %19 = arith.addi %c124_i32, %18 : i32
        %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %21 = arith.cmpi ne, %20, %c0_i32_4 : i32
        "simt_step.condition"(%21, %arg2, %arg3) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg2: i32, %arg3: i32):
        %17 = simt_step.subgroup_id
        %18 = arith.index_cast %17 : index to i32
        %19 = arith.addi %arg2, %18 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = arith.addi %arg3, %c1_i32 : i32
        %true_3 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %c4_i32_4 = arith.constant 4 : i32
        %21 = arith.muli %arg3, %c4_i32_4 : i32
        %22 = arith.addi %c448_i32, %21 : i32
        %23 = arith.addi %22, %0 : i32
        %true_5 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19, %20) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%16#0) : (i32) -> ()
    }, {
      %c144_i32 = arith.constant 144 : i32
      %16 = arith.addi %c144_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %18 = simt_step.subgroup_id
      %19 = arith.index_cast %18 : index to i32
      %20 = "simt_step.switch"(%17, %19) ({
      ^bb0(%arg2: i32):
        %c148_i32 = arith.constant 148 : i32
        %21 = arith.addi %c148_i32, %0 : i32
        %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_1 = arith.constant 0 : i32
        %23 = "simt_step.switch"(%22, %c0_i32_1) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          %31 = arith.addi %0, %c2_i32 : i32
          %true_4 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %32 = arith.addi %c464_i32, %0 : i32
          %true_5 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %35 = simt_step.subgroup_id
          %36 = arith.index_cast %35 : index to i32
          %true_6 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %37 = arith.addi %c480_i32, %0 : i32
          %true_7 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = true} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %40 = simt_step.subgroup_id
          %41 = arith.index_cast %40 : index to i32
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_2 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %24 = arith.addi %c496_i32, %0 : i32
        %true_3 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c152_i32 = arith.constant 152 : i32
        %27 = arith.addi %c152_i32, %0 : i32
        %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %29 = arith.addi %0, %c3_i32 : i32
        %30 = "simt_step.switch"(%28, %29) ({
        ^bb0(%arg3: i32):
          %31 = simt_step.lane_id
          %32 = arith.index_cast %31 : index to i32
          %true_4 = arith.constant true
          %c512_i32 = arith.constant 512 : i32
          %33 = arith.addi %c512_i32, %0 : i32
          %true_5 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %37 = simt_step.lane_id
          %38 = arith.index_cast %37 : index to i32
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%20) : (i32) -> ()
    }) : (i1) -> i32
    %c528_i32 = arith.constant 528 : i32
    %14 = arith.addi %c528_i32, %0 : i32
    %true = arith.constant true
    %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

