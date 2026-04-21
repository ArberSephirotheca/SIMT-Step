module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %true = arith.constant true
    %0 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %c0_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %1, %0) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c3_i32 = arith.constant 3 : i32
    %2 = arith.remsi %arg3, %c3_i32 : i32
    %3 = simt_step.lane_id
    %4 = arith.index_cast %3 : index to i32
    %5 = "simt_step.switch"(%2, %4) ({
    ^bb0(%arg4: i32):
      %c2_i32 = arith.constant 2 : i32
      %10 = arith.remsi %arg3, %c2_i32 : i32
      %c4_i32 = arith.constant 4 : i32
      %11 = "simt_step.switch"(%10, %c4_i32) ({
      ^bb0(%arg5: i32):
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c16_i32 = arith.constant 16 : i32
        %25 = arith.addi %c16_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %27:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %33 = arith.remsi %arg3, %c4_i32_11 : i32
          %c1_i32_12 = arith.constant 1 : i32
          %34 = arith.addi %33, %c1_i32_12 : i32
          %35 = arith.cmpi slt, %arg7, %34 : i32
          "simt_step.condition"(%35, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32_12 = arith.constant 4 : i32
          %34 = arith.muli %arg7, %c4_i32_12 : i32
          %35 = arith.addi %c32_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_13 = arith.constant 1 : i32
          %37 = arith.addi %arg7, %c1_i32_13 : i32
          "simt_step.break"(%33, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%27#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c4_i32_10 = arith.constant 4 : i32
        %29 = arith.remsi %arg3, %c4_i32_10 : i32
        %30 = simt_step.subgroup_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg6: i32):
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %34 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %true_12 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %37 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb2(%38: i32):  // no predecessors
          %true_13 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %40 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        ^bb3(%41: i32):  // no predecessors
          %true_14 = arith.constant true
          %42 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %43 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %43, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %true_2 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %14 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb2(%15: i32):  // no predecessors
      %c3_i32_3 = arith.constant 3 : i32
      %16 = arith.remsi %arg3, %c3_i32_3 : i32
      %c1_i32 = arith.constant 1 : i32
      %17 = arith.addi %arg0, %c1_i32 : i32
      %18 = "simt_step.switch"(%16, %17) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %33 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %34 = arith.addi %33, %c1_i32_14 : i32
          %35 = arith.cmpi slt, %arg7, %34 : i32
          "simt_step.condition"(%35, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %34 = arith.muli %arg7, %c4_i32_14 : i32
          %35 = arith.addi %c128_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_15 = arith.constant 1 : i32
          %37 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.continue"(%33, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %27 = "simt_step.if"(%26) ({
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %34 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %34 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %33 = arith.remsi %arg3, %c4_i32_13 : i32
          %c1_i32_14 = arith.constant 1 : i32
          %34 = arith.addi %33, %c1_i32_14 : i32
          %35 = arith.cmpi slt, %arg7, %34 : i32
          "simt_step.condition"(%35, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %c4_i32_14 = arith.constant 4 : i32
          %34 = arith.muli %arg7, %c4_i32_14 : i32
          %35 = arith.addi %c176_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_15 = arith.constant 1 : i32
          %37 = arith.addi %arg7, %c1_i32_15 : i32
          "simt_step.yield"(%33, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%30: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %arg2, %c0_i32_12 : i32
        %32 = "simt_step.if"(%31) ({
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %34 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %true_13 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %34 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    ^bb3(%19: i32):  // no predecessors
      %c2_i32_4 = arith.constant 2 : i32
      %20 = arith.remsi %arg3, %c2_i32_4 : i32
      %c0_i32_5 = arith.constant 0 : i32
      %21 = "simt_step.switch"(%20, %c0_i32_5) ({
      ^bb0(%arg5: i32):
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c224_i32 = arith.constant 224 : i32
        %25 = arith.addi %c224_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %28 = "simt_step.if"(%27) ({
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %30 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %30 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %23 = arith.addi %c272_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_0 = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    %c288_i32 = arith.constant 288 : i32
    %7 = arith.addi %c288_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %8 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %9 = arith.select %8, %0, %5 : i32
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
    %c1_i32 = arith.constant 1 : i32
    %7 = "simt_step.switch"(%6, %c1_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %8 = arith.addi %c12_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %9, %c0_i32_0 : i32
      %11 = "simt_step.if"(%10) ({
        %c16_i32 = arith.constant 16 : i32
        %28 = arith.addi %c16_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_9 : i32
        %31 = "simt_step.if"(%30) ({
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }, {
          %c4_i32_11 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_11) : (i32) -> ()
        }) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %32 = arith.addi %c304_i32, %0 : i32
        %true_10 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %12 = arith.addi %c320_i32, %0 : i32
      %true = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %12, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_1 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %14 = arith.addi %c336_i32, %0 : i32
      %true_2 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb1(%16: i32):  // no predecessors
      %c20_i32 = arith.constant 20 : i32
      %17 = arith.addi %c20_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_3 = arith.constant 4 : i32
      %19 = arith.addi %0, %c4_i32_3 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %c24_i32 = arith.constant 24 : i32
        %28 = arith.addi %c24_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %30 = simt_step.lane_id
        %31 = arith.index_cast %30 : index to i32
        %32 = "simt_step.switch"(%29, %31) ({
        ^bb0(%arg4: i32):
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
        ^bb1(%47: i32):  // no predecessors
          %48 = simt_step.lane_id
          %49 = arith.index_cast %48 : index to i32
          %true_13 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %50 = arith.addi %c352_i32, %0 : i32
          %true_14 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        ^bb2(%52: i32):  // no predecessors
          %c0_i32_15 = arith.constant 0 : i32
          %53 = arith.addi %0, %c0_i32_15 : i32
          %true_16 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %54 = arith.addi %c368_i32, %0 : i32
          %true_17 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb3(%56: i32):  // no predecessors
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %34 = simt_step.lane_id
        %35 = arith.index_cast %34 : index to i32
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %37 = arith.addi %c28_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %39 = arith.cmpi ne, %38, %c0_i32_9 : i32
        %40 = "simt_step.if"(%39) ({
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) : (i32) -> ()
        }, {
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        %c384_i32 = arith.constant 384 : i32
        %41 = arith.addi %c384_i32, %0 : i32
        %true_10 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %43 = arith.addi %c400_i32, %0 : i32
        %true_12 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c416_i32 = arith.constant 416 : i32
      %21 = arith.addi %c416_i32, %0 : i32
      %true_5 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %c1_i32_6 = arith.constant 1 : i32
      %24 = arith.addi %0, %c1_i32_6 : i32
      "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
    ^bb3(%25: i32):  // no predecessors
      %true_7 = arith.constant true
      %c432_i32 = arith.constant 432 : i32
      %26 = arith.addi %c432_i32, %0 : i32
      %true_8 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

