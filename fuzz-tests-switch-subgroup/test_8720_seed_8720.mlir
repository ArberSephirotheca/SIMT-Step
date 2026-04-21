module {
  func.func @helper0(%arg0: i32, %arg1: !simt_step.resource<Global, i32>, %arg2: i32, %arg3: i32) {
    %0 = simt_step.subgroup_id
    %1 = arith.index_cast %0 : index to i32
    %2 = "simt_step.switch"(%arg3, %1) ({
    ^bb0(%arg4: i32):
      %true = arith.constant true
      %3 = "simt_step.wave_count_bits"(%true) : (i1) -> i32
      %c0_i32 = arith.constant 0 : i32
      %4 = arith.addi %c0_i32, %arg0 : i32
      "simt_step.buffer.store"(%arg1, %4, %3) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%3) {fallthrough = false} : (i32) -> ()
    ^bb1(%5: i32):  // no predecessors
      %c0_i32_0 = arith.constant 0 : i32
      %6 = arith.cmpi ne, %arg2, %c0_i32_0 : i32
      %7 = "simt_step.if"(%6) ({
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32 : i32
          %11 = arith.cmpi slt, %arg6, %10 : i32
          "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_3 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c16_i32 = arith.constant 16 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg6, %c4_i32 : i32
          %11 = arith.addi %c16_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) : (i32) -> ()
      }, {
        %c0_i32_1 = arith.constant 0 : i32
        %c0_i32_2 = arith.constant 0 : i32
        %8:2 = "simt_step.loop"(%c0_i32_1, %c0_i32_2) ({
        ^bb0(%arg5: i32, %arg6: i32):
          %c4_i32 = arith.constant 4 : i32
          %9 = arith.remsi %arg3, %c4_i32 : i32
          %c1_i32 = arith.constant 1 : i32
          %10 = arith.addi %9, %c1_i32 : i32
          %11 = arith.cmpi slt, %arg6, %10 : i32
          "simt_step.condition"(%11, %arg5, %arg6) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg5: i32, %arg6: i32):
          %true_3 = arith.constant true
          %9 = "simt_step.wave_count_bits"(%true_3) : (i1) -> i32
          %c32_i32 = arith.constant 32 : i32
          %c4_i32 = arith.constant 4 : i32
          %10 = arith.muli %arg6, %c4_i32 : i32
          %11 = arith.addi %c32_i32, %10 : i32
          %12 = arith.addi %11, %arg0 : i32
          "simt_step.buffer.store"(%arg1, %12, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          %c1_i32 = arith.constant 1 : i32
          %13 = arith.addi %arg6, %c1_i32 : i32
          "simt_step.yield"(%9, %13) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%8#0) : (i32) -> ()
      }) : (i1) -> i32
      "simt_step.yield"(%7) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
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
      %10 = arith.addi %c12_i32, %0 : i32
      %11 = "simt_step.buffer.load"(%arg1, %10) : (!simt_step.resource<Global, i32>, i32) -> i32
      %12 = simt_step.subgroup_id
      %13 = arith.index_cast %12 : index to i32
      %14 = "simt_step.switch"(%11, %13) ({
      ^bb0(%arg3: i32):
        %c16_i32 = arith.constant 16 : i32
        %33 = arith.addi %c16_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32 = arith.constant 3 : i32
        %35 = "simt_step.switch"(%34, %c3_i32) ({
        ^bb0(%arg4: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %56 = arith.addi %0, %c4_i32_20 : i32
          %true_21 = arith.constant true
          %c48_i32 = arith.constant 48 : i32
          %57 = arith.addi %c48_i32, %0 : i32
          %true_22 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %60 = simt_step.subgroup_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c64_i32 = arith.constant 64 : i32
        %36 = arith.addi %c64_i32, %0 : i32
        %true_10 = arith.constant true
        %37 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %36, %37) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_11 = arith.constant true
        %c80_i32 = arith.constant 80 : i32
        %38 = arith.addi %c80_i32, %0 : i32
        %true_12 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%35) {fallthrough = false} : (i32) -> ()
      ^bb1(%40: i32):  // no predecessors
        %c20_i32 = arith.constant 20 : i32
        %41 = arith.addi %c20_i32, %0 : i32
        %42 = "simt_step.buffer.load"(%arg1, %41) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c3_i32_13 = arith.constant 3 : i32
        %43 = "simt_step.switch"(%42, %c3_i32_13) ({
        ^bb0(%arg4: i32):
          %c3_i32_20 = arith.constant 3 : i32
          %56 = arith.addi %0, %c3_i32_20 : i32
          %true_21 = arith.constant true
          %c96_i32 = arith.constant 96 : i32
          %57 = arith.addi %c96_i32, %0 : i32
          %true_22 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %60 = simt_step.lane_id
          %61 = arith.index_cast %60 : index to i32
          "simt_step.yield"(%61) {fallthrough = false} : (i32) -> ()
        ^bb2(%62: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1>, default_index = 0 : i64} : (i32, i32) -> i32
        %true_14 = arith.constant true
        %c112_i32 = arith.constant 112 : i32
        %44 = arith.addi %c112_i32, %0 : i32
        %true_15 = arith.constant true
        %45 = "simt_step.wave_count_bits"(%true_15) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %44, %45) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%43) {fallthrough = false} : (i32) -> ()
      ^bb2(%46: i32):  // no predecessors
        %c24_i32 = arith.constant 24 : i32
        %47 = arith.addi %c24_i32, %0 : i32
        %48 = "simt_step.buffer.load"(%arg1, %47) : (!simt_step.resource<Global, i32>, i32) -> i32
        %49 = simt_step.subgroup_id
        %50 = arith.index_cast %49 : index to i32
        %51 = "simt_step.switch"(%48, %50) ({
        ^bb0(%arg4: i32):
          %c4_i32_20 = arith.constant 4 : i32
          %56 = arith.addi %0, %c4_i32_20 : i32
          %true_21 = arith.constant true
          %c128_i32 = arith.constant 128 : i32
          %57 = arith.addi %c128_i32, %0 : i32
          %true_22 = arith.constant true
          %58 = "simt_step.wave_count_bits"(%true_22) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %57, %58) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%56) {fallthrough = false} : (i32) -> ()
        ^bb1(%59: i32):  // no predecessors
          %c0_i32_23 = arith.constant 0 : i32
          %60 = arith.addi %0, %c0_i32_23 : i32
          "simt_step.yield"(%60) {fallthrough = false} : (i32) -> ()
        ^bb2(%61: i32):  // no predecessors
          "simt_step.yield"(%0) {fallthrough = false} : (i32) -> ()
        ^bb3(%62: i32):  // no predecessors
          %c3_i32_24 = arith.constant 3 : i32
          "simt_step.yield"(%c3_i32_24) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0, 1, 2>, default_index = 2 : i64} : (i32, i32) -> i32
        %true_16 = arith.constant true
        %c144_i32 = arith.constant 144 : i32
        %52 = arith.addi %c144_i32, %0 : i32
        %true_17 = arith.constant true
        %53 = "simt_step.wave_count_bits"(%true_17) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %52, %53) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        %true_18 = arith.constant true
        %c160_i32 = arith.constant 160 : i32
        %54 = arith.addi %c160_i32, %0 : i32
        %true_19 = arith.constant true
        %55 = "simt_step.wave_count_bits"(%true_19) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %54, %55) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%51) {fallthrough = false} : (i32) -> ()
      }) {case_values = array<i64: 0, 1>, default_index = 1 : i64} : (i32, i32) -> i32
      "simt_step.yield"(%14) {fallthrough = false} : (i32) -> ()
    ^bb1(%15: i32):  // no predecessors
      %c28_i32 = arith.constant 28 : i32
      %16 = arith.addi %c28_i32, %0 : i32
      %17 = "simt_step.buffer.load"(%arg1, %16) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_1 = arith.constant 0 : i32
      %18 = arith.cmpi ne, %17, %c0_i32_1 : i32
      %19 = "simt_step.if"(%18) ({
        %33 = simt_step.subgroup_id
        %34 = arith.index_cast %33 : index to i32
        "simt_step.yield"(%34) : (i32) -> ()
      }, {
        %c32_i32 = arith.constant 32 : i32
        %33 = arith.addi %c32_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %35 = simt_step.subgroup_id
        %36 = arith.index_cast %35 : index to i32
        %37 = "simt_step.switch"(%34, %36) ({
        ^bb0(%arg3: i32):
          %true_11 = arith.constant true
          %c176_i32 = arith.constant 176 : i32
          %40 = arith.addi %c176_i32, %0 : i32
          %true_12 = arith.constant true
          %41 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %40, %41) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%0) {fallthrough = true} : (i32) -> ()
        ^bb1(%42: i32):  // no predecessors
          %43 = simt_step.subgroup_id
          %44 = arith.index_cast %43 : index to i32
          "simt_step.yield"(%44) {fallthrough = false} : (i32) -> ()
        }) {case_values = array<i64: 0>, default_index = 1 : i64} : (i32, i32) -> i32
        %true_9 = arith.constant true
        %c192_i32 = arith.constant 192 : i32
        %38 = arith.addi %c192_i32, %0 : i32
        %true_10 = arith.constant true
        %39 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%37) : (i32) -> ()
      }) : (i1) -> i32
      %c208_i32 = arith.constant 208 : i32
      %20 = arith.addi %c208_i32, %0 : i32
      %true_2 = arith.constant true
      %21 = "simt_step.wave_count_bits"(%true_2) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %20, %21) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%19) {fallthrough = true} : (i32) -> ()
    ^bb2(%22: i32):  // no predecessors
      %c0_i32_3 = arith.constant 0 : i32
      %c0_i32_4 = arith.constant 0 : i32
      %23:2 = "simt_step.loop"(%c0_i32_3, %c0_i32_4) ({
      ^bb0(%arg3: i32, %arg4: i32):
        %c4_i32_9 = arith.constant 4 : i32
        %33 = arith.muli %arg4, %c4_i32_9 : i32
        %34 = arith.addi %33, %0 : i32
        %c36_i32 = arith.constant 36 : i32
        %35 = arith.addi %c36_i32, %34 : i32
        %36 = "simt_step.buffer.load"(%arg1, %35) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_10 = arith.constant 0 : i32
        %37 = arith.cmpi ne, %36, %c0_i32_10 : i32
        "simt_step.condition"(%37, %arg3, %arg4) : (i1, i32, i32) -> ()
      }, {
      ^bb0(%arg3: i32, %arg4: i32):
        %33 = simt_step.lane_id
        %34 = arith.index_cast %33 : index to i32
        %35 = arith.addi %arg3, %34 : i32
        %c1_i32_9 = arith.constant 1 : i32
        %36 = arith.addi %arg4, %c1_i32_9 : i32
        %true_10 = arith.constant true
        %c224_i32 = arith.constant 224 : i32
        %c4_i32_11 = arith.constant 4 : i32
        %37 = arith.muli %arg4, %c4_i32_11 : i32
        %38 = arith.addi %c224_i32, %37 : i32
        %39 = arith.addi %38, %0 : i32
        %true_12 = arith.constant true
        %40 = "simt_step.wave_count_bits"(%true_12) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %39, %40) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.continue"(%35, %36) : (i32, i32) -> ()
      }) : (i32, i32) -> (i32, i32)
      "simt_step.yield"(%23#0) {fallthrough = true} : (i32) -> ()
    ^bb3(%24: i32):  // no predecessors
      %c56_i32 = arith.constant 56 : i32
      %25 = arith.addi %c56_i32, %0 : i32
      %26 = "simt_step.buffer.load"(%arg1, %25) : (!simt_step.resource<Global, i32>, i32) -> i32
      %c0_i32_5 = arith.constant 0 : i32
      %27 = arith.cmpi ne, %26, %c0_i32_5 : i32
      %28 = "simt_step.if"(%27) ({
        %c0_i32_9 = arith.constant 0 : i32
        %c0_i32_10 = arith.constant 0 : i32
        %33:2 = "simt_step.loop"(%c0_i32_9, %c0_i32_10) ({
        ^bb0(%arg3: i32, %arg4: i32):
          %c4_i32_11 = arith.constant 4 : i32
          %34 = arith.muli %arg4, %c4_i32_11 : i32
          %35 = arith.addi %34, %0 : i32
          %c60_i32 = arith.constant 60 : i32
          %36 = arith.addi %c60_i32, %35 : i32
          %37 = "simt_step.buffer.load"(%arg1, %36) : (!simt_step.resource<Global, i32>, i32) -> i32
          %c0_i32_12 = arith.constant 0 : i32
          %38 = arith.cmpi ne, %37, %c0_i32_12 : i32
          "simt_step.condition"(%38, %arg3, %arg4) : (i1, i32, i32) -> ()
        }, {
        ^bb0(%arg3: i32, %arg4: i32):
          %34 = arith.addi %arg3, %arg4 : i32
          %c1_i32_11 = arith.constant 1 : i32
          %35 = arith.addi %arg4, %c1_i32_11 : i32
          %true_12 = arith.constant true
          %c240_i32 = arith.constant 240 : i32
          %c4_i32_13 = arith.constant 4 : i32
          %36 = arith.muli %arg4, %c4_i32_13 : i32
          %37 = arith.addi %c240_i32, %36 : i32
          %38 = arith.addi %37, %0 : i32
          %true_14 = arith.constant true
          %39 = "simt_step.wave_count_bits"(%true_14) : (i1) -> i32
          "simt_step.buffer.store"(%arg0, %38, %39) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
          "simt_step.yield"(%34, %35) : (i32, i32) -> ()
        }) : (i32, i32) -> (i32, i32)
        "simt_step.yield"(%33#0) : (i32) -> ()
      }, {
        %c80_i32 = arith.constant 80 : i32
        %33 = arith.addi %c80_i32, %0 : i32
        %34 = "simt_step.buffer.load"(%arg1, %33) : (!simt_step.resource<Global, i32>, i32) -> i32
        %c0_i32_9 = arith.constant 0 : i32
        %35 = arith.cmpi ne, %34, %c0_i32_9 : i32
        %36 = "simt_step.if"(%35) ({
          %c4_i32_11 = arith.constant 4 : i32
          %39 = arith.addi %0, %c4_i32_11 : i32
          "simt_step.yield"(%39) : (i32) -> ()
        }, {
          %c2_i32 = arith.constant 2 : i32
          "simt_step.yield"(%c2_i32) : (i32) -> ()
        }) : (i1) -> i32
        %c256_i32 = arith.constant 256 : i32
        %37 = arith.addi %c256_i32, %0 : i32
        %true_10 = arith.constant true
        %38 = "simt_step.wave_count_bits"(%true_10) : (i1) -> i32
        "simt_step.buffer.store"(%arg0, %37, %38) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
        "simt_step.yield"(%36) : (i32) -> ()
      }) : (i1) -> i32
      %c272_i32 = arith.constant 272 : i32
      %29 = arith.addi %c272_i32, %0 : i32
      %true_6 = arith.constant true
      %30 = "simt_step.wave_count_bits"(%true_6) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %29, %30) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      %true_7 = arith.constant true
      %c288_i32 = arith.constant 288 : i32
      %31 = arith.addi %c288_i32, %0 : i32
      %true_8 = arith.constant true
      %32 = "simt_step.wave_count_bits"(%true_8) : (i1) -> i32
      "simt_step.buffer.store"(%arg0, %31, %32) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
      "simt_step.yield"(%28) {fallthrough = false} : (i32) -> ()
    }) {case_values = array<i64: 0, 1, 2>, default_index = 1 : i64} : (i32, i32) -> i32
    %true = arith.constant true
    %c304_i32 = arith.constant 304 : i32
    %8 = arith.addi %c304_i32, %0 : i32
    %true_0 = arith.constant true
    %9 = "simt_step.wave_count_bits"(%true_0) : (i1) -> i32
    "simt_step.buffer.store"(%arg0, %8, %9) : (!simt_step.resource<Global, i32>, i32, i32) -> ()
    return
  }
}

