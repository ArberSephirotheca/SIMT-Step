module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32_2 = arith.constant 4 : i32
      %6 = arith.remsi %arg3, %c4_i32_2 : i32
      %c1_i32 = arith.constant 1 : i32
      %7 = arith.addi %6, %c1_i32 : i32
      %8 = arith.cmpi slt, %arg5, %7 : i32
      "simt_step.condition"(%8, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32_2 = arith.constant 0 : i32
      %c4_i32_3 = arith.constant 4 : i32
      %7 = arith.muli %arg5, %c4_i32_3 : i32
      %8 = arith.addi %c0_i32_2, %7 : i32
      %9 = arith.addi %8, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %9, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%6, %10) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %arg3, %c3_i32 : i32
    %c4_i32 = arith.constant 4 : i32
    %2 = arith.addi %arg0, %c4_i32 : i32
    %3 = "simt_step.switch"(%1, %2) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %6 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c16_i32 = arith.constant 16 : i32
      %7 = arith.addi %c16_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %7, %6) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%6) {fallthrough = true} : (i32) -> ()
    ^bb1(%8: i32):  // no predecessors
      %9 = simt_step.lane_id
      %10 = arith.index_cast %9 : index to i32
      %11 = "simt_step.switch"(%arg3, %10) ({
      ^bb0(%arg5: i32):
        %c0_i32_4 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %25 = "simt_step.if"(%24) ({
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %33 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %33 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c2_i32_5 = arith.constant 2 : i32
        %27 = arith.remsi %arg3, %c2_i32_5 : i32
        %c4_i32_6 = arith.constant 4 : i32
        %28 = arith.addi %arg0, %c4_i32_6 : i32
        %29 = "simt_step.switch"(%27, %28) ({
        ^bb0(%arg6: i32):
          %true_8 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %33 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        ^bb1(%34: i32):  // no predecessors
          %true_9 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %36 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
        ^bb2(%37: i32):  // no predecessors
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %39 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_7 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c112_i32 = arith.constant 112 : i32
        %31 = arith.addi %c112_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb2(%12: i32):  // no predecessors
      %c3_i32_2 = arith.constant 3 : i32
      %13 = arith.remsi %arg3, %c3_i32_2 : i32
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg5: i32):
        %c1_i32 = arith.constant 1 : i32
        %24 = "simt_step.switch"(%arg3, %c1_i32) ({
        ^bb0(%arg6: i32):
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %34 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb1(%35: i32):  // no predecessors
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %37 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%24) {fallthrough = true} : (i32) -> ()
      ^bb1(%25: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %27 = "simt_step.if"(%26) ({
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %34 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %34 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb2(%28: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %29 = arith.cmpi ne, %arg2, %c0_i32_5 : i32
        %30 = "simt_step.if"(%29) ({
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %34 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %34 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
      ^bb3(%31: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %33 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32_9 = arith.constant 1 : i32
          %34 = arith.addi %33, %c1_i32_9 : i32
          %35 = arith.cmpi slt, %arg7, %34 : i32
          "simt_step.condition"(%35, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %34 = arith.muli %arg7, %c4_i32_9 : i32
          %35 = arith.addi %c224_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32_10 = arith.constant 1 : i32
          %37 = arith.addi %arg7, %c1_i32_10 : i32
          "simt_step.yield"(%33, %37) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
    ^bb3(%17: i32):  // no predecessors
      %c2_i32 = arith.constant 2 : i32
      %18 = arith.remsi %arg3, %c2_i32 : i32
      %19 = simt_step.lane_id
      %20 = arith.index_cast %19 : index to i32
      %21 = "simt_step.switch"(%18, %20) ({
      ^bb0(%arg5: i32):
        %c4_i32_4 = arith.constant 4 : i32
        %24 = arith.remsi %arg3, %c4_i32_4 : i32
        %25 = simt_step.subgroup_id
        %26 = arith.index_cast %25 : index to i32
        %27 = "simt_step.switch"(%24, %26) ({
        ^bb0(%arg6: i32):
          %true_9 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %36 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %39 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %true_11 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %42 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb3(%43: i32):  // no predecessors
          %true_12 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %45 = arith.addi %c288_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %45, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c304_i32 = arith.constant 304 : i32
        %29 = arith.addi %c304_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%30: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %31 = arith.cmpi ne, %arg2, %c0_i32_6 : i32
        %32 = "simt_step.if"(%31) ({
          %true_9 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c320_i32 = arith.constant 320 : i32
          %36 = arith.addi %c320_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) : (i32) -> ()
        }, {
          %true_9 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c336_i32 = arith.constant 336 : i32
          %36 = arith.addi %c336_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %34:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_9 = arith.constant 4 : i32
          %35 = arith.remsi %arg3, %c4_i32_9 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %35, %c1_i32 : i32
          %37 = arith.cmpi slt, %arg7, %36 : i32
          "simt_step.condition"(%37, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_9 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c352_i32 = arith.constant 352 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %36 = arith.muli %arg7, %c4_i32_10 : i32
          %37 = arith.addi %c352_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%35, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%34#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c368_i32 = arith.constant 368 : i32
      %23 = arith.addi %c368_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %4 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %5 = arith.select %4, %0#0, %3 : i32
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
    %7 = "simt_step.switch"(%6, %0) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %19 = arith.addi %c12_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = "simt_step.switch"(%20, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_15 = arith.constant 0 : i32
        %c0_i32_16 = arith.constant 0 : i32
        %40:2 = "simt_step.loop"(%c0_i32_15, %c0_i32_16) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_23 : i32
          %58 = arith.addi %57, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %59 = arith.addi %c16_i32, %58 : i32
          %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %61 = arith.cmpi ne, %60, %c0_i32_24 : i32
          "simt_step.condition"(%61, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %57 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %58 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_24 : i32
          %60 = arith.addi %c384_i32, %59 : i32
          %61 = arith.addi %60, %0 : i32
          %true_25 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57, %58) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%40#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%41: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %42 = arith.addi %c36_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %44 = "simt_step.switch"(%43, %c3_i32) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          %true_23 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %62 = arith.addi %c400_i32, %0 : i32
          %true_24 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_17 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %45 = arith.addi %c416_i32, %0 : i32
        %true_18 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c432_i32 = arith.constant 432 : i32
        %47 = arith.addi %c432_i32, %0 : i32
        %true_20 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
      ^bb2(%49: i32):  // no predecessors
        %c0_i32_21 = arith.constant 0 : i32
        %c0_i32_22 = arith.constant 0 : i32
        %50:2 = "simt_step.loop"(%c0_i32_21, %c0_i32_22) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %57 = arith.muli %arg5, %c4_i32_23 : i32
          %58 = arith.addi %57, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %59 = arith.addi %c40_i32, %58 : i32
          %60 = "simt_step.buffer.load"(%arg1, %59) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_24 = arith.constant 0 : i32
          %61 = arith.cmpi ne, %60, %c0_i32_24 : i32
          "simt_step.condition"(%61, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %57 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %58 = arith.addi %arg5, %c1_i32 : i32
          %true_23 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %c4_i32_24 = arith.constant 4 : i32
          %59 = arith.muli %arg5, %c4_i32_24 : i32
          %60 = arith.addi %c448_i32, %59 : i32
          %61 = arith.addi %60, %0 : i32
          %true_25 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%57, %58) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%50#0) {fallthrough = false} : (i32) -> ()
      ^bb3(%51: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %52 = arith.addi %c60_i32, %0 : i32
        %53 = "simt_step.buffer.load"(%arg1, %52) : (!simt_step.resource<Global, i32>, i32) -> i32
        %54 = simt_step.lane_id
        %55 = arith.index_cast %54 : index to i32
        %56 = "simt_step.switch"(%53, %55) ({
        ^bb0(%arg4: i32):
          %c4_i32_23 = arith.constant 4 : i32
          %57 = arith.addi %0, %c4_i32_23 : i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          %62 = simt_step.subgroup_id
          %63 = arith.index_cast %62 : index to i32
          %true_24 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %64 = arith.addi %c464_i32, %0 : i32
          %true_25 = arith.constant true
          %65 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %64, %65) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%63) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c480_i32 = arith.constant 480 : i32
      %22 = arith.addi %c480_i32, %0 : i32
      %true_4 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_5 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %24 = arith.addi %c496_i32, %0 : i32
      %true_6 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %27 = arith.addi %c64_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = simt_step.subgroup_id
      %30 = arith.index_cast %29 : index to i32
      %31 = "simt_step.switch"(%28, %30) ({
      ^bb0(%arg3: i32):
        %c3_i32 = arith.constant 3 : i32
        %true_15 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %40 = arith.addi %c512_i32, %0 : i32
        %true_16 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      ^bb1(%42: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %43 = arith.addi %c68_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %45 = arith.cmpi ne, %44, %c0_i32_17 : i32
        %46 = "simt_step.if"(%45) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32_23 = arith.constant 3 : i32
          %59 = arith.addi %0, %c3_i32_23 : i32
          "simt_step.yield"(%59) : (i32) -> ()
        }) : (i1) -> i32
        %c528_i32 = arith.constant 528 : i32
        %47 = arith.addi %c528_i32, %0 : i32
        %true_18 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_19 = arith.constant true
        %c544_i32 = arith.constant 544 : i32
        %49 = arith.addi %c544_i32, %0 : i32
        %true_20 = arith.constant true
        %50 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%46) {fallthrough = false} : (i32) -> ()
      ^bb2(%51: i32):  // no predecessors
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      ^bb3(%52: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %53 = arith.addi %c72_i32, %0 : i32
        %54 = "simt_step.buffer.load"(%arg1, %53) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_21 = arith.constant 0 : i32
        %55 = arith.cmpi ne, %54, %c0_i32_21 : i32
        %56 = "simt_step.if"(%55) ({
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          "simt_step.yield"(%60) : (i32) -> ()
        }, {
          %c0_i32_23 = arith.constant 0 : i32
          %59 = arith.addi %0, %c0_i32_23 : i32
          "simt_step.yield"(%59) : (i32) -> ()
        }) : (i1) -> i32
        %c560_i32 = arith.constant 560 : i32
        %57 = arith.addi %c560_i32, %0 : i32
        %true_22 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c576_i32 = arith.constant 576 : i32
      %32 = arith.addi %c576_i32, %0 : i32
      %true_8 = arith.constant true
      %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %32, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
    ^bb2(%34: i32):  // no predecessors
      %c0_i32_9 = arith.constant 0 : i32
      %c0_i32_10 = arith.constant 0 : i32
      %35:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %40 = arith.muli %arg4, %c4_i32_15 : i32
        %41 = arith.addi %40, %0 : i32
        %c76_i32 = arith.constant 76 : i32
        %42 = arith.addi %c76_i32, %41 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_16 : i32
        "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %40 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %41 = arith.addi %arg4, %c1_i32 : i32
        %true_15 = arith.constant true
        %c592_i32 = arith.constant 592 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_16 : i32
        %43 = arith.addi %c592_i32, %42 : i32
        %44 = arith.addi %43, %0 : i32
        %true_17 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40, %41) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%35#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%36: i32):  // no predecessors
      %c0_i32_11 = arith.constant 0 : i32
      %c0_i32_12 = arith.constant 0 : i32
      %37:2 = "simt_step.loop"(%c0_i32_11, %c0_i32_12) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_15 = arith.constant 4 : i32
        %40 = arith.muli %arg4, %c4_i32_15 : i32
        %41 = arith.addi %40, %0 : i32
        %c96_i32 = arith.constant 96 : i32
        %42 = arith.addi %c96_i32, %41 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_16 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_16 : i32
        "simt_step.condition"(%44, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %40 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %41 = arith.addi %arg4, %c1_i32 : i32
        %true_15 = arith.constant true
        %c608_i32 = arith.constant 608 : i32
        %c4_i32_16 = arith.constant 4 : i32
        %42 = arith.muli %arg4, %c4_i32_16 : i32
        %43 = arith.addi %c608_i32, %42 : i32
        %44 = arith.addi %43, %0 : i32
        %true_17 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.break"(%40, %41) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true_13 = arith.constant true
      %c624_i32 = arith.constant 624 : i32
      %38 = arith.addi %c624_i32, %0 : i32
      %true_14 = arith.constant true
      %39 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%37#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %c116_i32 = arith.constant 116 : i32
    %8 = arith.addi %c116_i32, %0 : i32
    %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
    %10 = "simt_step.switch"(%9, %0) ({
    ^bb0(%arg2: i32):
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb1(%19: i32):  // no predecessors
      %c120_i32 = arith.constant 120 : i32
      %20 = arith.addi %c120_i32, %0 : i32
      %21 = "simt_step.buffer.load"(%arg1, %20) : (!simt_step.resource<Global, i32>, i32) -> i32
      %22 = "simt_step.switch"(%21, %0) ({
      ^bb0(%arg3: i32):
        %c4_i32_5 = arith.constant 4 : i32
        %true_6 = arith.constant true
        %c640_i32 = arith.constant 640 : i32
        %26 = arith.addi %c640_i32, %0 : i32
        %true_7 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c4_i32_5) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %29 = simt_step.subgroup_id
        %30 = arith.index_cast %29 : index to i32
        "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
      ^bb2(%31: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %32 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%32) {fallthrough = true} : (i32) -> ()
      ^bb3(%33: i32):  // no predecessors
        %c124_i32 = arith.constant 124 : i32
        %34 = arith.addi %c124_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %36 = "simt_step.switch"(%35, %0) ({
        ^bb0(%arg4: i32):
          %39 = simt_step.lane_id
          %40 = arith.index_cast %39 : index to i32
          "simt_step.yield"(%40) {fallthrough = true} : (i32) -> ()
        ^bb1(%41: i32):  // no predecessors
          %true_10 = arith.constant true
          %c656_i32 = arith.constant 656 : i32
          %42 = arith.addi %c656_i32, %0 : i32
          %true_11 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%44: i32):  // no predecessors
          %45 = simt_step.subgroup_id
          %46 = arith.index_cast %45 : index to i32
          "simt_step.yield"(%46) {fallthrough = true} : (i32) -> ()
        ^bb3(%47: i32):  // no predecessors
          %c1_i32_12 = arith.constant 1 : i32
          %true_13 = arith.constant true
          %c672_i32 = arith.constant 672 : i32
          %48 = arith.addi %c672_i32, %0 : i32
          %true_14 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_12) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c688_i32 = arith.constant 688 : i32
        %37 = arith.addi %c688_i32, %0 : i32
        %true_9 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
    ^bb2(%23: i32):  // no predecessors
      %true_3 = arith.constant true
      %c704_i32 = arith.constant 704 : i32
      %24 = arith.addi %c704_i32, %0 : i32
      %true_4 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c720_i32 = arith.constant 720 : i32
    %11 = arith.addi %c720_i32, %0 : i32
    %true_0 = arith.constant true
    %12 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %11, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c128_i32 = arith.constant 128 : i32
    %13 = arith.addi %c128_i32, %0 : i32
    %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
    %c0_i32_1 = arith.constant 0 : i32
    %15 = arith.cmpi ne, %14, %c0_i32_1 : i32
    %16 = "simt_step.if"(%15) ({
      %c132_i32 = arith.constant 132 : i32
      %19 = arith.addi %c132_i32, %0 : i32
      %20 = "simt_step.buffer.load"(%arg1, %19) : (!simt_step.resource<Global, i32>, i32) -> i32
      %21 = simt_step.subgroup_id
      %22 = arith.index_cast %21 : index to i32
      %23 = "simt_step.switch"(%20, %22) ({
      ^bb0(%arg2: i32):
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_16 : i32
          %47 = arith.addi %46, %0 : i32
          %c136_i32 = arith.constant 136 : i32
          %48 = arith.addi %c136_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_17 : i32
          "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %46 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c736_i32 = arith.constant 736 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_17 : i32
          %49 = arith.addi %c736_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.break"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_7 = arith.constant true
        %c752_i32 = arith.constant 752 : i32
        %27 = arith.addi %c752_i32, %0 : i32
        %true_8 = arith.constant true
        %28 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c156_i32 = arith.constant 156 : i32
        %30 = arith.addi %c156_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = simt_step.subgroup_id
        %33 = arith.index_cast %32 : index to i32
        %34 = "simt_step.switch"(%31, %33) ({
        ^bb0(%arg3: i32):
          %true_16 = arith.constant true
          %c768_i32 = arith.constant 768 : i32
          %46 = arith.addi %c768_i32, %0 : i32
          %true_17 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%48: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %49 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb2(%35: i32):  // no predecessors
        %c160_i32 = arith.constant 160 : i32
        %36 = arith.addi %c160_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_9 = arith.constant 4 : i32
        %38 = arith.addi %0, %c4_i32_9 : i32
        %39 = "simt_step.switch"(%37, %38) ({
        ^bb0(%arg3: i32):
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) {fallthrough = true} : (i32) -> ()
        ^bb1(%46: i32):  // no predecessors
          %c2_i32_16 = arith.constant 2 : i32
          %47 = arith.addi %0, %c2_i32_16 : i32
          "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
        ^bb2(%48: i32):  // no predecessors
          %true_17 = arith.constant true
          %c784_i32 = arith.constant 784 : i32
          %49 = arith.addi %c784_i32, %0 : i32
          %true_18 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb3(%51: i32):  // no predecessors
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c800_i32 = arith.constant 800 : i32
        %40 = arith.addi %c800_i32, %0 : i32
        %true_11 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
      ^bb3(%42: i32):  // no predecessors
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %43:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_16 = arith.constant 4 : i32
          %46 = arith.muli %arg4, %c4_i32_16 : i32
          %47 = arith.addi %46, %0 : i32
          %c164_i32 = arith.constant 164 : i32
          %48 = arith.addi %c164_i32, %47 : i32
          %49 = "simt_step.buffer.load"(%arg1, %48) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_17 = arith.constant 0 : i32
          %50 = arith.cmpi ne, %49, %c0_i32_17 : i32
          "simt_step.condition"(%50, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %46 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %47 = arith.addi %arg4, %c1_i32 : i32
          %true_16 = arith.constant true
          %c816_i32 = arith.constant 816 : i32
          %c4_i32_17 = arith.constant 4 : i32
          %48 = arith.muli %arg4, %c4_i32_17 : i32
          %49 = arith.addi %c816_i32, %48 : i32
          %50 = arith.addi %49, %0 : i32
          %true_18 = arith.constant true
          %51 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%46, %47) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_14 = arith.constant true
        %c832_i32 = arith.constant 832 : i32
        %44 = arith.addi %c832_i32, %0 : i32
        %true_15 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %c848_i32 = arith.constant 848 : i32
      %24 = arith.addi %c848_i32, %0 : i32
      %true_4 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) : (i32) -> ()
    }, {
      %c3_i32 = arith.constant 3 : i32
      %19 = arith.addi %0, %c3_i32 : i32
      "simt_step.yield"(%19) : (i32) -> ()
    }) : (i1) -> i32
    %c864_i32 = arith.constant 864 : i32
    %17 = arith.addi %c864_i32, %0 : i32
    %true_2 = arith.constant true
    %18 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %17, %18) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

