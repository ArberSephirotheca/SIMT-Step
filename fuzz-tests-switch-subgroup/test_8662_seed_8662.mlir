module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0:2 = "simt_step.loop"(%c0_i32, %c0_i32_0) ({
    ^bb0(%arg4: i32, %arg5: i32):
      %c4_i32 = arith.constant 4 : i32
      %9 = arith.remsi %arg3, %c4_i32 : i32
      %c1_i32 = arith.constant 1 : i32
      %10 = arith.addi %9, %c1_i32 : i32
      %11 = arith.cmpi slt, %arg5, %10 : i32
      "simt_step.condition"(%11, %arg4, %arg5) : (i1, i32, i32) -> ()
    }, {
    ^bb0(%arg4: i32, %arg5: i32):
      %true_2 = arith.constant true
      %9 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      %c0_i32_3 = arith.constant 0 : i32
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.muli %arg5, %c4_i32 : i32
      %11 = arith.addi %c0_i32_3, %10 : i32
      %12 = arith.addi %11, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %c1_i32 = arith.constant 1 : i32
      %13 = arith.addi %arg5, %c1_i32 : i32
      "simt_step.yield"(%9, %13) : (i32, i32) -> ()
    }) : (i32, i32) -> (i32, i32)
    %c3_i32 = arith.constant 3 : i32
    %1 = arith.remsi %arg3, %c3_i32 : i32
    %2 = simt_step.lane_id
    %3 = arith.index_cast %2 : index to i32
    %4 = "simt_step.switch"(%1, %3) ({
    ^bb0(%arg4: i32):
      %c3_i32_2 = arith.constant 3 : i32
      %9 = arith.remsi %arg3, %c3_i32_2 : i32
      %10 = simt_step.subgroup_id
      %11 = arith.index_cast %10 : index to i32
      %12 = "simt_step.switch"(%9, %11) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %26:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %35 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %35, %c1_i32 : i32
          %37 = arith.cmpi slt, %arg7, %36 : i32
          "simt_step.condition"(%37, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_12 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.muli %arg7, %c4_i32_13 : i32
          %37 = arith.addi %c16_i32, %36 : i32
          %38 = arith.addi %37, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %39 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.continue"(%35, %39) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%26#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c3_i32_9 = arith.constant 3 : i32
        %28 = arith.remsi %arg3, %c3_i32_9 : i32
        %c4_i32 = arith.constant 4 : i32
        %29 = "simt_step.switch"(%28, %c4_i32) ({
        ^bb0(%arg6: i32):
          %true_12 = arith.constant true
          %35 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %36 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
        ^bb1(%37: i32):  // no predecessors
          %true_13 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %39 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb2(%40: i32):  // no predecessors
          %true_14 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %42 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        %c80_i32 = arith.constant 80 : i32
        %31 = arith.addi %c80_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %true_11 = arith.constant true
        %33 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        %c96_i32 = arith.constant 96 : i32
        %34 = arith.addi %c96_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %13 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c112_i32 = arith.constant 112 : i32
      %14 = arith.addi %c112_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %14, %13) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c0_i32_4 = arith.constant 0 : i32
      %16 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
      %17 = "simt_step.if"(%16) ({
        %true_7 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c128_i32 = arith.constant 128 : i32
        %27 = arith.addi %c128_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%26) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        %26 = arith.remsi %arg3, %c2_i32 : i32
        %27 = simt_step.subgroup_id
        %28 = arith.index_cast %27 : index to i32
        %29 = "simt_step.switch"(%26, %28) ({
        ^bb0(%arg5: i32):
          %true_7 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %31 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_8 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %34 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        ^bb2(%35: i32):  // no predecessors
          %true_9 = arith.constant true
          %36 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %37 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%29) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%17) {fallthrough = true} : (i32) -> ()
    ^bb2(%18: i32):  // no predecessors
      %true_5 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      %c192_i32 = arith.constant 192 : i32
      %20 = arith.addi %c192_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
    ^bb3(%21: i32):  // no predecessors
      %c3_i32_6 = arith.constant 3 : i32
      %22 = arith.remsi %arg3, %c3_i32_6 : i32
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      %25 = "simt_step.switch"(%22, %24) ({
      ^bb0(%arg5: i32):
        %c0_i32_7 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %arg2, %c0_i32_7 : i32
        %27 = "simt_step.if"(%26) ({
          %true_12 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %33 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }, {
          %true_12 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %33 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb1(%28: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %29:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32 : i32
          %34 = arith.cmpi slt, %arg7, %33 : i32
          "simt_step.condition"(%34, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_12 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %c4_i32 = arith.constant 4 : i32
          %33 = arith.muli %arg7, %c4_i32 : i32
          %34 = arith.addi %c240_i32, %33 : i32
          %35 = arith.addi %34, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.continue"(%32, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%29#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%30: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %31:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %32 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %33 = arith.addi %32, %c1_i32 : i32
          %34 = arith.cmpi slt, %arg7, %33 : i32
          "simt_step.condition"(%34, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_12 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %c4_i32 = arith.constant 4 : i32
          %33 = arith.muli %arg7, %c4_i32 : i32
          %34 = arith.addi %c256_i32, %33 : i32
          %35 = arith.addi %34, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %36 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%32, %36) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%31#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %5 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c272_i32 = arith.constant 272 : i32
    %6 = arith.addi %c272_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %6, %5) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c0_i32_1 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %arg2, %c0_i32_1 : i32
    %8 = arith.select %7, %0#0, %4 : i32
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
    %c4_i32_0 = arith.constant 4 : i32
    %7 = arith.addi %0, %c4_i32_0 : i32
    %8 = "simt_step.switch"(%6, %7) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %9 = arith.addi %c12_i32, %0 : i32
      %10 = "simt_step.buffer.load"(%arg1, %9) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %11 = arith.cmpi ne, %10, %c0_i32_1 : i32
      %12 = "simt_step.if"(%11) ({
        %c16_i32 = arith.constant 16 : i32
        %24 = arith.addi %c16_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        %27 = "simt_step.if"(%26) ({
          %30 = simt_step.lane_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %30 = simt_step.subgroup_id
          %31 = arith.index_cast %30 : index to i32
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        %c288_i32 = arith.constant 288 : i32
        %28 = arith.addi %c288_i32, %0 : i32
        %true_7 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %24:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %25 = arith.muli %arg4, %c4_i32_8 : i32
          %26 = arith.addi %25, %0 : i32
          %c20_i32 = arith.constant 20 : i32
          %27 = arith.addi %c20_i32, %26 : i32
          %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_9 = arith.constant 0 : i32
          %29 = arith.cmpi ne, %28, %c0_i32_9 : i32
          "simt_step.condition"(%29, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %25 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %26 = arith.addi %arg4, %c1_i32 : i32
          %true_8 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %27 = arith.muli %arg4, %c4_i32_9 : i32
          %28 = arith.addi %c304_i32, %27 : i32
          %29 = arith.addi %28, %0 : i32
          %true_10 = arith.constant true
          %30 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%25, %26) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%24#0) : (i32) -> ()
      }) : (i1) -> i32
      %c320_i32 = arith.constant 320 : i32
      %13 = arith.addi %c320_i32, %0 : i32
      %true = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %13, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_2 = arith.constant true
      %c336_i32 = arith.constant 336 : i32
      %15 = arith.addi %c336_i32, %0 : i32
      %true_3 = arith.constant true
      %16 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %15, %16) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%12) {fallthrough = false} : (i32) -> ()
    ^bb1(%17: i32):  // no predecessors
      %c40_i32 = arith.constant 40 : i32
      %18 = arith.addi %c40_i32, %0 : i32
      %19 = "simt_step.buffer.load"(%arg1, %18) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %20 = arith.cmpi ne, %19, %c0_i32_4 : i32
      %21 = "simt_step.if"(%20) ({
        %c44_i32 = arith.constant 44 : i32
        %24 = arith.addi %c44_i32, %0 : i32
        %25 = "simt_step.buffer.load"(%arg1, %24) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_6 = arith.constant 0 : i32
        %26 = arith.cmpi ne, %25, %c0_i32_6 : i32
        %27 = "simt_step.if"(%26) ({
          "simt_step.yield"(%0) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c352_i32 = arith.constant 352 : i32
        %28 = arith.addi %c352_i32, %0 : i32
        %true_7 = arith.constant true
        %29 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %28, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c368_i32 = arith.constant 368 : i32
      %22 = arith.addi %c368_i32, %0 : i32
      %true_5 = arith.constant true
      %23 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %22, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%21) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

