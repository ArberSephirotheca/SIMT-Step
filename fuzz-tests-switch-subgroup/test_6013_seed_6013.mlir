module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c4_i32 = arith.constant 4 : i32
    %0 = arith.remsi %arg3, %c4_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %c0_i32 = arith.constant 0 : i32
      %4 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %5 = "simt_step.if"(%4) ({
        %c3_i32_2 = arith.constant 3 : i32
        %17 = arith.remsi %arg3, %c3_i32_2 : i32
        %18 = simt_step.subgroup_id
        %19 = arith.index_cast %18 : index to i32
        %20 = "simt_step.switch"(%17, %19) ({
        ^bb0(%arg5: i32):
          %true_3 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c0_i32_4 = arith.constant 0 : i32
          %24 = arith.addi %c0_i32_4, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_5 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %27 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_6 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %30 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %true_7 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %33 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %22 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) : (i32) -> ()
      }, {
        %c3_i32_2 = arith.constant 3 : i32
        %17 = arith.remsi %arg3, %c3_i32_2 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %18 = "simt_step.switch"(%17, %c0_i32_3) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %21 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %22 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
        ^bb1(%23: i32):  // no predecessors
          %true_5 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %25 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb2(%26: i32):  // no predecessors
          %true_6 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %28 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb3(%29: i32):  // no predecessors
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %31 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %20 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%18) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%5) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %8 = "simt_step.if"(%7) ({
        %true = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c160_i32 = arith.constant 160 : i32
        %18 = arith.addi %c160_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) : (i32) -> ()
      }, {
        %true = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %18 = arith.addi %c176_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %10 = arith.remsi %arg3, %c3_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %11 = "simt_step.switch"(%10, %c1_i32) ({
      ^bb0(%arg5: i32):
        %true = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %18 = arith.addi %c192_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
      ^bb1(%19: i32):  // no predecessors
        %c3_i32_2 = arith.constant 3 : i32
        %20 = arith.remsi %arg3, %c3_i32_2 : i32
        %21 = simt_step.lane_id
        %22 = arith.index_cast %21 : index to i32
        %23 = "simt_step.switch"(%20, %22) ({
        ^bb0(%arg6: i32):
          %true_4 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %28 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb1(%29: i32):  // no predecessors
          %true_5 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %31 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb2(%32: i32):  // no predecessors
          %true_6 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %34 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
      ^bb2(%24: i32):  // no predecessors
        %true_3 = arith.constant true
        %25 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %26 = arith.addi %c256_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %26, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb3(%12: i32):  // no predecessors
      %c3_i32_1 = arith.constant 3 : i32
      %13 = arith.remsi %arg3, %c3_i32_1 : i32
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_6 = arith.constant 4 : i32
          %27 = arith.remsi %arg3, %c4_i32_6 : i32
          %c1_i32_7 = arith.constant 1 : i32
          %28 = arith.addi %27, %c1_i32_7 : i32
          %29 = arith.cmpi slt, %arg7, %28 : i32
          "simt_step.condition"(%29, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_6 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %c4_i32_7 = arith.constant 4 : i32
          %28 = arith.muli %arg7, %c4_i32_7 : i32
          %29 = arith.addi %c272_i32, %28 : i32
          %30 = arith.addi %29, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_8 = arith.constant 1 : i32
          %31 = arith.addi %arg7, %c1_i32_8 : i32
          "simt_step.yield"(%27, %31) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %true = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %20 = arith.addi %c288_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
      ^bb2(%21: i32):  // no predecessors
        %true_4 = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %23 = arith.addi %c304_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb3(%24: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %25 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %26 = "simt_step.if"(%25) ({
          %true_6 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c320_i32 = arith.constant 320 : i32
          %28 = arith.addi %c320_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }, {
          %true_6 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c336_i32 = arith.constant 336 : i32
          %28 = arith.addi %c336_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
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
      %9 = arith.addi %c8_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
      "simt_step.if"(%11) ({
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
      %9 = arith.addi %c16_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %11 = simt_step.lane_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg3: i32):
        %c20_i32 = arith.constant 20 : i32
        %24 = arith.addi %c20_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg4: i32):
          %42 = simt_step.subgroup_id
          %43 = arith.index_cast %42 : index to i32
          %true_14 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %44 = arith.addi %c352_i32, %0 : i32
          %true_15 = arith.constant true
          %45 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = true} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c0_i32_16 = arith.constant 0 : i32
          %47 = arith.addi %0, %c0_i32_16 : i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %true_17 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %49 = arith.addi %c368_i32, %0 : i32
          %true_18 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %c4_i32_19 = arith.constant 4 : i32
          %true_20 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %52 = arith.addi %c384_i32, %0 : i32
          %true_21 = arith.constant true
          %53 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_19) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %29 = arith.addi %c400_i32, %0 : i32
        %true_7 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb1(%31: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %42 = arith.muli %arg5, %c4_i32_14 : i32
          %43 = arith.addi %42, %0 : i32
          %c24_i32 = arith.constant 24 : i32
          %44 = arith.addi %c24_i32, %43 : i32
          %45 = "simt_step.buffer.load"(%arg1, %44) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %46 = arith.cmpi ne, %45, %c0_i32_15 : i32
          "simt_step.condition"(%46, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %42 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %43 = arith.addi %arg5, %c1_i32 : i32
          %true_14 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_15 : i32
          %45 = arith.addi %c416_i32, %44 : i32
          %46 = arith.addi %45, %0 : i32
          %true_16 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42, %43) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c44_i32 = arith.constant 44 : i32
        %34 = arith.addi %c44_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_10 : i32
        %37 = "simt_step.if"(%36) ({
          %42 = simt_step.lane_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %38 = arith.addi %c432_i32, %0 : i32
        %true_11 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %40 = arith.addi %c448_i32, %0 : i32
        %true_13 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb1(%14: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %15:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_6 = arith.constant 4 : i32
        %24 = arith.muli %arg4, %c4_i32_6 : i32
        %25 = arith.addi %24, %0 : i32
        %c48_i32 = arith.constant 48 : i32
        %26 = arith.addi %c48_i32, %25 : i32
        %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_7 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %27, %c0_i32_7 : i32
        "simt_step.condition"(%28, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c68_i32 = arith.constant 68 : i32
        %24 = arith.addi %c68_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %26 = simt_step.lane_id
        %27 = arith.index_cast %26 : index to i32
        %28 = "simt_step.switch"(%25, %27) ({
        ^bb0(%arg5: i32):
          %37 = simt_step.subgroup_id
          %38 = arith.index_cast %37 : index to i32
          %true_11 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %39 = arith.addi %c464_i32, %0 : i32
          %true_12 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%42: i32):  // no predecessors
          %c4_i32_13 = arith.constant 4 : i32
          %true_14 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %43 = arith.addi %c480_i32, %0 : i32
          %true_15 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_13) {fallthrough = false} : (i32) -> ()
        ^bb3(%45: i32):  // no predecessors
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %c496_i32 = arith.constant 496 : i32
        %29 = arith.addi %c496_i32, %0 : i32
        %true_7 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %31 = arith.addi %arg3, %28 : i32
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %arg4, %c1_i32 : i32
        %true_8 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %c4_i32_9 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_9 : i32
        %34 = arith.addi %c512_i32, %33 : i32
        %35 = arith.addi %34, %0 : i32
        %true_10 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31, %32) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c528_i32 = arith.constant 528 : i32
      %16 = arith.addi %c528_i32, %0 : i32
      %true_3 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%15#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %c72_i32 = arith.constant 72 : i32
      %19 = arith.addi %c72_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_20 : i32
          %48 = arith.addi %47, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %49 = arith.addi %c76_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_21 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c544_i32 = arith.constant 544 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_21 : i32
          %50 = arith.addi %c544_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_22 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_8 = arith.constant true
        %c560_i32 = arith.constant 560 : i32
        %25 = arith.addi %c560_i32, %0 : i32
        %true_9 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c96_i32 = arith.constant 96 : i32
        %28 = arith.addi %c96_i32, %0 : i32
        %29 = "simt_step.buffer.load"(%arg1, %28) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %30 = arith.cmpi ne, %29, %c0_i32_10 : i32
        %31 = "simt_step.if"(%30) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c576_i32 = arith.constant 576 : i32
        %32 = arith.addi %c576_i32, %0 : i32
        %true_11 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_12 = arith.constant true
        %c592_i32 = arith.constant 592 : i32
        %34 = arith.addi %c592_i32, %0 : i32
        %true_13 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb2(%36: i32):  // no predecessors
        %c0_i32_14 = arith.constant 0 : i32
        %c0_i32_15 = arith.constant 0 : i32
        %37:2 = "simt_step.loop"(%c0_i32_14, %c0_i32_15) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_20 : i32
          %48 = arith.addi %47, %0 : i32
          %c100_i32 = arith.constant 100 : i32
          %49 = arith.addi %c100_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_21 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c608_i32 = arith.constant 608 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_21 : i32
          %50 = arith.addi %c608_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_22 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%38: i32):  // no predecessors
        %c120_i32 = arith.constant 120 : i32
        %39 = arith.addi %c120_i32, %0 : i32
        %40 = "simt_step.buffer.load"(%arg1, %39) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %41 = arith.cmpi ne, %40, %c0_i32_16 : i32
        %42 = "simt_step.if"(%41) ({
          %c0_i32_20 = arith.constant 0 : i32
          %47 = arith.addi %0, %c0_i32_20 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }, {
          %c4_i32_20 = arith.constant 4 : i32
          %47 = arith.addi %0, %c4_i32_20 : i32
          "simt_step.yield"(%47) : (i32) -> ()
        }) : (i1) -> i32
        %c624_i32 = arith.constant 624 : i32
        %43 = arith.addi %c624_i32, %0 : i32
        %true_17 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_18 = arith.constant true
        %c640_i32 = arith.constant 640 : i32
        %45 = arith.addi %c640_i32, %0 : i32
        %true_19 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_4 = arith.constant true
      %c656_i32 = arith.constant 656 : i32
      %22 = arith.addi %c656_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    return
  }
}

