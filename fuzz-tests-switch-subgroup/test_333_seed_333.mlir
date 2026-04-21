module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %c3_i32 = arith.constant 3 : i32
    %0 = arith.remsi %arg3, %c3_i32 : i32
    %1 = simt_step.subgroup_id
    %2 = arith.index_cast %1 : index to i32
    %3 = "simt_step.switch"(%0, %2) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %4 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %5 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %5, %4) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%4) {fallthrough = false} : (i32) -> ()
    ^bb1(%6: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %7 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %8 = "simt_step.if"(%7) ({
        %c0_i32_3 = arith.constant 0 : i32
        %c0_i32_4 = arith.constant 0 : i32
        %19:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32_5 = arith.constant 4 : i32
          %20 = arith.remsi %arg3, %c4_i32_5 : i32
          %c1_i32 = arith.constant 1 : i32
          %21 = arith.addi %20, %c1_i32 : i32
          %22 = arith.cmpi slt, %arg6, %21 : i32
          "simt_step.condition"(%22, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_5 = arith.constant true
          %20 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32_6 = arith.constant 4 : i32
          %21 = arith.muli %arg6, %c4_i32_6 : i32
          %22 = arith.addi %c16_i32, %21 : i32
          %23 = arith.addi %22, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %23, %20) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %24 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.continue"(%20, %24) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%19#0) : (i32) -> ()
      }, {
        %true_3 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c32_i32 = arith.constant 32 : i32
        %20 = arith.addi %c32_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%8) {fallthrough = false} : (i32) -> ()
    ^bb2(%9: i32):  // no predecessors
      %c4_i32 = arith.constant 4 : i32
      %10 = arith.remsi %arg3, %c4_i32 : i32
      %11 = simt_step.subgroup_id
      %12 = arith.index_cast %11 : index to i32
      %13 = "simt_step.switch"(%10, %12) ({
      ^bb0(%arg5: i32):
        %c4_i32_3 = arith.constant 4 : i32
        %19 = arith.remsi %arg3, %c4_i32_3 : i32
        %20 = simt_step.lane_id
        %21 = arith.index_cast %20 : index to i32
        %22 = "simt_step.switch"(%19, %21) ({
        ^bb0(%arg6: i32):
          %true_8 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c48_i32 = arith.constant 48 : i32
          %32 = arith.addi %c48_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) {fallthrough = false} : (i32) -> ()
        ^bb1(%33: i32):  // no predecessors
          %true_9 = arith.constant true
          %34 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
          %c64_i32 = arith.constant 64 : i32
          %35 = arith.addi %c64_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %35, %34) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34) {fallthrough = true} : (i32) -> ()
        ^bb2(%36: i32):  // no predecessors
          %true_10 = arith.constant true
          %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
          %c80_i32 = arith.constant 80 : i32
          %38 = arith.addi %c80_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %38, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%37) {fallthrough = true} : (i32) -> ()
        ^bb3(%39: i32):  // no predecessors
          %true_11 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
          %c96_i32 = arith.constant 96 : i32
          %41 = arith.addi %c96_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %41, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%40) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) {fallthrough = false} : (i32) -> ()
      ^bb1(%23: i32):  // no predecessors
        %c0_i32_4 = arith.constant 0 : i32
        %24 = arith.cmpi ne, %arg2, %c0_i32_4 : i32
        %25 = "simt_step.if"(%24) ({
          %true_8 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c112_i32 = arith.constant 112 : i32
          %32 = arith.addi %c112_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }, {
          %true_8 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c128_i32 = arith.constant 128 : i32
          %32 = arith.addi %c128_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %32, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%31) : (i32) -> ()
        }) : (i1) -> i32
        "simt_step.yield"(%25) {fallthrough = false} : (i32) -> ()
      ^bb2(%26: i32):  // no predecessors
        %true_5 = arith.constant true
        %27 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
        %c144_i32 = arith.constant 144 : i32
        %28 = arith.addi %c144_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %28, %27) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%27) {fallthrough = false} : (i32) -> ()
      ^bb3(%29: i32):  // no predecessors
        %c0_i32_6 = arith.constant 0 : i32
        %c0_i32_7 = arith.constant 0 : i32
        %30:2 = "simt_step.loop"(%c0_i32_6, %c0_i32_7) ({
        ^bb0(%arg6: i32, %arg7: i32):
          %c4_i32_8 = arith.constant 4 : i32
          %31 = arith.remsi %arg3, %c4_i32_8 : i32
          %c1_i32 = arith.constant 1 : i32
          %32 = arith.addi %31, %c1_i32 : i32
          %33 = arith.cmpi slt, %arg7, %32 : i32
          "simt_step.condition"(%33, %arg6, %arg7) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg6: i32, %arg7: i32):
          %true_8 = arith.constant true
          %31 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
          %c160_i32 = arith.constant 160 : i32
          %c4_i32_9 = arith.constant 4 : i32
          %32 = arith.muli %arg7, %c4_i32_9 : i32
          %33 = arith.addi %c160_i32, %32 : i32
          %34 = arith.addi %33, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %34, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %35 = arith.addi %arg7, %c1_i32 : i32
          "simt_step.yield"(%31, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%30#0) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 3 : i64} : (i32, i32) -> i32
      %true_1 = arith.constant true
      %14 = "simt_step.wave_count_bits"(%true_1) : (i1) -> i32
      %c176_i32 = arith.constant 176 : i32
      %15 = arith.addi %c176_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %15, %14) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13) {fallthrough = false} : (i32) -> ()
    ^bb3(%16: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %17 = arith.cmpi ne, %arg2, %c0_i32_2 : i32
      %18 = "simt_step.if"(%17) ({
        %true_3 = arith.constant true
        %19 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
        %c192_i32 = arith.constant 192 : i32
        %20 = arith.addi %c192_i32, %arg0 : i32
        "simt_step.buffer.store"(%arg1, %20, %19) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%19) : (i32) -> ()
      }, {
        %c3_i32_3 = arith.constant 3 : i32
        %19 = arith.remsi %arg3, %c3_i32_3 : i32
        %20 = simt_step.lane_id
        %21 = arith.index_cast %20 : index to i32
        %22 = "simt_step.switch"(%19, %21) ({
        ^bb0(%arg5: i32):
          %true_4 = arith.constant true
          %23 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
          %c208_i32 = arith.constant 208 : i32
          %24 = arith.addi %c208_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %24, %23) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%23) {fallthrough = true} : (i32) -> ()
        ^bb1(%25: i32):  // no predecessors
          %true_5 = arith.constant true
          %26 = "simt_step.wave_count_bits"(%true_5) : (i1) -> i32
          %c224_i32 = arith.constant 224 : i32
          %27 = arith.addi %c224_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %27, %26) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%26) {fallthrough = false} : (i32) -> ()
        ^bb2(%28: i32):  // no predecessors
          %true_6 = arith.constant true
          %29 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
          %c240_i32 = arith.constant 240 : i32
          %30 = arith.addi %c240_i32, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %30, %29) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%22) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%18) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
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
    %c2_i32 = arith.constant 2 : i32
    %5 = arith.addi %0, %c2_i32 : i32
    %c8_i32 = arith.constant 8 : i32
    %6 = arith.addi %c8_i32, %0 : i32
    %7 = "simt_step.buffer.load"(%arg1, %6) : (!simt_step.resource<Global, i32>, i32) -> i32
    %8 = simt_step.subgroup_id
    %9 = arith.index_cast %8 : index to i32
    %10 = "simt_step.switch"(%7, %9) ({
    ^bb0(%arg2: i32):
      %c0_i32_0 = arith.constant 0 : i32
      %c0_i32_1 = arith.constant 0 : i32
      %11:2 = "simt_step.loop"(%c0_i32_0, %c0_i32_1) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_12 : i32
        %33 = arith.addi %32, %0 : i32
        %c12_i32 = arith.constant 12 : i32
        %34 = arith.addi %c12_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_13 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %32 = arith.addi %arg3, %arg4 : i32
        %c1_i32 = arith.constant 1 : i32
        %33 = arith.addi %arg4, %c1_i32 : i32
        %true_12 = arith.constant true
        %c256_i32 = arith.constant 256 : i32
        %c4_i32_13 = arith.constant 4 : i32
        %34 = arith.muli %arg4, %c4_i32_13 : i32
        %35 = arith.addi %c256_i32, %34 : i32
        %36 = arith.addi %35, %0 : i32
        %true_14 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%32, %33) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%11#0) {fallthrough = true} : (i32) -> ()
    ^bb1(%12: i32):  // no predecessors
      %c0_i32_2 = arith.constant 0 : i32
      %c0_i32_3 = arith.constant 0 : i32
      %13:2 = "simt_step.loop"(%c0_i32_2, %c0_i32_3) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_12 = arith.constant 4 : i32
        %32 = arith.muli %arg4, %c4_i32_12 : i32
        %33 = arith.addi %32, %0 : i32
        %c32_i32 = arith.constant 32 : i32
        %34 = arith.addi %c32_i32, %33 : i32
        %35 = "simt_step.buffer.load"(%arg1, %34) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_13 = arith.constant 0 : i32
        %36 = arith.cmpi ne, %35, %c0_i32_13 : i32
        "simt_step.condition"(%36, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %c52_i32 = arith.constant 52 : i32
        %32 = arith.addi %c52_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %0, %c1_i32 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg5: i32):
          %c2_i32_16 = arith.constant 2 : i32
          %42 = arith.addi %0, %c2_i32_16 : i32
          %true_17 = arith.constant true
          %c272_i32 = arith.constant 272 : i32
          %43 = arith.addi %c272_i32, %0 : i32
          %true_18 = arith.constant true
          %44 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %43, %44) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%42) {fallthrough = false} : (i32) -> ()
        ^bb1(%45: i32):  // no predecessors
          %46 = simt_step.lane_id
          %47 = arith.index_cast %46 : index to i32
          "simt_step.yield"(%47) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %36 = arith.addi %arg3, %35 : i32
        %c1_i32_12 = arith.constant 1 : i32
        %37 = arith.addi %arg4, %c1_i32_12 : i32
        %true_13 = arith.constant true
        %c288_i32 = arith.constant 288 : i32
        %c4_i32_14 = arith.constant 4 : i32
        %38 = arith.muli %arg4, %c4_i32_14 : i32
        %39 = arith.addi %c288_i32, %38 : i32
        %40 = arith.addi %39, %0 : i32
        %true_15 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36, %37) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      %true = arith.constant true
      %c304_i32 = arith.constant 304 : i32
      %14 = arith.addi %c304_i32, %0 : i32
      %true_4 = arith.constant true
      %15 = "simt_step.wave_count_bits"(%true_4) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %14, %15) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%13#0) {fallthrough = false} : (i32) -> ()
    ^bb2(%16: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %17 = arith.addi %c56_i32, %0 : i32
      %18 = "simt_step.buffer.load"(%arg1, %17) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c2_i32_5 = arith.constant 2 : i32
      %19 = arith.addi %0, %c2_i32_5 : i32
      %20 = "simt_step.switch"(%18, %19) ({
      ^bb0(%arg3: i32):
        %c60_i32 = arith.constant 60 : i32
        %32 = arith.addi %c60_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c1_i32 = arith.constant 1 : i32
        %34 = arith.addi %0, %c1_i32 : i32
        %35 = "simt_step.switch"(%33, %34) ({
        ^bb0(%arg4: i32):
          %c3_i32 = arith.constant 3 : i32
          %57 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%57) {fallthrough = true} : (i32) -> ()
        ^bb1(%58: i32):  // no predecessors
          %59 = simt_step.subgroup_id
          %60 = arith.index_cast %59 : index to i32
          %true_19 = arith.constant true
          %c320_i32 = arith.constant 320 : i32
          %61 = arith.addi %c320_i32, %0 : i32
          %true_20 = arith.constant true
          %62 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %61, %62) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%60) {fallthrough = true} : (i32) -> ()
        ^bb2(%63: i32):  // no predecessors
          %64 = simt_step.subgroup_id
          %65 = arith.index_cast %64 : index to i32
          %true_21 = arith.constant true
          %c336_i32 = arith.constant 336 : i32
          %66 = arith.addi %c336_i32, %0 : i32
          %true_22 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%65) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        "simt_step.yield"(%35) {fallthrough = true} : (i32) -> ()
      ^bb1(%36: i32):  // no predecessors
        %c64_i32 = arith.constant 64 : i32
        %37 = arith.addi %c64_i32, %0 : i32
        %38 = "simt_step.buffer.load"(%arg1, %37) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c2_i32_12 = arith.constant 2 : i32
        %39 = "simt_step.switch"(%38, %c2_i32_12) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = true} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          %true_19 = arith.constant true
          %c352_i32 = arith.constant 352 : i32
          %62 = arith.addi %c352_i32, %0 : i32
          %true_20 = arith.constant true
          %63 = "simt_step.wave_count_bits"(%true_20) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %62, %63) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c368_i32 = arith.constant 368 : i32
        %40 = arith.addi %c368_i32, %0 : i32
        %true_14 = arith.constant true
        %41 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%39) {fallthrough = true} : (i32) -> ()
      ^bb2(%42: i32):  // no predecessors
        %c68_i32 = arith.constant 68 : i32
        %43 = arith.addi %c68_i32, %0 : i32
        %44 = "simt_step.buffer.load"(%arg1, %43) : (!simt_step.resource<Global, i32>, i32) -> i32
        %45 = simt_step.subgroup_id
        %46 = arith.index_cast %45 : index to i32
        %47 = "simt_step.switch"(%44, %46) ({
        ^bb0(%arg4: i32):
          %57 = simt_step.lane_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          %c1_i32_19 = arith.constant 1 : i32
          %true_20 = arith.constant true
          %c384_i32 = arith.constant 384 : i32
          %63 = arith.addi %c384_i32, %0 : i32
          %true_21 = arith.constant true
          %64 = "simt_step.wave_count_bits"(%true_21) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %63, %64) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c1_i32_19) {fallthrough = false} : (i32) -> ()
        ^bb3(%65: i32):  // no predecessors
          %c0_i32_22 = arith.constant 0 : i32
          %true_23 = arith.constant true
          %c400_i32 = arith.constant 400 : i32
          %66 = arith.addi %c400_i32, %0 : i32
          %true_24 = arith.constant true
          %67 = "simt_step.wave_count_bits"(%true_24) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %66, %67) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c0_i32_22) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_15 = arith.constant true
        %c416_i32 = arith.constant 416 : i32
        %48 = arith.addi %c416_i32, %0 : i32
        %true_16 = arith.constant true
        %49 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %48, %49) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%47) {fallthrough = true} : (i32) -> ()
      ^bb3(%50: i32):  // no predecessors
        %c72_i32 = arith.constant 72 : i32
        %51 = arith.addi %c72_i32, %0 : i32
        %52 = "simt_step.buffer.load"(%arg1, %51) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_17 = arith.constant 0 : i32
        %53 = arith.cmpi ne, %52, %c0_i32_17 : i32
        %54 = "simt_step.if"(%53) ({
          %c3_i32 = arith.constant 3 : i32
          %57 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%57) : (i32) -> ()
        }, {
          %57 = simt_step.subgroup_id
          %58 = arith.index_cast %57 : index to i32
          "simt_step.yield"(%58) : (i32) -> ()
        }) : (i1) -> i32
        %c432_i32 = arith.constant 432 : i32
        %55 = arith.addi %c432_i32, %0 : i32
        %true_18 = arith.constant true
        %56 = "simt_step.wave_count_bits"(%true_18) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %55, %56) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%54) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
      %true_6 = arith.constant true
      %c448_i32 = arith.constant 448 : i32
      %21 = arith.addi %c448_i32, %0 : i32
      %true_7 = arith.constant true
      %22 = "simt_step.wave_count_bits"(%true_7) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %21, %22) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_8 = arith.constant true
      %c464_i32 = arith.constant 464 : i32
      %23 = arith.addi %c464_i32, %0 : i32
      %true_9 = arith.constant true
      %24 = "simt_step.wave_count_bits"(%true_9) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %23, %24) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%20) {fallthrough = true} : (i32) -> ()
    ^bb3(%25: i32):  // no predecessors
      %c76_i32 = arith.constant 76 : i32
      %26 = arith.addi %c76_i32, %0 : i32
      %27 = "simt_step.buffer.load"(%arg1, %26) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_10 = arith.constant 0 : i32
      %28 = arith.cmpi ne, %27, %c0_i32_10 : i32
      %29 = "simt_step.if"(%28) ({
        %c0_i32_12 = arith.constant 0 : i32
        %c0_i32_13 = arith.constant 0 : i32
        %32:2 = "simt_step.loop"(%c0_i32_12, %c0_i32_13) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_14 = arith.constant 4 : i32
          %33 = arith.muli %arg4, %c4_i32_14 : i32
          %34 = arith.addi %33, %0 : i32
          %c80_i32 = arith.constant 80 : i32
          %35 = arith.addi %c80_i32, %34 : i32
          %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_15 = arith.constant 0 : i32
          %37 = arith.cmpi ne, %36, %c0_i32_15 : i32
          "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %33 = arith.addi %arg3, %arg4 : i32
          %c1_i32 = arith.constant 1 : i32
          %34 = arith.addi %arg4, %c1_i32 : i32
          %true_14 = arith.constant true
          %c480_i32 = arith.constant 480 : i32
          %c4_i32_15 = arith.constant 4 : i32
          %35 = arith.muli %arg4, %c4_i32_15 : i32
          %36 = arith.addi %c480_i32, %35 : i32
          %37 = arith.addi %36, %0 : i32
          %true_16 = arith.constant true
          %38 = "simt_step.wave_count_bits"(%true_16) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%33, %34) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%32#0) : (i32) -> ()
      }, {
        %c100_i32 = arith.constant 100 : i32
        %32 = arith.addi %c100_i32, %0 : i32
        %33 = "simt_step.buffer.load"(%arg1, %32) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_12 = arith.constant 0 : i32
        %34 = "simt_step.switch"(%33, %c0_i32_12) ({
        ^bb0(%arg3: i32):
          %c3_i32 = arith.constant 3 : i32
          %37 = arith.addi %0, %c3_i32 : i32
          "simt_step.yield"(%37) {fallthrough = false} : (i32) -> ()
        ^bb1(%38: i32):  // no predecessors
          %c2_i32_15 = arith.constant 2 : i32
          %true_16 = arith.constant true
          %c496_i32 = arith.constant 496 : i32
          %39 = arith.addi %c496_i32, %0 : i32
          %true_17 = arith.constant true
          %40 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%c2_i32_15) {fallthrough = true} : (i32) -> ()
        ^bb2(%41: i32):  // no predecessors
          %42 = simt_step.lane_id
          %43 = arith.index_cast %42 : index to i32
          "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_13 = arith.constant true
        %c512_i32 = arith.constant 512 : i32
        %35 = arith.addi %c512_i32, %0 : i32
        %true_14 = arith.constant true
        %36 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %35, %36) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%34) : (i32) -> ()
      }) : (i1) -> i32
      %c528_i32 = arith.constant 528 : i32
      %30 = arith.addi %c528_i32, %0 : i32
      %true_11 = arith.constant true
      %31 = "simt_step.wave_count_bits"(%true_11) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %30, %31) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%29) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    return
  }
}

