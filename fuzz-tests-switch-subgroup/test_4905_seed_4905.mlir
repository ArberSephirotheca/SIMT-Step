module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.remsi %arg3, %c2_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %1 = arith.addi %arg0, %c4_i32 : i32
    %2 = "simt_step.switch"(%0, %1) ({
    ^bb0(%arg4: i32):
      %c3_i32 = arith.constant 3 : i32
      %3 = arith.remsi %arg3, %c3_i32 : i32
      %4 = simt_step.subgroup_id
      %5 = arith.index_cast %4 : index to i32
      %6 = "simt_step.switch"(%3, %5) ({
      ^bb0(%arg5: i32):
        %c4_i32_2 = arith.constant 4 : i32
        %14 = arith.remsi %arg3, %c4_i32_2 : i32
        %15 = simt_step.subgroup_id
        %16 = arith.index_cast %15 : index to i32
        %17 = "simt_step.switch"(%14, %16) ({
        ^bb0(%arg6: i32):
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %31 = arith.addi %c0_i32_8, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_9 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %34 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %true_10 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %37 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        ^bb3(%38: i32):  // no predecessors
          %true_11 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %40 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %40, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
      ^bb1(%18: i32):  // no predecessors
        %c2_i32_3 = arith.constant 2 : i32
        %19 = arith.remsi %arg3, %c2_i32_3 : i32
        %c1_i32 = arith.constant 1 : i32
        %20 = "simt_step.switch"(%19, %c1_i32) ({
        ^bb0(%arg6: i32):
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %31 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %34 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = true} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %37 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true = arith.constant true
        %21 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %22 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %22, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
      ^bb2(%23: i32):  // no predecessors
        %c3_i32_4 = arith.constant 3 : i32
        %24 = arith.remsi %arg3, %c3_i32_4 : i32
        %c3_i32_5 = arith.constant 3 : i32
        %25 = arith.addi %arg0, %c3_i32_5 : i32
        %26 = "simt_step.switch"(%24, %25) ({
        ^bb0(%arg6: i32):
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %31 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %34 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %37 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
      ^bb3(%27: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %28 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %29 = "simt_step.if"(%28) ({
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %31 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }, {
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %31 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c0_i32 = arith.constant 0 : i32
      %8 = arith.cmpi ne, %arg2, %c0_i32 : i32
      %9 = "simt_step.if"(%8) ({
        %true = arith.constant true
        %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c208_i32 = arith.constant 208 : i32
        %15 = arith.addi %c208_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%14) : (i32) -> ()
      }, {
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_4 = arith.constant 4 : i32
          %15 = arith.remsi %arg3, %c4_i32_4 : i32
          %c1_i32 = arith.constant 1 : i32
          %16 = arith.addi %15, %c1_i32 : i32
          %17 = arith.cmpi slt, %arg6, %16 : i32
          "simt_step.condition"(%17, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_4 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32_4 : i32
          %17 = arith.addi %c224_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %19 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.break"(%15, %19) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c3_i32_0 = arith.constant 3 : i32
      %11 = arith.remsi %arg3, %c3_i32_0 : i32
      %c4_i32_1 = arith.constant 4 : i32
      %12 = arith.addi %arg0, %c4_i32_1 : i32
      %13 = "simt_step.switch"(%11, %12) ({
      ^bb0(%arg5: i32):
        %c0_i32_2 = arith.constant 0 : i32
        %c0_i32_3 = arith.constant 0 : i32
        %14:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %24 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %24, %c1_i32 : i32
          %26 = arith.cmpi slt, %arg7, %25 : i32
          "simt_step.condition"(%26, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_8 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %25 = arith.muli %arg7, %c4_i32_9 : i32
          %26 = arith.addi %c240_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%24, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%14#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%15: i32):  // no predecessors
        %c3_i32_4 = arith.constant 3 : i32
        %16 = arith.remsi %arg3, %c3_i32_4 : i32
        %c0_i32_5 = arith.constant 0 : i32
        %17 = arith.addi %arg0, %c0_i32_5 : i32
        %18 = "simt_step.switch"(%16, %17) ({
        ^bb0(%arg6: i32):
          %true_8 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %25 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
        ^bb1(%26: i32):  // no predecessors
          %true_9 = arith.constant true
          %27 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %28 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
        ^bb2(%29: i32):  // no predecessors
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %31 = arith.addi %c288_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb3(%32: i32):  // no predecessors
          %true_11 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c304_i32 = arith.constant 304 : i32
          %34 = arith.addi %c304_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
      ^bb2(%19: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %20:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %24 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %25 = arith.addi %24, %c1_i32 : i32
          %26 = arith.cmpi slt, %arg7, %25 : i32
          "simt_step.condition"(%26, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_8 = arith.constant true
          %24 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c320_i32 = arith.constant 320 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %25 = arith.muli %arg7, %c4_i32_9 : i32
          %26 = arith.addi %c320_i32, %25 : i32
          %27 = arith.addi %26, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %28 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%24, %28) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%20#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%21: i32):  // no predecessors
        %true = arith.constant true
        %22 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
        %c336_i32 = arith.constant 336 : i32
        %23 = arith.addi %c336_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
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
    %5 = simt_step.subgroup_id
    %6 = arith.index_cast %5 : index to i32
    %c0_i32_0 = arith.constant 0 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %7:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
    ^bb0(%arg2: i32, %arg3: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %8 = arith.muli %arg3, %c4_i32_2 : i32
      %9 = arith.addi %8, %0 : i32
      %c8_i32 = arith.constant 8 : i32
      %10 = arith.addi %c8_i32, %9 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %12 = arith.cmpi ne, %11, %c0_i32_3 : i32
      "simt_step.condition"(%12, %arg2, %arg3) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg2: i32, %arg3: i32):
      %c28_i32 = arith.constant 28 : i32
      %8 = arith.addi %c28_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c4_i32_2 = arith.constant 4 : i32
      %10 = arith.addi %0, %c4_i32_2 : i32
      %11 = "simt_step.switch"(%9, %10) ({
      ^bb0(%arg4: i32):
        %c32_i32 = arith.constant 32 : i32
        %18 = arith.addi %c32_i32, %0 : i32
        %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
        %20 = simt_step.lane_id
        %21 = arith.index_cast %20 : index to i32
        %22 = "simt_step.switch"(%19, %21) ({
        ^bb0(%arg5: i32):
          %c1_i32_13 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32_13) {fallthrough = true} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %c0_i32_14 = arith.constant 0 : i32
          %37 = arith.addi %0, %c0_i32_14 : i32
          %true_15 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %38 = arith.addi %c352_i32, %0 : i32
          %true_16 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %41 = simt_step.subgroup_id
          %42 = arith.index_cast %41 : index to i32
          %true_17 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %43 = arith.addi %c368_i32, %0 : i32
          %true_18 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = true} : (i32) -> ()
        ^bb3(%45: i32):  // no predecessors
          %true_19 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %46 = arith.addi %c384_i32, %0 : i32
          %true_20 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c400_i32 = arith.constant 400 : i32
        %23 = arith.addi %c400_i32, %0 : i32
        %true_6 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.muli %arg6, %c4_i32_13 : i32
          %37 = arith.addi %36, %0 : i32
          %c36_i32 = arith.constant 36 : i32
          %38 = arith.addi %c36_i32, %37 : i32
          %39 = "simt_step.buffer.load"(%arg1, %38) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %40 = arith.cmpi ne, %39, %c0_i32_14 : i32
          "simt_step.condition"(%40, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %36 = arith.addi %arg5, %arg6 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %37 = arith.addi %arg6, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %38 = arith.muli %arg6, %c4_i32_15 : i32
          %39 = arith.addi %c416_i32, %38 : i32
          %40 = arith.addi %39, %0 : i32
          %true_16 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %27 = arith.addi %c432_i32, %0 : i32
        %true_10 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %c56_i32 = arith.constant 56 : i32
        %30 = arith.addi %c56_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_11 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_11 : i32
        %33 = "simt_step.if"(%32) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          "simt_step.yield"(%0) : (i32) -> ()
        }) : (i1) -> i32
        %c448_i32 = arith.constant 448 : i32
        %34 = arith.addi %c448_i32, %0 : i32
        %true_12 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      %12 = arith.addi %arg2, %11 : i32
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg3, %c1_i32 : i32
      %true = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %14 = arith.muli %arg3, %c4_i32_3 : i32
      %15 = arith.addi %c464_i32, %14 : i32
      %16 = arith.addi %15, %0 : i32
      %true_4 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %16, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.break"(%12, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    return
  }
}

