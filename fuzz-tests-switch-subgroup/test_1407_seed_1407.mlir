module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %c2_i32 = arith.constant 2 : i32
    %1 = "simt_step.switch"(%0, %c2_i32) ({
    ^bb0(%arg4: i32):
      %4 = simt_step.subgroup_id
      %5 = arith.index_cast %4 : index to i32
      %6 = "simt_step.switch"(%arg3, %5) ({
      ^bb0(%arg5: i32):
        %true_3 = arith.constant true
        %12 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c0_i32_4 = arith.constant 0 : i32
        %13 = arith.addi %c0_i32_4, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %13, %12) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%12) {fallthrough = true} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c2_i32_5 = arith.constant 2 : i32
        %15 = arith.remsi %arg3, %c2_i32_5 : i32
        %16 = "simt_step.switch"(%15, %arg0) ({
        ^bb0(%arg6: i32):
          %true_7 = arith.constant true
          %19 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %20 = arith.addi %c16_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%19) {fallthrough = false} : (i32) -> ()
        ^bb1(%21: i32):  // no predecessors
          %true_8 = arith.constant true
          %22 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %23 = arith.addi %c32_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_6 = arith.constant true
        %17 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
        %c48_i32 = arith.constant 48 : i32
        %18 = arith.addi %c48_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %18, %17) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%16) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%6) {fallthrough = false} : (i32) -> ()
    ^bb1(%7: i32):  // no predecessors
      %c3_i32_0 = arith.constant 3 : i32
      %8 = arith.remsi %arg3, %c3_i32_0 : i32
      %c0_i32 = arith.constant 0 : i32
      %9 = "simt_step.switch"(%8, %c0_i32) ({
      ^bb0(%arg5: i32):
        %c3_i32_3 = arith.constant 3 : i32
        %12 = arith.remsi %arg3, %c3_i32_3 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %13 = "simt_step.switch"(%12, %c0_i32_4) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %24 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_11 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %27 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_12 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %30 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = true} : (i32) -> ()
        ^bb3(%31: i32):  // no predecessors
          %true_13 = arith.constant true
          %32 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %33 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %33, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%32) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
      ^bb1(%14: i32):  // no predecessors
        %c0_i32_5 = arith.constant 0 : i32
        %c0_i32_6 = arith.constant 0 : i32
        %15:2 = "simt_step.loop"(%c0_i32_5, %c0_i32_6) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %c4_i32 = arith.constant 4 : i32
          %24 = arith.muli %arg7, %c4_i32 : i32
          %25 = arith.addi %c128_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%23, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%15#0) {fallthrough = true} : (i32) -> ()
      ^bb2(%16: i32):  // no predecessors
        %c0_i32_7 = arith.constant 0 : i32
        %c0_i32_8 = arith.constant 0 : i32
        %17:2 = "simt_step.loop"(%c0_i32_7, %c0_i32_8) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32 = arith.constant 4 : i32
          %23 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %23, %c1_i32 : i32
          %25 = arith.cmpi slt, %arg7, %24 : i32
          "simt_step.condition"(%25, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_10 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c144_i32 = arith.constant 144 : i32
          %c4_i32 = arith.constant 4 : i32
          %24 = arith.muli %arg7, %c4_i32 : i32
          %25 = arith.addi %c144_i32, %24 : i32
          %26 = arith.addi %25, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %26, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %27 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%23, %27) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%17#0) {fallthrough = true} : (i32) -> ()
      ^bb3(%18: i32):  // no predecessors
        %c2_i32_9 = arith.constant 2 : i32
        %19 = arith.remsi %arg3, %c2_i32_9 : i32
        %20 = simt_step.lane_id
        %21 = arith.index_cast %20 : index to i32
        %22 = "simt_step.switch"(%19, %21) ({
        ^bb0(%arg6: i32):
          %true_10 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %24 = arith.addi %c160_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_11 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c176_i32 = arith.constant 176 : i32
          %27 = arith.addi %c176_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = true} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_12 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          %c192_i32 = arith.constant 192 : i32
          %30 = arith.addi %c192_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 2 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%9) {fallthrough = false} : (i32) -> ()
    ^bb2(%10: i32):  // no predecessors
      %c0_i32_1 = arith.constant 0 : i32
      %c0_i32_2 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
      ^bb0(%arg5: i32, %arg6: i32):
        %c4_i32 = arith.constant 4 : i32
        %12 = arith.remsi %arg3, %c4_i32 : i32
        %c1_i32 = arith.constant 1 : i32
        %13 = arith.addi %12, %c1_i32 : i32
        %14 = arith.cmpi slt, %arg6, %13 : i32
        "simt_step.condition"(%14, %arg5, %arg6) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg5: i32, %arg6: i32):
        %c0_i32_3 = arith.constant 0 : i32
        %12 = arith.cmpi ne, %arg2, %c0_i32_3 : i32
        %13 = "simt_step.if"(%12) ({
          %true_4 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32 : i32
          %17 = arith.addi %c208_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }, {
          %true_4 = arith.constant true
          %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %c4_i32 = arith.constant 4 : i32
          %16 = arith.muli %arg6, %c4_i32 : i32
          %17 = arith.addi %c224_i32, %16 : i32
          %18 = arith.addi %17, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %18, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%15) : (i32) -> ()
        }) : (i1) -> i32
        %c1_i32 = arith.constant 1 : i32
        %14 = arith.addi %arg6, %c1_i32 : i32
        "simt_step.break"(%13, %14) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %2 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
    %c240_i32 = arith.constant 240 : i32
    %3 = arith.addi %c240_i32, %arg0 : i32
    "simt_step.buffer.store"(%arg1, %3, %2) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
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
    %c3_i32 = arith.constant 3 : i32
    %7 = "simt_step.switch"(%6, %c3_i32) ({
    ^bb0(%arg2: i32):
      %c12_i32 = arith.constant 12 : i32
      %8 = arith.addi %c12_i32, %0 : i32
      %9 = "simt_step.buffer.load"(%arg1, %8) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_0 = arith.constant 0 : i32
      %10 = arith.addi %0, %c0_i32_0 : i32
      %11 = "simt_step.switch"(%9, %10) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %35 = arith.addi %c16_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %37 = "simt_step.switch"(%36, %0) ({
        ^bb0(%arg4: i32):
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          %true_12 = arith.constant true
          %c256_i32 = arith.constant 256 : i32
          %51 = arith.addi %c256_i32, %0 : i32
          %true_13 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = true} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_8 = arith.constant true
        %c272_i32 = arith.constant 272 : i32
        %38 = arith.addi %c272_i32, %0 : i32
        %true_9 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %41 = arith.addi %c20_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %43 = simt_step.subgroup_id
        %44 = arith.index_cast %43 : index to i32
        %45 = "simt_step.switch"(%42, %44) ({
        ^bb0(%arg4: i32):
          %49 = simt_step.subgroup_id
          %50 = arith.index_cast %49 : index to i32
          %true_12 = arith.constant true
          %c288_i32 = arith.constant 288 : i32
          %51 = arith.addi %c288_i32, %0 : i32
          %true_13 = arith.constant true
          %52 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %51, %52) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%50) {fallthrough = false} : (i32) -> ()
        ^bb1(%53: i32):  // no predecessors
          %54 = simt_step.subgroup_id
          %55 = arith.index_cast %54 : index to i32
          %true_14 = arith.constant true
          %c304_i32 = arith.constant 304 : i32
          %56 = arith.addi %c304_i32, %0 : i32
          %true_15 = arith.constant true
          %57 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %56, %57) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%55) {fallthrough = false} : (i32) -> ()
        ^bb2(%58: i32):  // no predecessors
          %59 = simt_step.lane_id
          %60 = arith.index_cast %59 : index to i32
          %true_16 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %61 = arith.addi %c320_i32, %0 : i32
          %true_17 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb3(%63: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %true_10 = arith.constant true
        %c336_i32 = arith.constant 336 : i32
        %47 = arith.addi %c336_i32, %0 : i32
        %true_11 = arith.constant true
        %48 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %47, %48) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%11) {fallthrough = false} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c24_i32 = arith.constant 24 : i32
      %13 = arith.addi %c24_i32, %0 : i32
      %14 = "simt_step.buffer.load"(%arg1, %13) : (!simt_step.resource<Global, i32>, i32) -> i32
      %15 = simt_step.lane_id
      %16 = arith.index_cast %15 : index to i32
      %17 = "simt_step.switch"(%14, %16) ({
      ^bb0(%arg3: i32):
        %35 = simt_step.subgroup_id
        %36 = arith.index_cast %35 : index to i32
        %true_8 = arith.constant true
        %c352_i32 = arith.constant 352 : i32
        %37 = arith.addi %c352_i32, %0 : i32
        %true_9 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) {fallthrough = false} : (i32) -> ()
      ^bb1(%39: i32):  // no predecessors
        %c28_i32 = arith.constant 28 : i32
        %40 = arith.addi %c28_i32, %0 : i32
        %41 = "simt_step.buffer.load"(%arg1, %40) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c4_i32_10 = arith.constant 4 : i32
        %42 = arith.addi %0, %c4_i32_10 : i32
        %43 = "simt_step.switch"(%41, %42) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          %true_18 = arith.constant true
          %c368_i32 = arith.constant 368 : i32
          %59 = arith.addi %c368_i32, %0 : i32
          %true_19 = arith.constant true
          %60 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %59, %60) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb1(%61: i32):  // no predecessors
          %c4_i32_20 = arith.constant 4 : i32
          %true_21 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %62 = arith.addi %c384_i32, %0 : i32
          %true_22 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c4_i32_20) {fallthrough = false} : (i32) -> ()
        ^bb2(%64: i32):  // no predecessors
          %c3_i32_23 = arith.constant 3 : i32
          %true_24 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %65 = arith.addi %c400_i32, %0 : i32
          %true_25 = arith.constant true
          %66 = "simt_step.wave_count_bits"(%true_25) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %65, %66) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c3_i32_23) {fallthrough = false} : (i32) -> ()
        ^bb3(%67: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_11 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %44 = arith.addi %c416_i32, %0 : i32
        %true_12 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c3_i32_13 = arith.constant 3 : i32
        %47 = arith.addi %0, %c3_i32_13 : i32
        "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
      ^bb3(%48: i32):  // no predecessors
        %c32_i32 = arith.constant 32 : i32
        %49 = arith.addi %c32_i32, %0 : i32
        %50 = "simt_step.buffer.load"(%arg1, %49) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_14 = arith.constant 0 : i32
        %51 = arith.cmpi ne, %50, %c0_i32_14 : i32
        %52 = "simt_step.if"(%51) ({
          %c0_i32_18 = arith.constant 0 : i32
          %57 = arith.addi %0, %c0_i32_18 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %53 = arith.addi %c432_i32, %0 : i32
        %true_15 = arith.constant true
        %54 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %53, %54) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_16 = arith.constant true
        %c448_i32 = arith.constant 448 : i32
        %55 = arith.addi %c448_i32, %0 : i32
        %true_17 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%52) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
      %true = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %18 = arith.addi %c464_i32, %0 : i32
      %true_1 = arith.constant true
      %19 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %18, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%17) {fallthrough = false} : (i32) -> ()
    ^bb2(%20: i32):  // no predecessors
      %c36_i32 = arith.constant 36 : i32
      %21 = arith.addi %c36_i32, %0 : i32
      %22 = "simt_step.buffer.load"(%arg1, %21) : (!simt_step.resource<Global, i32>, i32) -> i32
      %23 = "simt_step.switch"(%22, %0) ({
      ^bb0(%arg3: i32):
        %c0_i32_8 = arith.constant 0 : i32
        %c0_i32_9 = arith.constant 0 : i32
        %35:2 = "simt_step.loop"(%c0_i32_8, %c0_i32_9) ({
        ^bb0(%arg4: i32, %arg5: i32):
          %c4_i32_12 = arith.constant 4 : i32
          %44 = arith.muli %arg5, %c4_i32_12 : i32
          %45 = arith.addi %44, %0 : i32
          %c40_i32 = arith.constant 40 : i32
          %46 = arith.addi %c40_i32, %45 : i32
          %47 = "simt_step.buffer.load"(%arg1, %46) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_13 = arith.constant 0 : i32
          %48 = arith.cmpi ne, %47, %c0_i32_13 : i32
          "simt_step.condition"(%48, %arg4, %arg5) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg4: i32, %arg5: i32):
          %44 = arith.addi %arg4, %arg5 : i32
          %c1_i32 = arith.constant 1 : i32
          %45 = arith.addi %arg5, %c1_i32 : i32
          %true_12 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %46 = arith.muli %arg5, %c4_i32_13 : i32
          %47 = arith.addi %c480_i32, %46 : i32
          %48 = arith.addi %47, %0 : i32
          %true_14 = arith.constant true
          %49 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%44, %45) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%35#0) {fallthrough = true} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c60_i32 = arith.constant 60 : i32
        %37 = arith.addi %c60_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %39 = simt_step.lane_id
        %40 = arith.index_cast %39 : index to i32
        %41 = "simt_step.switch"(%38, %40) ({
        ^bb0(%arg4: i32):
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb1(%44: i32):  // no predecessors
          %c2_i32 = arith.constant 2 : i32
          %45 = arith.addi %0, %c2_i32 : i32
          %true_12 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %46 = arith.addi %c496_i32, %0 : i32
          %true_13 = arith.constant true
          %47 = "simt_step.wave_count_bits"(%true_13) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %46, %47) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%45) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_10 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %42 = arith.addi %c512_i32, %0 : i32
        %true_11 = arith.constant true
        %43 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %42, %43) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%41) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
      %true_2 = arith.constant true
      %c528_i32 = arith.constant 528 : i32
      %24 = arith.addi %c528_i32, %0 : i32
      %true_3 = arith.constant true
      %25 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %24, %25) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%23) {fallthrough = false} : (i32) -> ()
    ^bb3(%26: i32):  // no predecessors
      %c64_i32 = arith.constant 64 : i32
      %27 = arith.addi %c64_i32, %0 : i32
      %28 = "simt_step.buffer.load"(%arg1, %27) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_4 = arith.constant 0 : i32
      %29 = arith.cmpi ne, %28, %c0_i32_4 : i32
      %30 = "simt_step.if"(%29) ({
        %c68_i32 = arith.constant 68 : i32
        %35 = arith.addi %c68_i32, %0 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_8 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_8 : i32
        %38 = "simt_step.if"(%37) ({
          %c0_i32_10 = arith.constant 0 : i32
          "simt_step.yield"(%c0_i32_10) : (i32) -> ()
        }, {
          %c4_i32_10 = arith.constant 4 : i32
          "simt_step.yield"(%c4_i32_10) : (i32) -> ()
        }) : (i1) -> i32
        %c544_i32 = arith.constant 544 : i32
        %39 = arith.addi %c544_i32, %0 : i32
        %true_9 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%38) : (i32) -> ()
      }, {
        %c2_i32 = arith.constant 2 : i32
        "simt_step.yield"(%c2_i32) : (i32) -> ()
      }) : (i1) -> i32
      %c560_i32 = arith.constant 560 : i32
      %31 = arith.addi %c560_i32, %0 : i32
      %true_5 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_6 = arith.constant true
      %c576_i32 = arith.constant 576 : i32
      %33 = arith.addi %c576_i32, %0 : i32
      %true_7 = arith.constant true
      %34 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %33, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%30) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
    return
  }
}

