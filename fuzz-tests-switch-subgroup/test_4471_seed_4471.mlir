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
      %c0_i32_2 = arith.constant 0 : i32
      %10 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %11 = "simt_step.if"(%10) ({
        %c4_i32_7 = arith.constant 4 : i32
        %24 = arith.addi %arg0, %c4_i32_7 : i32
        %25 = "simt_step.switch"(%arg3, %24) ({
        ^bb0(%arg5: i32):
          %true_9 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %29 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %29, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%30: i32):  // no predecessors
          %true_10 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %32 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %26 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %27 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%25) : (i32) -> ()
      }, {
        %true_7 = arith.constant true
        %24 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        %c64_i32 = arith.constant 64 : i32
        %25 = arith.addi %c64_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %25, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%24) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%11) {fallthrough = true} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %13 = arith.remsi %arg3, %c4_i32 : i32
      %14 = simt_step.lane_id
      %15 = arith.index_cast %14 : index to i32
      %16 = "simt_step.switch"(%13, %15) ({
      ^bb0(%arg5: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %24 = arith.remsi %arg3, %c4_i32_7 : i32
        %25 = "simt_step.switch"(%24, %arg0) ({
        ^bb0(%arg6: i32):
          %true_12 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %35 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb1(%36: i32):  // no predecessors
          %true_13 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %38 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb2(%39: i32):  // no predecessors
          %true_14 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %41 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %41, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        ^bb3(%42: i32):  // no predecessors
          %true_15 = arith.constant true
          %43 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %44 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %44, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb1(%26: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %27 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %28 = "simt_step.if"(%27) ({
          %true_12 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %35 = arith.addi %c144_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) : (i32) -> ()
        }, {
          %true_12 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %35 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%28) {fallthrough = true} : (i32) -> ()
      ^bb2(%29: i32):  // no predecessors
        %true_9 = arith.constant true
        %30 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        %c176_i32 = arith.constant 176 : i32
        %31 = arith.addi %c176_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %31, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%30) {fallthrough = true} : (i32) -> ()
      ^bb3(%32: i32):  // no predecessors
        %c0_i32_10 = arith.constant 0 : i32
        %c0_i32_11 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_10, %c0_i32_11) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %34 = arith.remsi %arg3, %c4_i32_12 : i32
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %34, %c1_i32 : i32
          %36 = arith.cmpi slt, %arg7, %35 : i32
          "simt_step.condition"(%36, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_12 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %35 = arith.muli %arg7, %c4_i32_13 : i32
          %36 = arith.addi %c192_i32, %35 : i32
          %37 = arith.addi %36, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %37, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %38 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%34, %38) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%33#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_3 = arith.constant true
      %17 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %18 = arith.addi %c208_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%16) {fallthrough = true} : (i32) -> ()
    ^bb2(%19: i32):  // no predecessors
      %c4_i32_4 = arith.constant 4 : i32
      %20 = arith.remsi %arg3, %c4_i32_4 : i32
      %21 = "simt_step.switch"(%20, %arg0) ({
      ^bb0(%arg5: i32):
        %c2_i32 = arith.constant 2 : i32
        %24 = arith.remsi %arg3, %c2_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %arg0, %c1_i32 : i32
        %26 = "simt_step.switch"(%24, %25) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %39 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = false} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %true_11 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %42 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
      ^bb1(%27: i32):  // no predecessors
        %c2_i32_7 = arith.constant 2 : i32
        %28 = arith.remsi %arg3, %c2_i32_7 : i32
        %29 = simt_step.subgroup_id
        %30 = arith.index_cast %29 : index to i32
        %31 = "simt_step.switch"(%28, %30) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c256_i32 = arith.constant 256 : i32
          %39 = arith.addi %c256_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) {fallthrough = true} : (i32) -> ()
        ^bb1(%40: i32):  // no predecessors
          %true_11 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c272_i32 = arith.constant 272 : i32
          %42 = arith.addi %c272_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %42, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
        ^bb2(%43: i32):  // no predecessors
          %true_12 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c288_i32 = arith.constant 288 : i32
          %45 = arith.addi %c288_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %45, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
      ^bb2(%32: i32):  // no predecessors
        %c0_i32_8 = arith.constant 0 : i32
        %33 = arith.cmpi ne, %arg2, %c0_i32_8 : i32
        %34 = "simt_step.if"(%33) ({
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c304_i32 = arith.constant 304 : i32
          %39 = arith.addi %c304_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c320_i32 = arith.constant 320 : i32
          %39 = arith.addi %c320_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
      ^bb3(%35: i32):  // no predecessors
        %c0_i32_9 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %arg2, %c0_i32_9 : i32
        %37 = "simt_step.if"(%36) ({
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c336_i32 = arith.constant 336 : i32
          %39 = arith.addi %c336_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) : (i32) -> ()
        }, {
          %true_10 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c352_i32 = arith.constant 352 : i32
          %39 = arith.addi %c352_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %39, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%38) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%21) {fallthrough = true} : (i32) -> ()
    ^bb3(%22: i32):  // no predecessors
      %c0_i32_5 = arith.constant 0 : i32
      %c0_i32_6 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32_7 = arith.constant 4 : i32
        %24 = arith.remsi %arg3, %c4_i32_7 : i32
        %c1_i32 = arith.constant 1 : i32
        %25 = arith.addi %24, %c1_i32 : i32
        %26 = arith.cmpi slt, %arg6, %25 : i32
        "simt_step.condition"(%26, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %24 = simt_step.subgroup_id
        %25 = arith.index_cast %24 : index to i32
        %26 = "simt_step.switch"(%arg3, %25) ({
        ^bb0(%arg7: i32):
          %true_7 = arith.constant true
          %28 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c368_i32 = arith.constant 368 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %29 = arith.muli %arg6, %c4_i32_8 : i32
          %30 = arith.addi %c368_i32, %29 : i32
          %31 = arith.addi %30, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %31, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
        ^bb1(%32: i32):  // no predecessors
          %true_9 = arith.constant true
          %33 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c384_i32 = arith.constant 384 : i32
          %c4_i32_10 = arith.constant 4 : i32
          %34 = arith.muli %arg6, %c4_i32_10 : i32
          %35 = arith.addi %c384_i32, %34 : i32
          %36 = arith.addi %35, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %36, %33) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %27 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.continue"(%26, %27) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true_0 = arith.constant true
    %6 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    %c400_i32 = arith.constant 400 : i32
    %7 = arith.addi %c400_i32, %arg0 : i32
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
    %c0_i32_0 = arith.constant 0 : i32
    %7 = arith.cmpi ne, %6, %c0_i32_0 : i32
    %8 = "simt_step.if"(%7) ({
      %c12_i32 = arith.constant 12 : i32
      %21 = arith.addi %c12_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = simt_step.subgroup_id
      %24 = arith.index_cast %23 : index to i32
      %25 = "simt_step.switch"(%22, %24) ({
      ^bb0(%arg2: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %28:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %43 = arith.muli %arg4, %c4_i32_7 : i32
          %44 = arith.addi %43, %0 : i32
          %c16_i32 = arith.constant 16 : i32
          %45 = arith.addi %c16_i32, %44 : i32
          %46 = "simt_step.buffer.load"(%arg1, %45) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_8 = arith.constant 0 : i32
          %47 = arith.cmpi ne, %46, %c0_i32_8 : i32
          "simt_step.condition"(%47, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %43 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %44 = arith.addi %arg4, %c1_i32 : i32
          %true_7 = arith.constant true
          %c416_i32 = arith.constant 416 : i32
          %c4_i32_8 = arith.constant 4 : i32
          %45 = arith.muli %arg4, %c4_i32_8 : i32
          %46 = arith.addi %c416_i32, %45 : i32
          %47 = arith.addi %46, %0 : i32
          %true_9 = arith.constant true
          %48 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%43, %44) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%28#0) {fallthrough = false} : (i32) -> ()
      ^bb1(%29: i32):  // no predecessors
        %c36_i32 = arith.constant 36 : i32
        %30 = arith.addi %c36_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %32 = "simt_step.switch"(%31, %0) ({
        ^bb0(%arg3: i32):
          %43 = simt_step.subgroup_id
          %44 = arith.index_cast %43 : index to i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %46 = simt_step.subgroup_id
          %47 = arith.index_cast %46 : index to i32
          %true_7 = arith.constant true
          %c432_i32 = arith.constant 432 : i32
          %48 = arith.addi %c432_i32, %0 : i32
          %true_8 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        ^bb2(%50: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          "simt_step.yield"(%c1_i32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb2(%33: i32):  // no predecessors
        %c2_i32 = arith.constant 2 : i32
        %34 = arith.addi %0, %c2_i32 : i32
        "simt_step.yield"(%34) {fallthrough = false} : (i32) -> ()
      ^bb3(%35: i32):  // no predecessors
        %c40_i32 = arith.constant 40 : i32
        %36 = arith.addi %c40_i32, %0 : i32
        %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
        %38 = simt_step.lane_id
        %39 = arith.index_cast %38 : index to i32
        %40 = "simt_step.switch"(%37, %39) ({
        ^bb0(%arg3: i32):
          %c4_i32_7 = arith.constant 4 : i32
          %true_8 = arith.constant true
          %c448_i32 = arith.constant 448 : i32
          %43 = arith.addi %c448_i32, %0 : i32
          %true_9 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_7) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
        ^bb2(%46: i32):  // no predecessors
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          %true_10 = arith.constant true
          %c464_i32 = arith.constant 464 : i32
          %49 = arith.addi %c464_i32, %0 : i32
          %true_11 = arith.constant true
          %50 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %49, %50) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%48) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_5 = arith.constant true
        %c480_i32 = arith.constant 480 : i32
        %41 = arith.addi %c480_i32, %0 : i32
        %true_6 = arith.constant true
        %42 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %41, %42) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c496_i32 = arith.constant 496 : i32
      %26 = arith.addi %c496_i32, %0 : i32
      %true_2 = arith.constant true
      %27 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %26, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%25) : (i32) -> ()
    }, {
      %c44_i32 = arith.constant 44 : i32
      %21 = arith.addi %c44_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_1 : i32
      %24 = "simt_step.if"(%23) ({
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c512_i32 = arith.constant 512 : i32
      %25 = arith.addi %c512_i32, %0 : i32
      %true_2 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) : (i32) -> ()
    }) : (i1) -> i32
    %c528_i32 = arith.constant 528 : i32
    %9 = arith.addi %c528_i32, %0 : i32
    %true = arith.constant true
    %10 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %9, %10) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    %c48_i32 = arith.constant 48 : i32
    %11 = arith.addi %c48_i32, %0 : i32
    %12 = "simt_step.buffer.load"(%arg1, %11) : (!simt_step.resource<Global, i32>, i32) -> i32
    %13 = simt_step.lane_id
    %14 = arith.index_cast %13 : index to i32
    %15 = "simt_step.switch"(%12, %14) ({
    ^bb0(%arg2: i32):
      %c52_i32 = arith.constant 52 : i32
      %21 = arith.addi %c52_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = "simt_step.switch"(%22, %0) ({
      ^bb0(%arg3: i32):
        %c56_i32 = arith.constant 56 : i32
        %30 = arith.addi %c56_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_3 = arith.constant 4 : i32
        %32 = "simt_step.switch"(%31, %c4_i32_3) ({
        ^bb0(%arg4: i32):
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          %true_12 = arith.constant true
          %c544_i32 = arith.constant 544 : i32
          %54 = arith.addi %c544_i32, %0 : i32
          %true_13 = arith.constant true
          %55 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%53) {fallthrough = false} : (i32) -> ()
        ^bb1(%56: i32):  // no predecessors
          %c1_i32 = arith.constant 1 : i32
          %57 = arith.addi %0, %c1_i32 : i32
          "simt_step.yield"(%57) {fallthrough = false} : (i32) -> ()
        ^bb2(%58: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
      ^bb1(%33: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %34 = arith.addi %c60_i32, %0 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_4 : i32
        %37 = "simt_step.if"(%36) ({
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) : (i32) -> ()
        }, {
          %c3_i32 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c560_i32 = arith.constant 560 : i32
        %38 = arith.addi %c560_i32, %0 : i32
        %true_5 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_6 = arith.constant true
        %c576_i32 = arith.constant 576 : i32
        %40 = arith.addi %c576_i32, %0 : i32
        %true_7 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %true_8 = arith.constant true
        %c592_i32 = arith.constant 592 : i32
        %43 = arith.addi %c592_i32, %0 : i32
        %true_9 = arith.constant true
        %44 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
      ^bb3(%45: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %46 = arith.addi %c64_i32, %0 : i32
        %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %48 = arith.cmpi ne, %47, %c0_i32_10 : i32
        %49 = "simt_step.if"(%48) ({
          %52 = simt_step.lane_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) : (i32) -> ()
        }, {
          %52 = simt_step.subgroup_id
          %53 = arith.index_cast %52 : index to i32
          "simt_step.yield"(%53) : (i32) -> ()
        }) : (i1) -> i32
        %c608_i32 = arith.constant 608 : i32
        %50 = arith.addi %c608_i32, %0 : i32
        %true_11 = arith.constant true
        %51 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %50, %51) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%49) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %c624_i32 = arith.constant 624 : i32
      %24 = arith.addi %c624_i32, %0 : i32
      %true_2 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb1(%26: i32):  // no predecessors
      %c68_i32 = arith.constant 68 : i32
      %27 = arith.addi %c68_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %29 = "simt_step.switch"(%28, %0) ({
      ^bb0(%arg3: i32):
        %c72_i32 = arith.constant 72 : i32
        %30 = arith.addi %c72_i32, %0 : i32
        %31 = "simt_step.buffer.load"(%arg1, %30) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_3 = arith.constant 0 : i32
        %32 = arith.cmpi ne, %31, %c0_i32_3 : i32
        %33 = "simt_step.if"(%32) ({
          %47 = simt_step.lane_id
          %48 = arith.index_cast %47 : index to i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %c3_i32_13 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_13) : (i32) -> ()
        }) : (i1) -> i32
        %c640_i32 = arith.constant 640 : i32
        %34 = arith.addi %c640_i32, %0 : i32
        %true_4 = arith.constant true
        %35 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %34, %35) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_5 = arith.constant true
        %c656_i32 = arith.constant 656 : i32
        %36 = arith.addi %c656_i32, %0 : i32
        %true_6 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%33) {fallthrough = false} : (i32) -> ()
      ^bb1(%38: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %39:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_13 = arith.constant 4 : i32
          %47 = arith.muli %arg5, %c4_i32_13 : i32
          %48 = arith.addi %47, %0 : i32
          %c76_i32 = arith.constant 76 : i32
          %49 = arith.addi %c76_i32, %48 : i32
          %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_14 = arith.constant 0 : i32
          %51 = arith.cmpi ne, %50, %c0_i32_14 : i32
          "simt_step.condition"(%51, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %47 = arith.addi %arg4, %arg5 : i32
          %c1_i32_13 = arith.constant 1 : i32
          %48 = arith.addi %arg5, %c1_i32_13 : i32
          %true_14 = arith.constant true
          %c672_i32 = arith.constant 672 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %49 = arith.muli %arg5, %c4_i32_15 : i32
          %50 = arith.addi %c672_i32, %49 : i32
          %51 = arith.addi %50, %0 : i32
          %true_16 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%47, %48) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        %true_9 = arith.constant true
        %c688_i32 = arith.constant 688 : i32
        %40 = arith.addi %c688_i32, %0 : i32
        %true_10 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39#0) {fallthrough = false} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c1_i32 = arith.constant 1 : i32
        %43 = arith.addi %0, %c1_i32 : i32
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb3(%44: i32):  // no predecessors
        %c3_i32 = arith.constant 3 : i32
        %true_11 = arith.constant true
        %c704_i32 = arith.constant 704 : i32
        %45 = arith.addi %c704_i32, %0 : i32
        %true_12 = arith.constant true
        %46 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %45, %46) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%c3_i32) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
    %c96_i32 = arith.constant 96 : i32
    %16 = arith.addi %c96_i32, %0 : i32
    %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
    %18 = simt_step.lane_id
    %19 = arith.index_cast %18 : index to i32
    %20 = "simt_step.switch"(%17, %19) ({
    ^bb0(%arg2: i32):
      %c100_i32 = arith.constant 100 : i32
      %21 = arith.addi %c100_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %23 = arith.cmpi ne, %22, %c0_i32_1 : i32
      %24 = "simt_step.if"(%23) ({
        %c104_i32 = arith.constant 104 : i32
        %42 = arith.addi %c104_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_9 : i32
        %45 = "simt_step.if"(%44) ({
          %c0_i32_11 = arith.constant 0 : i32
          %48 = arith.addi %0, %c0_i32_11 : i32
          "simt_step.yield"(%48) : (i32) -> ()
        }, {
          %48 = simt_step.subgroup_id
          %49 = arith.index_cast %48 : index to i32
          "simt_step.yield"(%49) : (i32) -> ()
        }) : (i1) -> i32
        %c720_i32 = arith.constant 720 : i32
        %46 = arith.addi %c720_i32, %0 : i32
        %true_10 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) : (i32) -> ()
      }, {
        "simt_step.yield"(%0) : (i32) -> ()
      }) : (i1) -> i32
      %c736_i32 = arith.constant 736 : i32
      %25 = arith.addi %c736_i32, %0 : i32
      %true_2 = arith.constant true
      %26 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %25, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_3 = arith.constant true
      %c752_i32 = arith.constant 752 : i32
      %27 = arith.addi %c752_i32, %0 : i32
      %true_4 = arith.constant true
      %28 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %27, %28) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%24) {fallthrough = false} : (i32) -> ()
    ^bb1(%29: i32):  // no predecessors
      %c3_i32 = arith.constant 3 : i32
      %30 = arith.addi %0, %c3_i32 : i32
      %true_5 = arith.constant true
      %c768_i32 = arith.constant 768 : i32
      %31 = arith.addi %c768_i32, %0 : i32
      %true_6 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    ^bb2(%33: i32):  // no predecessors
      "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
    ^bb3(%34: i32):  // no predecessors
      %c108_i32 = arith.constant 108 : i32
      %35 = arith.addi %c108_i32, %0 : i32
      %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
      %37 = simt_step.lane_id
      %38 = arith.index_cast %37 : index to i32
      %39 = "simt_step.switch"(%36, %38) ({
      ^bb0(%arg3: i32):
        %c112_i32 = arith.constant 112 : i32
        %42 = arith.addi %c112_i32, %0 : i32
        %43 = "simt_step.buffer.load"(%arg1, %42) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %44 = arith.cmpi ne, %43, %c0_i32_9 : i32
        %45 = "simt_step.if"(%44) ({
          %c0_i32_20 = arith.constant 0 : i32
          %61 = arith.addi %0, %c0_i32_20 : i32
          "simt_step.yield"(%61) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c784_i32 = arith.constant 784 : i32
        %46 = arith.addi %c784_i32, %0 : i32
        %true_10 = arith.constant true
        %47 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c800_i32 = arith.constant 800 : i32
        %48 = arith.addi %c800_i32, %0 : i32
        %true_12 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb1(%50: i32):  // no predecessors
        %c116_i32 = arith.constant 116 : i32
        %51 = arith.addi %c116_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_13 = arith.constant 4 : i32
        %53 = arith.addi %0, %c4_i32_13 : i32
        %54 = "simt_step.switch"(%52, %53) ({
        ^bb0(%arg4: i32):
          %c2_i32 = arith.constant 2 : i32
          %61 = arith.addi %0, %c2_i32 : i32
          %true_20 = arith.constant true
          %c816_i32 = arith.constant 816 : i32
          %62 = arith.addi %c816_i32, %0 : i32
          %true_21 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = true} : (i32) -> ()
        ^bb1(%64: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb2(%65: i32):  // no predecessors
          %66 = simt_step.lane_id
          %67 = arith.index_cast %66 : index to i32
          "simt_step.yield"(%67) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c832_i32 = arith.constant 832 : i32
        %55 = arith.addi %c832_i32, %0 : i32
        %true_15 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c848_i32 = arith.constant 848 : i32
        %57 = arith.addi %c848_i32, %0 : i32
        %true_17 = arith.constant true
        %58 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
      ^bb2(%59: i32):  // no predecessors
        %c0_i32_18 = arith.constant 0 : i32
        %c0_i32_19 = arith.constant 0 : i32
        %60:2 = "simt_step.loop"(%c0_i32_18, %c0_i32_19) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %61 = arith.muli %arg5, %c4_i32_20 : i32
          %62 = arith.addi %61, %0 : i32
          %c120_i32 = arith.constant 120 : i32
          %63 = arith.addi %c120_i32, %62 : i32
          %64 = "simt_step.buffer.load"(%arg1, %63) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_21 = arith.constant 0 : i32
          %65 = arith.cmpi ne, %64, %c0_i32_21 : i32
          "simt_step.condition"(%65, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %61 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %62 = arith.addi %arg5, %c1_i32 : i32
          %true_20 = arith.constant true
          %c864_i32 = arith.constant 864 : i32
          %c4_i32_21 = arith.constant 4 : i32
          %63 = arith.muli %arg5, %c4_i32_21 : i32
          %64 = arith.addi %c864_i32, %63 : i32
          %65 = arith.addi %64, %0 : i32
          %true_22 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61, %62) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%60#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      %true_7 = arith.constant true
      %c880_i32 = arith.constant 880 : i32
      %40 = arith.addi %c880_i32, %0 : i32
      %true_8 = arith.constant true
      %41 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%39) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
    return
  }
}

